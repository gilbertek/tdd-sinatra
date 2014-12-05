require "spec_helper"

Rspec.describe TodoApi do
	def app
		TodoApi # This defines the active appliocation for the test
	end

	describe "GET todos" do
		context "no todos" do
			it "returns no todo" do
				get "/"

				expect(last_response.body).to eq("")
				expect(last_response.status).to eq 200
			end
		end

		context "several todos" do

			before do
				@todos = ["Hello", "world", "!"]
				$db = @todos
			end

			it "returns all the todos" do
				get "/"

				expect(last_response.body).to eq @todos.join("\n")
				expect(last_response.status).to eq 200
			end
		end
	end

	describe "POST todo" do
		it "returns status 200" do
			post "/" :todo => "Hello spec"

			expect(last_response.status).to eq 200
		end

		context "todo param missing" do

			it "returns status 400" do
				post "/"

				expect(last_response.status).to eq 400
			end
		end
	end
end
