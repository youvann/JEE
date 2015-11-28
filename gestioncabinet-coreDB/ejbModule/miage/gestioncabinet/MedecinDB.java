package miage.gestioncabinet;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

import miage.gestioncabinet.api.Medecin;

@Entity
@DiscriminatorValue("medecin")
@NamedQueries({ 
    @NamedQuery(name = "findAllMedecin", query = "SELECT m FROM MedecinDB m"),
    @NamedQuery(name = "findMedecinById", query = "SELECT m FROM MedecinDB m WHERE m.id = :id"), 
})

public class MedecinDB extends UtilisateurDB implements Medecin {
    private static final long serialVersionUID = -7477138413558824643L;

    @Column(name = "rpps")
    private String            rpps;

    @Override
    public String getRPPS() {
        return rpps;
    }

    public Long getId() {
        return this.id;
    }

    @Override
    public String toString() {
        return "(" + super.toString() + " rpps=" + rpps + ")";
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((rpps == null) ? 0 : rpps.hashCode());
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
        MedecinDB other = (MedecinDB) obj;
        if (rpps == null) {
            if (other.rpps != null)
                return false;
        } else if (!rpps.equals(other.rpps))
            return false;
        return true;
    }

}
