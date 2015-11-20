package miage.gestioncabinet;

import javax.persistence.Id;

import miage.gestioncabinet.api.Produit;

public class InteractionDB implements miage.gestioncabinet.api.Interaction {
    private static final long serialVersionUID = 8754798513096945732L;

    @Id
    private long              id;

    private ProduitDB         produitA;

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

    @Override
    public String toString() {
        return "Interaction [produitA=" + produitA + ", produitB=" + produitB + ", severite=" + severite + ", risques=" + risques + ", precautions=" + precautions + "]";
    }

}
