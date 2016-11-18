defmodule Transformer.Consumer do
  alias Experimental.GenStage
  alias Transformer.Consumer
  use GenStage

  def start_link do
    GenStage.start_link(Consumer, %{file: File.open!("output.txt", [:write, :utf8]), counter: 0})
  end

  def init(state) do
    {:consumer, state}
  end

  def handle_events(events, _from, %{file: file, counter: counter}) do
    Enum.each(events, & handle_event(&1, file, counter))

    # We are a consumer, so we would never emit items.
    {:noreply, [], %{file: file, counter: counter + Enum.count(events)}}
  end

  def handle_event(event, file, counter) do
    IO.puts "Writing line #{counter}..."
    line = Enum.join(event, "|")
    IO.write(file, line)
  end
end
