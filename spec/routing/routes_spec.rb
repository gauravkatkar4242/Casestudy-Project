require 'rails_helper'

describe "Routes", :type => :routing do

  describe "Assessor Response Controller" do
    it "GET index" do
      expect(get: '/assessor_responses').to route_to(controller: 'assessor_responses', action: 'index')
    end
    it "GET show" do
      expect(get: '/casestudy_users/1/assessor_responses/show').to route_to(controller: 'assessor_responses', action: 'show', casestudy_user_id: '1')
    end
    it "GET final_submit" do
      expect(get: '/assessor_responses/1/final_submit').to route_to(controller: 'assessor_responses', action: 'final_submit', assessor_response_id: '1')
    end
    it "GET edit" do
      expect(get: '/assessor_responses/1/edit').to route_to(controller: 'assessor_responses', action: 'edit', id: '1')
    end

    # it "GET new" do
    #   expect(get: '/assessor_responses/new').to route_to(controller: 'assessor_responses', action: 'new')
    # end

    # it "POST create" do
    #   expect(POST: '/assessor_responses').to route_to(controller: 'assessor_responses', action: 'create')
    # end

    it "PUT update" do
      expect(put: '/assessor_responses/1').to route_to(controller: 'assessor_responses', action: 'update', id: '1')
    end
    it "patch update" do
      expect(patch: '/assessor_responses/1').to route_to(controller: 'assessor_responses', action: 'update', id: '1')
    end
  

  end

  describe 'Casestudy controller' do
    
    it 'GET index' do
      expect(get: '/casestudies').to route_to(controller: 'casestudies', action: 'index')
    end
    it 'GET new' do
      expect(get: '/casestudies/new').to route_to(controller: 'casestudies', action: 'new')
    end
    it 'GET edit' do
      expect(get: '/casestudies/1/edit').to route_to(controller: 'casestudies', action: 'edit', id: '1')
    end
    it 'GET show' do
      expect(get: '/casestudies/1').to route_to(controller: 'casestudies', action: 'show', id: '1')
    end

    it 'PATCH update' do
      expect(patch: '/casestudies/1').to route_to(controller: 'casestudies', action: 'update', id: '1')
    end
    it 'PUT update' do
      expect(put: '/casestudies/1').to route_to(controller: 'casestudies', action: 'update', id: '1')
    end

    it 'POST create' do
      expect(post: '/casestudies').to route_to(controller: 'casestudies', action: 'create')
    end

  end

  describe 'Casestudy User Controller' do

    it 'GET index' do
      expect(get: '/casestudy_users').to route_to(controller: 'casestudy_users', action: 'index')
    end

    it 'GET new' do
      expect(get: '/casestudy_users/new').to route_to(controller: 'casestudy_users', action: 'new')
    end

    it 'GET walk_in_tests' do
      expect(get: '/walk_in_tests/1/1').to route_to(controller: 'casestudy_users', action: 'create_user_and_assign_casestudy_form', casestudy_id: '1', assessor_id: '1')
    end

    it 'POST walk_in_tests' do
      expect(post: '/walk_in_tests/1/1').to route_to(controller: 'casestudy_users', action: 'create_user_and_assign_casestudy', casestudy_id: '1', assessor_id: '1')
    end

    it 'POST create' do
      expect(post: '/casestudy_users').to route_to(controller: 'casestudy_users', action: 'create')
    end
  end


  describe "Dashboard Controller" do
    
    it 'GET Assessor Dashboard' do
      expect(get: '/assessor_dashboard').to route_to(controller: 'dashboard', action: 'assessor')
    end
    it 'GET Content_creator Dashboard' do
      expect(get: '/content_creator_dashboard').to route_to(controller: 'dashboard', action: 'content_creator')
    end
    it 'GET Admin Dashboard' do
      expect(get: '/admin_dashboard').to route_to(controller: 'dashboard', action: 'admin')
    end
    it 'GET Candidate Dashboard' do
      expect(get: '/candidate_dashboard').to route_to(controller: 'dashboard', action: 'candidate')
    end

    it 'GET Update role' do
      expect(get('/candidate_dashboard')).to route_to 'dashboard#candidate'
    end
    
    it 'GET User Permissions' do
      expect(get: '/candidate_dashboard').to route_to(controller: 'dashboard', action: 'candidate') #''''''''''''''''''
    end

  end

  describe "Home Controller" do
    
    it 'GET index' do
      expect(get('/')).to route_to 'home#index'
    end
    it 'GET test' do
      expect(get('/test')).to route_to 'home#test'
    end
  end

  describe 'Page controller' do
    it 'GET index' do
      expect(get('/casestudies/1/pages')).to route_to(controller: 'pages', action: 'index', casestudy_id: '1')
    end

    it 'GET new' do
      expect(get('/casestudies/1/pages/new')).to route_to(controller: 'pages', action: 'new', casestudy_id: '1')
    end

     it 'POST create' do
      expect(post('/casestudies/1/pages')).to route_to(controller: 'pages', action: 'create', casestudy_id: '1')
    end

    it 'GET edit' do
      expect(get('/casestudies/1/pages/1/edit')).to route_to(controller: 'pages', action: 'edit', casestudy_id: '1', id: '1')
    end

    it 'GET show' do
      expect(get('/casestudies/1/pages/1')).to route_to(controller: 'pages', action: 'show', casestudy_id: '1', id: '1')
    end

    it 'PUT update' do
      expect(put('/casestudies/1/pages/1')).to route_to(controller: 'pages', action: 'update', casestudy_id: '1', id: '1')
    end

    it 'PATCH update' do
      expect(patch('/casestudies/1/pages/1')).to route_to(controller: 'pages', action: 'update', casestudy_id: '1', id: '1')
    end

    it 'DELETE destroy' do
      expect(delete('/casestudies/1/pages/1')).to route_to(controller: 'pages', action: 'destroy', casestudy_id: '1', id: '1')
    end
  end

  describe 'Question Trait Controller' do 

    it 'DELETE destroy' do
      expect(delete('/question_traits/1')).to route_to(controller: 'question_traits', action: 'destroy', id: '1')
    end
  end

  describe 'Question controller' do

    it 'GET index' do
      expect(get('/casestudies/1/questions')).to route_to(controller: 'questions', action: 'index', casestudy_id: '1')
    end

    it 'GET new' do
      expect(get('/casestudies/1/questions/new')).to route_to(controller: 'questions', action: 'new', casestudy_id: '1')
    end

     it 'POST create' do
      expect(post('/casestudies/1/questions')).to route_to(controller: 'questions', action: 'create', casestudy_id: '1')
    end

    it 'GET edit' do
      expect(get('/casestudies/1/questions/1/edit')).to route_to(controller: 'questions', action: 'edit', casestudy_id: '1', id: '1')
    end

    it 'GET show' do
      expect(get('/casestudies/1/questions/1')).to route_to(controller: 'questions', action: 'show', casestudy_id: '1', id: '1')
    end

    it 'PUT update' do
      expect(put('/casestudies/1/questions/1')).to route_to(controller: 'questions', action: 'update', casestudy_id: '1', id: '1')
    end

    it 'PATCH update' do
      expect(patch('/casestudies/1/questions/1')).to route_to(controller: 'questions', action: 'update', casestudy_id: '1', id: '1')
    end

    it 'DELETE destroy' do
      expect(delete('/casestudies/1/questions/1')).to route_to(controller: 'questions', action: 'destroy', casestudy_id: '1', id: '1')
    end

    it 'GET assign Trait' do
      expect(get('/casestudies/1/questions/1/assign_trait')).to route_to(controller: 'questions', action: 'assign_trait', casestudy_id: '1', question_id: '1')
    end

    it 'POST assign Trait' do
      expect(post('/casestudies/1/questions/1/assign_trait')).to route_to(controller: 'questions', action: 'assign_trait', casestudy_id: '1', question_id: '1')
    end
  end

  describe "Trait Controller" do
    
    it 'GET index' do
      expect(get: '/traits').to route_to(controller: 'traits', action: 'index')
    end
    it 'GET new' do
      expect(get: '/traits/new').to route_to(controller: 'traits', action: 'new')
    end
    it 'GET show' do
      expect(get: '/traits/1').to route_to(controller: 'traits', action: 'show',  "id"=>"1")
    end
    it 'GET edit' do
      expect(get: '/traits/1/edit').to route_to(controller: 'traits', action: 'edit', "id"=>"1")
    end

    it 'POST create' do
      expect(post: '/traits').to route_to(controller: 'traits', action: 'create')
    end
    it 'PATCH update' do
      expect(patch: '/traits/1').to route_to(controller: 'traits', action: 'update', "id"=>"1")
    end

    it 'PUT update' do
      expect(put: '/traits/1').to route_to(controller: 'traits', action: 'update', "id"=>"1")
    end

  end

  

  describe "User Response Controller" do

    it 'POST Update Time' do
      expect(post('/update_time')).to route_to 'user_responses#update_time'
    end
    it 'POST Auto submit' do
      expect(post('/auto_submit/1')).to route_to(controller: 'user_responses', action: 'auto_submit', "id"=>"1")
    end

    it 'GET index' do
      expect(get('/casestudy_users/1/user_responses')).to route_to(controller: 'user_responses', action: 'index', "casestudy_user_id"=>"1")
    end

    it 'GET exam' do
      expect(get('/casestudy_users/1/user_responses/exam')).to route_to(controller: 'user_responses', action: 'exam', "casestudy_user_id"=>"1")
    end
    it 'GET submit' do
      expect(get('/casestudy_users/1/user_responses/submit')).to route_to(controller: 'user_responses', action: 'submit', "casestudy_user_id"=>"1")
    end

    it 'PATCH update' do
      expect(patch: '/casestudy_users/1/user_responses/1').to route_to(controller: 'user_responses', action: 'update', "casestudy_user_id"=>"1", "id" => '1')
    end

     it 'PUT update' do
      expect(put: '/casestudy_users/1/user_responses/1').to route_to(controller: 'user_responses', action: 'update', "casestudy_user_id"=>"1", "id" => '1')
    end

  end


end