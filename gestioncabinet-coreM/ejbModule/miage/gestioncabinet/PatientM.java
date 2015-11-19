package miage.gestioncabinet;

import java.util.Calendar;

import miage.gestioncabinet.api.Patient;

public class PatientM extends PersonneM implements Patient {

    private static final long serialVersionUID = 6902763909172284957L;
    private Integer           age;
    private Calendar          dateNaissance;

    @Override
    public Integer getAge() {
        return age;
    }

    @Override
    public Calendar getDateNaissance() {
        return dateNaissance;
    }

    @Override
    public void setDateNaissance(Calendar dateNaissance) {
        this.dateNaissance = dateNaissance;

    }

    @Override
    public String toString() {
        return "(" + super.toString() + " " + age + " ans)";
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((age == null) ? 0 : age.hashCode());
        result = prime * result + ((dateNaissance == null) ? 0 : dateNaissance.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!super.equals(obj))
            return false;
        if (getClass() != obj.getClass())
            return false;
        PatientM other = (PatientM) obj;
        if (age == null) {
            if (other.age != null)
                return false;
        } else if (!age.equals(other.age))
            return false;
        if (dateNaissance == null) {
            if (other.dateNaissance != null)
                return false;
        } else if (!dateNaissance.equals(other.dateNaissance))
            return false;
        return true;
    }

}
