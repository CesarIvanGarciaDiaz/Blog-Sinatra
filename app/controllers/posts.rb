#Mostrar todos los posts.
get '/all_posts' do
  @all = Post.all
  erb :all_posts
end

#Mostrar un post determinado.
post '/find_post' do
  id= params[:id]

  unless Post.where(id: id).empty?
    puts  @find = Post.find(id)
    erb :find

  end
end

#Crear un post nuevo.
get '/new_post'do
erb :entrada
end
post '/new_post' do
  title = params[:title]
  description = params[:description]

  nuevo=Post.create(title:title, description:description)

  tags=params[:tags]
  arr= tags.split(",")
  arr.each do |x|
    nuevo.tags <<  Tag.create(name:x)
  end
  erb :index
end

#Editar un post existente.}
get '/update_post'do
erb:update
end

post'/update_post' do
  id=params[:id]
  title=params[:title]
  description=params[:description]

  unless Post.where(id: id).empty?
    @post2=Post.find_by(id: id)
    @post2.update(title:title,description:description)
    erb :index
  else
    erb :error_2
  end
end

get '/delete_post'do
erb:delete
end

post '/delete_post' do
  id=params[:id]
  @post=Post.find(params[:id])
  @post.destroy
  erb :index
end

post '/tag'do
name=params[:name]
@tag=Tag.find_by(name:name)
@id=PostsTag.find_by(tag_id:@tag.id)
@nombre=Post.find_by(id:@id.post_id)
erb :tag
end
