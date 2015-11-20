package miage.gestioncabinet;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import miage.gestioncabinet.api.Personne;

public class Test {

    public static void main(String[] argv) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("gestioncabinet-coreDB");
        EntityManager em = emf.createEntityManager();
        Personne p = em.find(PersonneDB.class, 1);
        System.out.println(p);

        em.close();
        emf.close();
    }
}