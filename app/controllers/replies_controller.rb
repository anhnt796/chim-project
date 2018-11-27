class RepliesController < ApplicationController
  before_action :find_bird, only: [:index, :create, :show, :edit, :update, :destroy]
  # before_action :find_review, only: [:index, :create, :show, :edit, :update, :destroy]
  before_action :set_reply, only: [:show, :edit, :update, :destroy]

  # GET /replies
  # GET /replies.json
  def index
    # @replies = @review.replies.all_replies
    @replies = Reply.all
  end

  # GET /replies/1
  # GET /replies/1.json
  def show
  end

  # GET /replies/new
  def new
    @reply = current_user.replies.build
  end

  # GET /replies/1/edit
  def edit
  end

  # POST /replies
  # POST /replies.json
  def create
    @reply = current_user.replies.build(reply_params)
    if @reply.save
      flash[:success] = "Thank you for your reply."
      redirect_to :back
    else
      if @reply.errors.any?
        flash[:warning] = "Reply can't be blank."
      else
        flash[:warning] = "Some errors occured"
      end
      redirect_to :back
    end
  end

  # PATCH/PUT /replies/1
  # PATCH/PUT /replies/1.json
  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to @reply, notice: 'Reply was successfully updated.' }
        format.json { render :show, status: :ok, location: @reply }
      else
        format.html { render :edit }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replies/1
  # DELETE /replies/1.json
  def destroy
    @reply.destroy
    respond_to do |format|
      format.html { redirect_to replies_url, notice: 'Reply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_reply
    @reply = Reply.find_by id: params[:id]
    return if @reply
    redirect_to :back
  end

  def find_bird
    @bird = Bird.find_by id: params[:bird_id]
    return if @bird
    redirect_to :back
  end

  def find_review
    @review = Review.find_by id: params[:review_id]
    return if @review
    redirect_to :back
  end

  def reply_params
    params.require(:reply).permit(:content, :review_id)
  end
end
