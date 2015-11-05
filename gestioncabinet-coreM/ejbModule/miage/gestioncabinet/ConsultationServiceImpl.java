package miage.gestioncabinet;

import java.util.List;

import fr.vidal.webservices.interactionservice.Product;
import fr.vidal.webservices.productservice.ProductService;
import fr.vidal.webservices.productservice.ProductService_Service;
import fr.vidal.webservices.productservice.ProductType;
import miage.gestioncabinet.api.Consultation;
import miage.gestioncabinet.api.ConsultationRemoteService;
import miage.gestioncabinet.api.GestionCabinetException;
import miage.gestioncabinet.api.Produit;

public class ConsultationServiceImpl implements ConsultationRemoteService {

    @Override
    public Consultation getConsultation() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public void setConsultation(Consultation consultation) {
        // TODO Auto-generated method stub

    }

    @Override
    public List<Produit> rechercherMedicament(String keyword) throws GestionCabinetException {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public void analyserPrescription() throws GestionCabinetException {
        // TODO Auto-generated method stub

    }

    @Override
    public Consultation enregistrer() throws GestionCabinetException {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public void supprimer() throws GestionCabinetException {
        // TODO Auto-generated method stub

    }

    private void initialiser() {
        try {
            ProductService productService = new ProductService_Service().getProductServiceHttpPort();
            for (fr.vidal.webservices.productservice.Product p : productService
                    .searchByNameAndType("dolip", ProductType.VIDAL).getProduct()) {
                Produit produit = new miage.gestioncabinet.ProduitImpl();
                produit.setNom(p.getName());
            }
        } catch (Exception e) {

        }
    }

}
