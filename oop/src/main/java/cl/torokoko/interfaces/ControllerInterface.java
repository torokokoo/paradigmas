package cl.torokoko.interfaces;

import cl.torokoko.models.Sistema;
import cl.torokoko.models.User;

public interface ControllerInterface {
    Sistema getSystem();
    void systemLogin(String username);
    void systemLogout();
    void systemRegister(String username, String role);
    void systemUpdateUser(User newData);
}
