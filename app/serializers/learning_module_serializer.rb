class LearningModuleSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :subscription_level, :exercises, :video_courses

  def subscription_level
    case object.subscription
    when 0 then 'basic'
    when 1 then 'premium'
    when 2 then 'professional'
    end
  end

  def exercises
    object.exercises
  end

  def video_courses
    object.video_courses
  end
end
