module FinSentinel
  class NLPFraudDetector
    # Heuristic NLP baseline for detecting localized digital fraud 
    # tailored to capture scarce, under-resourced language trends or colloquial scams
    LOCALIZED_FRAUD_KEYWORDS = [
      'urgent transfer', 'account locked', 'verify identity', 
      'tax penalty', 'safe account route', 'crypto invest guarantee'
    ]

    def analyze_transaction_notes(description)
      return { score: 0.0, flags: [] } if description.nil? || description.empty?

      normalized_desc = description.downcase
      
      # Basic natural language processing extraction
      flags = LOCALIZED_FRAUD_KEYWORDS.select { |keyword| normalized_desc.include?(keyword) }
      
      risk_score = (flags.length.to_f / LOCALIZED_FRAUD_KEYWORDS.length) * 3.0
      risk_score = [risk_score, 1.0].min 

      { score: risk_score.round(2), flags: flags }
    end
  end
end
