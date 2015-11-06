package miage.gestioncabinet;

import fr.vidal.webservices.productservice.ProductService;
import fr.vidal.webservices.productservice.ProductService_Service;
import fr.vidal.webservices.productservice.ProductType;
import miage.gestioncabinet.api.Produit;

public class Test {

    public static void main(String[] args) {
        ProductService productService = new ProductService_Service().getProductServiceHttpPort();
        
        for (fr.vidal.webservices.productservice.Product p : productService
                .searchByNameAndType("dolip", ProductType.VIDAL).getProduct()) {
            Produit produit = new ProduitImpl();
            produit.setNom(p.getName());
            
            System.out.println(produit);
        }
    }

}
