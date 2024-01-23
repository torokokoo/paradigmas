package cl.torokoko.models;

import cl.torokoko.interfaces.UserInterface;

import java.util.ArrayList;

/**
 * Clase que representa un usuario, compuesto por su nombre de usuario, el rol [user | admin] y una lista
 * con el historial de los mensajes enviados
 *
 * @author Diego Toro
 */
public class User implements UserInterface {
    private String username;
    private String role;
    private ArrayList<ChatHistory> history;

    /**
     * Constructor del usuario
     * @param username (String) Nombre de usuario
     * @param role (String) Representa el rol, puede tomar los valores "user" o "admin"
     */
    public User(String username, String role){
        this.username = username;
        this.role = role;
        this.history = new ArrayList<ChatHistory>();
    }

    // Getters

    /**
     * Retorna el atributo username del usuario.
     * @return username (String)
     */
    public String getUsername(){
        return this.username;
    }

    /**
     * Retorna el atributo role del usuario.
     * @return role ("user" | "admin")
     */
    public String getRole() { return this.role; }

    /**
     * Retorna el atributo history del usuario.
     * @return history (ArrayList[ChatHistory]).
     */
    public ArrayList<ChatHistory> getHistory() { return this.history; }

    /**
     * Agrega un ChatHistory al historial del usuario
     * @param chatHistory (chatHistory) Clase ChatHistory con la informacion de un mensaje.
     */
    public void addHistory(ChatHistory chatHistory){
        this.history.add(chatHistory);
    }
}
