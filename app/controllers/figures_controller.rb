class FiguresController < ApplicationController
  

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do 
    fig = Figure.create(params[:figure])
    fig.titles << Title.create(params[:title]) if !params[:title][:name].empty?
    fig.landmarks << Landmark.create(params[:landmark]) if !params[:landmark][:name].empty?
    fig.save
    redirect to "/figures/#{fig.id}"
  end

  get '/figures/:id' do
    @fig = Figure.find params[:id]
    erb :'/figures/show'
  end

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find params[:id]
    erb :'/figures/edit'
  end

  patch '/figures/:id' do 
    fig = Figure.find(params[:id])
    fig.update(params[:figure])
    fig.titles << Title.create(params[:title]) if !params[:title][:name].empty?
    fig.landmarks << Landmark.create(params[:landmark]) if !params[:landmark][:name].empty?
    fig.save
    redirect to "/figures/#{fig.id}"
  end


end