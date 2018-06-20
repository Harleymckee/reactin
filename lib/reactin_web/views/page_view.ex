defmodule ReactinWeb.PageView do
  use ReactinWeb, :view

  def react() do
    component_path = "./../../../assets/js/HelloWorld.js"
    props = %{name: "Revelry"}
    {:ok, html_string} = ReactRender.render(component_path, props)
    raw(html_string)
  end
end
