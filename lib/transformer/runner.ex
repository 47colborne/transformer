defmodule Transformer.Runner do
  alias Experimental.GenStage
  alias Transformer.{Producer, Consumer, ProducerConsumer}
  use GenStage

  def start do
    {:ok, a} = Producer.start_link(0)
    {:ok, b} = ProducerConsumer.start_link(2)
    {:ok, c} = Consumer.start_link
    GenStage.sync_subscribe(c, to: b)
    GenStage.sync_subscribe(b, to: a)
  end
end
