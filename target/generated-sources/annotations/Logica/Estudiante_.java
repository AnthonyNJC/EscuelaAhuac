package Logica;

import Logica.Apoderado;
import Logica.Grado;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2024-10-20T19:23:01", comments="EclipseLink-2.7.10.v20211216-rNA")
@StaticMetamodel(Estudiante.class)
public class Estudiante_ extends Persona_ {

    public static volatile SingularAttribute<Estudiante, Grado> grado;
    public static volatile SingularAttribute<Estudiante, Apoderado> apoderado;

}