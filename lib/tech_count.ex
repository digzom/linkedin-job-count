defmodule TechCount do
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
end
