package cl.torokoko.interfaces;

import cl.torokoko.models.Chatbot;
import cl.torokoko.models.User;

import java.util.ArrayList;

public interface SystemInterface {
    String getName();
    Integer getInitialChatbotCodeLink();
    ArrayList<Chatbot> getChatbots();
    User getLoggedIn();
    ArrayList<User> getRegisteredUsers();
    Boolean checkDuplicates(Chatbot chatbot);
    void systemAddChatbot(Chatbot chatbot);
    void systemAddUser(User user);
    void systemLogin(User user);
    void systemLogout();
    Chatbot findChatbot(Integer id);
    void setLoggedIn(User user);
    Boolean isLoggedIn();

}
