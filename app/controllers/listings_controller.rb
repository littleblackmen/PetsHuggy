class ListingsController < ApplicationController
  #26
  before_action :authenticate_user!
  before_action :set_listing, only: [:update, :basics, :description, :address, :price, :photos, :calender, :bankaccount, :publish]

  def index
  end

  def show
  end

  def new
    #現在のユーザーのリスティングの作成　#28
    @listing = current_user.listings.build
  end

  def create
    #パラメータとともに現在のユーザーのリスティングを作成　#29 #31
    @listing = current_user.listings.build(listing_params)

    if @listing.save
      redirect_to manage_listing_basics_path(@listing), notice:"リスティングを作成・保存しました"
    else
      redirect_to new_listing_path, notice:"リスティングを作成・保存できませんでした"
    end
  end

  def edit
  end

  def update
    #35　V5よりredirect_toは非対応になるため別の記述
    if @listing.update(listing_params)
      redirect_back(fallback_location: root_path, notice:"更新できました")
    end
  end

  #31
  def basics
  end
  #32
  def description
  end
  #33
  def address
  end
  #33
  def price
  end
  #33
  def photos
    @photo = Photo.new
  end
  #33
  def calender
  end
  #33
  def bankaccount
  end
  #33
  def publish

  end

  private
  def listing_params
    params.require(:listing).permit(:home_type, :pet_type, :breeding_years, :pet_size, :price_pernight)
  end
  #33
  def set_listing
    @listing = Listing.find(params[:id])
  end
end
