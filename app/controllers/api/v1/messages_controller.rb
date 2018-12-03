
class Api::V1::MessagesController < Api::V1::BaseController
  def create
    @sport = Sport.find(params[:sport_id])
    # @user = User.find(params[:user_id])
    @message = Message.new(message_params)
    @message.sport = @sport
    # @message.user = @user
    if @message.save
      # redirect_to user_path(@user), status: :created
      render json: @message.to_json

    else
      render_error
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    head :no_content

  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      # redirect_to restaurant_path(@restaurant)
      render json: @message.to_json
    else
      render_error
    end
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :content, :read_status, :msg_time)
  end

  def render_error
    render json: { errors: @message.errors.full_messages },
      status: :unprocessable_entity
  end
end
