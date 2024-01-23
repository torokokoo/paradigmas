package cl.torokoko.interfaces;

import java.util.ArrayList;

public interface OptionInterface {
    Integer getCode();
    String getMessage();
    Integer getChatbotCodeLink();
    Integer getInitialFlowCodeLink();
    ArrayList<String> getKeyword();
}
