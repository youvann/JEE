package miage.gestioncabinet;

import miage.gestioncabinet.api.Produit;
import miage.gestioncabinet.api.Traitement;

public class TraitementImpl implements Traitement {

    private static final long serialVersionUID = 8600415727819596688L;
    private Produit           produit;
    private String            posologie;

    @Override
    public Produit getProduit() {
        return produit;
    }

    @Override
    public void setProduit(Produit produit) {
        this.produit = produit;
    }

    @Override
    public String getPosologie() {
        return posologie;
    }

    @Override
    public void setPosologie(String posologie) {
        this.posologie = posologie;

    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((posologie == null) ? 0 : posologie.hashCode());
        result = prime * result + ((produit == null) ? 0 : produit.hashCode());
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
        TraitementImpl other = (TraitementImpl) obj;
        if (posologie == null) {
            if (other.posologie != null)
                return false;
        } else if (!posologie.equals(other.posologie))
            return false;
        if (produit == null) {
            if (other.produit != null)
                return false;
        } else if (!produit.equals(other.produit))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "[Traitement] (" + produit + " et la posologie " + posologie + ")";
    }

}
