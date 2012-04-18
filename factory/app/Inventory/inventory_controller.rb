require 'rho/rhocontroller'
require 'helpers/browser_helper'

class InventoryController < Rho::RhoController
  include BrowserHelper

  # GET /Inventory
  def index
    @inventories = Inventory.find(:all)
    render :back => '/app'
  end

  # GET /Inventory/{1}
  def show
    @inventory = Inventory.find(@params['id'])
    if @inventory
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Inventory/new
  def new
    @inventory = Inventory.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Inventory/{1}/edit
  def edit
    @inventory = Inventory.find(@params['id'])
    if @inventory
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Inventory/create
  def create
    @inventory = Inventory.create(@params['inventory'])
    redirect :action => :index
  end

  # POST /Inventory/{1}/update
  def update
    @inventory = Inventory.find(@params['id'])
    @inventory.update_attributes(@params['inventory']) if @inventory
    redirect :action => :index
  end

  # POST /Inventory/{1}/delete
  def delete
    @inventory = Inventory.find(@params['id'])
    @inventory.destroy if @inventory
    redirect :action => :index  
  end
end
