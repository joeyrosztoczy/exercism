defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([]), do: 0
  def count([_|t]), do: 1 + count(t)

  @spec reverse(list) :: list
  def reverse(l) do
    build_reverse(l, [])
  end

  defp build_reverse([], new_list), do: new_list
  defp build_reverse([h|t], new_list) do
    build_reverse(t, [h| new_list])
  end

  @spec map(list, (any -> any)) :: list
  def map([], _f), do: []
  def map([h|t], fun), do: [fun.(h) | map(t, fun)]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _f), do: []
  def filter([h|t], fun) do
    if fun.(h) do
      [h | filter(t, fun)]
    else
      filter(t, fun)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _f), do: acc
  def reduce([h|t], acc, f), do: reduce(t, f.(h, acc), f)

  @spec append(list, list) :: list
  def append(a, []), do: a
  def append([], b), do: b
  def append([h|t], b), do: [h| append(t, b)]


  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([h|t]), do: append(h, concat(t))
end
