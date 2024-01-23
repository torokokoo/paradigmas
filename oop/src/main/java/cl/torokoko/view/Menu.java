package cl.torokoko.view;

import cl.torokoko.controller.Controller;
import cl.torokoko.models.ChatHistory;
import cl.torokoko.models.Chatbot;
import cl.torokoko.models.Flow;
import cl.torokoko.models.Option;

import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Objects;
import java.util.Scanner;

public class Menu {
    private Controller controller;

    public Menu(Controller controller){
        this.controller = controller;
    }

    public Controller getController(){ return this.controller; }

    public void setController(Controller controller){ this.controller = controller;}

    public void run(){
        Scanner input = new Scanner(System.in);
        boolean exit = false;
        Controller controller = getController();

        while (!exit) {
            if (getController().getSystem().isLoggedIn()) {
                if (getController().getSystem().isLoggedIn()) {
                    if (Objects.equals(getController().getSystem().getLoggedIn().getRole(), "user")){
                        runUserOptions(input);
                    } else {
                        runAdminOptions(input);
                    }
                }
            } else {
                printWelcome();
                try {
                    System.out.println("Introduzca su elección: ");
                    int option = input.nextInt();

                    switch (option) {
                        case 1:
                            runLogin(input);
                            break;

                        case 2:
                            runRegister(input);
                            break;

                        case 3:
                            exit = true;
                            break;

                        default:
                            System.out.println("Intentelo nuevamente");
                            break;
                    }
                } catch (InputMismatchException e) {
                    System.out.println("Ha ingresado una opcion invalida");
                    input.next();
                }
            }

        }
    }

    private void runLogin(Scanner input){
        printLogin();
        String username = input.next();

        getController().systemLogin(username);

        if (getController().getSystem().isLoggedIn()) {
            if (Objects.equals(getController().getSystem().getLoggedIn().getRole(), "user")){
                runUserOptions(input);
            } else {
                runAdminOptions(input);
            }
        }
    }

    private void runRegister(Scanner input){
        printRegister();

        System.out.println("Ingrese su nombre de usuario: ");
        String username = input.next();

        System.out.println("Ingrese su rol ['user', 'admin']: ");
        String role = input.next().toLowerCase();

        getController().systemRegister(username, role);
    }

    private void runUserOptions(Scanner input){
        printUserOptions();
        System.out.println("Introduzca su elección: ");
        int option = input.nextInt();

        try {
            switch (option) {
                case 1:
                    systemTalk(input);
                    break;

                case 2:
                    systemSynthesis();
                    break;

                case 3:
                    System.out.println("Simular");
                    break;

                case 4:
                    getController().systemLogout();
                    break;

                default:
                    System.out.println("Intentelo nuevamente");
                    break;
            }
        } catch (InputMismatchException e) {
            System.out.println("Ha ingresado una opcion invalida");
            input.next();
        }

    }

    private void runAdminOptions(Scanner input){
        printAdminOptions();
        int option = input.nextInt();

        try {
            System.out.println("Introduzca su elección: ");
            switch (option) {
                case 1:
                    systemTalk(input);
                    break;

                case 2:
                    systemSynthesis();
                    break;

                case 3:
                    System.out.println("Simular");
                    break;

                case 4:
                    runCreateChatbot(input);
                    break;

                case 5:
                    runCreateFlow(input);
                    break;

                case 6:
                    runCreateOption(input);
                    break;

                case 7:
                    getController().systemLogout();
                    break;

                default:
                    System.out.println("Intentelo nuevamente");
                    break;
            }
        } catch (InputMismatchException e) {
            System.out.println("Ha ingresado una opcion invalida");
            input.next();
        }
    }

    private void systemTalk(Scanner input){
        Chatbot chatbotStart = getController().getSystem().findChatbot(getController().getSystem().getInitialChatbotCodeLink());
        Flow flowStart = chatbotStart.findFlow(chatbotStart.getStartFlowId());

        flowStart.printOptions();
        System.out.println("Ingrese la opcion que desea: ");
        input.nextLine();
        String option = input.nextLine();

        getController().getSystem().getLoggedIn().addHistory(
                new ChatHistory(
                        chatbotStart.getName() + ": " + flowStart.getNameMsg(),
                        flowStart.returnOptions()
                )
        );

        getController().getSystem().getLoggedIn().addHistory(
                new ChatHistory(
                        getController().getSystem().getLoggedIn().getUsername(),
                        option
                )
        );

        getController().systemUpdateUser(getController().getSystem().getLoggedIn());

        systemTalk(
                flowStart.findOption(option).getChatbotCodeLink(),
                flowStart.findOption(option).getInitialFlowCodeLink(),
                input
        );


    }


    private void systemTalk(Integer chatbotId, Integer flowId, Scanner input){
        Chatbot chatbot = getController().getSystem().findChatbot(chatbotId);
        Flow flow = chatbot.findFlow(flowId);

        flow.printOptions();
        System.out.println("Ingrese la opcion que desea (-1 para salir): ");
        String option = input.nextLine();

        getController().getSystem().getLoggedIn().addHistory(
                new ChatHistory(
                        chatbot.getName() + ": " + flow.getNameMsg(),
                        flow.returnOptions()
                )
        );

        getController().getSystem().getLoggedIn().addHistory(
                new ChatHistory(
                        getController().getSystem().getLoggedIn().getUsername(),
                        option
                )
        );

        getController().systemUpdateUser(getController().getSystem().getLoggedIn());

        if (!Objects.equals(option, "-1")) {
            systemTalk(
                    flow.findOption(option).getChatbotCodeLink(),
                    flow.findOption(option).getInitialFlowCodeLink(),
                    input
            );
        }

    }

