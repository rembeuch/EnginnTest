class ContactsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @contacts = Contact.all
    @pages = Page.first.number
  end

  def pages10
    Page.first.update(number: 10)
    redirect_to root_path
  end

  def pages20
    Page.first.update(number: 20)
    redirect_to root_path
  end

  def pages50
    Page.first.update(number: 50)
    redirect_to root_path
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to root_path, notice: 'modifié!'
    else
      render :edit
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to root_path
  end

  private

  def contact_params
    params.require(:contact).permit(:name)
  end
end
