class Api::V1::SportsController < Api::V1::BaseController


  # def tagged
  #   if params[:tag].present?
  #     @sports = Sport.tagged_with(params[:tag])
  #   else
  #     @sports = Sport.all
  #   end
  # end

  def index
    @sports = Sport.all
  end

  def show
    @sport = Sport.find(params[:id])
  end

  def create
    # @user = User.find(params[:user_id])
    @sport = Sport.new(sport_params)
    # @sport.user = @user
    if @sport.save
      # if params[:tag]
      #   params[:tag].each do |tag|
      #   @sport.tag_list.add(tag)
      #   @sport.save
      #   end
      # end
      render json: @sport.to_json
    else
      render_error
    end
  end

  def update
    @sport = Sport.find(params[:id])
    if @sport.update(sport_params)
      render json: @sport.to_json
    else
      render_error
    end
  end

  def destroy
    @sport = Sport.find(params[:id])
    @sport.destroy
    head :no_content
  end

  private

  def sport_params
    params.require(:sport).permit(:title, :description, :category, :start_time, :end_time, :price, :photo, :province, :city, :district, :address, :capacity, :level, :user_id, :latitude, :longitude, :like)
  end

  def render_error
    render json: { errors: @sport.errors.full_messages },
      status: :unprocessable_entity
  end

end

