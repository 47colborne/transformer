defmodule Transformer.Runner do
  alias Experimental.GenStage
  alias Transformer.{Producer, Consumer, ProducerConsumer}
  use GenStage

  def start do
    file = File.open!("output.txt", [:write, :utf8])

    {:ok, a} = GenStage.from_enumerable(File.stream!("../../Downloads/datafeed_222899 (2).csv"))

    {:ok, b1} = ProducerConsumer.start_link
    {:ok, b2} = ProducerConsumer.start_link
    {:ok, b3} = ProducerConsumer.start_link
    {:ok, b4} = ProducerConsumer.start_link
    {:ok, b5} = ProducerConsumer.start_link
    {:ok, b6} = ProducerConsumer.start_link
    {:ok, b7} = ProducerConsumer.start_link
    {:ok, b8} = ProducerConsumer.start_link

    {:ok, c1} = Consumer.start_link(file)
    {:ok, c2} = Consumer.start_link(file)
    {:ok, c3} = Consumer.start_link(file)
    {:ok, c4} = Consumer.start_link(file)
    {:ok, c5} = Consumer.start_link(file)
    {:ok, c6} = Consumer.start_link(file)
    {:ok, c7} = Consumer.start_link(file)
    {:ok, c8} = Consumer.start_link(file)
    {:ok, c9} = Consumer.start_link(file)
    {:ok, c10} = Consumer.start_link(file)
    {:ok, c11} = Consumer.start_link(file)
    {:ok, c12} = Consumer.start_link(file)
    {:ok, c13} = Consumer.start_link(file)
    {:ok, c14} = Consumer.start_link(file)
    {:ok, c15} = Consumer.start_link(file)
    {:ok, c16} = Consumer.start_link(file)

    GenStage.sync_subscribe(c1, to: b1)
    GenStage.sync_subscribe(c2, to: b1)
    GenStage.sync_subscribe(c3, to: b2)
    GenStage.sync_subscribe(c4, to: b2)
    GenStage.sync_subscribe(c5, to: b3)
    GenStage.sync_subscribe(c6, to: b3)
    GenStage.sync_subscribe(c7, to: b4)
    GenStage.sync_subscribe(c8, to: b4)
    GenStage.sync_subscribe(c9, to: b5)
    GenStage.sync_subscribe(c10, to: b5)
    GenStage.sync_subscribe(c11, to: b6)
    GenStage.sync_subscribe(c12, to: b6)
    GenStage.sync_subscribe(c13, to: b7)
    GenStage.sync_subscribe(c14, to: b7)
    GenStage.sync_subscribe(c15, to: b8)
    GenStage.sync_subscribe(c16, to: b8)

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
