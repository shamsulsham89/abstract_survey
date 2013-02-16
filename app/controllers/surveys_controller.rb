class SurveysController < ApplicationController
  # GET /surveys
  # GET /surveys.json
  before_filter :login_required
  layout :user_layout
  #helper_method :check_promoter

  def index
    @surveys = Survey.all

    respond_to do |format|
      format.html # index.html.erb
      format.csv #{ send_data @products.to_csv }

      format.xls {send_data @surveys.to_xls(
          :columns => [{:outlet_type => :name}, :time_spent_at_the_philips, :visibility_of_philips, :stock_availability_of_philips, :check_promoter, :rate_the_presentability_of_the_philips, :rate_the_communication_skill_of_the_philips, :time_spent_at_the_braun, :visibility_of_the_braun, :stock_availability_of_the_braun, :check_promoter, :rate_the_presentability_of_braun, :rate_the_communication_skill_of_the_braun, :created_at.strftime('%d/%m/%Y') ],
          :headers => ["Name of the outlet", "Time spent at the Philips promotion in the outlet (in minutes)", "Visibility of Philips Promotion in the outlet is", "Stock availability of Philips in the promotion is", "Promoter of Philips is available at the promotion stand", "Rate the presentability of the Philips promoter in the promotion", "Rate the communication skill of the Philips promoter in the promotion", "Time spent at the Braun promotion stand (in minutes)", "Visibility of the Braun promotion in the outlet is", "Stock availability of the Braun in the promotion", "Promoter of Braun is available at the promotion", "Rate the presentability of Braun promoter in the promotion" , "Rate the communication skill of the Braun promoter in the promotion ", "Created at"]
        )
      }

      format.json { render json: @surveys }
    end
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    @survey = Survey.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @survey }
    end
  end

  # GET /surveys/new
  # GET /surveys/new.json
  def new
    @survey = Survey.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @survey }
    end
  end

  # GET /surveys/1/edit
  def edit
    @survey = Survey.find(params[:id])
  end

  # POST /surveys
  # POST /surveys.json
  def create
    #raise params.inspect
    @survey = Survey.new(params[:survey])

    respond_to do |format|
      if @survey.save
        if is_admin?
          format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
          format.json { render json: @survey, status: :created, location: @survey }
        else
          format.html { redirect_to new_survey_path, notice: 'Survey was successfully created.' }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /surveys/1
  # PUT /surveys/1.json
  def update
    @survey = Survey.find(params[:id])

    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to surveys_url }
      format.json { head :no_content }
    end
  end


  

  

end
