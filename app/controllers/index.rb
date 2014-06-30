get '/gadgets' do
  @gadgets = Gadget.all
  erb :'gadgets/index'
end

post '/gadgets' do
  gadget = Gadget.new(name: params[:name], body: params[:body])

  if gadget.save
    redirect to('/gadgets')
  else
    status 422
  end

end

get '/widgets' do
  current_user = authenticate_session
  if current_user
    @widgets = current_user.widgets
  else
    @widgets = Widget.all
  end

  erb :'widgets/index'
end