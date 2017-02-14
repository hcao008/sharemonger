json.extract! order, :id, :feedback_rating, :feedback_comment, :buyer_id, :seller_id, :item_id, :created_at, :updated_at
json.url order_url(order, format: :json)