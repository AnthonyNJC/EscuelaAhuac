package Logica;

import Logica.Grado;
import Logica.Usuario;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2024-09-25T20:29:07", comments="EclipseLink-2.7.10.v20211216-rNA")
@StaticMetamodel(Docente.class)
public class Docente_ extends Persona_ {

    public static volatile SingularAttribute<Docente, Grado> grado;
    public static volatile SingularAttribute<Docente, Usuario> usuario;
    public static volatile SingularAttribute<Docente, String> telefono;

}