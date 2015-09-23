defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """

  @spec count(String.t) :: map()
  def count(sentence) do
  	sentence
  	|> String.downcase
  	|> strip_punctuation
  	|> get_unique_word_count
  	|> Enum.into(%{})
  end

  @spec get_unique_word_count(List.t) :: list()
  defp get_unique_word_count(list) do
  	list
  	|> Enum.group_by(&(&1))
  	|> Enum.map(fn ({k, v}) -> {k, length(v)} end)
  end

  @spec strip_punctuation(String.t) :: list()
  defp strip_punctuation(string) do
	  String.split(string, ~r/[^\p{L}0-9'\-]/u, trim: true)
  end

end
