package cl.torokoko.models;

import cl.torokoko.interfaces.OptionInterface;

import java.util.ArrayList;

/**
 * Clase que representa una Option,
 * compuesta por un identificador, un mensaje, un chatbotCodeLink, initialFlowCodeLink y una lista de
 * palabras claves
 *
 * @author Diego Toro
 */
public class Option implements OptionInterface {
    private Integer code;
    private String message;
    private Integer chatbotCodeLink;
    private Integer initialFlowCodeLink;
    private ArrayList<String> keyword;

    /**
     *
     * @param code (Integer) Codigo identificador de la opcion
     * @param message (String) Mensaje que arroja la opcion (ej. "1) Viajar")
     * @param chatbotCodeLink (Integer) ID del Chatbot al cual se mandara si elige esta opcion
     * @param initialFlowCodeLink (Integer) ID del flujo contenido el el chatbot [chatbotCodeLink]>
     *                            al cual se mandara si elige esta opcion
     * @param keyword (ArrayList[String]) Lista de palabras claves que sirven como posible respuesta
     *                en vez de ingresar el ID de la opcion.
     */
    public Option(Integer code, String message, Integer chatbotCodeLink, Integer initialFlowCodeLink, ArrayList<String> keyword){
        this.code = code;
        this.message = message;
        this.chatbotCodeLink = chatbotCodeLink;
        this.initialFlowCodeLink = initialFlowCodeLink;
        this.keyword = keyword;
    }

    // Getters

    /**
     * Retorna el atributo code del option.
     * @return code (Integer) del option.
     */
    public Integer getCode(){
        return this.code;
    }

    /**
     * Retorna el atributo mensaje del option
     * @return message (String)
     */
    public String getMessage() { return this.message; }

    /**
     * Retorna el atributo chatbotCodeLink del option
     * @return chatbotCodeLink (Integer)
     */
    public Integer getChatbotCodeLink() { return this.chatbotCodeLink; }

    /**
     * Retorna el atributo initialFlowCodeLink del option
     * @return initialFlowCodeLink (Integer)
     */
    public Integer getInitialFlowCodeLink() { return this.initialFlowCodeLink; }

    /**
     * Retorna el atributo keyword del option.
     * @return keyword (ArrayList[String])
     */
    public ArrayList<String> getKeyword() { return this.keyword; }
}
