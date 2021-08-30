# frozen_string_literal: true

module Maglev
  class PagePreviewController < ApplicationController
    include ::Maglev::RenderingConcern
    include ::Maglev::JSONConcern

    def index
      render_maglev_page
    end

    def create
      render_maglev_page
    end

    private

    def fetch_maglev_page_sections
      return super if action_name == 'index'

      super(JSON.parse(params[:page_sections]))
    end

    def maglev_rendering_mode
      params[:rendering_mode] || super
    end

    def use_engine_webpacker?
      false
    end
  end
end
