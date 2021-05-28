defmodule Fib do
  def start() do
    {:ok, pid } = Agent.start_link(fn -> %{ 0 => 0, 1 => 1 } end)
    pid
  end

  def fib(agent, n) do
    Agent.get(agent, &(Map.get(&1, n)))
    |> return_or_compute(n, agent)
  end

  defp return_or_compute(nil, n, agent) do
    result = fib(agent, n-1) + fib(agent, n-2)
    Agent.get_and_update(agent, &({ result, Map.put(&1, n, result) }))
  end

  defp return_or_compute(result, _, _), do: result
end
