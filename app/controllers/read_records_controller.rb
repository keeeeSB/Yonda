class ReadRecordsController < ApplicationController


  def index
    @read_records = ReadRecord.all.order(created_at: :desc).page(params[:page])
  end

  def new
    @read_record = current_user.read_records.new(book_id: params[:book_id], family_id: current_user.family_id)
    @book = current_user.books.find(params[:book_id])
  end

  def create
    @read_record = current_user.read_records.build(read_record_params)
    if @read_record.save
      ChildReadRecord.create(child_id: params[:read_record][:child_id], read_record_id: @read_record.id)
      flash[:success] = t(".success")
      redirect_to home_path
    else
      flash.now[:danger] = t(".failure")
      render :new, status: :unprocessable_entity
    end
  end

  private

  def read_record_params
    params.require(:read_record).permit(:body, :read_date, :book_id, :user_id, :family_id)
  end
end
