json.messages do
	json.array! [*1] do
		json.attachment do
			json.type "template"
			json.payload do
				json.template_type "generic"
				json.image_aspect_ratio "square"
				json.elements do
					json.array! (@products).limit(10) do |product|
						json.title "#{product.title}"
						json.image_url "#{product.image.url(:messenger)}"
						json.subtitle "DKK #{product.price}"
						json.buttons do
							if product.product_link?
								json.array! [*1] do
									json.type "web_url"
									json.url "#{product.product_link}?v=%20"
									json.title "Hjemmeside"
								end
							end
							json.array! [*1] do
					            json.type "show_block"
					            json.block_names ["mobilepay"]
					            json.title "MobilePay"
					        end
							json.array! [*1] do
					            json.type "show_block"
					            json.block_names ["overforsel"]
					            json.title "Overførsel"
					        end
						end
					end
				end
			end
		end
	end
end

if @products.count > 10
	json.messages do
		json.array! [*1] do
			json.text "Se flere nyheder:"
			json.quick_replies do
				json.array! [*1] do
					json.title "Flere nyheder"
					json.block_names ["nyheder_2"]
				end
			end
		end
	end
end