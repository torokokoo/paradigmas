package cl.torokoko.interfaces;

import cl.torokoko.models.ChatHistory;

import java.util.ArrayList;

public interface UserInterface {
    String getUsername();
    String getRole();
    ArrayList<ChatHistory> getHistory();
    void addHistory(ChatHistory chatHistory);
}
