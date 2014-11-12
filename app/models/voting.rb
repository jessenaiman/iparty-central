# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

#ActiveRecord::Schema.define(:version => 20130302075827) do

class Administrator
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :email,
  field :encrypted_password,
  field :reset_password_token
  field :reset_password_sent_at
  field :remember_created_at
  field :sign_in_count,          :default => 0
  field :current_sign_in_at
  field :last_sign_in_at
  field :current_sign_in_ip
  field :last_sign_in_ip
  field :failed_attempts,        :default => 0
  field :unlock_token
  field :locked_at
  field :password
  
  #index "administrators", ["email"], :name => "index_administrators_on_email", :unique => true
  #index "administrators", ["reset_password_token"], :name => "index_administrators_on_reset_password_token", :unique => true
end



class Answer
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :question_id
  filed :text
  field :short_text
  field :help_text
  field :weight
  field :response_class
  field :reference_identifier
  field :data_export_identifier
  field :common_namespace
  field :common_identifier
  field :display_order
  field :is_exclusive
  field :display_length
  field :custom_class
  field :custom_renderer
  field :default_value
  field :api_id
  field :display_type
  
  add_index "answers", ["api_id"], :name => "uq_answers_api_id", :unique => true
end

class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title
  field :ingress
  field :body
  field :article_type
  field :idea_id
  field :citizen_id
  field :publish_state, :default => "unpublished"
  field :slug
  
  add_index "articles", ["slug"], :name => "index_articles_on_slug", :unique => true
end

class Authentication
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :provider
  field :uid
  field :info
  field :credentials
  field :extra
  field :citizen_id
  
  add_index "authentications", ["citizen_id"], :name => "index_authentications_on_citizen_id"
  add_index "authentications", ["provider", "uid"], :name => "index_authentications_on_provider_and_uid", :unique => true
end



class Changelog
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :changer_type
  field :changer_id
  field :changelogged_type
  field :changelogged_id
  field :change_type
  field :attribute_changes
  
  add_index "changelogs", ["changelogged_type", "changelogged_id"], :name => "index_changelogs_on_changelogged_type_and_changelogged_id"
  add_index "changelogs", ["changer_type", "changer_id"], :name => "index_changelogs_on_changer_type_and_changer_id"
end



class Citizen
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :email
  field :encrypted_password,     :default => "", :null => false
  field :reset_password_token
  field :reset_password_sent_at
  field :remember_created_at
  field :sign_in_count,          :default => 0
  field :current_sign_in_at
  field :last_sign_in_at
  field :current_sign_in_ip
  field :last_sign_in_ip
  field :password
  field :first_name
  field :last_name
  field :locked_at
  
  add_index "citizens", ["email"], :name => "index_citizens_on_email", :unique => true
  add_index "citizens", ["reset_password_token"], :name => "index_citizens_on_reset_password_token", :unique => true
end



class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :author_id
  field :body
  field :published,        :default => true
  field :commentable_id
  field :commentable_type
  field :publish_state,    :default => "published"
  
  add_index "comments", ["author_id"], :name => "index_comments_on_author_id"
  add_index "comments", ["commentable_id", "commentable_type"], :name => "index_comments_on_commentable_id_and_commentable_type"
  add_index "comments", ["publish_state"], :name => "index_comments_on_publish_state"
end



class Conversation
  field :subject    :default => ""
end

class Dependency
  field :question_id
  field :question_group_id
  field      :rule"
  field   :created_at",        :null => false
  field   :updated_at",        :null => false
end

class "dependency_conditions"
  field    :dependency_id"
  field      :rule_key"
  field    :question_id"
  field      :operator"
  field    :answer_id"
  field   :datetime_value"
  field    :integer_value"
  field    :float_value"
  field      :unit"
  field       :text_value"
  field      :string_value"
  field      :response_other"
  field   :created_at",     :null => false
  field   :updated_at",     :null => false
end

