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
@Table(name = "interaction")
public class InteractionDB implements miage.gestioncabinet.api.Interaction {
    private static final long serialVersionUID = 8754798513096945732L;

    @Id
    @SequenceGenerator(name = "interaction_seq", sequenceName = "interaction_id_seq", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "interaction_seq")
    private long              id;

    @Embedded
    @AttributeOverrides({ @AttributeOverride(name = "cis", column = @Column(name = "produit_a_cis") ), @AttributeOverride(name = "nom", column = @Column(name = "produit_a_nom") ) })
    private ProduitDB         produitA;

    @Embedded
    @AttributeOverrides({ @AttributeOverride(name = "cis", column = @Column(name = "produit_b_cis") ), @AttributeOverride(name = "nom", column = @Column(name = "produit_b_nom") ) })
    private ProduitDB         produitB;

    @Column(name = "severite")
    private String            severite;

    @Column(name = "risques")
    private String            risques;

    @Column(name = "precautions")
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

    @Override
    public String toString() {
        return "Interaction [produitA=" + produitA + ", produitB=" + produitB + ", severite=" + severite + ", risques=" + risques + ", precautions=" + precautions + "]";
    }

}
