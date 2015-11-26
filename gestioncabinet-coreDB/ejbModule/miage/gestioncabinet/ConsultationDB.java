package miage.gestioncabinet;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import miage.gestioncabinet.api.Consultation;
import miage.gestioncabinet.api.Interaction;
import miage.gestioncabinet.api.Medecin;
import miage.gestioncabinet.api.Patient;
import miage.gestioncabinet.api.Produit;
import miage.gestioncabinet.api.Traitement;

@Entity
@Table(name = "consultation")
public class ConsultationDB implements Consultation {

    /*
     * OneToMany
     * 
     * In JPA 2.0 a @JoinColumn can be used on a OneToMany to define the foreign key
     */

    private static final long serialVersionUID = 7075372281144303720L;

    @Id
    @SequenceGenerator(name = "consultation_seq", sequenceName = "consultation_id_seq", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "consultation_seq")
    private long              id;

    @Column(name = "date_debut")
    @Temporal(TemporalType.TIMESTAMP)
    private Calendar          dateDebut;

    @Column(name = "date_fin")
    @Temporal(TemporalType.TIMESTAMP)
    private Calendar          dateFin;

    @Column(name = "compte_rendu")
    private String            compteRendu;

    @OneToMany(targetEntity = TraitementDB.class) // Une consultation possède plusieurs prescriptions
    @JoinColumn(name = "consultation_id", referencedColumnName = "id") // La table traitement possède la clef étrangère consultation_id
    private List<Traitement>  prescriptions;

    @OneToMany(targetEntity = InteractionDB.class) // Une consultation possède plusieurs interactions
    @JoinColumn(name = "consultation_id", referencedColumnName = "id") // La table interaction possède la clef étrangère consultation_id
    private List<Interaction> interactions;

    @ManyToOne(targetEntity = PatientDB.class) // Plusieurs consultations peuvent appartenir à un même patient
    @JoinColumn(name = "patient_id") // La table consultation possède la clef étrangère patient_id
    private Patient           patient;

    @ManyToOne(targetEntity = MedecinDB.class) // Plusieurs consultations peuvent appartenir à un même médecin
    @JoinColumn(name = "medecin_id") // La table consultation possède la clef étrangère medecin_id
    private Medecin           medecin;

    public ConsultationDB() {
        this.medecin = new MedecinDB();
        this.prescriptions = new ArrayList<Traitement>();
        this.interactions = new ArrayList<Interaction>();
        this.patient = new PatientDB();
    }

    @Override
    public int compareTo(miage.gestioncabinet.api.Consultation c) {
        return this.dateDebut.compareTo(c.getDebut());

    }

    @Override
    public Patient getPatient() {
        return patient;
    }

    @Override
    public void setPatient(Patient patient) {
        this.patient = patient;

    }

    @Override
    public Medecin getMedecin() {
        return medecin;
    }

    @Override
    public void setMedecin(Medecin medecin) {
        this.medecin = medecin;

    }

    @Override
    public Calendar getDebut() {
        return dateDebut;
    }

    @Override
    public void setDebut(Calendar date) {
        dateDebut = date;

    }

    @Override
    public Calendar getFin() {
        return dateFin;
    }

    @Override
    public void setFin(Calendar date) {
        dateFin = date;

    }

    @Override
    public String getCompteRendu() {
        return compteRendu;
    }

    @Override
    public void setCompteRendu(String texte) {
        compteRendu = texte;
    }

    @Override
    public List<Interaction> getInteractions() {
        return interactions;
    }

    @Override
    public void setInteractions(List<Interaction> interactions) {
        this.interactions = interactions;
    }

    @Override
    public List<Traitement> getPrescription() {
        return prescriptions;
    }

    @Override
    public Boolean ajouterTraitement(Produit produit) {

        Traitement traitement = new TraitementDB();
        traitement.setProduit(produit);

        if (!prescriptions.contains(traitement)) {
            return prescriptions.add(traitement);
        }
        return false;

    }

    @Override
    public Boolean supprimerTraitement(Traitement medicament) {
        if (prescriptions.contains(medicament)) {
            prescriptions.remove(medicament);
            return true;
        }
        return false;
    }

    @Override
    public String toString() {
        DateFormat df1 = DateFormat.getDateTimeInstance(DateFormat.MEDIUM, DateFormat.SHORT);
        DateFormat df2 = DateFormat.getTimeInstance(DateFormat.SHORT);

        return "[CONSULTATION] du medecin " + medecin + "\n-- avec le patient " + patient + "\n-- le " + df1.format(dateDebut.getTime()) + " à " + df2.format(dateFin.getTime())
                + "\n-- avec le compte rendu : \"" + compteRendu + "\"" + "\n-- avec les prescriptions : " + prescriptions + "\n-- avec les interactions : " + interactions + "\n";
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((compteRendu == null) ? 0 : compteRendu.hashCode());
        result = prime * result + ((dateDebut == null) ? 0 : dateDebut.hashCode());
        result = prime * result + ((dateFin == null) ? 0 : dateFin.hashCode());
        result = prime * result + ((interactions == null) ? 0 : interactions.hashCode());
        result = prime * result + ((medecin == null) ? 0 : medecin.hashCode());
        result = prime * result + ((patient == null) ? 0 : patient.hashCode());
        result = prime * result + ((prescriptions == null) ? 0 : prescriptions.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        ConsultationDB other = (ConsultationDB) obj;
        if (compteRendu == null) {
            if (other.compteRendu != null)
                return false;
        } else if (!compteRendu.equals(other.compteRendu))
            return false;
        if (dateDebut == null) {
            if (other.dateDebut != null)
                return false;
        } else if (!dateDebut.equals(other.dateDebut))
            return false;
        if (dateFin == null) {
            if (other.dateFin != null)
                return false;
        } else if (!dateFin.equals(other.dateFin))
            return false;
        if (interactions == null) {
            if (other.interactions != null)
                return false;
        } else if (!interactions.equals(other.interactions))
            return false;
        if (medecin == null) {
            if (other.medecin != null)
                return false;
        } else if (!medecin.equals(other.medecin))
            return false;
        if (patient == null) {
            if (other.patient != null)
                return false;
        } else if (!patient.equals(other.patient))
            return false;
        if (prescriptions == null) {
            if (other.prescriptions != null)
                return false;
        } else if (!prescriptions.equals(other.prescriptions))
            return false;
        return true;
    }

}
