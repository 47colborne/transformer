defmodule Transformer.Consumer do
  alias Experimental.GenStage
  alias Transformer.Consumer
  use GenStage

  def start_link do
    GenStage.start_link(Consumer, :ok)
  end

  def init(:ok) do
    {:consumer, :the_state_does_not_matter}
  end

  def handle_events(events, _from, state) do
    # Wait for a second.
    :timer.sleep(1000)

    # Inspect the events.
    IO.inspect(events)

    # We are a consumer, so we would never emit items.
    {:noreply, [], state}
  end
end
