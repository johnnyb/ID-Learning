module ApplicationHelper
	def texthtml(val, opts = {})
		RedCloth.new(val).to_html.html_safe
	end

	def embed_youtube_video(ytid)
		"<iframe width='640' height='390' src='http://www.youtube.com/embed/#{ytid}' frameborder='0' allowfullscreen='allowfullscreen'></iframe>".html_safe
	end

	def sortable_element(dom_id, url, opts = {})
		url = url_for(url)
		method = opts[:method] || "PUT"
		param = opts[:param] || "sortOrder"
		val = <<EOF
		<script type="text/javascript">
			$(function(){$("##{dom_id}").sortable({update: function(event, ui){
				$.ajax({
					url: "#{url}", 
					type: "#{method}", 
					data: {"#{param}": $.map($(this).sortable('toArray'), function(x){return x.split("_")[1]}).toString()},
					success: function() {
						$("##{dom_id}").effect("highlight");
					}
				});
			}})});
		</script>
EOF
		return val.html_safe
	end

	def show_video_by_url(url)
		if url.include?("youtu.be")
			ytid = url.split("/").last
			return embed_youtube_video(ytid)
		elsif /youtube.com.watch.*v=([^\&]+)/.match(url)
			return embed_youtube_video($1)
		else
			return link_to("Watch Video", url, :target => "_blank")
		end
	end
end
