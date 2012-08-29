require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe CallbackSkipper do
  describe "For an instance of ActiveRecord model with callbacks" do

    class User < ActiveRecord::Base
      around_create :do_around_create
      after_save :do_after_save
      before_validation :do_before_validation

      protected

      def do_around_create
        true
      end

      def do_after_save
        true
      end

      def do_before_validation
        true
      end
    end

    before do
      @user = User.new
    end

    describe "when its saved while skipping all callbacks" do
      before do
        @user.skip_callback :save, :after, :do_after_save
        @user.skip_callback :create, :around, :do_around_create
        @user.skip_callback :validation, :before, :do_before_validation
      end
      it "should skip all validations" do
        @user.should_receive(:do_after_save).never
        @user.should_receive(:do_around_create).never
        @user.should_receive(:do_before_validation).never
        @user.save!
      end
      describe "when a new instance of user is assigned to the same variable that skipped callbacks before" do
        before do
          @user = User.new
        end
        it "should not skip validations upon saving" do
          @user.should_receive(:do_after_save).once
          @user.should_receive(:do_around_create).once
          @user.should_receive(:do_before_validation).once
          @user.save!
        end
      end
      describe "when a new instance of user is initialized" do
        before do
          @another_user = User.new
        end
        it "should not skip validations upon saving" do
          @another_user.should_receive(:do_after_save).once
          @another_user.should_receive(:do_around_create).once
          @another_user.should_receive(:do_before_validation).once
          @another_user.save!
        end
      end
    end
    it "should through an error when attempting to skip an undefined callback" do
      lambda { @user.skip_callback :save, :after, :method_that_doesnt_exist }.should raise_error CallbackSkipper::CallbackNotDefinedError
    end
  end
end
