# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @sites = Site.all
  end
end
