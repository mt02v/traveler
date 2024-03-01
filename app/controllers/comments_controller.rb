def create
  post = Post.find(params[:post_id])
  @comment = current_user.comments.new(comment_params)
  @comment.post_id = post.id
  if @comment.save
    redirect_to post_path(post)
  else
    @post = Post.find(params[:post_id])
    @comments = @post.comments.page(params[:page]).per(7).reverse_order
    render 'posts/show'
  end
end

def update
  @post = Post.find(params[:id])
  if @post.update(post_params)
    redirect_to post_path(@post.id)
  else
    render :edit
  end
end