module Comfy
  module Admin
    module CmsHelper

      # Wrapper around ComfortableMexicanSofa::FormBuilder
      def comfy_form_for(record, options = {}, &block)
        options[:builder] = ComfortableMexicanSofa::FormBuilder
        options[:layout] ||= :horizontal
        bootstrap_form_for(record, options, &block)
      end

      def comfy_admin_partial(path, params = {})
        render path, params
      rescue ActionView::MissingTemplate
        if ComfortableMexicanSofa.config.reveal_cms_partials
          content_tag(:div, class: "comfy-admin-partial") do
            path
          end
        end
      end

      # Injects some content somewhere inside cms admin area
      def cms_hook(name, options = {})
        ComfortableMexicanSofa::ViewHooks.render(name, self, options)
      end

    end
  end
end
