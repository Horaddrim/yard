defmodule Yard.Train do
  use GenServer

  def init(id) do
    {:ok,
     %{
       id: id,
       speed: nil
     }}
  end

  def start_link([], id) do
    start_link(id)
  end

  def start_link(id) do
    GenServer.start_link(__MODULE__, id, name: {:global, "train:#{id}"})
  end

  def get(pid) do
    GenServer.call(pid, :get)
  end

  def update_speed(pid, speed) do
    GenServer.cast(pid, {:update_speed, speed})
  end

  def handle_call(:get, _from, state) do
    {:reply, {:ok, state}, state}
  end

  def handle_cast({:update_speed, speed}, state) do
    new_state = Map.merge(state, %{speed: speed})
    {:noreply, new_state}
  end
end
