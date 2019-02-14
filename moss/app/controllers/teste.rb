#!/usr/bin/env ruby
Moss::App.controllers :main do
  get '/' do
    api_sucess('oi')
  end
end
