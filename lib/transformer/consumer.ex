defmodule Transformer.Consumer do
  alias Experimental.GenStage
  alias Transformer.Consumer
  use GenStage

  def start_link do
    GenStage.start_link(Consumer, File.open!("output.txt", [:write, :utf8]))
  end

  def init(file) do
    {:consumer, file}
  end

  def handle_events(events, _from, file) do
    # Inspect the events.
    IO.inspect(events)

    Enum.each(events, & handle_event(&1, file))

    # We are a consumer, so we would never emit items.
    {:noreply, [], file}
  end

  def handle_event(event, file) do
    line = Enum.join(event, "|")
    IO.write(file, line)
  end
end
