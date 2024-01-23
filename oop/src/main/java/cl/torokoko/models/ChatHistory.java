package cl.torokoko.models;

import cl.torokoko.interfaces.ChatHistoryInterface;

import java.util.Date;

/**
 * Clase que representa un ChatHistory, aqui se encuentra el nombre de quien envio el mensaje, el mensaje y la fecha.
 *
 * @author Diego Toro
 */
public class ChatHistory implements ChatHistoryInterface {
    private String name;
    private String message;
    private Date date;

    /**
     * Constructor de ChatHistory
     * @param name (String) Nombre del usuario o chatbot que envio el mensaje.
     * @param message (String) Contenido del mensaje enviado.
     */
    public ChatHistory(String name, String message){
        this.name = name;
        this.message = message;
        this.date = new Date(); // Se genera una nueva fecha en el momento que se instancia la clase.
    }

    // Getters

    /**
     * Retorna el usuario o chatbot que envio el mensaje.
     * @return String
     */
    public String getName(){ return this.name; }

    /**
     * Retorna el contenido del mensaje.
     * @return String
     */
    public String getMessage() { return this.message; }

    /**
     * Retorna la fecha de envio del mensaje
     * @return Date
     */
    public Date getDate() { return this.date; }
}
