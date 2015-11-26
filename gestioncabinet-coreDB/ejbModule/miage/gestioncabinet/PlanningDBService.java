/**
 * 
 */
package miage.gestioncabinet;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.GregorianCalendar;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.Remote;
import javax.ejb.Stateful;
import javax.persistence.EntityManager;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import miage.gestioncabinet.api.Consultation;
import miage.gestioncabinet.api.GestionCabinetException;
import miage.gestioncabinet.api.Medecin;
import miage.gestioncabinet.api.Patient;
import miage.gestioncabinet.api.Personne;
import miage.gestioncabinet.api.PlanningRemoteService;
import miage.gestioncabinet.api.Utilisateur;

/**
 * @author youvann
 * 
 *         Stateful avec état utilisé pour les EJB L'EJB est exposé via une interface locale : PlanningRemoteService Remote(PlanningRemoteService.class)
 * 
 *         Communiquer entre client de test et application déployée via l'interface Remote de l'EJB accessbile par n'importe quel programme client
 * 
 *         Pour déployer l'application faire : - clic droit sur WildFly > add > gestioncabinet - clic droit sur WildFly > Publish
 * 
 *         Vérifier dans WildFly>standalone>deployments que l'EJB a bien été publié
 * 
 *         L'adresse de notre EJB est java:global/gestioncabinet/gestioncabinet-coreM/PlanningService!miage .gestioncabinet.api.PlanningRemoteService
 * 
 *         Aller dans GestionCabinet-test pour lui communiquer l'adresse de l'EJB
 * 
 */
@Stateful
@Remote(PlanningRemoteService.class)
public class PlanningDBService implements PlanningRemoteService {

    private Utilisateur   utilisateur;
    private Calendar      dateDebut;
    private Calendar      dateFin;
    private Medecin       medecinCourant;
    private Consultation  rdvCourant;

    @PersistenceContext(unitName = "gestioncabinet-coreDB")
    private EntityManager em;

    @PostConstruct
    public void init() throws ParseException {
        utilisateur = null;
        medecinCourant = new MedecinDB();
        dateDebut = new GregorianCalendar(2015, 11, 11, 9, 0);
        dateFin = new GregorianCalendar(2015, 11, 11, 18, 0);
    }

    // Test d'un CRUD sur Personne
    public Personne find(Long id) {
        return em.find(PersonneDB.class, id);
    }

    public List<? extends Personne> list() {
        return em.createQuery("FROM personne", PersonneDB.class).getResultList();
    }

    public Long save(Personne personne) {
        em.persist(personne);
        return personne.getId();
    }

    public void update(Personne personne) {
        em.merge(personne);
    }

    public void delete(Personne personne) {
        em.remove(em.contains(personne) ? personne : em.merge(personne));
    }

    @Override
    public Utilisateur getUtilisateur() {
        if (this.utilisateur == null) {
            UtilisateurDB utilisateur = new UtilisateurDB();
            utilisateur.setPrenom("John");
            utilisateur.setNom("Smith");
            utilisateur.setCompte(super.toString().substring(super.toString().indexOf('@') + 1));
        }
        return utilisateur;
    }

    @Override
    public List<Medecin> rechercherMedecins() throws GestionCabinetException {
        Query query = em.createNamedQuery("findAllMedecin");
        List<Medecin> medecinList = query.getResultList();
        return medecinList;
    }

    @Override
    public List<Patient> rechercherPatients(String nom, String prenom, Calendar dateNaissance) throws GestionCabinetException {
        Query query = em.createNamedQuery("findAllPatient");
        List<Patient> patientList = query.getResultList();

        List<Patient> patientListFound = new ArrayList<Patient>();
        for (Patient patient : patientList) {
            if (patient.getNom().equals(nom) && patient.getPrenom().equals(prenom) && patient.getDateNaissance().equals(dateNaissance)) {
                patientListFound.add(patient);
            }
        }
        return patientListFound;
    }

    @Override
    public List<Consultation> listerRdv() {
        Query query = em.createNamedQuery("findAllConsultation");
        List<Consultation> consultationList = query.getResultList();

        List<Consultation> consultationTmp = new ArrayList<Consultation>();
        for (Consultation consultation : consultationList) {

            if (consultation.getMedecin().equals(medecinCourant)) { // Affiche uniquement le rendez-vous du médecin courant
                Boolean conditionDateFin = consultation.getFin().before(getDateFin()) || consultation.getFin().equals(getDateFin());
                Boolean conditionDateDebut = consultation.getDebut().after(getDateDebut()) || consultation.getDebut().equals(getDateDebut());

                if (conditionDateDebut && conditionDateFin) { // Affiche uniquement les rendez-vous du jour
                    consultationTmp.add(consultation);
                }
            }
        }

        Collections.sort(consultationTmp);
        return consultationTmp;
    }

    // Création d'un rendez-vous
    @Override
    public Consultation creerRdv(Calendar date) {
        Calendar dateFin = (Calendar) date.clone();
        dateFin.add(Calendar.MINUTE, 20); // Un rdv dure 20 minutes

        Consultation rdv = new ConsultationDB();
        rdv.setDebut(date);
        rdv.setFin(dateFin);
        rdv.setMedecin(medecinCourant);

        return rdv;
    }

    // Ajout d'un rdv
    @Override
    public Consultation enregistrerRdv() throws GestionCabinetException {
        em.persist(em.merge(rdvCourant));
        return rdvCourant;
    }

    @Override
    public void supprimerRdv() throws GestionCabinetException {
        Consultation rdv = em.merge(rdvCourant);
        em.remove(rdv);
    }

    @Override
    public Calendar getDateDebut() {
        return dateDebut;
    }

    @Override
    public void setDateDebut(Calendar date) {
        dateDebut = date;
    }

    @Override
    public Calendar getDateFin() {
        return dateFin;
    }

    @Override
    public void setDateFin(Calendar date) {
        dateFin = date;
    }

    @Override
    public Medecin getMedecin() {
        return medecinCourant;
    }

    @Override
    public void setMedecin(Medecin medecin) {
        this.medecinCourant = medecin;
    }

    @Override
    public Consultation getRdvCourant() {
        return rdvCourant;
    }

    @Override
    public void setRdvCourant(Consultation rdv) {
        this.rdvCourant = rdv;

    }

}
