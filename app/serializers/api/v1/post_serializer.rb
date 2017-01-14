class Api::V1::PostSerializer < ActiveModel::Serializer
    attributes :id,
                :title,
                :content,
                :user_id,
                # :activated,
                # :admin,
                :created_at,
                :updated_at

    def created_at
        object.created_at.in_time_zone.iso8601 if object.created_at
    end

    def updated_at
        object.updated_at.in_time_zone.iso8601 if object.created_at
    end
end