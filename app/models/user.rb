require 'role_model'

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include SixthDensity::CurrencyField

  module Roles
    ALL = %w(client tester admin).collect do |role|
      const_set role.upcase, role
    end

    VALID_ON_CREATE = ALL - [ADMIN]
  end

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Confirmable
  field :confirmation_token,   :type => String
  field :confirmed_at,         :type => Time
  field :confirmation_sent_at, :type => Time
  field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # attr_accessible :title, :body

  field :role,              type: String
  field :tests_taken_count, type: Integer, default: 0
  currency_field :balance

  has_many :tests_created, class_name: "TestDefinition", 
                           inverse_of: :author
                           
  validates :role, inclusion: Roles::VALID_ON_CREATE

  def is_a_client?
    role == Roles::CLIENT
  end

  def tests_taken
    TestDefinition.active.in taker_ids: [id]
  end

  def tests_not_taken
    TestDefinition.active.nin taker_ids: [id], author_id: id
  end

  def debit_account! f_amount
    inc :balance_in_cents, (User.float_to_cents(f_amount) * -1)
  end

  def payout! f_amount
    inc :balance_in_cents, User.float_to_cents(f_amount)
    inc :tests_taken_count, 1
  end
end
