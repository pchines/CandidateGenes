class GenesController < ApplicationController
  # GET /genes
  # GET /genes.json
  def index
    session[:order] = params[:order] || session[:order] || 'symbol'
    session[:q] ||= {}
    if params[:disease]
      params[:disease].delete('0')
      if params[:disease].empty?
        session[:q][:disease] = nil
      else
        session[:q][:disease] = {}
        params[:disease].each do |d|
          session[:q][:disease][d] = 1
        end
      end
    end
    if !session[:q][:disease]
      session[:q][:disease] = {}
      Gene.all_diseases.each do |d|
        session[:q][:disease][d] = 1
      end
    end

    @genes = Gene.find(:all, :order => session[:order], :conditions => {
      :disease => session[:q][:disease].keys
    })

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @genes }
    end
  end

  # GET /genes/1
  # GET /genes/1.json
  def show
    @gene = Gene.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gene }
    end
  end

  # GET /genes/new
  # GET /genes/new.json
  def new
    @gene = Gene.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gene }
    end
  end

  # GET /genes/1/edit
  def edit
    @gene = Gene.find(params[:id])
  end

  # POST /genes
  # POST /genes.json
  def create
    begin
      @gene = Gene.new(params[:gene])
      respond_to do |format|
        if @gene.save
          format.html { redirect_to @gene, notice: 'Gene was successfully created.' }
          format.json { render json: @gene, status: :created, location: @gene }
        else
          format.html { render action: "new" }
          format.json { render json: @gene.errors, status: :unprocessable_entity }
        end
      end
    rescue ActiveRecord::RecordNotUnique
      respond_to do |format|
        format.html { redirect_to new_gene_path, notice: 'Gene name/disease already in use.' }
        format.json { render json: @gene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /genes/1
  # PUT /genes/1.json
  def update
    @gene = Gene.find(params[:id])

    respond_to do |format|
      if @gene.update_attributes(params[:gene])
        format.html { redirect_to @gene, notice: 'Gene was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /genes/1
  # DELETE /genes/1.json
  def destroy
    @gene = Gene.find(params[:id])
    @gene.destroy

    respond_to do |format|
      format.html { redirect_to genes_url }
      format.json { head :no_content }
    end
  end
end
