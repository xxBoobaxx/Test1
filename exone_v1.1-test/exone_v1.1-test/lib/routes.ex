defmodule ExOne.Routes do 
    use N2O, with: [:n2o]

    def finish(state, context), do: {:ok, state, context}

    def init(state,context) do
        %{path: path} = cx(context, :req)
        {:ok, state, cx(context, path: path, module: route(path))}
    end

    def route(<<"/ws/", _ :: binary>>), do: :index
    def route(_), do: :index

end