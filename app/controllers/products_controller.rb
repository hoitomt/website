class ProductsController < ApplicationController
  before_filter :logged_in, :except => [:display, :index, :show]
  
  # GET /products
  # GET /products.xml
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])
    @upload_photo = Uploadphoto.find(params[:upload_file_id])
    @product.photo = @upload_photo.photo

    respond_to do |format|
      if @product.save
        format.html { redirect_to(products_path, :notice => 'Product was successfully created.') }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(products_path, :notice => 'Product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
  
  def inquire
    @product = Product.find(params[:id])
    @message = Message.new
  end
  
  def send_inquire_email
    @product = Product.find(params[:id])
    @message = Message.new(params[:message])
    respond_to do |format|
      if @message.save
        format.html {
          email = ProductMailer.deliver_inquire(@product, @message)
          #render(:text => "<pre>" + email.encoded + "</pre>")
          redirect_to(root_path, :notice => 'Thank you for your interest. We will write back shortly')
        }
        format.xml  { head :ok }
      else
        format.html { render :action => "inquire" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def upload_image
    logger.info("Uploading the image")
    @upload_photo = Uploadphoto.new
    @upload_photo.photo = params['imageUpload']
    @upload_photo.save
    respond_to do |format|
      format.js
      format.html
    end
  end
  
  private
  def logged_in
    if current_user.nil?
      redirect_to log_in_url
    end
  end
  
end
