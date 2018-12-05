class Api::V1::UsersController < Api::V1::BaseController
  # skip_before_action :verify_authenticity_token
  URL = "https://api.weixin.qq.com/sns/jscode2session".freeze
  before_action :set_user, only: [:show, :update]


  def login
    @user = User.find_or_create_by(open_id: wechat_user.fetch("openid"))
    render json: {
      userId: @user.open_id
    }
  end

  def wechat_user
  @wechat_response ||= RestClient.post(URL, wechat_params)
  @wechat_user ||= JSON.parse(@wechat_response.body)
  end

  def create
    if @user = User.find_by(open_id: user_data[:open_id])
      render json: @user.to_json
    else
      @user = User.new(user_data)
      if @user.save
        render json: @user.to_json
      else
        render_error
      end
    end
    # if @user.save
    #   redirect_to user_path(@user), status: :created
    # else
    #   render :new
    # end
  end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to user_path(@user), status: :created
  #   else
  #     render :new
  #   end
  # end

  def show
    bookings = @user.bookings
    sports = @user.sports
    fav_sports = []
    sports.each { |sport| fav_sports << sport.id }
    bookings.each { |booking| fav_sports << booking.sport_id }
    fav_sports.uniq!
    @fav = {}
    if fav_sports == []
      @fav_sports=[]
    else
      fav_sports.each do |i|
        category = Sport.find(i.to_i).category
        if @fav[category]
          @fav[category] += 1
        else
          @fav[category] = 1
        end
        @fav_sports = @fav.sort_by { |k, v| -v }
      end
    end


    # @sports_own = Sport.where("user_id": @user.id)
    # @bookings = Booking.where("user_id": @user.id)
    # @bookings = []
    # @bookings.each do |i|
    #    @bookings << Sport.find(i.sport_id)
    # end
    # @reviews = Review.where("booking_id": @booking.id)
  end

  def update
    if @user.update(user_params)
      # redirect_to restaurant_path(@restaurant)
      render json: @user.to_json
    else
      render_error
    end
  end


  private

  def user_data
    params.require(:user_data).permit(:nickname, :open_id, :gender, :city, :province, :country, :avatarUrl, :info, :like)
  end

  def user_params
    params.require(:user).permit(:nickname, :open_id, :gender, :city, :province, :country, :avatarUrl, :info, :like)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end

  def wechat_params
  {
    appid: ENV["APP_ID"],
    secret: ENV["APP_SECRET"],
    js_code: params[:code],
    grant_type: "authorization_code"
  }
  end

end

