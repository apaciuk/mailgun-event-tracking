# frozen_string_literal: true

class EventsController < ApplicationController
#TOKEN = "secret"
require 'logger'
require 'json' 
skip_before_action :verify_authenticity_token

  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show 
    @event = Event.find(params[:id])
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  def create 
    logger||= Logger.new("#{Rails.root}/log/mg.log")

    result = JSON.parse(params['event-data'].to_json)
    
    @event = create_event(result) 
    logger.info "Data: #{@event.inspect}"
  end  

  def create_event(result) 
   event = Event.new(
   message_id: result['message']['headers']['message-id'],
   track_status: result['event'],
   message: result['event'],
   severity: result['severity'],
   reason: result['reason'],
   subject: result['message']['headers']['subject'],
   sender: result['message']['headers']['from'],
   recipient: result['recipient'],
   headers: result['message']['headers']
   )
    event.save!
    event
   end

end