get '/gadgets' do
  @gadgets = Gadget.all
  erb :'gadgets/index'
end