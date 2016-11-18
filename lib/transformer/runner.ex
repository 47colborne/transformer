defmodule Transformer.Runner do
  alias Experimental.GenStage
  alias Transformer.{Producer, Consumer, ProducerConsumer}
  use GenStage

  def start do
    {:ok, a} = GenStage.from_enumerable(File.stream!("../../Downloads/datafeed_222899 (2).csv"))

    {:ok, b1} = ProducerConsumer.start_link
    {:ok, b2} = ProducerConsumer.start_link
    {:ok, b3} = ProducerConsumer.start_link
    {:ok, b4} = ProducerConsumer.start_link
    {:ok, b5} = ProducerConsumer.start_link
    {:ok, b6} = ProducerConsumer.start_link
    {:ok, b7} = ProducerConsumer.start_link
    {:ok, b8} = ProducerConsumer.start_link

    {:ok, c1} = Consumer.start_link
    {:ok, c2} = Consumer.start_link
    {:ok, c3} = Consumer.start_link
    {:ok, c4} = Consumer.start_link
    {:ok, c5} = Consumer.start_link
    {:ok, c6} = Consumer.start_link
    {:ok, c7} = Consumer.start_link
    {:ok, c8} = Consumer.start_link
    {:ok, c9} = Consumer.start_link
    {:ok, c10} = Consumer.start_link
    {:ok, c11} = Consumer.start_link
    {:ok, c12} = Consumer.start_link
    {:ok, c13} = Consumer.start_link
    {:ok, c14} = Consumer.start_link
    {:ok, c15} = Consumer.start_link
    {:ok, c16} = Consumer.start_link

    GenStage.sync_subscribe(c1, to: b1, max_demand: 1)
    GenStage.sync_subscribe(c2, to: b1, max_demand: 1)
    GenStage.sync_subscribe(c3, to: b2, max_demand: 1)
    GenStage.sync_subscribe(c4, to: b2, max_demand: 1)
    GenStage.sync_subscribe(c5, to: b3, max_demand: 1)
    GenStage.sync_subscribe(c6, to: b3, max_demand: 1)
    GenStage.sync_subscribe(c7, to: b4, max_demand: 1)
    GenStage.sync_subscribe(c8, to: b4, max_demand: 1)
    GenStage.sync_subscribe(c9, to: b5, max_demand: 1)
    GenStage.sync_subscribe(c10, to: b5, max_demand: 1)
    GenStage.sync_subscribe(c11, to: b6, max_demand: 1)
    GenStage.sync_subscribe(c12, to: b6, max_demand: 1)
    GenStage.sync_subscribe(c13, to: b7, max_demand: 1)
    GenStage.sync_subscribe(c14, to: b7, max_demand: 1)
    GenStage.sync_subscribe(c15, to: b8, max_demand: 1)
    GenStage.sync_subscribe(c16, to: b8, max_demand: 1)

    GenStage.sync_subscribe(b1, to: a)
    GenStage.sync_subscribe(b2, to: a)
    GenStage.sync_subscribe(b3, to: a)
    GenStage.sync_subscribe(b4, to: a)
    GenStage.sync_subscribe(b5, to: a)
    GenStage.sync_subscribe(b6, to: a)
    GenStage.sync_subscribe(b7, to: a)
    GenStage.sync_subscribe(b8, to: a)
  end
end
