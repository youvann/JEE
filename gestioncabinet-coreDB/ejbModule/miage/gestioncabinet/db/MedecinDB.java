package miage.gestioncabinet.db;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "t_medecin")
public class MedecinDB extends UtilisateurDB implements miage.gestioncabinet.api.Medecin {
    private static final long serialVersionUID = -7477138413558824643L;
    private String            rpps;

    @Override
    public String getRPPS() {
        return rpps;
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
