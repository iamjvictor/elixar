ExUnit.start()

defmodule LeituraArquivoMaiusculas do
  @doc """
  Lê o conteúdo de um arquivo de texto e o retorna em maiúsculas.

  ## Dicas
  - Use `File.read!/1` para ler o arquivo e `String.upcase/1` para converter o texto.

  ## Exemplos

      # Supondo que o conteúdo do arquivo seja "conteúdo de teste"
      iex> LeituraArquivoMaiusculas.run("caminho/do/arquivo.txt")
      "CONTEÚDO DE TESTE"
  """
  @spec run(String.t()) :: String.t() | :error
  def run(path) do
    case File.read(path) do
      {:ok, content} -> String.upcase(content)
      {:error, reason} -> {:error, reason}
    end
  end
end


defmodule LeituraArquivoMaiusculasTest do
  use ExUnit.Case, async: true

  test "retorna o conteúdo do arquivo em maiúsculas" do
    assert LeituraArquivoMaiusculas.run("sup/Texto.txt") == "FLAMENGO É O MAIOR !"
  end
end
