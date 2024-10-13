import java.io.*;

public class Main {
    public static void main(String[] args) throws Exception {
        // Verifique se o arquivo de entrada foi passado como argumento
        if (args.length == 0) {
            System.out.println("Por favor, forneça o arquivo de entrada.");
            return;
        }

        // Abra o arquivo de entrada
        FileReader fileReader = new FileReader(args[0]);

        // Crie uma instância do lexer
        foolLexer lexer = new foolLexer(fileReader);

        // Crie uma instância do parser e passe o lexer
        parser p = new parser(lexer);

        try {
            // Inicie a análise
            p.parse();
            System.out.println("Parse concluído sem erros.");
        } catch (Exception e) {
            System.err.println("Erro durante a análise: " + e.getMessage());
            e.printStackTrace();
        }
  }
}
