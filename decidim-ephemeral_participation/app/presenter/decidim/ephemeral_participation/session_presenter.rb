# frozen_string_literal: true

module Decidim
  module EphemeralParticipation
    class SessionPresenter
      EPHEMERAL_PARTICIPANT_SESSION_DURATION = ::Devise.timeout_in

      def initialize(user)
        @user = user
      end

      def ephemeral_participant_session_remaining_time_in_minutes
        (ephemeral_participant_session_remaining_time / 1.minute).round
      end

      def ephemeral_participant_session_expired?
        ephemeral_participant_session_remaining_time.negative?
      end

      private

      def ephemeral_participant_session_remaining_time
        (@user.created_at + EPHEMERAL_PARTICIPANT_SESSION_DURATION) - Time.current
      end
    end
  end
end
