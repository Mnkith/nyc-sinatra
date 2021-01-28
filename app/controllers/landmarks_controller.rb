class LandmarksController < ApplicationController
  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do 
    lm = Landmark.create(params[:landmark])
    lm.save
    redirect to "/landmarks/#{lm.id}"
  end

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/:id' do 
    @landmark = Landmark.find params[:id]
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find params[:id]
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    Landmark.find(params[:id]).update params[:landmark]
    redirect to "/landmarks/#{params[:id]}"
  end


end
