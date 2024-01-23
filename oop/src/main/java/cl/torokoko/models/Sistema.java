package cl.torokoko.models;

import cl.torokoko.controller.Controller;
import cl.torokoko.interfaces.SystemInterface;

import java.util.ArrayList;
import java.util.Objects;

/**
 * Clase que representa un sistema, compuesto por su nombre, chatbots, informacion respecto a los usuarios del sistema
 * y a que chatbot va a mandar cuando comience a hablar el usuario.
 * RegisteredUsers: Lista de usuarios, corresponde a los usuarios registrados que pueden logearse en el sistema.
 * LoggedIn: Usuario que se encuentra actualmente loggeado, en caso de que no haya nadie es null.
 *
 * @see Chatbot
 * @see Flow
 * @see Option
 * @see User
 * @author Diego Toro
 */

public class Sistema implements SystemInterface {
    private String name;
    private Integer initialChatbotCodeLink;
    private ArrayList<Chatbot> chatbots;
    private User loggedIn;
    private ArrayList<User> registeredUsers;

    /**
     * Constructor del sistema.
     * @param name (String) Nombre del sistema
     * @param initialChatbotCodeLink (Integer) ID del Chatbot inicial a donde se mandara
     * @param chatbots (ArrayList[Chatbot]) Listado de chatbots correspondientes al sistema.
     */
    public Sistema(String name, Integer initialChatbotCodeLink, ArrayList<Chatbot> chatbots){
        this.name = name;
        this.initialChatbotCodeLink = initialChatbotCodeLink;
        this.chatbots = chatbots;
        this.loggedIn = null;
        this.registeredUsers = new ArrayList<User>();

    }

    /**
     * Metodo que permite revisar si un chatbot tiene o no el mismo ID de un chatbot ya ingresado en este sistema.
     *
     * @param newChatbot (Chatbot) Chatbot que se desea revisar
     * @return boolean Falso si ya se encuentra ingresado un chatbot con el mismo ID, Verdadero en caso contrario.
     */
    public Boolean checkDuplicates(Chatbot newChatbot){
        for (Chatbot chatbot : this.chatbots){
            if (Objects.equals(chatbot.getId(), newChatbot.getId())){
                return false;
            }
        }
        return true;
    }

    // ---> RF.8 systemAddChatbot <---
    /**
     * Metodo que permite agregar un chatbot nuevo al sistema, para esto hace uso del metodo checkDuplicates()
     * y de esta forma revisar que no se repitan los IDs, en caso de que este bien se agrega, caso contrario imprime
     * al usuario el error.
     *
     * @param chatbot (Chatbot) Chatbot que se desea agregar.
     */
    public void systemAddChatbot(Chatbot chatbot){
        if (checkDuplicates(chatbot)){ this.chatbots.add(chatbot); }
        else { System.out.println("Ya existe un chatbot en este sistema con el mismo ID"); }
    }

    // ---> RF.9 systemAddUser <--

    /**
     * Metodo que agrega un usuario al sistema, para hacer esto valida que no exista un usuario ya registrado
     * con el mismo nombre de usuario a traves de un ciclo for.
     *
     * @param newUser (User) Usuario que se desea agregar al sistema.
     */
    public void systemAddUser(User newUser){
        boolean error = false;
        for (User user : this.registeredUsers){
            if (Objects.equals(user.getUsername(), newUser.getUsername())) {
                error = true;
                break;
            }
        }
        if (error) {
            System.out.println("Ya hay un usuario registrado con este nombre");
        } else {
            this.registeredUsers.add(newUser);
        }
    }

    // --> RF.10 systemLogin <--

    /**
     * Metodo para que un usuario pueda ingresar al sistema, para esto valida que no haya nadie loggeado y que el usuario
     * se encuentre en la lista de usuarios registrados.
     * @deprecated este metodo funciona perfectamente, pero para realizar su implementacion a traves del menu
     * se encuentra contenido en otro metodo para simplicidad del codigo y del usuario.
     *
     * @see Controller#systemLogin(String)
     * @param user (User) Usuario que se desea logear.
     */
    public void systemLogin(User user){
        if (this.registeredUsers.contains(user) && this.loggedIn == null){
            this.loggedIn = user;
        } else {
            System.out.println("El usuario no se encuentra registrado o ya hay un usuario logeado");
        }
    }

    /**
     * Metodo para cerrar la sesion del sistema, sobreescribe el atributo .loggedIn con valor null.
     * es utilizado por el controlador para poder hacer uso de este el en menú interactivo.
     *
     * @see Controller
     * @see Controller#systemLogout()
     */
    public void systemLogout() {
        this.loggedIn = null;
    }

    /**
     * Metodo para encontrar un chatbot dentro del sistema a partir del ID ingresado, se utiliza un ciclo for y comparacion.
     * @param id (Integer) ID del chatbot que se quiere encontrar
     * @return Chatbot Si encuentra el Chatbot retorna este objeto, caso contrario retorna null.
     */
    public Chatbot findChatbot(Integer id) {
        for (Chatbot c : getChatbots()){
            if (Objects.equals(c.getId(), id)){
                return c;
            }
        }
        return null;
    }

    // Getters
    /**
     * Retorna el nombre del sistema.
     * @return String
     */
    public String getName(){ return this.name; }

    /**
     * Retorna el atributo initialChatbotCodeLink del sistema
     * @return Integer
     */
    public Integer getInitialChatbotCodeLink() { return this.initialChatbotCodeLink; }

    /**
     * Retorna el listado de chatbots correspondientes al sistema.
     * @return ArrayList[Chatbot]
     */
    public ArrayList<Chatbot> getChatbots() { return this.chatbots; }

    /**
     * Retorna el usuario logeado actualmente en el sistema.
     * @return User | null si no hay nadie loggeado.
     */
    public User getLoggedIn() { return this.loggedIn; }

    /**
     * Retorna el listado de usuarios registrados en el sistema.
     * @return ArrayList[User]
     */
    public ArrayList<User> getRegisteredUsers() { return this.registeredUsers; }

    // Setters

    /**
     * Modifica el usuario loggeado en el sistema por el ingresado.
     * @param user (User)
     */
    public void setLoggedIn(User user) { this.loggedIn = user; }

    /**
     * Valida si hay un usuario loggeado en el sistema.
     *
     * @return Boolean
     */
    public Boolean isLoggedIn() {
        return this.loggedIn != null;
    }
}
