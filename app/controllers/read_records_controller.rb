class ReadRecordsController < ApplicationController


  def index
    @read_records = ReadRecord.all.order(created_at: :desc).page(params[:page])
    @book_ranks = Book.group(:title, :id).order('count(user_id) desc').limit(5)
  end

  def new
    @read_record = current_user.read_records.new(book_id: params[:book_id], family_id: current_user.family_id)
    @book = current_user.books.find(params[:book_id])
  end

  def create
    @read_record = current_user.read_records.build(read_record_params)
    tags = params[:read_record][:tags][:name].split(',')
    if @read_record.save
      ChildReadRecord.create(child_id: params[:read_record][:child_id], read_record_id: @read_record.id)
      @read_record.save_tags(tags)
      redirect_to home_path, success: t(".success")
    else
      flash.now[:danger] = t(".failure")
      @book = Book.find(params[:read_record][:book_id])
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @read_record = ReadRecord.find(params[:id])
    @book = @read_record.book
  end

  def update
    @read_record = ReadRecord.find(params[:id])
    if @read_record.update(read_record_params)
      redirect_to family_path(current_user), success: t(".success")
    else
      flash.now[:danger] = t(".failure")
      redirect_to family_path(current_user)
    end
  end

  def destroy
    ReadRecord.find(params[:id]).destroy
    flash[:success] = t(".success")
    redirect_to family_path(current_user), status: :see_other
  end

  private

  def read_record_params
    params.require(:read_record).permit(:body, :read_date, :book_id, :user_id, :family_id, tag_ids: [])
  end
end
