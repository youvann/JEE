package miage.gestioncabinet;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.Remote;
import javax.ejb.Stateful;

import fr.vidal.webservices.interactionservice.InteractionService;
import fr.vidal.webservices.interactionservice.InteractionService_Service;
import fr.vidal.webservices.interactionservice.InteractionSeverityType;
import fr.vidal.webservices.interactionservice.ArrayOfInt;
import fr.vidal.webservices.interactionservice.InteractionResult;
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
        return consultation;
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
        ArrayOfInt productIds = new ArrayOfInt();

        for (Traitement traitement : traitements) {
            productIds.getInt().add(Integer.parseInt(traitement.getProduit().getCis()));
        }

        InteractionResult interactions = interactionService.searchInteractionCouplesForProductIds(productIds, InteractionSeverityType.CONTRAINDICATIONS);
        interactions.getInteractionCoupleList();
        // interactionService.searchInteractionCouplesForProductIds(productIds, severity);
        // consultation.setInteractions(interactions);
    }

    @Override
    public Consultation enregistrer() throws GestionCabinetException {
        return consultation;
    }

    @Override
    public void supprimer() throws GestionCabinetException {
        consultation = null;
    }

}
