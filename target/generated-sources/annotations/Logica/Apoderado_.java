package Logica;

import Logica.Estudiante;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2024-12-04T01:18:21", comments="EclipseLink-2.7.10.v20211216-rNA")
@StaticMetamodel(Apoderado.class)
public class Apoderado_ extends Persona_ {

    public static volatile SingularAttribute<Apoderado, Estudiante> estudiante;
    public static volatile SingularAttribute<Apoderado, String> parentesco;
    public static volatile SingularAttribute<Apoderado, String> telefono;

}