    private void systemSynthesis(){
        System.out.println("### HISTORIAL ###");
        for (ChatHistory ch : getController().getSystem().getLoggedIn().getHistory()){
            System.out.println(ch.getDate() + ": " + ch.getName());
            System.out.println(ch.getMessage() + "\n\n");
        }
        System.out.println("### FIN HISTORIAL ###");
    }

    private void runCreateChatbot(Scanner input){
        System.out.println("Ingrese el ID del nuevo chatbot: ");
        int id = input.nextInt();

        System.out.println("Ingrese el nombre del nuevo chatbot: ");
        String name = input.next();

        System.out.println("Ingrese el mensaje de bienvenida del nuevo chatbot: ");
        String welcomeMessage = input.next();

        System.out.println("Ingrese el ID del flow inicial del nuevo chatbot: ");
        int startFlowId = input.nextInt();

        getController().getSystem().systemAddChatbot(
                new Chatbot(
                        id,
                        name,
                        welcomeMessage,
                        startFlowId,
                        new ArrayList<Flow>()
                )
        );

        for (Chatbot c : getController().getSystem().getChatbots()){
            System.out.println(c.getName());
        }

    }

    private void runCreateFlow(Scanner input){
        System.out.println("Ingrese el ID del nuevo flujo: ");
        int id = input.nextInt();

        System.out.println("Ingrese el mensaje del nuevo flujo: ");
        String nameMsg = input.next();

        System.out.println("Ingrese el ID del chatbot donde quieres agregar este flujo: ");
        int chatbotId = input.nextInt();

        if (getController().getSystem().findChatbot(chatbotId) != null) {
            getController().getSystem()
                    .findChatbot(chatbotId)
                    .chatbotAddFlow(
                            new Flow(
                                    id,
                                    nameMsg,
                                    new ArrayList<Option>()
                            )
                    );
        } else {
            System.out.println("No existe el ID del chatbot ingresado");
        }

        for (Chatbot c : getController().getSystem().getChatbots()){
            System.out.println();
            for (Flow f : c.getFlows()){
                System.out.println(f.getNameMsg());
            }
        }
    }

    private void runCreateOption(Scanner input){
        System.out.println("Ingrese el ID de la nueva opcion: ");
        int id = input.nextInt();

        System.out.println("Ingrese el mensaje de la nueva opcion: ");
        input.next();
        String message = input.nextLine();

        System.out.println("Ingrese el chatbotCodeLink de la nueva opcion: ");
        int chatbotCodeLink = input.nextInt();

        System.out.println("Ingrese el initialFlowCodeLink de la nueva opcion: ");
        int initialFlowCodeLink = input.nextInt();

        ArrayList<String> keywords = new ArrayList<String>();

        boolean exit = false;
        while (!exit) {
            System.out.println("Ingrese una keyword para esta opcion (escribe -1 para salir): ");
            String keyword = input.next();
            if (Objects.equals(keyword, "-1")) {
                exit = true;
            } else {
                keywords.add(keyword);
            }
        }

        System.out.println("Ingrese el ID del chatbot donde quieres agregar esta opcion: ");
        int chatbotId = input.nextInt();

        System.out.println("Ingrese el ID del flujo donde quieres agregar esta opcion: ");
        int flowId = input.nextInt();

        if (
                getController().getSystem().findChatbot(chatbotId) != null
                && getController().getSystem().findChatbot(chatbotId).findFlow(flowId) != null
        ) {
            getController().getSystem()
                    .findChatbot(chatbotId)
                    .findFlow(flowId)
                    .flowAddOption(
                            new Option(
                                    id,
                                    message,
                                    chatbotCodeLink,
                                    initialFlowCodeLink,
                                    keywords
                            )
                    );
        } else {
            System.out.println("No existe el ID del chatbot ingresado");
        }

        for (Chatbot c : getController().getSystem().getChatbots()){
            for (Flow f : c.getFlows()) {
                for (Option o : f.getOption()) {
                    System.out.println(o.getMessage());
                }
            }
        }

    }

    private void printUserOptions(){
        System.out.println("\n\n### Bienvenido " + getController().getSystem().getLoggedIn().getUsername());
        System.out.println("1. Hablar con el chatbot"); /* system-talk */
        System.out.println("2. Revisar el historial de una conversacion previa");
        System.out.println("3. Simular una conversacion");
        System.out.println("4. Cerrar sesión");
    }

    private void printAdminOptions(){
        System.out.println("\n\n### Bienvenido " + getController().getSystem().getLoggedIn().getUsername());
        System.out.println("1. Hablar con el chatbot"); /* system-talk */
        System.out.println("2. Revisar el historial de una conversacion previa");
        System.out.println("3. Simular una conversacion");
        System.out.println("4. Crear y agregar un chatbot");
        System.out.println("5. Crear y agregar un flujo a un chatbot");
        System.out.println("6. Crear y agregar una opcion a un flujo");
        System.out.println("7. Cerrar sesión");
    }
    private void printWelcome(){
        System.out.println("\n\n### Sistema de Chatbots " + getController().getSystem().getName() +  " - Bienvenido ###");
        System.out.println("1. Login de usuario");
        System.out.println("2. Registro de usuario");
        System.out.println("3. Salir");
    }

    private void printLogin(){
        System.out.println("### Log-in de usuarios ###");
        System.out.println("Ingrese su nombre de usuario: ");
    }

    private void printRegister(){
        System.out.println("\n\n### Registro de usuarios");
    }
}
