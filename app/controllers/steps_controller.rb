class StepsController < ApplicationController

    def create
        @quest = Quest.find(params[:quest_id])
        @scene = Scene.find(params[:scene_id])
        @step = @scene.steps.create(step_params)
        redirect_to quest_path(@quest)
    end

    def destroy
        puts "params = #{params}"
        

        @step = Step.find(params[:id])
        @step.destroy
    
        respond_to do |format|
          format.html { redirect_to quest_scene_url(Quest.find(params[:quest_id]), Scene.find(params[:scene_id])), notice: "Step was successfully deleted." }
          format.json { head :no_content }
        end
      end


    private

    def step_params
        params.require(:step).permit(:choice, :target_scene_id)
    end
end