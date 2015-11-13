package miage.gestioncabinet;

import java.text.DateFormat;
import java.util.Calendar;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.resource.cci.Interaction;

import miage.gestioncabinet.api.Consultation;
import miage.gestioncabinet.api.Medecin;
import miage.gestioncabinet.api.Patient;
import miage.gestioncabinet.api.Produit;
import miage.gestioncabinet.api.Traitement;

@Entity
@Table(name = "t_consultation")
public class ConsultationDB implements Consultation {

    private static final long serialVersionUID = -640614506192476239L;
    @Id
    private long              id;
    private Patient           patient          = new PatientDB();
    private Medecin           medecin;
    private Calendar          dateDebut;
    private Calendar          dateFin;
    private String            compteRendu;
    private List<Traitement>  prescriptions;
    private List<Interaction> interactions;

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
    public List<Traitement> getPrescription() {
        return prescriptions;
    }

    @Override
    public Boolean ajouterTraitement(Produit produit) {

        Traitement traitement = new miage.gestioncabinet.TraitementDB();
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

        return "#Consultation du medecin " + medecin + " avec le patient " + patient + " le "
                + df1.format(dateDebut.getTime()) + " à " + df2.format(dateFin.getTime());
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

    @Override
    public List<miage.gestioncabinet.api.Interaction> getInteractions() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public void setInteractions(List<miage.gestioncabinet.api.Interaction> interactions) {
        // TODO Auto-generated method stub

    }

}
