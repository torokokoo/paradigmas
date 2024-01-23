package cl.torokoko.models;

import cl.torokoko.interfaces.FlowInterface;

import java.util.ArrayList;
import java.util.Objects;

/**
 * Clase que representa un flujo, compuesto por un identificador, un mensaje y un listado de opciones.
 *
 * @see Sistema
 * @see Chatbot
 * @see Option
 * @author Diego Toro
 */
public class Flow implements FlowInterface {
    private Integer id;
    private String nameMsg;
    private ArrayList<Option> option;

    /**
     * Constructor de flujo.
     * @param id (Integer) Identificador del flujo
     * @param nameMsg (String) Mensaje para anunciar al usuario en que flujo se encuentra.
     * @param option (ArrayList[Option]) Listado de opciones
     */
    public Flow(Integer id, String nameMsg, ArrayList<Option> option){
        this.id = id;
        this.nameMsg = nameMsg;
        this.option = option;

    }

    /**
     * Metodo que permite revisar si un option tiene o no el mismo ID de un option ya ingresado en este flujo.
     *
     * @param option (Option) Option que se desea revisar
     * @return Falso si ya se encuentra ingresado un option con el mismo ID, Verdadero en caso contrario.
     */
    public Boolean checkDuplicates(Option option){
        for (int i = 0; i < this.option.size(); i++){
            if (Objects.equals(this.option.get(i).getCode(), option.getCode())){
                return false;
            }
        }
        return true;
    }

    // --> RF.3 flowAddOption <--

    /**
     * Metodo para agregar una nueva opcion a este flujo, la opcion no puede tener el mismo ID de una opcion
     * que ya se encuentre ingresada previamente en este flujo.
     * @param option (Option) Opcion que se desea agregar.
     */
    public void flowAddOption(Option option){
        if (checkDuplicates(option)){ this.option.add(option); }
        else { System.out.println("Ya existe una opcion en este flujo con el mismo ID"); }
    }

    /**
     * Metodo para imprimir las opciones de este flujo, cicla a traves de ellas con un for y las imprime una a una.
     */
    public void printOptions(){
        for (Option o : getOption()){
            System.out.println(o.getMessage());
        }
    }

    /**
     * Metodo para retornar las opciones de este flujo como una cadena de texto con saltos de linea para cada opcion.
     * @return String
     */
    public String returnOptions(){
        String string = "";
        for (Option o : getOption()){
            string += o.getMessage() + "\n";
        }
        return string;
    }

    // Getters

    /**
     * Retorna el identificador del flujo
     * @return Integer
     */
    public Integer getId(){
        return this.id;
    }

    /**
     * Retorna el mensaje del flujo
     * @return String
     */
    public String getNameMsg() { return this.nameMsg; }

    /**
     * Retorna el listado de opciones del flujo.
     * @return ArrayList[Option]
     */
    public ArrayList<Option> getOption() { return this.option; }

    /**
     * Encuentra una opcion dentro de este flujo a partir del ID ingresado.
     * @param id (Integer) ID que se busca.
     *
     * @deprecated Debido a la ambiguedad de datos que puede ingresar el usuario, se optó por realizar
     * la busqueda a partir de un String.
     *
     * @see #findOption(String)
     * @return Option si encuentra una, null si no encuentra nada.
     */
    public Option findOption(Integer id) {
        for (Option o : getOption()){
            if (Objects.equals(o.getCode(), id)){
                return o;
            }
        }
        return null;
    }

    /**
     * Encuentra una opcion dentro de este flujo a partir de un ID o de una palabra clave.
     * @param input (String) puede ser un ID de Option, o un Keyword perteneciente a la option.
     * @return Option si encuentra una, null si no encuentra nada.
     */
    public Option findOption(String input) {
        // Llama a funcion auxiliar para revisar si es un entero (o sea, un ID)
        if (isInteger(input)) {
            for (Option o : getOption()){
                // Itera a traves de las opciones y busca un ID que coincida.
                if (Objects.equals(o.getCode(), Integer.parseInt(input))){
                    return o;
                }
            }
        // En caso de que no sea un Integer, se asume que es una keyword
        } else {
            for (Option o : getOption()){
                // Itera a traves de las keyword
                for (String k : o.getKeyword()){
                    // Compara las keyword y el string ingresado, para esto lo convierte a lowerCase.
                    if (Objects.equals(k.toLowerCase(), input.toLowerCase())){
                        return o;
                    }
                }
            }
        }

        return null;
    }

    /**
     * Revisa si la cadena de texto ingresada corresponde a un entero.
     *
     * @param str (String) Cadena de texto a revisar.
     * @return True si es un entero, False si no lo es.
     *
     * @author Jonas Klemming
     * @see <a href="https://stackoverflow.com/a/237204">Respuesta de StackOverflow</a>
     */
    private static boolean isInteger(String str) {
        if (str == null) {
            return false;
        }
        int length = str.length();
        if (length == 0) {
            return false;
        }
        int i = 0;
        if (str.charAt(0) == '-') {
            if (length == 1) {
                return false;
            }
            i = 1;
        }
        for (; i < length; i++) {
            char c = str.charAt(i);
            if (c < '0' || c > '9') {
                return false;
            }
        }
        return true;
    }
}
