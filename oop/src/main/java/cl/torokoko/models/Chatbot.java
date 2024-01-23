package cl.torokoko.models;

import cl.torokoko.interfaces.ChatbotInterface;

import java.util.ArrayList;
import java.util.Objects;

/**
 * Clase que representa un Chatbot, compuesto por un identificado, un nombre, un mensaje de bienvenida, un flujo de referencia
 * y un listado con flujos.
 *
 * @author Diego Toro
 */

public class Chatbot implements ChatbotInterface {
    private Integer id;
    private String name;
    private String welcomeMessage;
    private Integer startFlowId;
    private ArrayList<Flow> flows;

    /**
     * Constructor de un chatbot.
     *
     * @param id (Integer) Identificador del chatbot
     * @param name (String) Nombre del chatbot
     * @param welcomeMessage (String) Mensaje de bienvenida que se arrojara al usuario
     * @param startFlowId (Integer) Primero flujo al que se mandara una vez ingresa al chatbot
     * @param flows (ArrayList[Flow]) Listado de flujos
     */
    public Chatbot(Integer id, String name, String welcomeMessage, Integer startFlowId, ArrayList<Flow> flows){
        this.id = id;
        this.name = name;
        this.welcomeMessage = welcomeMessage;
        this.startFlowId = startFlowId;
        this.flows = flows;

    }

    /**
     * Metodo que permite revisar si un flujo tiene o no el mismo ID de un flujo ya ingresado en este chatbot.
     * @param newFlow (Flow) Flow que se desea revisar
     * @return Falso si ya se encuentra ingresado un flow con el mismo ID, Verdadero en caso contrario.
     */
    public boolean checkDuplicates(Flow newFlow){
        for (Flow flow: this.flows){
            if (Objects.equals(flow.getId(), newFlow.getId())){
                return false;
            }
        }
        return true;
    }

    // --> RF.5 chatbotAddFlow <--
    /**
     * Metodo que agrega un flujo al chatbot, valida que el flujo nuevo no tenga un ID de un flujo ya ingresado
     * en el chatbot previamente.
     * @param flow (Flow) Flow que se desea agregar.
     */

    public void chatbotAddFlow(Flow flow){
        if (checkDuplicates(flow)){ this.flows.add(flow); }
        else { System.out.println("Ya existe un flujo en este chatbot con el mismo ID"); }
    }

    // Getters

    /**
     * Retorna el identificador
     * @return Integer
     */
    public Integer getId(){
        return this.id;
    }

    /**
     * Retorna el nombre de este chatbot
     * @return String
     */
    public String getName() { return this.name; }

    /**
     * Retorna el mensaje de bienvenida de este chatbot
     * @return String
     */
    public String getWelcomeMessage() { return this.welcomeMessage; }

    /**
     * Retorna el startFlowId
     * @return Integer
     */
    public Integer getStartFlowId() { return this.startFlowId; }

    /**
     * Retorna el listado de flujos de este chatbot.
     * @return ArrayList[Flow]
     */
    public ArrayList<Flow> getFlows() { return this.flows; }

    /**
     * Metodo para encontrar un flujo en este chatbot a partir de su ID.
     * @param id (Integer) ID que se buscara
     * @return El Flow que encuentre, si no encuentra nada retorna null.
     */
    public Flow findFlow(Integer id) {
        for (Flow f : getFlows()){
            if (Objects.equals(f.getId(), id)){
                return f;
            }
        }
        return null;
    }
}
