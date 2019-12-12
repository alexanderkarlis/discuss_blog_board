defmodule Discuss.CommentsChannel do
    use Discuss.Web, :channel
    alias Discuss.Topic

    def join("comments:" <> topic_id, _params, socket) do
        IO.puts("++++++++")
        IO.puts(topic_id)

        topic_id = String.to_integer topic_id
        topic = Repo.get! Topic, topic_id
        IO.puts(topic_id)

        {:ok, %{ topic: topic.title }, socket}
    end

    def handle_in(name, %{"content" => content}, socket) do
        IO.puts("++++++++mess")
        IO.puts(name)
        IO.inspect(content)
        
        {:reply, :ok, socket}
    end
end