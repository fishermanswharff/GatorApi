require 'rails_helper'
require 'spec_helper'

describe 'Feeds API endpoint' do

  let(:user) { FactoryGirl.create(:user, :admin) }

end


# CREATE REQUEST SPEC
# ———————————————————————————
# describe '#create' do
#   context 'with unauthorized requests' do
#     before(:each) do
#       post "/",
#       { modelname:
#         { key: value }
#       }.to_json,
#       { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s, 'HTTP_AUTHORIZATION' => "Token token=#{@venue_admin.token}"}
#     end
#     it 'responds unauthorized' do
#       expect(response.status).to eq 403
#     end
#     it 'responds with an error message' do
#       r = json(response.body)
#       expect(r[:error]).to eq 'You are not an admin'
#     end
#   end

#   context 'with authorized request' do
#     before(:each) do
#       post "/",
#       { modelname:
#         { key: value }
#       }.to_json,
#       { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s, 'HTTP_AUTHORIZATION' => "Token token=#{@admin.token}"}
#     end
#     it 'responds successfully' do
#       expect(response.status).to eq 201
#     end
#     it 'responds with json object of the phone' do
#       obj = json(response.body)
#       expect(obj[:key]).to eq ""
#     end
#     it 'returns the location' do
#       r = json(response.body)
#       expect(r.headers['Location']).to eq "http://www.example.com/"
#     end
#   end
# end

# UPDATE REQUEST SPEC
# ———————————————————————————
# describe '#update' do

#   context 'by a venue_admin' do
#     before(:each) do
#       patch "/",
#       { model:
#         { key: 'value' }
#       }.to_json,
#       { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s, 'HTTP_AUTHORIZATION' => "Token token=#{@venue_admin.token}"}
#     end

#     it 'responds successfully' do
#       expect(response.status).to eq 200
#     end

#     it 'returns the object with successfully updated attributes' do
#       phone = json(response.body)
#       expect(phone[:key]).to eq 'value'
#     end
#   end

#   context 'by an Ishmael admin works too' do
#     before(:each) do
#       patch "/",
#       { model:
#         { key: 'value' }
#       }.to_json,
#       { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s, 'HTTP_AUTHORIZATION' => "Token token=#{@admin.token}"}
#     end
#     it 'responds successfully' do
#       expect(response.status).to eq 200
#     end

#     it 'does something else' do
#       model = json(response.body)
#       expect(model[:key]).to eq 'some value'
#     end
#   end
# end


