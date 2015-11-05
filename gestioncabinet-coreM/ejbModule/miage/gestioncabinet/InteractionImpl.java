package miage.gestioncabinet;

import miage.gestioncabinet.api.Produit;

public class InteractionImpl implements miage.gestioncabinet.api.Interaction {
    private Produit produitA;
    private Produit produitB;
    private String  severite;
    private String  risques;
    private String  precautions;

    @Override
    public Produit getProduitA() {
        return produitA;
    }

    @Override
    public void setProduitA(Produit produitA) {
        this.produitA = produitA;
    }

    @Override
    public Produit getProduitB() {
        return produitB;
    }

    @Override
    public void setProduitB(Produit produitB) {
        this.produitB = produitB;
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
