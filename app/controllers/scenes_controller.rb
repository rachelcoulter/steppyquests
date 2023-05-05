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

    private
      def scene_params
        params.require(:scene).permit(:title, :body)
      end
  end
  