require 'test_helper'

class AuthenticableTest < Minitest::Spec
  before do
    @dummy_authenticable = Struct.new(:username, :password, :encrypted_password, :salt) do
      class << self
        def before_save(m)
          @before_save = m
        end

        def after_save(m)
          @after_save = m
        end
      end
      include Authenticable
      def save
        send(self.class.instance_variable_get('@before_save'))
        send(self.class.instance_variable_get('@after_save'))
      end
    end
  end

  subject do
    obj = @dummy_authenticable.new('joe')
    obj.password = 'pass'
    obj
  end

  describe 'authenticable class' do
    it 'must respond to :authenticate?' do
      subject.must_respond_to :authenticate?
    end
  end

  describe '#save' do
    subject do
      obj = @dummy_authenticable.new('joe')
      obj.password = 'pass'
      obj.save
      obj
    end

    it 'must generate salt' do
      subject.salt.wont_be_nil
    end

    it 'must encrypt password'do
      subject.encrypted_password.wont_be_nil
    end

    it 'must clear password attribute' do
      subject.password.must_be_nil
    end

    describe '#autheticate' do
      it 'must accept valid pass' do
        subject.authenticate?('pass').must_equal true
      end

      it 'wont accept wrong pass' do
        subject.authenticate?('wrong').must_equal false
      end
    end
  end
end
