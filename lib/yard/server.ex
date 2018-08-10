defmodule Yard.Server do
  use GenServer

  def init(args) do
    {:ok, args}
  end

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def add_train(args) do
    GenServer.call(__MODULE__, {:add_train, args})
  end

  def remove_train(pid) do
    GenServer.call(__MODULE__, {:remove_train, pid})
  end

  def handle_call({:add_train, args}, _from, state) do
    start_status = Yard.TrainSupervisor.add_train(args)
    {:reply, start_status, state}
  end

  def handle_call({:remove_train, args}, _from, state) do
    remove_status = Yard.TrainSupervisor.remove_train(args)
    {:reply, remove_status, state}
  end
end
