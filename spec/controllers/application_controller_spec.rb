require 'spec_helper'

describe ApplicationController do

  it 'should destroy user session' do
     delete :destroy
     response.should redirect_to(login_students_path)
  end
end
