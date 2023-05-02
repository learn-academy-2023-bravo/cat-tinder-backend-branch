class TreesController < ApplicationController
  def index
    trees = Tree.all
    render json: trees
  end

  def create
    tree = Tree.create(tree_params)

    if tree.valid?
      render json: tree
    else
      render json: tree.errors, status: 422
    end
  end

  def update
    tree = Tree.find(params[:id])
    tree.update(tree_params)
    if tree.valid?
      render json: tree
    else
      render json: tree.errors
    end
  end

  def destroy
    tree = Tree.find(params[:id])
    if tree.destroy
      render json: tree
    else
      render json: tree.errors
    end
  end

  private
  def tree_params
    params.require(:tree).permit(:name, :age, :enjoys, :image)
  end
end
