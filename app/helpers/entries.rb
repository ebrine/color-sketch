helpers do
  def split_tags(all_tags)
    tags = all_tags.split(",")
    tags =  tags.collect { |tag| tag.strip }
    tags = tags.reject { |tag| tag.empty? }
  end
end
