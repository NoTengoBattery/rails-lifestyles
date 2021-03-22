class VotesController < ApplicationController
  before_action :empty_vote
  before_action :vote_from_params, except: [:create]

  def create
    @vote = Vote.new(votes_params)
    @vote.user = current_user
    @vote.save
    redirect_back fallback_location: root_path
  end

  def destroy
    @vote.destroy
    redirect_back fallback_location: root_path
  end

  private
    def empty_vote
      @vote = Vote.new
    end

    def vote_from_params
      @vote = Vote.find(params.require(:id))
    end

    def votes_params
      params.require(:vote).permit(:ArticleId)
    end
end
