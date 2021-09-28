class ProductsController < ApplicationController

  def index
    @products = Product.all

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @product, status: :created, location: @product }
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    if params[:id]
      respond_to do |format|
        format.html { redirect_to edit_product_path(params[:id]) }
        format.json { render :show, status: :created, location: @product }
      end
    end

    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update

    unless params[:id]
      respond_to do |format|
        format.html { redirect_to new_product_path }
        format.json { render :show, status: :created, location: @product }
      end
    end

    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path
  end

  def test_create
    Product.create(
      name: "Test Product 1",
      description: "Test description 1"
    )

    redirect_to products_path
  end

  def test_delete_all
    Product.delete_all

    redirect_to products_path
  end

  protected
  def product_params
    params.require(:product).permit(:name, :description)
  end
end