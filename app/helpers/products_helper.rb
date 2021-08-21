module ProductsHelper
  def user_action(product)
    if product.user == current_user
      link_to 'Delete', product_path(product), method: :delete
    else
      link_to 'Agree', agree_product_path(product), method: :post
    end
  end

  def header
    if params[:mode] == "owned"
      "My products"
    elsif params[:mode] == "offers"
      "Offers"
    end
  end
end
