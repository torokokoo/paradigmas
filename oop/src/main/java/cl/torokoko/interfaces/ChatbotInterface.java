package cl.torokoko.interfaces;

import cl.torokoko.models.Flow;

import java.util.ArrayList;

public interface ChatbotInterface {
    Integer getId();
    String getName();
    String getWelcomeMessage();
    Integer getStartFlowId();
    ArrayList<Flow> getFlows();
    boolean checkDuplicates(Flow flow);
    void chatbotAddFlow(Flow flow);
    Flow findFlow(Integer id);
}
