defmodule DocFusion do
  use Hound.Helpers

  def start_session do
    ChromeDriver.start()
    Hound.start_session()
  end

  def end_session do
    Hound.end_session()
    ChromeDriver.stop()
  end

  def fetch_and_extract_links(url) do
    IO.puts("Navigating to #{url}...")
    navigate_to(url)

    # Wait for the elements to be loaded
    :timer.sleep(3000)

    IO.puts("Fetching links...")
    links = find_all_elements(:css, "#extras-tab-panel a")

    Enum.map(links, fn link ->
      attribute_value(link, "href")
    end)
  end

  def scrape(url) do
    DocFusion.start_session()

    try do
      fetch_and_extract_links(url)
    rescue
      error -> IO.inspect(error, label: "Error")
    after
      DocFusion.end_session()
    end
  end
end
