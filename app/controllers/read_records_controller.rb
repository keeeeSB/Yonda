class ReadRecordsController < ApplicationController

  def new
    @read_record = current_user.read_records.new(book_id: params[:book_id])
  end

  def create
    @read_record = current_user.read_records.build(read_record_params)
    if @read_record.save
      ChildReadRecord.create(child_id: params[:read_record][:child_id], read_record_id: @read_record.id)
      flash[:success] = "読み聞かせ記録を作成しました"
      redirect_to home_path
    else
      flash.now[:danger] = "読み聞かせ記録を作成できませんでした"
      render :new
    end
  end

  private

  def read_record_params
    params.require(:read_record).permit(:body, :read_date, :book_id, :user_id)
  end
end
