class Students::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # GET /student/:id
  def profile
    @student = Student.find_by_id(params[:id])
    if !((student_signed_in? and current_student == @student) or instructor_signed_in?)
      flash[:notice] = "Try signing in if you have not already done so."
      redirect_to new_student_session_path
    else
      @counts = { "All" => 0, "Easy" => 0, "Medium" => 0, "Hard" => 0 }
      if @student.completed_problems
        problem_titles = @student.completed_problems.keys
        problems = Problem.where(title: problem_titles)
        problems.each do |p|
          @counts[p.difficulty] = @counts[p.difficulty] + 1
          @counts["All"] = @counts["All"] + 1
        end
        Rails.logger.debug("My object: #{@counts.inspect}")
      end
      @username = @student.email.split("@")[0].upcase
    end
  end


  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
