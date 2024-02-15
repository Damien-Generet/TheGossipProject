class StaticPagesController < ApplicationController
  def home
    @best_gossips = top_gossips = Gossip.find_by_sql("
    SELECT gossips.*
    FROM gossips
    INNER JOIN (
      SELECT gossip_id, COUNT(*) AS like_count
      FROM like_gossips
      GROUP BY gossip_id
      ORDER BY like_count DESC
      LIMIT 3
    ) AS top_likes ON gossips.id = top_likes.gossip_id
  ")
     @gossips = Gossip.all
  end

  def contact
  end

  def team
  end

end
