package miage.gestioncabinet;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import miage.gestioncabinet.api.Traitement;

public class Test {

    public static void main(String[] argv) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("gestioncabinet-coreDB");
        EntityManager em = emf.createEntityManager();
        Traitement t = em.find(TraitementDB.class, 1);
        System.out.println(t);

        em.close();
        emf.close();
    }
}