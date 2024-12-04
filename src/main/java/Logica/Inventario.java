package Logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Inventario implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idInventario;
    private long codigo;    
    private String nombreBien;
    private String marca;
    private String modelo;
    @Temporal(TemporalType.DATE)
    private Date fechaAlta;
    private String tipoIngreso;
    private String centroCosto;
    private String ubicacionFisica;
    private String estado;

    public Inventario(int idInventario, long codigo, String nombreBien, String marca, String modelo, Date fechaAlta, String tipoIngreso, String centroCosto, String ubicacionFisica, String estado) {
        this.idInventario = idInventario;
        this.codigo = codigo;
        this.nombreBien = nombreBien;
        this.marca = marca;
        this.modelo = modelo;
        this.fechaAlta = fechaAlta;
        this.tipoIngreso = tipoIngreso;
        this.centroCosto = centroCosto;
        this.ubicacionFisica = ubicacionFisica;
        this.estado = estado;
    }

    


    public Inventario() {
    }

    public int getIdInventario() {
        return idInventario;
    }

    public void setIdInventario(int idInventario) {
        this.idInventario = idInventario;
    }

    public long getCodigo() {
        return codigo;
    }

    public void setCodigo(long codigo) {
        this.codigo = codigo;
    }

    public String getNombreBien() {
        return nombreBien;
    }

    public void setNombreBien(String nombreBien) {
        this.nombreBien = nombreBien;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public Date getFechaAlta() {
        return fechaAlta;
    }

    public void setFechaAlta(Date fechaAlta) {
        this.fechaAlta = fechaAlta;
    }

    public String getTipoIngreso() {
        return tipoIngreso;
    }

    public void setTipoIngreso(String tipoIngreso) {
        this.tipoIngreso = tipoIngreso;
    }

    public String getCentroCosto() {
        return centroCosto;
    }

    public void setCentroCosto(String centroCosto) {
        this.centroCosto = centroCosto;
    }

    public String getUbicacionFisica() {
        return ubicacionFisica;
    }

    public void setUbicacionFisica(String ubicacionFisica) {
        this.ubicacionFisica = ubicacionFisica;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
}
