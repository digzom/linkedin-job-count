defmodule TechCountTest do
  use ExUnit.Case
  doctest TechCount

  @right_words [
    {"mongodb", 1},
    {"algoritmos", 1},
    {"c#", 1},
    {"git", 1},
    {"javascript", 1},
    {"python", 1},
    {"bancos", 1},
    {"clojure", 1},
    {"elixir", 1},
    {"versionamento", 1},
    {"ágeis", 1},
    {"sql", 1},
    {"estruturas", 1},
    {"c++", 1},
    {"oracle", 1},
    {"testes", 1},
    {"escaláveis", 1},
    {"padrões", 1},
    {"golang", 1},
    {"arquitetura", 1},
    {"c", 1},
    {"scala", 1},
    {"ruby", 1},
    {"mysql", 1},
    {"dados", 2},
    {"svn", 1},
    {"java", 1}
  ]

  test "count" do
    words = TechCount.count("test/test_job.txt")

    assert words == @right_words
  end
end
