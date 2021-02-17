class ContactsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @contacts = Contact.all
    @pages = Page.first.number
  end

  def pages20
    Page.first.update(number: 20)
    redirect_to root_path
  end

  def pages50
    @contacts = Contact.all
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

  def tag
    @contact =  Contact.find(params[:contact_id])
    if @contact.tag == false
      @contact.update(tag: true)
    else
      @contact.update(tag: false)
    end
    redirect_to root_path
  end

  def contact_params
    params.require(:contact).permit(:name, :tag)
  end
end
