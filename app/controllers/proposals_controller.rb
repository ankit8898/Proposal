class ProposalsController < ApplicationController
  # GET /proposals
  # GET /proposals.json
  def index
    @proposals = Proposal.all
    @proposal = Proposal.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @proposals }
    end
  end

  # GET /proposals/1
  # GET /proposals/1.json
  def show
    @proposal = Proposal.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @proposal }
    end
  end

  # GET /proposals/new
  # GET /proposals/new.json
  def new
    @proposal = Proposal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @proposal }
    end
  end

  # GET /proposals/1/edit
  def edit
    @proposal = Proposal.find(params[:id])
  end

  # POST /proposals
  # POST /proposals.json
  def create
    @proposal = Proposal.new(params[:proposal].merge(:user_id => params[:user_id]))
    if params[:commit] == "Save as Draft"
    @proposal.save(:validate => false)
    @proposal.instantiate_draft!
    respond_to do |format|
    format.html { redirect_to user_path(:id => params[:user_id]), :notice => 'Draft Saved Succesfully' }
    end
    else
    respond_to do |format|
      if @proposal.save
        format.html { redirect_to user_path(:id => params[:user_id]), :notice => 'Proposal was successfully created.' }
        format.json { render :json => @proposal, :status => :created }
        format.js
      else
      if @proposal.errors.any?
        session[:proposal_errors] = @proposal.errors
      end
        format.html { redirect_to user_path(:id => params[:user_id]) }
        format.json { render :json => @proposal.errors, :status => :unprocessable_entity }
      end
    end
    end
  end

  # PUT /proposals/1
  # PUT /proposals/1.json
  def update
    @proposal = Proposal.find(params[:id])
     if @proposal.has_draft?
       @proposal.draft.update_attributes(params[:lop])
        @proposal.replace_with_draft!
        @proposal.destroy_draft!
        respond_to do |format|
        format.html { redirect_to @proposal, :notice => 'Lop was successfully updated.' }
        end
else
    respond_to do |format|
      if @proposal.update_attributes(params[:proposal])
        format.html { redirect_to @proposal, :notice => 'Proposal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @proposal.errors, :status => :unprocessable_entity }
      end
    end
  end
  end

  # DELETE /proposals/1
  # DELETE /proposals/1.json
  def destroy
    @proposal = Proposal.find(params[:id])
    @proposal.destroy

    respond_to do |format|
      format.html { redirect_to proposals_url }
      format.json { head :no_content }
    end
  end
end
