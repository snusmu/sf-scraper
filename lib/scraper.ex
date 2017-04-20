defmodule Scraper do
  use Hound.Helpers
  @moduledoc """
  Documentation for Scraper.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Scraper.hello
      :world

  """
  def start(_type, _args) do
    IO.puts "starting"
    Hound.start_session
    navigate_to "http://www.sf.se/biljetter/bokningsflodet/valj-forestallning/"
    els = find_all_elements(:class, "concept-splash")
    IO.inspect OMDBApi.movie_info(inner_text(Enum.at(els,0)))
    Supervisor.start_link [], strategy: :one_for_one
    # Enum.each els, fn el ->
    #  IO.puts inner_text(el)
    # end
  end
end
