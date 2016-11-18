defmodule Transformer.Producer do
  alias Experimental.GenStage
  alias Transformer.Producer
  use GenStage

  def start_link(counter) do
    GenStage.start_link(Producer, counter)
  end

  def init(counter) do
    {:producer, counter}
  end

  def handle_demand(demand, counter) when demand > 0 do
    # If the counter is 3 and we ask for 2 items, we will
    # emit the items 3 and 4, and set the state to 5.
    events = Enum.to_list(counter..counter+demand-1)
    {:noreply, events, counter + demand}
  end
end
