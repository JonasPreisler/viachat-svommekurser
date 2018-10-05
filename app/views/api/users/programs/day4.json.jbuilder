json.messages do
	json.array! [*1] do
		json.attachment do
			json.type "template"
			json.payload do
				json.template_type "generic"
				json.image_aspect_ratio "horizontal"
				json.elements do
					json.array! (@program).limit(10) do |program|
						json.title "Kl. #{program.starttime.strftime("%H")}-#{program.endtime.strftime("%H")} - #{program.name}"
						if program.image.present?
							json.image_url "#{program.image.url(:messenger) if program.image}"
						else
							json.image_url "http://netovo.herokuapp.com/thumbnail.png"
						end
						json.subtitle "Foredrag: #{program.speakers.first.name} Sted: #{program.place if program.place}"
						json.buttons do
							json.array! [*1] do
					            json.type "show_block"
					            json.block_names ["Program"]
					            json.title "📓 Beskrivelse"
					        end
							json.array! [*1] do
					            json.type "show_block"
					            json.block_names ["Speaker"]
					            json.title "🙋 Om foredraget"
					        end
							json.array! [*1] do
					            json.type "web_url"
					            json.url "http://netovo.herokuapp.com/programs/#{program.id}?v=%20"
					            json.title "Webview"
					        end
						end
					end
				end
			end
		end
	end
end


if @program.count > 10
	json.messages do
		json.array! [*1] do
			json.text "Se flere programmer:"
			json.quick_replies do
				json.array! [*1] do
					json.title "Flere programmer"
					json.block_names ["day4_2"]
				end
			end
		end
	end
end