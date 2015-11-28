package miage.gestioncabinet;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import miage.gestioncabinet.api.Produit;

@Entity
@Table(name = "traitement")
public class TraitementDB implements miage.gestioncabinet.api.Traitement {
    private static final long serialVersionUID = -868044482900848450L;

    @Id
    @SequenceGenerator(name = "traitement_seq", sequenceName = "traitement_id_seq", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "traitement_seq")
    private long              id;

    @Embedded
    @AttributeOverrides({ @AttributeOverride(name = "cis", column = @Column(name = "produit_cis") ), @AttributeOverride(name = "nom", column = @Column(name = "produit_nom") ) })
    private ProduitDB         produit;

    @Column(name = "posologie")
    private String            posologie;

    @Override
    public Produit getProduit() {
        return produit;
    }

    @Override
    public void setProduit(Produit produit) {
        this.produit = (ProduitDB) produit;
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
        TraitementDB other = (TraitementDB) obj;
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
