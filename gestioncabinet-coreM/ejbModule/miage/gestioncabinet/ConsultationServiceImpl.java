package miage.gestioncabinet;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.Remote;
import javax.ejb.Stateful;

import fr.vidal.webservices.interactionservice.ArrayOfInt;
import fr.vidal.webservices.interactionservice.ArrayOfInteractionCouple;
import fr.vidal.webservices.interactionservice.ArrayOfProduct;
import fr.vidal.webservices.interactionservice.InteractionCouple;
import fr.vidal.webservices.interactionservice.InteractionResult;
import fr.vidal.webservices.interactionservice.InteractionService;
import fr.vidal.webservices.interactionservice.InteractionService_Service;
import fr.vidal.webservices.interactionservice.InteractionSeverityType;
import fr.vidal.webservices.productservice.Product;
import fr.vidal.webservices.productservice.ProductService;
import fr.vidal.webservices.productservice.ProductService_Service;
import fr.vidal.webservices.productservice.ProductType;
import miage.gestioncabinet.api.Consultation;
import miage.gestioncabinet.api.ConsultationRemoteService;
import miage.gestioncabinet.api.GestionCabinetException;
import miage.gestioncabinet.api.Interaction;
import miage.gestioncabinet.api.Produit;
import miage.gestioncabinet.api.Traitement;

@Stateful
@Remote(ConsultationRemoteService.class)
public class ConsultationServiceImpl implements ConsultationRemoteService {

    // Web service
    private ProductService     productService;
    private InteractionService interactionService;

    // Consultation courante
    private Consultation       consultation;

    @PostConstruct
    private void init() {
        try {
            productService = new ProductService_Service().getProductServiceHttpPort();
            interactionService = new InteractionService_Service().getInteractionServiceHttpPort();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public Consultation getConsultation() {
        return this.consultation;
    }

    @Override
    public void setConsultation(Consultation consultation) {
        this.consultation = consultation;
    }

    @Override
    public List<Produit> rechercherMedicament(String keyword) throws GestionCabinetException {
        List<Produit> produits = new ArrayList<Produit>();

        for (Product p : productService.searchByNameAndType(keyword, ProductType.VIDAL).getProduct()) {
            Produit produit = new ProduitImpl();
            produit.setNom(p.getName());
            produit.setCis(p.getCis());
            produits.add(produit);
        }
        return produits;
    }

    @Override
    public void analyserPrescription() throws GestionCabinetException {
        List<Traitement> traitements = consultation.getPrescription();

        // Récupération des produits ID
        ArrayOfInt productIds = new ArrayOfInt();

        for (Traitement traitement : traitements) {
            productIds.getInt().add(Integer.parseInt(traitement.getProduit().getCis()));
        }

        // productIds.getInt().add(63368332);
        // productIds.getInt().add(65124280);
        // productIds.getInt().add(68300762);
        // productIds.getInt().add(67010731);
        // productIds.getInt().add(63564053);

        // Récupération des interactions trouvées
        List<Interaction> interactionsFound = new ArrayList<Interaction>();
        ArrayOfInteractionCouple arrayInteractionsCouple = interactionService.searchInteractionCouplesForProductIds(productIds, InteractionSeverityType.CONTRAINDICATIONS).getInteractionCoupleList();
        for (InteractionCouple interactionCouple : arrayInteractionsCouple.getInteractionCouple()) {
            Interaction interaction = new InteractionImpl();
            // Précautions
            interaction.setPrecautions(interactionCouple.getPrecautionComment());
            // Produit A
            Produit produitA = new ProduitImpl();
            produitA.setCis(interactionCouple.getProductA().getCis());
            produitA.setNom(interactionCouple.getProductA().getName());
            interaction.setProduitA(produitA);
            // Produit B
            Produit produitB = new ProduitImpl();
            produitB.setCis(interactionCouple.getProductB().getCis());
            produitB.setNom(interactionCouple.getProductB().getName());
            interaction.setProduitA(produitB);
            // Risques
            interaction.setRisques(interactionCouple.getRiskComment());
            // Sévérité
            interaction.setSeverite(interactionCouple.getSeverity().value());

            interactionsFound.add(interaction);
        }

        this.consultation.setInteractions(interactionsFound);
    }

    @Override
    public Consultation enregistrer() throws GestionCabinetException {
        return this.consultation;
    }

    @Override
    public void supprimer() throws GestionCabinetException {
        this.consultation = null;
    }

}
