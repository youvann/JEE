package miage.gestioncabinet;

import java.util.List;

import fr.vidal.webservices.productservice.ProductService;
import fr.vidal.webservices.productservice.ProductService_Service;
import fr.vidal.webservices.productservice.ProductType;
import miage.gestioncabinet.api.Consultation;
import miage.gestioncabinet.api.ConsultationRemoteService;
import miage.gestioncabinet.api.GestionCabinetException;
import miage.gestioncabinet.api.Produit;

public class ConsultationServiceDB implements ConsultationRemoteService {

    private Consultation consultation;

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
                Produit produit = new miage.gestioncabinet.ProduitDB();
                produit.setNom(p.getName());
                System.out.println(produit);
            }
        } catch (Exception e) {

        }
    }

}
