defmodule TechCount do
  @ci_cd ~w(
    ci
    cd
    continuous
    integration
    integração
    contínua
    deploy
    deployment
    delivery
  )
  @database ~w(data banco bancos base database dado dados)
  @relational ~w(relational relacional)
  @ddd ~w(domain-driven ddd)
  @tdd ~w(test-driven tdd)
  @bdd ~w(behavior-driven bdd)
  @test ~w(testing test teste testes tests)
  @css ~w(css css3)
  @data_structure_word_list ~w(
    estruturas
    dados
    algoritmos
    algoritmo
    algorithms
    algorithm
    structure
  )
  @ingles_word_list ~w(ingles inglês)
  @angular ~w(angular angularjs)
  @distributed ~w(
    distributed
    distribuído
    distribuídos
  )
  @react ~w(react reactjs)
  @postgres_word_list ~w(
    postgresql
    postgre
    postgres
  )
  @agile ~w(
    agil
    agile
    agilidade
  )
  @rest ~w(rest restful)
  @oo ~w(
    objetos
    objects
    object
    objeto
    orientation
    orientação
    oop
    poo
    oo
  )

  @spec count(binary) :: [tuple()]
  def count(path_to_file) do
    {:ok, content} = File.read(path_to_file)

    included_words = searched_words("./search_words_file.txt")

    word_count =
      content
      |> sanitize_string()
      |> String.split()
      |> downcase_words()
      |> Enum.frequencies()
      |> Enum.filter(fn {item, _count} -> Enum.member?(included_words, item) end)
      |> Enum.sort_by(fn {_item, count} -> count end, :desc)

    word_count
  end

  @spec downcase_words(list()) :: list
  def downcase_words(enumerable) do
    enumerable |> Enum.map(&String.downcase/1)
  end

  @spec sanitize_string(binary) :: binary
  def sanitize_string(string) do
    string
    |> String.replace("/", " ")
    |> String.replace("(", "")
    |> String.replace(")", "")
    |> String.replace(";", "")
    |> String.replace("&", "")
    |> String.replace(",", "")
    |> String.replace(".", "")
    |> String.replace(":", "")
  end

  @spec searched_words(binary) :: [binary]
  def searched_words(path_to_file) do
    {:ok, included} = File.read(path_to_file)

    String.split(included, "\n")
  end

  @spec write_to_file(list(map())) :: :ok
  def write_to_file(word_count) do
    counting = Enum.map(word_count, fn {item, number} -> "#{item} -> #{number}\n" end)

    File.write!("./otherfile.txt", counting)
  end

  # def return_proper_group() do

  # end
end
