package miage.gestioncabinet;

public class UtilisateurImpl extends PersonneImpl implements miage.gestioncabinet.api.Utilisateur {

    private String compte;

    @Override
    public String getCompte() {
        return compte;
    }

    public void setCompte(String compte) {
        this.compte = compte;
    }

    @Override
    public String toString() {
        return super.toString() + " compte=" + compte;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((compte == null) ? 0 : compte.hashCode());
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
        UtilisateurImpl other = (UtilisateurImpl) obj;
        if (compte == null) {
            if (other.compte != null)
                return false;
        } else if (!compte.equals(other.compte))
            return false;
        return true;
    }

}
