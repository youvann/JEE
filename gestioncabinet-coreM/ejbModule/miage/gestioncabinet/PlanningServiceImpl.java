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

import miage.gestioncabinet.api.Consultation;
import miage.gestioncabinet.api.GestionCabinetException;
import miage.gestioncabinet.api.Medecin;
import miage.gestioncabinet.api.Patient;
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
public class PlanningServiceImpl implements PlanningRemoteService {

    private Utilisateur        utilisateur       = null;
    private Calendar           dateDebut;
    private Calendar           dateFin;
    private Medecin            medecinCourant;
    private Consultation       rdvCourant;

    // Stubs
    private List<Medecin>      stubMedecins      = new ArrayList<Medecin>();
    private List<Patient>      stubPatients      = new ArrayList<Patient>();
    private List<Consultation> stubConsultations = new ArrayList<Consultation>();

    @PostConstruct
    public void init() throws ParseException {
        // Medecins
        Medecin m1 = new MedecinImpl();
        m1.setPrenom("Robert");
        m1.setNom("FORD");

        Medecin m2 = new MedecinImpl();
        m2.setPrenom("Paul");
        m2.setNom("MAES");

        Medecin m3 = new MedecinImpl();
        m3.setPrenom("Pierre");
        m3.setNom("MARF");

        stubMedecins.add(m1);
        stubMedecins.add(m2);
        stubMedecins.add(m3);

        // Patients
        Patient p1 = new PatientImpl();
        p1.setPrenom("Julien");
        p1.setNom("RISH");
        Calendar dateNaissance1 = Calendar.getInstance();
        dateNaissance1.setTime(new SimpleDateFormat("dd/MM/yyyy").parse("12/03/1964"));
        p1.setDateNaissance(dateNaissance1);

        Patient p2 = new PatientImpl();
        p2.setPrenom("Johny");
        p2.setNom("WALKER");

        Patient p3 = new PatientImpl();
        p3.setPrenom("Jack");
        p3.setNom("TADAM");

        stubPatients.add(p1);
        stubPatients.add(p2);
        stubPatients.add(p3);

        dateDebut = new GregorianCalendar(2015, 11, 11, 9, 0);
        dateFin = new GregorianCalendar(2015, 11, 11, 18, 0);

    }

    @Override
    public Utilisateur getUtilisateur() {
        if (this.utilisateur == null) {
            UtilisateurImpl utilisateur = new UtilisateurImpl();
            utilisateur.setPrenom("John");
            utilisateur.setNom("Smith");
            utilisateur.setCompte(super.toString().substring(super.toString().indexOf('@') + 1));
        }
        return utilisateur;
    }

    @Override
    public List<Medecin> rechercherMedecins() throws GestionCabinetException {
        return stubMedecins;
    }

    @Override
    public List<Patient> rechercherPatients(String nom, String prenom, Calendar dateNaissance) throws GestionCabinetException {
        List<Patient> patientListFound = new ArrayList<Patient>();

        for (Patient patient : stubPatients) {
            if (patient.getNom().equals(nom) && patient.getPrenom().equals(prenom) && patient.getDateNaissance().equals(dateNaissance)) {
                patientListFound.add(patient);
            }
        }

        return patientListFound;
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
    public List<Consultation> listerRdv() {
        List<Consultation> consultationTmp = new ArrayList<Consultation>();
        for (Consultation consultation : stubConsultations) {

            // Affiche uniquement le rendez-vous du médecin courant
            if (consultation.getMedecin().equals(medecinCourant)) {

                Boolean conditionDateFin = consultation.getFin().before(getDateFin()) || consultation.getFin().equals(getDateFin());
                // Affiche uniquement les rendez-vous du jour
                if (consultation.getDebut().after(getDateDebut()) && conditionDateFin || consultation.getDebut().equals(getDateDebut()) && conditionDateFin) {
                    consultationTmp.add(consultation);
                }

            }
        }

        Collections.sort(consultationTmp);
        return consultationTmp;
    }

    @Override
    public Consultation getRdvCourant() {
        return rdvCourant;
    }

    @Override
    public void setRdvCourant(Consultation rdv) {
        this.rdvCourant = rdv;

    }

    // Création d'un rendez-vous
    @Override
    public Consultation creerRdv(Calendar date) {
        Calendar dateFin = (Calendar) getDateDebut().clone();
        dateFin.add(Calendar.MINUTE, 20);

        Consultation rdv = new ConsultationImpl();
        rdv.setDebut(date);
        rdv.setFin(dateFin);
        rdv.setMedecin(medecinCourant);

        return rdv;

    }

    // Modification d'un rendez-vous
    @Override
    public Consultation enregistrerRdv() throws GestionCabinetException {
        stubConsultations.add(rdvCourant);
        return rdvCourant;
    }

    @Override
    public void supprimerRdv() throws GestionCabinetException {
        if (stubConsultations.contains(rdvCourant)) {
            stubConsultations.remove(rdvCourant);
        }
    }

}
