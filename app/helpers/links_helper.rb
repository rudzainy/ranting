module LinksHelper

  def sanitize_link(url)
    url.gsub(/https:\/\/|http:\/\//, "")
  end
end
