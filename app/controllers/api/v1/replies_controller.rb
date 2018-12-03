class Api::V1::RepliesController < Api::V1::BaseController
  def create
    @message = Message.find(params[:message_id])
    @reply = Reply.new(reply_params)
    @reply.message = @message

    if @reply.save
      # redirect_to user_path(@reply.user), status: :created
      render json: @reply.to_json
    else
      render_error
    end
  end

  def update
    @reply = Reply.find(params[:id])
    if @reply.update(reply_params)
      # redirect_to restaurant_path(@restaurant)
      render json: @reply.to_json
    else
      render_error
    end
  end

  private
  def reply_params
    params.require(:reply).permit(:content, :read_status, :user_id, :msg_time)
  end

  def render_error
    render json: { errors: @reply.errors.full_messages },
      status: :unprocessable_entity
  end
end
