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
 *         Stateful avec état utilisé pour les EJB L'EJB est exposé via une
 *         interface locale : PlanningRemoteService
 *         Remote(PlanningRemoteService.class)
 * 
 *         Communiquer entre client de test et application déployée via
 *         l'interface Remote de l'EJB accessbile par n'importe quel programme
 *         client
 * 
 *         Pour déployer l'application faire : - clic droit sur WildFly > add >
 *         gestioncabinet - clic droit sur WildFly > Publish
 * 
 *         Vérifier dans WildFly>standalone>deployments que l'EJB a bien été
 *         publié
 * 
 *         L'adresse de notre EJB est
 *         java:global/gestioncabinet/gestioncabinet-coreM/PlanningService!miage
 *         .gestioncabinet.api.PlanningRemoteService
 * 
 *         Aller dans GestionCabinet-test pour lui communiquer l'adresse de
 *         l'EJB
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

        // Consultations
        // m1
        Consultation c1 = new ConsultationImpl();
        c1.setPatient(p1);
        c1.setMedecin(m1);
        c1.setDebut(new GregorianCalendar(2015, 10, 30, 16, 00));
        c1.setFin(new GregorianCalendar(2015, 10, 30, 16, 15));

        Consultation c2 = new ConsultationImpl();
        c2.setPatient(p2);
        c2.setMedecin(m1);
        c2.setDebut(new GregorianCalendar(2015, 10, 30, 16, 15));
        c2.setFin(new GregorianCalendar(2015, 10, 30, 16, 30));

        Consultation c3 = new ConsultationImpl();
        c3.setPatient(p3);
        c3.setMedecin(m1);
        c3.setDebut(new GregorianCalendar(2015, 10, 30, 16, 30));
        c3.setFin(new GregorianCalendar(2015, 10, 30, 16, 45));

        // m2
        Consultation c4 = new ConsultationImpl();
        c4.setPatient(p1);
        c4.setMedecin(m2);
        c4.setDebut(new GregorianCalendar(2015, 10, 31, 12, 45));
        c4.setFin(new GregorianCalendar(2015, 10, 31, 13, 00));

        // m1
        stubConsultations.add(c2);
        stubConsultations.add(c1);
        stubConsultations.add(c3);
        // m2
        stubConsultations.add(c4);

        /*
         * Calendar cal1 = Calendar.getInstance(); cal1.set(Calendar.YEAR,
         * 2014); cal1.set(Calendar.MONTH, 10); cal1.set(Calendar.DATE, 30);
         * cal1.set(Calendar.HOUR, 10); cal1.set(Calendar.MINUTE, 00);
         * cal1.set(Calendar.SECOND, 00); dateDebut = cal1;
         * 
         * Calendar cal2 = Calendar.getInstance(); cal2.set(Calendar.YEAR,
         * 2014); cal2.set(Calendar.MONTH, 10); cal2.set(Calendar.DATE, 30);
         * cal2.set(Calendar.HOUR, 18); cal2.set(Calendar.MINUTE, 00);
         * cal2.set(Calendar.SECOND, 00); dateFin = cal2;
         */

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
    public List<Patient> rechercherPatients(String nom, String prenom, Calendar dateNaissance)
            throws GestionCabinetException {
        Patient patientCherche = new PatientImpl();
        patientCherche.setNom(nom);
        patientCherche.setPrenom(prenom);
        patientCherche.setDateNaissance(dateNaissance);

        List<Patient> patientListFound = new ArrayList<Patient>();

        for (Patient patient : stubPatients) {
            if (patient.getNom().equals(nom) && patient.getPrenom().equals(prenom)
                    && patient.getDateNaissance().equals(dateNaissance)) {
                patientListFound.add(patient);
            }
        }

        return patientListFound;
    }

    @Override
    public Calendar getDateDebut() {
        List<Consultation> rdvs = listerRdv();
        if (rdvs.isEmpty()) {
            Calendar fakeDate = Calendar.getInstance();
            fakeDate.set(Calendar.YEAR, 2000);
            fakeDate.set(Calendar.MONTH, 12);
            fakeDate.set(Calendar.DATE, 30);
            fakeDate.set(Calendar.HOUR, 10);
            fakeDate.set(Calendar.MINUTE, 00);
            fakeDate.set(Calendar.SECOND, 00);
            dateDebut = fakeDate;
        } else {
            dateDebut = listerRdv().get(0).getDebut();
        }
        return dateDebut;
    }

    @Override
    public void setDateDebut(Calendar date) {
        dateDebut = date;
    }

    @Override
    public Calendar getDateFin() {
        List<Consultation> rdvs = listerRdv();
        if (rdvs.isEmpty()) {
            Calendar fakeDate = Calendar.getInstance();
            fakeDate.set(Calendar.YEAR, 2000);
            fakeDate.set(Calendar.MONTH, 12);
            fakeDate.set(Calendar.DATE, 30);
            fakeDate.set(Calendar.HOUR, 11);
            fakeDate.set(Calendar.MINUTE, 00);
            fakeDate.set(Calendar.SECOND, 00);
            dateFin = fakeDate;
        } else {
            dateFin = listerRdv().get(rdvs.size() - 1).getFin();
        }
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
            if (consultation.getMedecin().equals(medecinCourant)) {
                consultationTmp.add(consultation);
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
        Consultation rdv = new ConsultationImpl();

        rdv.setDebut(date);
        date.add(Calendar.MINUTE, 20);
        rdv.setFin(date);
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
        } else {
            System.out.println("ok");
        }
    }

}
