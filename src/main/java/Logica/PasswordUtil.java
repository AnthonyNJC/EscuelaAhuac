package Logica;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordUtil {

    // Método para cifrar la contraseña con SHA-256
    public static String hashPassword(String password) {
        try {
            // Obtener la instancia del algoritmo SHA-256
            MessageDigest digest = MessageDigest.getInstance("SHA-256");

            // Convertir la contraseña en un array de bytes
            byte[] hashBytes = digest.digest(password.getBytes());

            // Convertir el array de bytes en una cadena hexadecimal
            StringBuilder hexString = new StringBuilder();
            for (byte b : hashBytes) {
                // Convierte cada byte a su representación hexadecimal
                hexString.append(String.format("%02x", b));
            }

            // Retornar el hash de la contraseña en formato hexadecimal
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null; // Retorna null en caso de error
        }
    }

    
}