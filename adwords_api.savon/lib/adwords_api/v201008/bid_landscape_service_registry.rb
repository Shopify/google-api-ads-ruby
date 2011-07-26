#!/usr/bin/ruby
# This is auto-generated code, changes will be overwritten.
# Copyright:: Copyright 2011, Google Inc. All Rights Reserved.
# License:: Licensed under the Apache License,Version 2.0 (the "License").
#
# Code generated by AdsCommon library 0.5.0 on 2011-07-19 18:48:56.

module AdwordsApi; module V201008; module BidLandscapeService
  class BidLandscapeServiceRegistry
    BIDLANDSCAPESERVICE_METHODS = {:get_bid_landscape=>{:input=>[{:type=>"BidLandscapeSelector", :max_occurs=>1, :name=>:selector, :min_occurs=>0}], :output=>{:fields=>[{:type=>"BidLandscape", :max_occurs=>:unbounded, :name=>:rval, :min_occurs=>0}], :name=>"get_bid_landscape_response"}}}
    BIDLANDSCAPESERVICE_TYPES = {:BidLandscapeSelector=>{:fields=>[{:type=>"BidLandscapeIdFilter", :max_occurs=>:unbounded, :name=>:id_filters, :min_occurs=>0}, {:type=>"string", :max_occurs=>1, :name=>:bid_landscape_selector_type, :min_occurs=>0}], :abstract=>true}, :Money=>{:fields=>[{:type=>"long", :max_occurs=>1, :name=>:micro_amount, :min_occurs=>0}], :base=>"ComparableValue"}, :EntityNotFound=>{:fields=>[{:type=>"EntityNotFound.Reason", :max_occurs=>1, :name=>:reason, :min_occurs=>0}], :base=>"ApiError"}, :NumberValue=>{:fields=>[], :abstract=>true, :base=>"ComparableValue"}, :OperationAccessDenied=>{:fields=>[{:type=>"OperationAccessDenied.Reason", :max_occurs=>1, :name=>:reason, :min_occurs=>0}], :base=>"ApiError"}, :SoapHeader=>{:fields=>[{:type=>"string", :max_occurs=>1, :name=>:auth_token, :min_occurs=>0}, {:type=>"string", :max_occurs=>1, :name=>:client_customer_id, :min_occurs=>0}, {:type=>"string", :max_occurs=>1, :name=>:client_email, :min_occurs=>0}, {:type=>"string", :max_occurs=>1, :name=>:developer_token, :min_occurs=>0}, {:type=>"string", :max_occurs=>1, :name=>:user_agent, :min_occurs=>0}, {:type=>"boolean", :max_occurs=>1, :name=>:validate_only, :min_occurs=>0}, {:type=>"boolean", :max_occurs=>1, :name=>:partial_failure, :min_occurs=>0}]}, :CriterionBidLandscape=>{:fields=>[{:type=>"long", :max_occurs=>1, :name=>:criterion_id, :min_occurs=>0}], :base=>"BidLandscape"}, :AdGroupBidLandscapeSelector=>{:fields=>[], :base=>"BidLandscapeSelector"}, :"BidLandscape.LandscapePoint"=>{:fields=>[{:type=>"Money", :max_occurs=>1, :name=>:bid, :min_occurs=>0}, {:type=>"long", :max_occurs=>1, :name=>:clicks, :min_occurs=>0}, {:type=>"Money", :max_occurs=>1, :name=>:cost, :min_occurs=>0}, {:type=>"Money", :max_occurs=>1, :name=>:marginal_cpc, :min_occurs=>0}, {:type=>"long", :max_occurs=>1, :name=>:impressions, :min_occurs=>0}]}, :SoapResponseHeader=>{:fields=>[{:type=>"string", :max_occurs=>1, :name=>:request_id, :min_occurs=>0}, {:type=>"long", :max_occurs=>1, :name=>:operations, :min_occurs=>0}, {:type=>"long", :max_occurs=>1, :name=>:response_time, :min_occurs=>0}, {:type=>"long", :max_occurs=>1, :name=>:units, :min_occurs=>0}]}, :LongValue=>{:fields=>[{:type=>"long", :max_occurs=>1, :name=>:number, :min_occurs=>0}], :base=>"NumberValue"}, :BidLandscapeIdFilter=>{:fields=>[{:type=>"long", :max_occurs=>1, :name=>:campaign_id, :min_occurs=>0}, {:type=>"long", :max_occurs=>1, :name=>:ad_group_id, :min_occurs=>0}, {:type=>"long", :max_occurs=>1, :name=>:criterion_id, :min_occurs=>0}]}, :AdGroupBidLandscape=>{:fields=>[{:type=>"AdGroupBidLandscape.Type", :max_occurs=>1, :name=>:type, :min_occurs=>0}, {:type=>"boolean", :max_occurs=>1, :name=>:landscape_current, :min_occurs=>0}], :base=>"BidLandscape"}, :ComparableValue=>{:fields=>[{:type=>"string", :max_occurs=>1, :name=>:comparable_value_type, :min_occurs=>0}], :abstract=>true}, :CriterionBidLandscapeSelector=>{:fields=>[], :base=>"BidLandscapeSelector"}, :BidLandscape=>{:fields=>[{:type=>"long", :max_occurs=>1, :name=>:campaign_id, :min_occurs=>0}, {:type=>"long", :max_occurs=>1, :name=>:ad_group_id, :min_occurs=>0}, {:type=>"string", :max_occurs=>1, :name=>:start_date, :min_occurs=>0}, {:type=>"string", :max_occurs=>1, :name=>:end_date, :min_occurs=>0}, {:type=>"BidLandscape.LandscapePoint", :max_occurs=>:unbounded, :name=>:landscape_points, :min_occurs=>0}, {:type=>"string", :max_occurs=>1, :name=>:bid_landscape_type, :min_occurs=>0}], :abstract=>true}, :DoubleValue=>{:fields=>[{:type=>"double", :max_occurs=>1, :name=>:number, :min_occurs=>0}], :base=>"NumberValue"}}
    BIDLANDSCAPESERVICE_NAMESPACES = []

    def self.get_method_signature(method_name)
      return BIDLANDSCAPESERVICE_METHODS[method_name.to_sym]
    end

    def self.get_type_signature(type_name)
      return BIDLANDSCAPESERVICE_TYPES[type_name.to_sym]
    end

    def self.get_namespace(index)
      return BIDLANDSCAPESERVICE_NAMESPACES[index]
    end
  end

  # Base class for exceptions.
  class ApplicationException < AdwordsApi::Errors::ApiException
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