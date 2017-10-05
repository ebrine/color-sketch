get '/' do
  # Look in app/views/index.erb
  erb :index
end

get "/templates" do
  templates = {}
  Template.all.each do |template|
    templates[template.name] = template.pattern
  end
  if request.xhr?
    content_type "/application/json"
    templates.to_json
  end
end

get "/templates/:name" do
  template = Template.find_by(name: params[:name])
  if request.xhr?
    template.pattern
  end
end
