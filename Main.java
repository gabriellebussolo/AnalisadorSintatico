import java.io.*;

public class Main {
    public static void main(String[] args) throws Exception {
        // Verifica se o arquivo de entrada foi passado como argumento
        if (args.length == 0) {
            System.out.println("Erro: envie o arquivo novamente.");
            return;
        }

        // Abre o arquivo de entrada
        FileReader fileReader = new FileReader(args[0]);

        // Cria uma instância do lexer
        foolLexer lexer = new foolLexer(fileReader);

        // Cria uma instância do parser e passa o lexer
        parser p = new parser(lexer);

        try {
            // Inicie a análise
            p.parse();
            System.out.println("Parse concluído com sucesso.");
        } catch (Exception e) {
            System.err.println("Erro durante a análise: " + e.getMessage());
            e.printStackTrace();
        }
  }
}
