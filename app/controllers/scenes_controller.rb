class ScenesController < ApplicationController
end

class ScenesController < ApplicationController
    def create
      @quest = Quest.find(params[:quest_id])
      @scene = @quest.scenes.create(scene_params)
      redirect_to quest_path(@quest)
    end
  
    def show
      
      @scene = Scene.find(params[:id])
    end

    def destroy
      puts "params = #{params}"
      @scene = Scene.find(params[:id])
      @scene.destroy
  
      respond_to do |format|
        format.html { redirect_to quest_url(Quest.find(params[:quest_id])), notice: "Scene was successfully deleted." }
        format.json { head :no_content }
      end
    end

    private
      def scene_params
        params.require(:scene).permit(:title, :body)
      end
  end
  