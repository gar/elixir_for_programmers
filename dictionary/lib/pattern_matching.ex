defmodule PatternMatching do
  def reverse({a, b}) do
    {b, a}
  end

  def same?(a, a), do: true
  def same?(_, _), do: false
end
