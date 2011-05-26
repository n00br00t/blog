class CommentObserver < ActiveRecord::Observer
	def after_create(comment)
		puts "Capitulo 9"
	end
end
