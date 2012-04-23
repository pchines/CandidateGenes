class FeaturesController < ApplicationController
  # GET /features
  # GET /features.json
  def index
    @gene = Gene.find(params[:gene_id])
    @features = @gene.features

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @features }
    end
  end

  # GET /features/1
  # GET /features/1.json
  def show
    @gene = Gene.find(params[:gene_id])
    @feature = @gene.features.find(params[:id])
    #@feature = Feature.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feature }
    end
  end

  # GET /features/new
  # GET /features/new.json
  def new
    @gene    = Gene.find(params[:gene_id])
    @feature = @gene.features.build
    @ratings = Feature.all_ratings

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feature }
    end
  end

  # GET /features/1/edit
  def edit
    @gene    = Gene.find(params[:gene_id])
    @feature = @gene.features.find(params[:id])
  end

  # POST /features
  # POST /features.json
  def create
    @gene    = Gene.find(params[:gene_id])
    @feature = @gene.features.create(params[:feature])

    respond_to do |format|
      if @feature.save
        format.html { redirect_to @gene, notice: 'Feature was successfully created.' }
        format.json { render json: @feature, status: :created, location: @feature }
      else
        format.html { render action: "new" }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /features/1
  # PUT /features/1.json
  def update
    @gene    = Gene.find(params[:gene_id])
    @feature = @gene.features.find(params[:id])

    respond_to do |format|
      if @feature.update_attributes(params[:feature])
        format.html { redirect_to @gene, notice: 'Feature was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /features/1
  # DELETE /features/1.json
  def destroy
    @gene    = Gene.find(params[:gene_id])
    @feature = @gene.features.find(params[:id])
    @feature.destroy

    respond_to do |format|
      format.html { redirect_to @gene, notice: 'Feature was removed.' }
      format.json { head :no_content }
    end
  end
end
