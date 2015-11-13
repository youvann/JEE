package miage.gestioncabinet;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import miage.gestioncabinet.api.Produit;

@Entity
@Table(name = "t_interaction")
public class InteractionDB implements miage.gestioncabinet.api.Interaction {
    private static final long serialVersionUID = 8754798513096945732L;
    @Id
    private long              id;
    @Embedded
    @AttributeOverrides({ @AttributeOverride(name = "cis", column = @Column(name = "produit1_cis") ),
            @AttributeOverride(name = "nom", column = @Column(name = "produit1_nom") ) })
    private ProduitDB         produitA;
    @Embedded
    @AttributeOverrides({ @AttributeOverride(name = "cis", column = @Column(name = "produit2_cis") ),
            @AttributeOverride(name = "nom", column = @Column(name = "produit2_nom") ) })
    private ProduitDB         produitB;

    private String            severite;
    private String            risques;
    private String            precautions;

    @Override
    public Produit getProduitA() {
        return produitA;
    }

    @Override
    public void setProduitA(Produit produitA) {
        this.produitA = (ProduitDB) produitA;
    }

    @Override
    public Produit getProduitB() {
        return produitB;
    }

    @Override
    public void setProduitB(Produit produitB) {
        this.produitB = (ProduitDB) produitB;
    }

    public String getSeverite() {
        return severite;
    }

    public void setSeverite(String severite) {
        this.severite = severite;
    }

    public String getRisques() {
        return risques;
    }

    public void setRisques(String risques) {
        this.risques = risques;
    }

    public String getPrecautions() {
        return precautions;
    }

    public void setPrecautions(String precautions) {
        this.precautions = precautions;
    }

}
