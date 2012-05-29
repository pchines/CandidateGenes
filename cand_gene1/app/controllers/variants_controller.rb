class VariantsController < ApplicationController
  before_filter :find_containing_resource

  # GET /variants
  # GET /variants.json
  def index
    @variants = @gene.variants

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @variants }
    end
  end

  # GET /variants/1
  # GET /variants/1.json
  def show
    @variant = @gene.variants.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @variant }
    end
  end

  # GET /variants/new
  # GET /variants/new.json
  def new
    @variant = @gene.variants.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @variant }
    end
  end

  # GET /variants/1/edit
  def edit
    @variant = @gene.variants.find(params[:id])
  end

  # POST /variants
  # POST /variants.json
  def create
    @variant = @gene.variants.create(params[:variant])

    respond_to do |format|
      if @variant.save
        format.html { redirect_to @gene, notice: 'Variant was successfully created.' }
        format.json { render json: @variant, status: :created, location: @variant }
      else
        format.html { render action: "new" }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /variants/1
  # PUT /variants/1.json
  def update
    @variant = @gene.variants.find(params[:id])

    respond_to do |format|
      if @variant.update_attributes(params[:variant])
        format.html { redirect_to @gene, notice: 'Variant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variants/1
  # DELETE /variants/1.json
  def destroy
    @variant = @gene.variants.find(params[:id])
    @variant.destroy

    respond_to do |format|
      format.html { redirect_to @gene }
      format.json { head :no_content }
    end
  end

  private
  def find_containing_resource
    @gene = Gene.find(params[:gene_id])
  end
end
