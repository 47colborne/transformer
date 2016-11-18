defmodule Transformer.Consumer do
  alias Experimental.GenStage
  alias Transformer.Consumer
  use GenStage

  def start_link do
    GenStage.start_link(Consumer, %{file: File.open!("output.txt", [:write, :utf8]), counter: 1})
  end

  def init(state) do
    {:consumer, state}
  end

  def handle_events(events, _from, %{file: file, counter: counter}) do
    num_events = Enum.count(events)

    IO.puts "Writing lines #{counter} to #{counter + num_events}..."

    Enum.each(events, & handle_event(&1, file))

    {:noreply, [], %{file: file, counter: counter + num_events + 1}}
  end

  def handle_event(event, file) do
    line = Enum.join(event, "|")
    IO.write(file, line)
  end
end
