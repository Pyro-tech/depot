class StoreController < ApplicationController
  skip_before_action :authorize

# if session[:counter].nil
# end


  def index
    @products = Product.order(:title)



puts "----------------------"
puts session[:counter]
puts "----------------------"
    if session[:counter].nil?
      session[:counter] = 1
      else
      session[:counter] += 1
    end
      @counter = session[:counter]
      @cart = current_cart
  end

# if session != nil
#   session['count'] = session['count'].to_i + 1
# else
#   session['count'] += 1
#   session['count'] = @count
#   session.close
# end





end
