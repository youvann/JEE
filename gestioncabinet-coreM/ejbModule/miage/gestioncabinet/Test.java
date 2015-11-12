package miage.gestioncabinet;

import fr.vidal.webservices.interactionservice.ArrayOfInt;
import fr.vidal.webservices.interactionservice.ArrayOfInteractionCouple;
import fr.vidal.webservices.interactionservice.InteractionCouple;
import fr.vidal.webservices.interactionservice.InteractionResult;
import fr.vidal.webservices.interactionservice.InteractionService;
import fr.vidal.webservices.interactionservice.InteractionService_Service;
import fr.vidal.webservices.interactionservice.InteractionSeverityType;

public class Test {

    public static void main(String[] args) {
        /*
         * ProductService productService = new ProductService_Service().getProductServiceHttpPort();
         * 
         * for (fr.vidal.webservices.productservice.Product p : productService .searchByNameAndType("dolip", ProductType.VIDAL).getProduct()) { Produit produit = new ProduitImpl();
         * produit.setNom(p.getName());
         * 
         * System.out.println(produit); }
         */

        try {
            InteractionService interactionService = new InteractionService_Service().getInteractionServiceHttpPort();
            ArrayOfInt productIds = new ArrayOfInt();
            productIds.getInt().add(63368332);
            productIds.getInt().add(65124280);
            productIds.getInt().add(68300762);
            productIds.getInt().add(67010731);
            productIds.getInt().add(63564053);

            ArrayOfInteractionCouple arrayInteractionsCouple = interactionService.searchInteractionCouplesForProductIds(productIds, InteractionSeverityType.CONTRAINDICATIONS)
                    .getInteractionCoupleList();
            for (InteractionCouple interactionCouple : arrayInteractionsCouple.getInteractionCouple()) {
                System.out.println(interactionCouple.getInteractionId());
            }

            System.out.println("finish");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        System.out.println("finish2");
    }

}