class "expert_suggestions"
  field      :firstname"
  field      :lastname"
  field      :email"
  field      :jobtitle"
  field      :organisation"
  field      :expertise"
  field      :recommendation"
  field    :citizen_id"
  field    :idea_id"
  field   :created_at",     :null => false
  field   :updated_at",     :null => false
end

class "ideas"
  field      :title"
  field       :body"
  field      :state",                              :default => "idea"
  field    :author_id"
  field   :created_at",                                                  :null => false
  field   :updated_at",                                                  :null => false
  field       :summary"
  field      :publish_state",                      :default => "published"
  field      :slug"
  field    :comment_count",                      :default => 0
  field    :vote_count",                         :default => 0
  field    :vote_for_count",                     :default => 0
  field    :vote_against_count",                 :default => 0
  field    :vote_proportion",                    :default => 0.0
  field    :vote_proportion_away_mid",           :default => 0.5
  field  :collecting_started"
  field  :collecting_ended"
  field     :collecting_start_date"
  field     :collecting_end_date"
  field    :additional_signatures_count"
  field     :additional_signatures_count_date"
  field    :target_count"
  field  :collecting_in_service"
  field      :additional_collecting_service_urls"
  field   :updated_content_at"
  field    :impressions_count"
end

add_index "ideas", ["author_id"], :name => "index_ideas_on_author_id"
add_index "ideas", ["publish_state"], :name => "index_ideas_on_publish_state"
add_index "ideas", ["slug"], :name => "index_ideas_on_slug", :unique => true

class "impressions"
  field      :impressionable_type"
  field    :impressionable_id"
  field    :user_id"
  field      :controller_name"
  field      :action_name"
  field      :view_name"
  field      :request_hash"
  field      :ip_address"
  field      :session_hash"
  field       :message"
  field       :referrer"
  field   :created_at",          :null => false
  field   :updated_at",          :null => false
end

add_index "impressions", ["controller_name", "action_name", "ip_address"], :name => "controlleraction_ip_index"
add_index "impressions", ["controller_name", "action_name", "request_hash"], :name => "controlleraction_request_index"
add_index "impressions", ["controller_name", "action_name", "session_hash"], :name => "controlleraction_session_index"
add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], :name => "poly_ip_index"
add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], :name => "poly_request_index"
add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], :name => "poly_session_index"
add_index "impressions", ["user_id"], :name => "index_impressions_on_user_id"

class "locations"
  field      :address"
  field    :latitude"
  field    :longitude"
  field   :created_at", :null => false
  field   :updated_at", :null => false
  field      :name"
end

class "money_transactions"
  field    :citizen_id"
  t.decimal  "amount",            :precision => 8, :scale => 2
  field      :description"
  field   :created_at",                                      :null => false
  field   :updated_at",                                      :null => false
  field      :unique_identifier"
end

class "notifications"
  field      :type"
  field       :body"
  field      :subject",              :default => ""
  field    :sender_id"
  field      :sender_type"
  field    :conversation_id"
  field  :draft",                :default => false
  field   :updated_at",                              :null => false
  field   :created_at",                              :null => false
  field    :notified_object_id"
  field      :notified_object_type"
  field      :notification_code"
  field      :attachment"

  add_index "notifications", ["conversation_id"], :name => "index_notifications_on_conversation_id"
end



class Profile
  field    :citizen_id
  field      :first_name
  field      :last_name
  field      :image
  field  :receive_newsletter,              :default => true
  field  :receive_other_announcements,     :default => true
  field  :receive_weekletter,              :default => true
  field      :first_names
  field  :accept_science,                  :default => true
  field  :accept_terms_of_use,             :default => true
  field      :authenticated_firstnames
  field      :authenticated_lastname
  field      :authenticated_birth_date
  field      :authenticated_occupancy_county
  field  :receive_messaging_notifications", :default => true
  
  add_index "profiles", ["citizen_id"], :name => "index_profiles_on_citizen_id"
end

