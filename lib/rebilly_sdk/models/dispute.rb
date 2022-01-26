=begin
#Rebilly REST API

## Introduction [comment]: <> (x-product-description-placeholder) The Rebilly API is built on HTTP. Our API is RESTful. It has predictable resource URLs. It returns HTTP response codes to indicate errors. It also accepts and returns JSON in the HTTP body. You can use your favorite HTTP/REST library for your programming language to use Rebilly's API, or you can use one of our SDKs (currently available in [PHP](https://github.com/Rebilly/rebilly-php) and [Javascript](https://github.com/Rebilly/rebilly-js-sdk)).  We have other APIs that are also available. Every action from our [app](https://app.rebilly.com) is supported by an API which is documented and available for use so that you may automate any workflows necessary. This document contains the most commonly integrated resources.  # Authentication  When you sign up for an account, you are given your first secret API key. You can generate additional API keys, and delete API keys (as you may need to rotate your keys in the future). You authenticate to the Rebilly API by providing your secret key in the request header.  Rebilly offers three forms of authentication:  secret key, publishable key, JSON Web Tokens, and public signature key. - [Secret API key](#section/Authentication/SecretApiKey): used for requests made   from the server side. Never share these keys. Keep them guarded and secure. - [Publishable API key](#section/Authentication/PublishableApiKey): used for    requests from the client side. For now can only be used to create    a [Payment Token](#operation/PostToken) and    a [File token](#operation/PostFile). - [JWT](#section/Authentication/JWT): short lifetime tokens that can be assigned a specific expiration time.  Never share your secret keys. Keep them guarded and secure.  <!-- ReDoc-Inject: <security-definitions> -->  # Errors Rebilly follow's the error response format proposed in [RFC 7807](https://tools.ietf.org/html/rfc7807) also known as Problem Details for HTTP APIs.  As with our normal API responses, your client must be prepared to gracefully handle additional members of the response.  ## Forbidden <RedocResponse pointer={\"#/components/responses/Forbidden\"} />  ## Conflict <RedocResponse pointer={\"#/components/responses/Conflict\"} />  ## NotFound <RedocResponse pointer={\"#/components/responses/NotFound\"} />  ## Unauthorized <RedocResponse pointer={\"#/components/responses/Unauthorized\"} />  ## ValidationError <RedocResponse pointer={\"#/components/responses/ValidationError\"} />  # SDKs  Rebilly offers a Javascript SDK and a PHP SDK to help interact with the API.  However, no SDK is required to use the API.  Rebilly also offers [FramePay](https://docs.rebilly.com/docs/developer-docs/framepay/),  a client-side iFrame-based solution to help create payment tokens while minimizing PCI DSS compliance burdens and maximizing the customization ability. [FramePay](https://docs.rebilly.com/docs/developer-docs/framepay/) is interacting with the [payment tokens creation operation](#operation/PostToken).  ## Javascript SDK  Installation and usage instructions can be found [here](https://docs.rebilly.com/docs/developer-docs/sdks). SDK code examples are included in these docs.  ## PHP SDK For all PHP SDK examples provided in these docs you will need to configure the `$client`. You may do it like this:  ```php $client = new Rebilly\\Client([     'apiKey' => 'YourApiKeyHere',     'baseUrl' => 'https://api.rebilly.com', ]); ```  # Using filter with collections Rebilly provides collections filtering. You can use `?filter` param on collections to define which records should be shown in the response.  Here is filter format description:  - Fields and values in filter are separated with `:`: `?filter=firstName:John`.  - Sub-fields are separated with `.`: `?filter=billingAddress.country:US`.  - Multiple filters are separated with `;`: `?filter=firstName:John;lastName:Doe`. They will be joined with `AND` logic. In this example: `firstName:John` AND `lastName:Doe`.  - You can use multiple values using `,` as values separator: `?filter=firstName:John,Bob`. Multiple values specified for a field will be joined with `OR` logic. In this example: `firstName:John` OR `firstName:Bob`.  - To negate the filter use `!`: `?filter=firstName:!John`. Note that you can negate multiple values like this: `?filter=firstName:!John,!Bob`. This filter rule will exclude all Johns and Bobs from the response.  - You can use range filters like this: `?filter=amount:1..10`.  - You can use gte (greater than or equals) filter like this: `?filter=amount:1..`, or lte (less than or equals) than filter like this: `?filter=amount:..10`. This also works for datetime-based fields.  - You can create some [predefined values lists](https://user-api-docs.rebilly.com/#tag/Lists) and use them in filter: `?filter=firstName:@yourListName`. You can also exclude list values: `?filter=firstName:!@yourListName`.  - Datetime-based fields accept values formatted using RFC 3339 like this: `?filter=createdTime:2021-02-14T13:30:00Z`.   # Expand to include embedded objects Rebilly provides the ability to pre-load additional  objects with a request.   You can use `?expand` param on most requests to expand and include embedded objects within the `_embedded` property of the response.  The `_embedded` property contains an array of  objects keyed by the expand parameter value(s).  You may expand multiple objects by passing them as comma-separated to the expand value like so:  ``` ?expand=recentInvoice,customer ```  And in the response, you would see:  ``` \"_embedded\": [     \"recentInvoice\": {...},     \"customer\": {...} ] ``` Expand may be utilitized not only on `GET` requests but also on `PATCH`, `POST`, `PUT` requests too.   # Getting started guide  Rebilly's API has over 500 operations.  That's more than you'll  need to implement your use cases.  If you have a use  case you would like to implement, please consult us for feedback on the best API operations for the task.  Our [getting started guides](https://www.rebilly.com/docs/content/dev-docs/concept/integrations/) will demonstrate a payment form use cases.  It will allow us to highlight core resources in Rebilly that will be helpful for many other use cases too. 

