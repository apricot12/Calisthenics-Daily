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
end
