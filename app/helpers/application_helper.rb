module ApplicationHelper
    def user_sessions
        if user_signed_in?
          content_tag(:div, class: 'text-end d-flex flex-column flex-sm-row') do
            (link_to 'New Category', new_category_path, class: 'text-decoration-none link-dark fs-6 mx-1') +
              (link_to 'New Article', new_article_path, class: 'text-decoration-none link-dark fs-6 mx-3') +
              (link_to 'Sign out', destroy_user_session_path, method: :delete, class: 'link-dark text-decoration-none mx-3')
          end
        else
          content_tag(:div, class: 'd-flex justify-content-end') do
            (link_to 'Sign in', new_user_session_path, class: 'link-dark text-decoration-none mx-2') +
              (link_to '|', class: 'link-dark text-decoration-none') +
              (link_to 'Register', new_user_registration_path, class: 'link-dark text-decoration-none mx-2')
          end
        end
    end

    def cat1
      cat_array = Category.all
      return if cat_array[0].nil?
  
      content_tag(:div) do
        (link_to cat_array[0].name, category_path(cat_array[0]), class: 'mx-2 link-dark text-decoration-none')
      end
    end
  
    def cat2
      cat_array = Category.all
      return if cat_array[1].nil?
  
      content_tag(:div) do
        (link_to cat_array[1].name, category_path(cat_array[1]), class: 'mx-2 link-dark text-decoration-none')
      end
    end
  
    def cat3
      cat_array = Category.all
      return if cat_array[2].nil?
  
      content_tag(:div) do
        (link_to cat_array[2].name, category_path(cat_array[2]), class: 'mx-2 link-dark text-decoration-none')
      end
    end
  
    def cat4
      cat_array = Category.all
      return if cat_array[3].nil?
  
      content_tag(:div) do
        (link_to cat_array[3].name, category_path(cat_array[3]), class: 'mx-2 link-dark text-decoration-none')
      end
    end
  
    def nav_cats(cat_array)
      return if cat_array.nil?
      return if cat_array.count.zero?
  
      cat1 +
        cat2 +
        cat3 +
        cat4 
    end
    
end
