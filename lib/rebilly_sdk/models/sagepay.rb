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
  # Sagepay Gateway config.
  class Sagepay
    # The gateway identifier string.
    attr_accessor :id

    attr_accessor :gateway_name

    attr_accessor :acquirer_name

    attr_accessor :method

    # Accepted currencies (array of the currency three letter codes).
    attr_accessor :accepted_currencies

    # Accepted payment card brands.
    attr_accessor :payment_card_schemes

    # The gateway account's status.
    attr_accessor :status

    # The gateway account's merchant category code.
    attr_accessor :merchant_category_code

    # Dynamic currency conversion markup in basis points.
    attr_accessor :dcc_markup

    # Force dynamic currency conversion to the specified currency on each sale. Leave it empty to disable force DCC. 
    attr_accessor :dcc_force_currency

    # The gateway account's descriptor.
    attr_accessor :descriptor

    # The gateway account's city field (also known as line 2 descriptor).
    attr_accessor :city_field

    # Excluded Dynamic Currency Conversion Quote Currencies.
    attr_accessor :excluded_dcc_quote_currencies

    # Monthly Limit.
    attr_accessor :monthly_limit

    # The time window (in seconds) allotted for approving an offsite transaction before it is automatically `abandoned`.
    attr_accessor :approval_window_ttl

    # If a transaction is not reconciled within the `reconciliationWindowTtl` time, then the transaction is marked as `abandoned`.
    attr_accessor :reconciliation_window_enabled

    # The time window (in seconds) allotted for a reconciliation to occur. If it is not reconciled in that time, then the transaction is marked as `abandoned`.
    attr_accessor :reconciliation_window_ttl

    # True, if Gateway Account allows 3DSecure.
    attr_accessor :three_d_secure

    # True, if Gateway Account allows dynamic descriptor.
    attr_accessor :dynamic_descriptor

    attr_accessor :digital_wallets

    # True if gateway is currently in downtime period.
    attr_accessor :is_down

    # The additional filters are used to determine whether the gateway account can be selected for the transaction to be processed. For example, the filter may put a maximum amount value. If the transaction is above that amount, this gateway account wouldn't be used. This follows our standard filter format. 
    attr_accessor :additional_filters

    # Gateway Account request timeout in seconds.
    attr_accessor :timeout

    # Gateway Account token.
    attr_accessor :token

    # Customer's payment instrument will \"stick\" to the gateway account for future transactions when enabled.
    attr_accessor :sticky

    # Creates zero, one, or more child transactions such as `authorize` and `void`. The transactions are linked to the `setup` transaction by the `parentTransactionId` relationship. 
    attr_accessor :setup_instruction

    # Gateway Account created time.
    attr_accessor :created_time

    # Gateway Account updated time.
    attr_accessor :updated_time

    # Organization ID.
    attr_accessor :organization_id

    # The links related to resource.
    attr_accessor :_links

    attr_accessor :credentials

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
        :'gateway_name' => :'gatewayName',
        :'acquirer_name' => :'acquirerName',
        :'method' => :'method',
        :'accepted_currencies' => :'acceptedCurrencies',
        :'payment_card_schemes' => :'paymentCardSchemes',
        :'status' => :'status',
        :'merchant_category_code' => :'merchantCategoryCode',
        :'dcc_markup' => :'dccMarkup',
        :'dcc_force_currency' => :'dccForceCurrency',
        :'descriptor' => :'descriptor',
        :'city_field' => :'cityField',
        :'excluded_dcc_quote_currencies' => :'excludedDccQuoteCurrencies',
        :'monthly_limit' => :'monthlyLimit',
        :'approval_window_ttl' => :'approvalWindowTtl',
        :'reconciliation_window_enabled' => :'reconciliationWindowEnabled',
        :'reconciliation_window_ttl' => :'reconciliationWindowTtl',
        :'three_d_secure' => :'threeDSecure',
        :'dynamic_descriptor' => :'dynamicDescriptor',
        :'digital_wallets' => :'digitalWallets',
        :'is_down' => :'isDown',
        :'additional_filters' => :'additionalFilters',
        :'timeout' => :'timeout',
        :'token' => :'token',
        :'sticky' => :'sticky',
        :'setup_instruction' => :'setupInstruction',
        :'created_time' => :'createdTime',
        :'updated_time' => :'updatedTime',
        :'organization_id' => :'organizationId',
        :'_links' => :'_links',
        :'credentials' => :'credentials'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'id' => :'',
        :'gateway_name' => :'',
        :'acquirer_name' => :'',
        :'method' => :'',
        :'accepted_currencies' => :'',
        :'payment_card_schemes' => :'',
        :'status' => :'',
        :'merchant_category_code' => :'',
        :'dcc_markup' => :'',
        :'dcc_force_currency' => :'',
        :'descriptor' => :'',
        :'city_field' => :'',
        :'excluded_dcc_quote_currencies' => :'',
        :'monthly_limit' => :'',
        :'approval_window_ttl' => :'',
        :'reconciliation_window_enabled' => :'',
        :'reconciliation_window_ttl' => :'',
        :'three_d_secure' => :'',
        :'dynamic_descriptor' => :'',
        :'digital_wallets' => :'',
        :'is_down' => :'',
        :'additional_filters' => :'',
        :'timeout' => :'',
        :'token' => :'',
        :'sticky' => :'',
        :'setup_instruction' => :'',
        :'created_time' => :'',
        :'updated_time' => :'',
        :'organization_id' => :'',
        :'_links' => :'',
        :'credentials' => :''
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'timeout',
      ])
    end
  
    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `RebillySdk::Sagepay` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `RebillySdk::Sagepay`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      # call parent's initialize
      super(attributes)

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'gateway_name')
        self.gateway_name = attributes[:'gateway_name']
      end

      if attributes.key?(:'acquirer_name')
        self.acquirer_name = attributes[:'acquirer_name']
      end

      if attributes.key?(:'method')
        self.method = attributes[:'method']
      end

      if attributes.key?(:'accepted_currencies')
        if (value = attributes[:'accepted_currencies']).is_a?(Array)
          self.accepted_currencies = value
        end
      end

      if attributes.key?(:'payment_card_schemes')
        if (value = attributes[:'payment_card_schemes']).is_a?(Array)
          self.payment_card_schemes = value
        end
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.key?(:'merchant_category_code')
        self.merchant_category_code = attributes[:'merchant_category_code']
      else
        self.merchant_category_code = '0000'
      end

      if attributes.key?(:'dcc_markup')
        self.dcc_markup = attributes[:'dcc_markup']
      end

      if attributes.key?(:'dcc_force_currency')
        self.dcc_force_currency = attributes[:'dcc_force_currency']
      end

      if attributes.key?(:'descriptor')
        self.descriptor = attributes[:'descriptor']
      end

      if attributes.key?(:'city_field')
        self.city_field = attributes[:'city_field']
      end

      if attributes.key?(:'excluded_dcc_quote_currencies')
        if (value = attributes[:'excluded_dcc_quote_currencies']).is_a?(Array)
          self.excluded_dcc_quote_currencies = value
        end
      end

      if attributes.key?(:'monthly_limit')
        self.monthly_limit = attributes[:'monthly_limit']
      end

      if attributes.key?(:'approval_window_ttl')
        self.approval_window_ttl = attributes[:'approval_window_ttl']
      else
        self.approval_window_ttl = 3600
      end

      if attributes.key?(:'reconciliation_window_enabled')
        self.reconciliation_window_enabled = attributes[:'reconciliation_window_enabled']
      else
        self.reconciliation_window_enabled = false
      end

      if attributes.key?(:'reconciliation_window_ttl')
        self.reconciliation_window_ttl = attributes[:'reconciliation_window_ttl']
      end

      if attributes.key?(:'three_d_secure')
        self.three_d_secure = attributes[:'three_d_secure']
      else
        self.three_d_secure = false
      end

      if attributes.key?(:'dynamic_descriptor')
        self.dynamic_descriptor = attributes[:'dynamic_descriptor']
      else
        self.dynamic_descriptor = false
      end

      if attributes.key?(:'digital_wallets')
        self.digital_wallets = attributes[:'digital_wallets']
      end

      if attributes.key?(:'is_down')
        self.is_down = attributes[:'is_down']
      end

      if attributes.key?(:'additional_filters')
        self.additional_filters = attributes[:'additional_filters']
      end

      if attributes.key?(:'timeout')
        self.timeout = attributes[:'timeout']
      end

      if attributes.key?(:'token')
        self.token = attributes[:'token']
      end

      if attributes.key?(:'sticky')
        self.sticky = attributes[:'sticky']
      else
        self.sticky = true
      end

      if attributes.key?(:'setup_instruction')
        self.setup_instruction = attributes[:'setup_instruction']
      else
        self.setup_instruction = 'do-nothing'
      end

      if attributes.key?(:'created_time')
        self.created_time = attributes[:'created_time']
      end

      if attributes.key?(:'updated_time')
        self.updated_time = attributes[:'updated_time']
      end

      if attributes.key?(:'organization_id')
        self.organization_id = attributes[:'organization_id']
      end

      if attributes.key?(:'_links')
        if (value = attributes[:'_links']).is_a?(Array)
          self._links = value
        end
      end

      if attributes.key?(:'credentials')
        self.credentials = attributes[:'credentials']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = super
      if @gateway_name.nil?
        invalid_properties.push('invalid value for "gateway_name", gateway_name cannot be nil.')
      end

      if @method.nil?
        invalid_properties.push('invalid value for "method", method cannot be nil.')
      end

      if @accepted_currencies.nil?
        invalid_properties.push('invalid value for "accepted_currencies", accepted_currencies cannot be nil.')
      end

      if @credentials.nil?
        invalid_properties.push('invalid value for "credentials", credentials cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @gateway_name.nil?
      return false if @method.nil?
      return false if @accepted_currencies.nil?
      status_validator = EnumAttributeValidator.new('', ['active', 'inactive', 'pending', 'closed'])
      return false unless status_validator.valid?(@status)
      setup_instruction_validator = EnumAttributeValidator.new('', ['authorize', 'authorize-and-void', 'sca', 'do-nothing'])
      return false unless setup_instruction_validator.valid?(@setup_instruction)
      return false if @credentials.nil?
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      validator = EnumAttributeValidator.new('', ['active', 'inactive', 'pending', 'closed'])
      unless validator.valid?(status)
        fail ArgumentError, "invalid value for \"status\", must be one of #{validator.allowable_values}."
      end
      @status = status
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] setup_instruction Object to be assigned
    def setup_instruction=(setup_instruction)
      validator = EnumAttributeValidator.new('', ['authorize', 'authorize-and-void', 'sca', 'do-nothing'])
      unless validator.valid?(setup_instruction)
        fail ArgumentError, "invalid value for \"setup_instruction\", must be one of #{validator.allowable_values}."
      end
      @setup_instruction = setup_instruction
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          gateway_name == o.gateway_name &&
          acquirer_name == o.acquirer_name &&
          method == o.method &&
          accepted_currencies == o.accepted_currencies &&
          payment_card_schemes == o.payment_card_schemes &&
          status == o.status &&
          merchant_category_code == o.merchant_category_code &&
          dcc_markup == o.dcc_markup &&
          dcc_force_currency == o.dcc_force_currency &&
          descriptor == o.descriptor &&
          city_field == o.city_field &&
          excluded_dcc_quote_currencies == o.excluded_dcc_quote_currencies &&
          monthly_limit == o.monthly_limit &&
          approval_window_ttl == o.approval_window_ttl &&
          reconciliation_window_enabled == o.reconciliation_window_enabled &&
          reconciliation_window_ttl == o.reconciliation_window_ttl &&
          three_d_secure == o.three_d_secure &&
          dynamic_descriptor == o.dynamic_descriptor &&
          digital_wallets == o.digital_wallets &&
          is_down == o.is_down &&
          additional_filters == o.additional_filters &&
          timeout == o.timeout &&
          token == o.token &&
          sticky == o.sticky &&
          setup_instruction == o.setup_instruction &&
          created_time == o.created_time &&
          updated_time == o.updated_time &&
          organization_id == o.organization_id &&
          _links == o._links &&
          credentials == o.credentials && super(o)
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, gateway_name, acquirer_name, method, accepted_currencies, payment_card_schemes, status, merchant_category_code, dcc_markup, dcc_force_currency, descriptor, city_field, excluded_dcc_quote_currencies, monthly_limit, approval_window_ttl, reconciliation_window_enabled, reconciliation_window_ttl, three_d_secure, dynamic_descriptor, digital_wallets, is_down, additional_filters, timeout, token, sticky, setup_instruction, created_time, updated_time, organization_id, _links, credentials].hash
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
      super(attributes)
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
      hash = super
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
