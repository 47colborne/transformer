defmodule Transformer.ProducerConsumer do
  alias Experimental.GenStage
  alias Transformer.ProducerConsumer
  use GenStage

  def start_link(number) do
    GenStage.start_link(ProducerConsumer, number)
  end

  def init(number) do
    {:producer_consumer, number}
  end

  def handle_events(events, _from, number) do
    events = Enum.map(events, & &1 * number)
    {:noreply, events, number}
  end
end
