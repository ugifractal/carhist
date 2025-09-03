module AiUtil
  class GeminiCaller
    @@api_key = nil

    class << self
      def setup(api_key)
        @@api_key = api_key
      end

      def print_api_key
        puts @@api_key
      end

      def api_key
        @@api_key
      end

      def request(prompt)
        conn = Faraday.new(
          url: "https://generativelanguage.googleapis.com",
          headers: {
            "Content-Type" => "application/json",
            "x-goog-api-key" => api_key
          }
        )
        response = conn.post("/v1beta/models/gemini-2.5-flash:generateContent") do |req|
          req.body = {
            "contents" => [
              "parts" => [
                {
                  "text" => prompt
                }
              ]
            ]
          }.to_json
        end
        output = JSON.parse(response.body)
        candidate = output["candidates"]&.first
        part = candidate.dig("content", "parts")&.first
        { text: part["text"], status: "ok" }
      end
    end
  end
end
