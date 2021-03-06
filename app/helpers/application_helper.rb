module ApplicationHelper
    def is_active_controller(controller_name)
        params[:controller] == controller_name ? "active" : nil
    end

    def is_active_action(action_name)
        params[:action] == action_name ? "active" : nil
    end
    
    # def is_fixedsidebar_league(controller_name, action_name)
    #     params[:controller] == controller_name ? "fixed-sidebar" : params[:action] != action_name ? "fixed-sidebar" : nil
    # end
    
    def is_navbar_league(controller_name, action_name)
        params[:controller] != controller_name ? "fixed-sidebar mini-navbar" : params[:action] == action_name ? "fixed-sidebar mini-navbar" : nil
    end
    
    def is_minibtn_league(controller_name, action_name)
        params[:controller] != controller_name ? "display: none" : params[:action] == action_name ? "display:none" : nil
    end
end