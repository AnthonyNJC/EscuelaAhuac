package Logica;

import Logica.Docente;
import Logica.Estudiante;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2024-10-20T19:23:01", comments="EclipseLink-2.7.10.v20211216-rNA")
@StaticMetamodel(Grado.class)
public class Grado_ { 

    public static volatile ListAttribute<Grado, Estudiante> listaEstudiantes;
    public static volatile SingularAttribute<Grado, Integer> idGrado;
    public static volatile SingularAttribute<Grado, String> ordenGrado;
    public static volatile SingularAttribute<Grado, Docente> docente;

}