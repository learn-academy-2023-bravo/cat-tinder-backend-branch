class TreesController < ApplicationController
  def index
    trees = Tree.all
    render json: trees
  end

  def create
    tree = Tree.create(tree_params)
    render json: tree
  end

  private
  def tree_params
    params.require(:tree).permit(:name, :age, :enjoys, :image)
  end
end