OpenAPI spec version: 2.1
Contact: integrations@rebilly.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 3.0.33-SNAPSHOT
=end

require 'date'

module RebillySdk
  class Dispute
    # The dispute identifier string.
    attr_accessor :id

    # The dispute's customer ID.
    attr_accessor :customer_id

    # The dispute's transaction ID.
    attr_accessor :transaction_id

    attr_accessor :currency

    # The dispute amount.
    attr_accessor :amount

    # The dispute's acquirer reference number.
    attr_accessor :acquirer_reference_number

    # The case ID for the dispute.
    attr_accessor :case_id

    # The dispute's reason code.
    attr_accessor :reason_code

    # The dispute's category.
    attr_accessor :category

    # The dispute's type.
    attr_accessor :type

    # The dispute's status.
    attr_accessor :status

    # Dispute posted time.
    attr_accessor :posted_time

    # Dispute deadline time.
    attr_accessor :deadline_time

    # Dispute raw response from gateway.
    attr_accessor :raw_response

    # Dispute resolved time.
    attr_accessor :resolved_time

    # Dispute created time.
    attr_accessor :created_time

    # Dispute updated time.
    attr_accessor :updated_time

    # The links related to resource.
    attr_accessor :_links

    # Any embedded objects available that are requested by the `expand` querystring parameter.
    attr_accessor :_embedded

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'customer_id' => :'customerId',
        :'transaction_id' => :'transactionId',
        :'currency' => :'currency',
        :'amount' => :'amount',
        :'acquirer_reference_number' => :'acquirerReferenceNumber',
        :'case_id' => :'caseId',
        :'reason_code' => :'reasonCode',
        :'category' => :'category',
        :'type' => :'type',
        :'status' => :'status',
        :'posted_time' => :'postedTime',
        :'deadline_time' => :'deadlineTime',
        :'raw_response' => :'rawResponse',
        :'resolved_time' => :'resolvedTime',
        :'created_time' => :'createdTime',
        :'updated_time' => :'updatedTime',
        :'_links' => :'_links',
        :'_embedded' => :'_embedded'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'id' => :'Object',
        :'customer_id' => :'Object',
        :'transaction_id' => :'Object',
        :'currency' => :'Object',
        :'amount' => :'Object',
        :'acquirer_reference_number' => :'Object',
        :'case_id' => :'Object',
        :'reason_code' => :'Object',
        :'category' => :'Object',
        :'type' => :'Object',
        :'status' => :'Object',
        :'posted_time' => :'Object',
        :'deadline_time' => :'Object',
        :'raw_response' => :'Object',
        :'resolved_time' => :'Object',
        :'created_time' => :'Object',
        :'updated_time' => :'Object',
        :'_links' => :'Object',
        :'_embedded' => :'Object'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end
  
    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `RebillySdk::Dispute` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `RebillySdk::Dispute`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'customer_id')
        self.customer_id = attributes[:'customer_id']
      end

      if attributes.key?(:'transaction_id')
        self.transaction_id = attributes[:'transaction_id']
      end

      if attributes.key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.key?(:'acquirer_reference_number')
        self.acquirer_reference_number = attributes[:'acquirer_reference_number']
      end

      if attributes.key?(:'case_id')
        self.case_id = attributes[:'case_id']
      end

      if attributes.key?(:'reason_code')
        self.reason_code = attributes[:'reason_code']
      end

      if attributes.key?(:'category')
        self.category = attributes[:'category']
      end

      if attributes.key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.key?(:'posted_time')
        self.posted_time = attributes[:'posted_time']
      end

      if attributes.key?(:'deadline_time')
        self.deadline_time = attributes[:'deadline_time']
      end

      if attributes.key?(:'raw_response')
        self.raw_response = attributes[:'raw_response']
      end

      if attributes.key?(:'resolved_time')
        self.resolved_time = attributes[:'resolved_time']
      end

      if attributes.key?(:'created_time')
        self.created_time = attributes[:'created_time']
      end

      if attributes.key?(:'updated_time')
        self.updated_time = attributes[:'updated_time']
      end

      if attributes.key?(:'_links')
        if (value = attributes[:'_links']).is_a?(Array)
          self._links = value
        end
      end

      if attributes.key?(:'_embedded')
        if (value = attributes[:'_embedded']).is_a?(Array)
          self._embedded = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @transaction_id.nil?
        invalid_properties.push('invalid value for "transaction_id", transaction_id cannot be nil.')
      end

      if @currency.nil?
        invalid_properties.push('invalid value for "currency", currency cannot be nil.')
      end

      if @amount.nil?
        invalid_properties.push('invalid value for "amount", amount cannot be nil.')
      end

      if @reason_code.nil?
        invalid_properties.push('invalid value for "reason_code", reason_code cannot be nil.')
      end

      if @type.nil?
        invalid_properties.push('invalid value for "type", type cannot be nil.')
      end

      if @status.nil?
        invalid_properties.push('invalid value for "status", status cannot be nil.')
      end

      if @posted_time.nil?
        invalid_properties.push('invalid value for "posted_time", posted_time cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @transaction_id.nil?
      return false if @currency.nil?
      return false if @amount.nil?
      return false if @reason_code.nil?
      reason_code_validator = EnumAttributeValidator.new('Object', ['1000', '10.1', '10.2', '10.3', '10.4', '10.5', '11.1', '11.2', '11.3', '12', '12.1', '12.2', '12.3', '12.4', '12.5', '12.6', '12.7', '13.1', '13.2', '13.3', '13.4', '13.5', '13.6', '13.7', '13.8', '13.9', '2', '30', '31', '35', '37', '40', '41', '42', '46', '47', '49', '50', '53', '54', '55', '57', '59', '60', '62', '7', '70', '71', '72', '73', '74', '75', '76', '77', '79', '8', '80', '81', '82', '83', '85', '86', '93', '00', '63', 'A01', 'A02', 'A08', 'F10', 'F14', 'F22', 'F24', 'F29', 'C02', 'C04', 'C05', 'C08', 'C14', 'C18', 'C28', 'C31', 'C32', 'M10', 'M49', 'P01', 'P03', 'P04', 'P05', 'P07', 'P08', 'P22', 'P23', 'R03', 'R13', 'M01', 'FR1', 'FR4', 'FR6', 'AL', 'AP', 'AW', 'CA', 'CD', 'CR', 'DA', 'DP', 'DP1', 'EX', 'IC', 'IN', 'IS', 'LP', 'N', 'NA', 'NC', 'P', 'RG', 'RM', 'RN1', 'RN2', 'SV', 'TF', 'TNM', 'UA01', 'UA02', 'UA32', 'UA99', 'UA03', 'UA10', 'UA11', 'UA12', 'UA18', 'UA20', 'UA21', 'UA22', 'UA23', 'UA28', 'UA30', 'UA31', 'UA38', 'duplicate', 'fraudulent', 'subscription_canceled', 'product_unacceptable', 'product_not_received', 'unrecognized', 'credit_not_processed', 'customer_initiated', 'incorrect_account_details', 'insufficient_funds', 'bank_cannot_process', 'debit_not_authorized', 'general', 'pre-chargeback-alert', '0', '1', '2', '3', '4', '5', '6', '7', '9', '51', 'A', 'B'])
      return false unless reason_code_validator.valid?(@reason_code)
      category_validator = EnumAttributeValidator.new('Object', ['fraud', 'unrecognized', 'product-not-received', 'product-unacceptable', 'product-not-refunded', 'duplicate', 'subscription-canceled', 'uncategorized'])
      return false unless category_validator.valid?(@category)
      return false if @type.nil?
      type_validator = EnumAttributeValidator.new('Object', ['information-request', 'first-chargeback', 'second-chargeback', 'arbitration', 'fraud', 'ethoca-alert', 'verifi-alert'])
      return false unless type_validator.valid?(@type)
      return false if @status.nil?
      status_validator = EnumAttributeValidator.new('Object', ['response-needed', 'under-review', 'forfeited', 'won', 'lost', 'unknown'])
      return false unless status_validator.valid?(@status)
      return false if @posted_time.nil?
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] reason_code Object to be assigned
    def reason_code=(reason_code)
      validator = EnumAttributeValidator.new('Object', ['1000', '10.1', '10.2', '10.3', '10.4', '10.5', '11.1', '11.2', '11.3', '12', '12.1', '12.2', '12.3', '12.4', '12.5', '12.6', '12.7', '13.1', '13.2', '13.3', '13.4', '13.5', '13.6', '13.7', '13.8', '13.9', '2', '30', '31', '35', '37', '40', '41', '42', '46', '47', '49', '50', '53', '54', '55', '57', '59', '60', '62', '7', '70', '71', '72', '73', '74', '75', '76', '77', '79', '8', '80', '81', '82', '83', '85', '86', '93', '00', '63', 'A01', 'A02', 'A08', 'F10', 'F14', 'F22', 'F24', 'F29', 'C02', 'C04', 'C05', 'C08', 'C14', 'C18', 'C28', 'C31', 'C32', 'M10', 'M49', 'P01', 'P03', 'P04', 'P05', 'P07', 'P08', 'P22', 'P23', 'R03', 'R13', 'M01', 'FR1', 'FR4', 'FR6', 'AL', 'AP', 'AW', 'CA', 'CD', 'CR', 'DA', 'DP', 'DP1', 'EX', 'IC', 'IN', 'IS', 'LP', 'N', 'NA', 'NC', 'P', 'RG', 'RM', 'RN1', 'RN2', 'SV', 'TF', 'TNM', 'UA01', 'UA02', 'UA32', 'UA99', 'UA03', 'UA10', 'UA11', 'UA12', 'UA18', 'UA20', 'UA21', 'UA22', 'UA23', 'UA28', 'UA30', 'UA31', 'UA38', 'duplicate', 'fraudulent', 'subscription_canceled', 'product_unacceptable', 'product_not_received', 'unrecognized', 'credit_not_processed', 'customer_initiated', 'incorrect_account_details', 'insufficient_funds', 'bank_cannot_process', 'debit_not_authorized', 'general', 'pre-chargeback-alert', '0', '1', '2', '3', '4', '5', '6', '7', '9', '51', 'A', 'B'])
      unless validator.valid?(reason_code)
        fail ArgumentError, "invalid value for \"reason_code\", must be one of #{validator.allowable_values}."
      end
      @reason_code = reason_code
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] category Object to be assigned
    def category=(category)
      validator = EnumAttributeValidator.new('Object', ['fraud', 'unrecognized', 'product-not-received', 'product-unacceptable', 'product-not-refunded', 'duplicate', 'subscription-canceled', 'uncategorized'])
      unless validator.valid?(category)
        fail ArgumentError, "invalid value for \"category\", must be one of #{validator.allowable_values}."
      end
      @category = category
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      validator = EnumAttributeValidator.new('Object', ['information-request', 'first-chargeback', 'second-chargeback', 'arbitration', 'fraud', 'ethoca-alert', 'verifi-alert'])
      unless validator.valid?(type)
        fail ArgumentError, "invalid value for \"type\", must be one of #{validator.allowable_values}."
      end
      @type = type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      validator = EnumAttributeValidator.new('Object', ['response-needed', 'under-review', 'forfeited', 'won', 'lost', 'unknown'])
      unless validator.valid?(status)
        fail ArgumentError, "invalid value for \"status\", must be one of #{validator.allowable_values}."
      end
      @status = status
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          customer_id == o.customer_id &&
          transaction_id == o.transaction_id &&
          currency == o.currency &&
          amount == o.amount &&
          acquirer_reference_number == o.acquirer_reference_number &&
          case_id == o.case_id &&
          reason_code == o.reason_code &&
          category == o.category &&
          type == o.type &&
          status == o.status &&
          posted_time == o.posted_time &&
          deadline_time == o.deadline_time &&
          raw_response == o.raw_response &&
          resolved_time == o.resolved_time &&
          created_time == o.created_time &&
          updated_time == o.updated_time &&
          _links == o._links &&
          _embedded == o._embedded
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, customer_id, transaction_id, currency, amount, acquirer_reference_number, case_id, reason_code, category, type, status, posted_time, deadline_time, raw_response, resolved_time, created_time, updated_time, _links, _embedded].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        elsif attributes[self.class.attribute_map[key]].nil? && self.class.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        RebillySdk.const_get(type).build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end  end
end
