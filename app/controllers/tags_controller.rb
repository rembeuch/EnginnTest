class TagsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @contact = Contact.find(params[:contact_id])
    @tag = Tag.new
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @tag = Tag.new(tag_params)
    @tag.contact = @contact
    if @tag.save
      redirect_to contact_path(@contact)
    else
      render :new
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:title)
  end
end
