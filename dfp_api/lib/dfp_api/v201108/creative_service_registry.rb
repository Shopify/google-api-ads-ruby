#!/usr/bin/ruby
# This is auto-generated code, changes will be overwritten.
# Copyright:: Copyright 2011, Google Inc. All Rights Reserved.
# License:: Licensed under the Apache License,Version 2.0 (the "License").
#
# Code generated by AdsCommon library 0.6.0 on 2011-12-02 16:51:49.

require 'dfp_api/errors'

module DfpApi; module V201108; module CreativeService
  class CreativeServiceRegistry
    CREATIVESERVICE_METHODS = {:create_creative=>{:input=>[{:name=>:creative, :type=>"Creative", :min_occurs=>0, :max_occurs=>1}], :output=>{:name=>"create_creative_response", :fields=>[{:name=>:rval, :type=>"Creative", :min_occurs=>0, :max_occurs=>1}]}}, :create_creatives=>{:input=>[{:name=>:creatives, :type=>"Creative", :min_occurs=>0, :max_occurs=>:unbounded}], :output=>{:name=>"create_creatives_response", :fields=>[{:name=>:rval, :type=>"Creative", :min_occurs=>0, :max_occurs=>:unbounded}]}}, :get_creative=>{:input=>[{:name=>:creative_id, :type=>"long", :min_occurs=>0, :max_occurs=>1}], :output=>{:name=>"get_creative_response", :fields=>[{:name=>:rval, :type=>"Creative", :min_occurs=>0, :max_occurs=>1}]}}, :get_creatives_by_statement=>{:input=>[{:name=>:filter_statement, :type=>"Statement", :min_occurs=>0, :max_occurs=>1}], :output=>{:name=>"get_creatives_by_statement_response", :fields=>[{:name=>:rval, :type=>"CreativePage", :min_occurs=>0, :max_occurs=>1}]}}, :update_creative=>{:input=>[{:name=>:creative, :type=>"Creative", :min_occurs=>0, :max_occurs=>1}], :output=>{:name=>"update_creative_response", :fields=>[{:name=>:rval, :type=>"Creative", :min_occurs=>0, :max_occurs=>1}]}}, :update_creatives=>{:input=>[{:name=>:creatives, :type=>"Creative", :min_occurs=>0, :max_occurs=>:unbounded}], :output=>{:name=>"update_creatives_response", :fields=>[{:name=>:rval, :type=>"Creative", :min_occurs=>0, :max_occurs=>:unbounded}]}}}
    CREATIVESERVICE_TYPES = {:AppliedLabel=>{:fields=>[{:name=>:label_id, :type=>"long", :min_occurs=>0, :max_occurs=>1}, {:name=>:is_negated, :type=>"boolean", :min_occurs=>0, :max_occurs=>1}]}, :Authentication=>{:fields=>[{:name=>:authentication_type, :type=>"string", :min_occurs=>0, :max_occurs=>1}], :abstract=>true}, :BaseFlashCreative=>{:fields=>[{:name=>:flash_name, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:flash_byte_array, :type=>"base64Binary", :min_occurs=>0, :max_occurs=>1}, {:name=>:fallback_image_name, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:fallback_image_byte_array, :type=>"base64Binary", :min_occurs=>0, :max_occurs=>1}, {:name=>:override_size, :type=>"boolean", :min_occurs=>0, :max_occurs=>1}, {:name=>:click_tag_required, :type=>"boolean", :min_occurs=>0, :max_occurs=>1}, {:name=>:fallback_preview_url, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:flash_asset_size, :type=>"Size", :min_occurs=>0, :max_occurs=>1}, {:name=>:fallback_asset_size, :type=>"Size", :min_occurs=>0, :max_occurs=>1}], :abstract=>true, :base=>"HasDestinationUrlCreative"}, :BaseFlashRedirectCreative=>{:fields=>[{:name=>:flash_url, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:fallback_url, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:fallback_preview_url, :type=>"string", :min_occurs=>0, :max_occurs=>1}], :abstract=>true, :base=>"HasDestinationUrlCreative"}, :BaseImageCreative=>{:fields=>[{:name=>:image_name, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:image_byte_array, :type=>"base64Binary", :min_occurs=>0, :max_occurs=>1}, {:name=>:override_size, :type=>"boolean", :min_occurs=>0, :max_occurs=>1}, {:name=>:asset_size, :type=>"Size", :min_occurs=>0, :max_occurs=>1}, {:name=>:image_url, :type=>"string", :min_occurs=>0, :max_occurs=>1}], :abstract=>true, :base=>"HasDestinationUrlCreative"}, :BaseImageRedirectCreative=>{:fields=>[{:name=>:image_url, :type=>"string", :min_occurs=>0, :max_occurs=>1}], :abstract=>true, :base=>"HasDestinationUrlCreative"}, :BooleanValue=>{:fields=>[{:name=>:value, :type=>"boolean", :min_occurs=>0, :max_occurs=>1}], :base=>"Value"}, :ClickTrackingCreative=>{:fields=>[{:name=>:click_tracking_url, :type=>"string", :min_occurs=>0, :max_occurs=>1}], :base=>"Creative"}, :ClientLogin=>{:fields=>[{:name=>:token, :type=>"string", :min_occurs=>0, :max_occurs=>1}], :base=>"Authentication"}, :CustomCreativeAsset=>{:fields=>[{:name=>:macro_name, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:asset_id, :type=>"long", :min_occurs=>0, :max_occurs=>1}, {:name=>:file_name, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:file_size, :type=>"long", :min_occurs=>0, :max_occurs=>1}]}, :Creative=>{:fields=>[{:name=>:advertiser_id, :type=>"long", :min_occurs=>0, :max_occurs=>1}, {:name=>:id, :type=>"long", :min_occurs=>0, :max_occurs=>1}, {:name=>:name, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:size, :type=>"Size", :min_occurs=>0, :max_occurs=>1}, {:name=>:preview_url, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:applied_labels, :type=>"AppliedLabel", :min_occurs=>0, :max_occurs=>:unbounded}, {:name=>:creative_type, :type=>"string", :min_occurs=>0, :max_occurs=>1}], :abstract=>true}, :CreativePage=>{:fields=>[{:name=>:total_result_set_size, :type=>"int", :min_occurs=>0, :max_occurs=>1}, {:name=>:start_index, :type=>"int", :min_occurs=>0, :max_occurs=>1}, {:name=>:results, :type=>"Creative", :min_occurs=>0, :max_occurs=>:unbounded}]}, :CreativePlaceholder=>{:fields=>[{:name=>:size, :type=>"Size", :min_occurs=>0, :max_occurs=>1}, {:name=>:companions, :type=>"CreativePlaceholder", :min_occurs=>0, :max_occurs=>:unbounded}, {:name=>:id, :type=>"long", :min_occurs=>0, :max_occurs=>1}]}, :CustomCreative=>{:fields=>[{:name=>:html_snippet, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:custom_creative_assets, :type=>"CustomCreativeAsset", :min_occurs=>0, :max_occurs=>:unbounded}, {:name=>:is_interstitial, :type=>"boolean", :min_occurs=>0, :max_occurs=>1}], :base=>"HasDestinationUrlCreative"}, :FlashCreative=>{:fields=>[], :base=>"BaseFlashCreative"}, :FlashRedirectCreative=>{:fields=>[], :base=>"BaseFlashRedirectCreative"}, :HasDestinationUrlCreative=>{:fields=>[{:name=>:destination_url, :type=>"string", :min_occurs=>0, :max_occurs=>1}], :abstract=>true, :base=>"Creative"}, :ImageCreative=>{:fields=>[], :base=>"BaseImageCreative"}, :ImageRedirectCreative=>{:fields=>[], :base=>"BaseImageRedirectCreative"}, :InternalRedirectCreative=>{:fields=>[{:name=>:internal_redirect_url, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:override_size, :type=>"boolean", :min_occurs=>0, :max_occurs=>1}, {:name=>:is_interstitial, :type=>"boolean", :min_occurs=>0, :max_occurs=>1}], :base=>"Creative"}, :NumberValue=>{:fields=>[{:name=>:value, :type=>"string", :min_occurs=>0, :max_occurs=>1}], :base=>"Value"}, :OAuth=>{:fields=>[{:name=>:parameters, :type=>"string", :min_occurs=>0, :max_occurs=>1}], :base=>"Authentication"}, :Size=>{:fields=>[{:name=>:width, :type=>"int", :min_occurs=>0, :max_occurs=>1}, {:name=>:height, :type=>"int", :min_occurs=>0, :max_occurs=>1}, {:name=>:is_aspect_ratio, :type=>"boolean", :min_occurs=>0, :max_occurs=>1}]}, :SoapRequestHeader=>{:fields=>[{:name=>:network_code, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:application_name, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:authentication, :type=>"Authentication", :min_occurs=>0, :max_occurs=>1}]}, :SoapResponseHeader=>{:fields=>[{:name=>:request_id, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:response_time, :type=>"long", :min_occurs=>0, :max_occurs=>1}]}, :Statement=>{:fields=>[{:name=>:query, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:values, :type=>"String_ValueMapEntry", :min_occurs=>0, :max_occurs=>:unbounded}]}, :String_ValueMapEntry=>{:fields=>[{:name=>:key, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:value, :type=>"Value", :min_occurs=>0, :max_occurs=>1}]}, :TextValue=>{:fields=>[{:name=>:value, :type=>"string", :min_occurs=>0, :max_occurs=>1}], :base=>"Value"}, :ThirdPartyCreative=>{:fields=>[{:name=>:snippet, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:expanded_snippet, :type=>"string", :min_occurs=>0, :max_occurs=>1}], :base=>"Creative"}, :Value=>{:fields=>[{:name=>:value_type, :type=>"string", :min_occurs=>0, :max_occurs=>1}], :abstract=>true}}
    CREATIVESERVICE_NAMESPACES = []

    def self.get_method_signature(method_name)
      return CREATIVESERVICE_METHODS[method_name.to_sym]
    end

    def self.get_type_signature(type_name)
      return CREATIVESERVICE_TYPES[type_name.to_sym]
    end

    def self.get_namespace(index)
      return CREATIVESERVICE_NAMESPACES[index]
    end
  end

  # Base class for exceptions.
  class ApplicationException < DfpApi::Errors::ApiException
    attr_reader :message  # string
    attr_reader :application_exception_type  # string
  end

  # Exception class for holding a list of service errors.
  class ApiException < ApplicationException
    attr_reader :errors  # ApiError
    def initialize(exception_fault)
      @array_fields ||= []
      @array_fields << 'errors'
      super(exception_fault)
    end
  end
end; end; end
