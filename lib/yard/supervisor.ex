defmodule Yard.TrainSupervisor do
    use DynamicSupervisor

    def start_link(_arg) do
        DynamicSupervisor.start_link(__MODULE__, :ok, name: __MODULE__)
    end

    def init(:ok) do
        DynamicSupervisor.init(strategy: :one_for_one)
    end

    def add_train(id) do
        child_spec = {Yard.Train, id}
        DynamicSupervisor.start_child(__MODULE__, child_spec)
    end

    def remove_train(pid) do
        DynamicSupervisor.terminate_child(__MODULE__, pid)
    end
end