class QuestionGroup
  field       :text
  field       :help_text
  field      :reference_identifier
  field      :data_export_identifier
  field      :common_namespace
  field      :common_identifier
  field      :display_type
  field      :custom_class
  field      :custom_renderer
  field      :api_id
  
  add_index "question_groups", ["api_id"], :name => "uq_question_groups_api_id", :unique => true
end



class Question
  field    :survey_section_id
  field    :question_group_id
  field       :text
  field       :short_text
  field       :help_text
  field      :pick
  field      :reference_identifier
  field      :data_export_identifier
  field      :common_namespace
  field      :common_identifier
  field    :display_order
  field      :display_type
  field  :is_mandatory
  field    :display_width
  field      :custom_class
  field      :custom_renderer
  field    :correct_answer_id
  field      :api_id

  add_index "questions", ["api_id"], :name => "uq_questions_api_id", :unique => true
end



class Receipt
  field    :receiver_id
  field      :receiver_type
  field    :notification_id,                                  :null => false
  field  :is_read,                       :default => false
  field  :trashed,                       :default => false
  field  :deleted,                       :default => false
  field      :mailbox_type,    :limit => 25
  
  add_index "receipts", ["notification_id"], :name => "index_receipts_on_notification_id"
end

class ResponseSet
  field    :user_id
  field    :survey_id
  field      :access_code
  field   :started_at
  field   :completed_at
  field      :api_id
  field      :user_state

  add_index "response_sets", ["access_code"], :name => "response_sets_ac_idx", :unique => true
  add_index "response_sets", ["api_id"], :name => "uq_response_sets_api_id", :unique => true
end

class Response
  field    :response_set_id
  field    :question_id
  field    :answer_id
  field   :datetime_value
  field    :integer_value
  field    :float_value
  field      :unit
  field       :text_value
  field      :string_value
  field      :response_other
  field      :response_group
  field    :survey_section_id
  field      :api_id

  add_index "responses", ["api_id"], :name => "uq_responses_api_id", :unique => true
  add_index "responses", ["survey_section_id"], :name => "index_responses_on_survey_section_id"
end



class Session
  field      :session_id, :null => false
  field :data
  
  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"
end



class Signature
  field    :citizen_id
  field    :idea_id
  field      :idea_title
  field     :idea_date
  field     :birth_date
  field      :occupancy_county
  field  :vow
  field     :signing_date
  field      :state
  field      :stamp
  field   :started
  field      :firstnames
  field      :lastname
  field  :accept_general
  field  :accept_non_eu_server
  field      :accept_publicity
  field  :accept_science
  field      :idea_mac
  field      :service
end

class SurveySection
  field    :survey_id
  field      :title
  field :description
  field      :reference_identifier
  field      :data_export_identifier
  field      :common_namespace
  field      :common_identifier
  field    :display_order
  field      :custom_class
end

class Survey
  field :title
  field :description
  field :access_code
  field :reference_identifier
  field :data_export_identifier
  field :common_namespace
  field :common_identifier
  field :active_at
  field   :inactive_at
  field      :css_url
  field      :custom_class
  field    :display_order
  field      :api_id
  field    :survey_version",         :default => 0
  
  add_index "surveys", ["access_code", "survey_version"], :name => "surveys_access_code_version_idx", :unique => true
  add_index "surveys", ["api_id"], :name => "uq_surveys_api_id", :unique => true
end



class ValidationCondition
  field :validation_id
  field :rule_key
  field :operator
  field :question_id
  field :answer_id
  field :datetime_value
  field :integer_value
  field :float_value
  field :unit
  field :text_value
  field :string_value
  field :response_other
  field :regexp
end

class Validation
  field :answer_id
  field :rule
  field :message
end

class Vote
  
  
  field :ption
  field :idea_id
  field :citizen_id
  
  add_index "votes", ["citizen_id"], :name => "index_votes_on_citizen_id"
  add_index "votes", ["idea_id"], :name => "index_votes_on_idea_id"
end



#end
