class Post < ActiveRecord::Base
  validates :title,:description, presence: true

  has_many :posts_tags
  has_many :tags, through: :posts_tags
end

#http://guides.rubyonrails.org/association_basics.html 
#has_many
#Esta asociación indica el enlace de uno
# a muchos con otro modelo. Esta asociación
#pueden encontrarse por lo general en el opuesto
# de un "belongs_to" e indica que cada objeto de
# un modelo puede tener muchos objetos relacionados a él (o ninguno).



#has_many :through
#Esta asociación se utiliza a menudo para establecer
#conexiones de muchos a muchos con otro modelo.
#Esta asociación al igual que "has_many" nos indica que
# cada objeto de un modelo puede tener muchos objetos asociados,
# la única diferencia es que para lograr un muchos a muchos
#debemos agregar un tercer modelo que relacione los anteriores.
