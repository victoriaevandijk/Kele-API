# require 'kele/errors'
require 'httparty'
require 'json'

class Kele
  include HTTParty
  base_uri 'https://www.bloc.io/api/v1'

  def initialize(email, password)
    response = self.class.post(api_url("sessions"), body: {"email": email, "password": password})
    # raise InvalidStudentCodeError.new() if response.code == 404
    @auth_token = response["auth_token"]
  end
  
  def get_me
    response = self.class.get(api_url("users/me"), headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end
  
  def get_mentor_availability(mentor_id)
    response = self.class.get(api_url("mentors/#{mentor_id}/student_availability"), headers: { "authorization" => @auth_token })
    @mentor_availability = JSON.parse(response.body)
  end
  
  def get_roadmap(roadmap_id)
    response = self.class.get(api_url("roadmaps/#{roadmap_id}"), headers: { "authorization" => @auth_token })
    @roadmap = JSON.parse(response.body)
  end

  def get_checkpoint(checkpoint_id)
    response = self.class.get(api_url("checkpoints/#{checkpoint_id}"), headers: { "authorization" => @auth_token })
    @checkpoint = JSON.parse(response.body)
  end
  
  def get_messages(page)
    response = self.class.get(api_url("message_threads?page=#{page}"), headers: { "authorization" => @auth_token })
    @get_messages = JSON.parse(response.body)
  end
  
  def create_message(recipient_id, subject, message)
    response = self.class.post(api_url("messages"), body: { "user_id": id, "recipient_id": recipient_id, "subject": subject, "stripped-text": message }, headers: { "authorization" => @auth_token })
    puts response
  end
  
  private
   def api_url(endpoint)
     "https://www.bloc.io/api/v1/#{endpoint}"
   end
end