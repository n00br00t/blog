class Comment < ActiveRecord::Base
	belongs_to :article
#dizendo para validar os campos antes de executar save e executar o codigo de erro
	validates :name, :email, :body, :presence => true
	validate :article_should_be_published

#adição do metodo de erro caso o artigo ainda nao tenha sido publicado
	def article_should_be_published
		errors.add(:article_id, "is not published yet") if article && !article.published?
	end

end
