package cl.torokoko.interfaces;

import cl.torokoko.models.Option;

import java.util.ArrayList;

public interface FlowInterface {
    Integer getId();
    String getNameMsg();
    ArrayList<Option> getOption();
    Boolean checkDuplicates(Option option);
    void flowAddOption(Option option);
    void printOptions();
    String returnOptions();
    Option findOption(Integer id);
    Option findOption(String input);
}
