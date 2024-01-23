package cl.torokoko.controller;

import cl.torokoko.interfaces.ControllerInterface;
import cl.torokoko.models.*;

import java.util.Objects;

/**
 * Clase controladora para hacer uso del menú a traves de ella, contiene un sistema.
 *
 * @author Diego Toro
 */
public class Controller implements ControllerInterface {
    private Sistema system;

    /**
     * Constructor del controlador.
     * @param system (System) Sistema que se usara.
     */
    public Controller(Sistema system){
        this.system = system;
    }

    /**
     * Retorna el sistema que el controlador esta utilizando
     * @return System
     */
    public Sistema getSystem() { return this.system; }

    // --> RF.10 SystemLogin <--
    /**
     * Metodo para realizar un inicio de sesion a partir del nombre de usuario, para lograrlo realiza una busqueda en los usuarios registrados
     * para encontrar un objeto User que coincida con este nombre de usuario, si lo encuentra realiza el inicio de sesion.
     *
     * @param user (String) nombre de usuario que se quiere iniciar sesion.
     */
    public void systemLogin(String user){
        User foundUser = null;
        for (User u : getSystem().getRegisteredUsers()){
            if (Objects.equals(u.getUsername(), user)) {
                foundUser = u;
            } else {
                System.out.println("El usuario ingresado no se encuentra registrado");
            }
        }

        if (getSystem().getLoggedIn() == null){
            getSystem().setLoggedIn(foundUser);
        } else {
            System.out.println("Ya hay un usuario logeado");
        }
    }

    /**
     * Reimplementacion de systemLogout para que sea mas legible.
     *
     * @see Sistema#systemLogout()
     */
    public void systemLogout(){
        getSystem().systemLogout();
    }

    /**
     * Implementacion de systemAddUser para poder ser utilizado en el menu, para esto crea un usuario nuevo
     * a partir de los parametros ingresados.
     *
     * @param username (String) Nombre de usuario que se desea crear
     * @param role ("user", "admin") Rol del usuario para establecer las capacidades que tendra.
     * @see Sistema#systemAddUser(User)
     */
    public void systemRegister(String username, String role){
        getSystem().systemAddUser(new User(username, role));
    }

    /**
     * Metodo para actualizar el usuario en la lista de usuarios registrados, esto con la finalidad de que los cambios
     * realizados en el usuario system.loggedIn no se borren si desea salir de la sesion (principalmente para temas
     * del historial). Busca dentro de los usuarios registrados el mismo objeto (con el mismo nombre de usuario) y lo sobreescribe.
     *
     * @param newData (User) Usuario con la nueva informacion
     */
    public void systemUpdateUser(User newData){
        for (User u : getSystem().getRegisteredUsers()){
            if (Objects.equals(u.getUsername(), newData.getUsername())) {
                u = newData;
            }
        }
    }
}
