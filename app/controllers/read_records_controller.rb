class ReadRecordsController < ApplicationController

  def new
    @read_record = current_user.read_records.new
  end

  def create
    @read_record = current_user.read_records.new(read_record_params)
    if @read_record.save
      flash[:success] = "読み聞かせ記録を作成しました"
      redirect_to home_path
    else
      flash.now[:danger] = "読み聞かせ記録を作成できませんでした"
      render :new
    end
  end

  private

  def read_record_params
    params.require(:read_record).permit(:body, :read_date, :book_id, :child_id)
  end
end
