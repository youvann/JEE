package miage.gestioncabinet;

import miage.gestioncabinet.api.Produit;

public class ProduitDB implements Produit {

    private static final long serialVersionUID = -1562087114201628808L;

    private String            cis;
    private String            nom;

    @Override
    public String getCis() {
        return cis;
    }

    @Override
    public void setCis(String cis) {
        this.cis = cis;
    }

    @Override
    public String getNom() {
        return nom;
    }

    @Override
    public void setNom(String nom) {
        this.nom = nom;

    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((cis == null) ? 0 : cis.hashCode());
        result = prime * result + ((nom == null) ? 0 : nom.hashCode());
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
        ProduitDB other = (ProduitDB) obj;
        if (cis == null) {
            if (other.cis != null)
                return false;
        } else if (!cis.equals(other.cis))
            return false;
        if (nom == null) {
            if (other.nom != null)
                return false;
        } else if (!nom.equals(other.nom))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "[produit] (cis=" + cis + ", nom=" + nom + ")";
    }

}
