class BillsController < ApplicationController
  def index
    @bills = Bill.search(params[:search]).paginate(:per_page => 10, :page => params[:page])
    @bills.each do |bill|
      bill.attributes[:url] = "http://lawfilesext.leg.wa.gov/biennium/2015-16/Pdf/Bills/House%20Bills/1000.pdf"
    end
  end
  
  def show
    @bill = Bill.find(params[:id])
    bill_number = @bill.name.split(' ')[1]
    if @bill.name.include? 'HB'
      @pdf_url = "http://lawfilesext.leg.wa.gov/biennium/2015-16/Pdf/Bills/House%20Bills/#{bill_number}.pdf"
    elsif @bill.name.include? 'SB'
      @pdf_url = "http://lawfilesext.leg.wa.gov/biennium/2015-16/Pdf/Bills/Senate%20Bills/#{bill_number}.pdf"
    end
  end

end
