require 'rails_helper'

RSpec.describe PostsController, type: :controller do
    describe "#index" do
        it 'renders the index template' do
            
            # GIVEN
            # Defaults
        
            # WHEN
            # Making a GET request to the index action
            get(:index)
            
            # THEN
            # The `response` object contains the rendered template `index`
            # The response object is available inside any controller. It
            # is similar to `response` available in Express Middleware,
            # however we rarely interact with it in Rails. Rspec makes
            # it available when testing, in order to verify its contents.
        
            # Here we verify with the `render_template` matcher that it
            # contains the right rendered template.
            expect(response).to(render_template(:index))
        end

        it 'renders the new template' do
            
        end
    end      
end
