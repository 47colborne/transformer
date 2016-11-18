defmodule Transformer.ProducerConsumer do
  alias Experimental.GenStage
  alias Transformer.ProducerConsumer
  use GenStage

  def start_link do
    GenStage.start_link(ProducerConsumer, :ok)
  end

  def init(number) do
    {:producer_consumer, :no_state}
  end

  def handle_events(events, _from, state) do
    events = Enum.map(events, & String.split(&1, "|"))
      |> Enum.map(fn(row) -> Enum.map(row, &String.upcase/1) end)
    {:noreply, events, state}
  end
end
