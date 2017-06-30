defmodule Cms2.Web.ContentPreviewChannel do
  use Phoenix.Channel

  def join("content_preview_channel", _message, socket) do
    {:ok, socket}
  end

  def handle_in("content_edited", %{"body" => content}, socket) do
    # TODO make this more robust by validating the logged in user
    # and notify only to him.
    html_doc = Earmark.as_html!(content)
    broadcast! socket, "formatted_content", %{doc: html_doc}
    {:noreply, socket}
  end
end