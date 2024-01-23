package cl.torokoko;

import cl.torokoko.controller.Controller;
import cl.torokoko.models.*;
import cl.torokoko.view.Menu;

import java.util.ArrayList;

/**
 * Clase principal
 * Genera ejemplos de chatbots, flujos, opciones y usuarios para que pueda ser probado.
 * Aqui se crea el sistema y se llama al menu.
 *
 * @author Diego Toro
 */
public class Main {
    public static void main(String[] args) {

        // Usuarios de ejemplo
        User user = new User("user1", "user");
        User admin = new User("admin", "admin");


        // CHATBOT 0
        // Se crea el flujo
        Flow flow = new Flow(
                1,
                "Flujo Principal Chatbot 1\n Que te gustaria hacer?",
                new ArrayList<Option>()
        );

        // Se agregan opciones al flujo
        flow.flowAddOption(new Option(
                1, "1) Viajar", 1, 1, new ArrayList<String>()
        ));

        flow.flowAddOption(new Option(
                2, "2) Estudiar", 2, 1, new ArrayList<String>()
        ));

        // Se crea el chatbot
        Chatbot chatbot0 = new Chatbot(
                0, "Inicial", "Bienvenido, que te gustaria hacer?", 1, new ArrayList<Flow>()
        );

        // Se agrega el flujo al chatbot recien creado
        chatbot0.chatbotAddFlow(flow);

//        CHATBOT 1
        // Misma logica de arriba.
        // FLUJO 1 del CHATBOT 1

        Flow flow1 = new Flow(
                1,
                "Flujo 1, Chatbot 1 \n Donde te gustaria ir?",
                new ArrayList<Option>()
        );

        flow1.flowAddOption(new Option(
                1, "1) New York, USA", 1, 2, new ArrayList<String>()
        ));

        flow1.flowAddOption(new Option(
                2, "2) Paris, Francia", 1, 1, new ArrayList<String>()
        ));

        flow1.flowAddOption(new Option(
                3, "3) Torres del Paine, Chile", 1, 1, new ArrayList<String>()
        ));

        flow1.flowAddOption(new Option(
                4, "4) Volver", 0, 1, new ArrayList<String>()
        ));

        // FLUJO 2 del CHATBOT 1
        Flow flow2 = new Flow(
                2,
                "Flujo 2, Chatbot 1 \n Que atractivos te gustaria visitar?",
                new ArrayList<Option>()
        );

        flow2.flowAddOption(new Option(
                1, "1) Central Park", 1, 2, new ArrayList<String>()
        ));

        // Se agrega una opcion con keyword para que pueda ser usada como ejemplo y no ingresar solamente su ID.
        ArrayList<String> keywords = new ArrayList<String>();
        keywords.add("MuSEo");

        flow2.flowAddOption(new Option(
                2, "2) Museos", 1, 2, keywords
        ));

        flow2.flowAddOption(new Option(
                3, "3) Ningun otro atractivo", 1, 3, new ArrayList<String>()
        ));

        flow2.flowAddOption(new Option(
                4, "4) Cambiar destino", 1, 1, new ArrayList<String>()
        ));

        // FLUJO 3 del CHATBOT 1

        Flow flow3 = new Flow(
                3,
                "Flujo 3, Chatbot 1 \n Vas solo o acompanado?",
                new ArrayList<Option>()
        );

        flow3.flowAddOption(new Option(
                1, "1) Solo", 1, 3, new ArrayList<String>()
        ));

        flow3.flowAddOption(new Option(
                2, "2) En pareja", 1, 3, new ArrayList<String>()
        ));

        flow3.flowAddOption(new Option(
                3, "3) En familia", 1, 3, new ArrayList<String>()
        ));

        flow3.flowAddOption(new Option(
                4, "4) Agregar mas atractivos", 1, 2, new ArrayList<String>()
        ));

        flow3.flowAddOption(new Option(
                5, "5) En realidad quiero otro destino", 1, 1, new ArrayList<String>()
        ));

        Chatbot chatbot1 = new Chatbot(
                1, "Agencia Viajes", "Bienvenido, Donde quieres viajar?", 1, new ArrayList<Flow>()
        );

        chatbot1.chatbotAddFlow(flow1);
        chatbot1.chatbotAddFlow(flow2);
        chatbot1.chatbotAddFlow(flow3);

        // CHATBOT 2

        Flow flow4 = new Flow(
                1,
                "Flujo 1 Chatbot 2\n Que te gustaria estudiar?",
                new ArrayList<Option>()
        );

        flow4.flowAddOption(new Option(
                1, "1) Carrera tecnica", 2, 1, new ArrayList<String>()
        ));

        flow4.flowAddOption(new Option(
                2, "2) Posgrado", 2, 1, new ArrayList<String>()
        ));

        flow4.flowAddOption(new Option(
                3, "3) Volver", 0, 1, new ArrayList<String>()
        ));

        Chatbot chatbot2 = new Chatbot(
                2, "Orientador academico", "Bienvenido, que te gustaria estudiar?", 1, new ArrayList<Flow>()
        );

        chatbot2.chatbotAddFlow(flow4);

        // Instancia un nuevo sistema que sera usado por el menu.
        Sistema system = new Sistema("Chatbot Paradigmas", 0, new ArrayList<Chatbot>());

        // Agrega los chatbots al sistema recien instanciado
        system.systemAddChatbot(chatbot0);
        system.systemAddChatbot(chatbot1);
        system.systemAddChatbot(chatbot2);

        // Agrega los usuarios al sistema
        system.systemAddUser(user);
        system.systemAddUser(admin);


        // Instancia un controlador, un menú y ejecuta el Menu.
        Menu menu = new Menu(new Controller(system));
        menu.run();
    }
}