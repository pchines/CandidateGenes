class AliasesController < ApplicationController
  before_filter :find_containing_resource

  # GET /aliases
  # GET /aliases.json
  def index
    @aliases = @gene.aliases

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @aliases }
    end
  end

  # GET /aliases/1
  # GET /aliases/1.json
  def show
    @alias = @gene.aliases.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @alias }
    end
  end

  # GET /aliases/new
  # GET /aliases/new.json
  def new
    @alias = @gene.aliases.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @alias }
    end
  end

  # GET /aliases/1/edit
  def edit
    @alias = @gene.aliases.find(params[:id])
  end

  # POST /aliases
  # POST /aliases.json
  def create
    @alias = Alias.new(params[:alias])

    respond_to do |format|
      if @alias.save
        format.html { redirect_to @gene, notice: 'Alias was successfully created.' }
        format.json { render json: @alias, status: :created, location: @alias }
      else
        format.html { render action: "new" }
        format.json { render json: @alias.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /aliases/1
  # PUT /aliases/1.json
  def update
    @alias = @gene.aliases.find(params[:id])

    respond_to do |format|
      if @alias.update_attributes(params[:alias])
        format.html { redirect_to @alias, notice: 'Alias was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @alias.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aliases/1
  # DELETE /aliases/1.json
  def destroy
    @alias = @gene.aliases.find(params[:id])
    @alias.destroy

    respond_to do |format|
      format.html { redirect_to @gene, :notice => 'Alias was removed.' }
      format.json { head :no_content }
    end
  end

  private
  def find_containing_resource
    @gene = Gene.find(params[:gene_id])
  end
end
