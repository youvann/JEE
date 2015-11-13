package miage.gestioncabinet;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import miage.gestioncabinet.api.Personne;

@Entity
@Table(name = "Personne")
@SequenceGenerator(name = "personne_id", sequenceName = "Personne_id_seq", allocationSize = 1)
public class PersonneDB implements miage.gestioncabinet.api.Personne {
    private static final long serialVersionUID = 1500822243878580383L;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "personne_id")
    protected Long            id;
    @Column(name = "nom")
    protected String          nom;
    @Column(name = "prenom")
    protected String          prenom;
    @PersistenceContext(unitName = "MIDB")
    private EntityManager      em;

    @Override
    public Long getId() {
        return id;
    }

    @Override
    public String getNom() {
        return nom;
    }

    @Override
    public void setNom(String nom) {
        this.nom = nom;
    }

    @Override
    public String getPrenom() {
        return prenom;
    }

    @Override
    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    @Override
    public String toString() {
        Personne p = em.find(PersonneDB.class, 1);
        System.out.println(p);
        return id + ", " + nom + ", " + prenom;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        result = prime * result + ((nom == null) ? 0 : nom.hashCode());
        result = prime * result + ((prenom == null) ? 0 : prenom.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        PersonneDB other = (PersonneDB) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (nom == null) {
            if (other.nom != null)
                return false;
        } else if (!nom.equals(other.nom))
            return false;
        if (prenom == null) {
            if (other.prenom != null)
                return false;
        } else if (!prenom.equals(other.prenom))
            return false;
        return true;
    }

}
