#!/usr/bin/env ruby
# Encoding: utf-8
#
# Copyright:: Copyright 2011, Google Inc. All Rights Reserved.
#
# License:: Licensed under the Apache License, Version 2.0 (the "License");
#           you may not use this file except in compliance with the License.
#           You may obtain a copy of the License at
#
#           http://www.apache.org/licenses/LICENSE-2.0
#
#           Unless required by applicable law or agreed to in writing, software
#           distributed under the License is distributed on an "AS IS" BASIS,
#           WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
#           implied.
#           See the License for the specific language governing permissions and
#           limitations under the License.
#
# This example runs a report equal to the "Whole network report" on the DFP
# website. To download the report see download_report.rb.

require 'dfp_api'

API_VERSION = :v201502
MAX_RETRIES = 10
RETRY_INTERVAL = 30

def run_inventory_report()
  # Get DfpApi instance and load configuration from ~/dfp_api.yml.
  dfp = DfpApi::Api.new

  # To enable logging of SOAP requests, set the log_level value to 'DEBUG' in
  # the configuration file or provide your own logger:
  # dfp.logger = Logger.new('dfp_xml.log')

  # Get the ReportService and NetworkService.
  report_service = dfp.service(:ReportService, API_VERSION)
  network_service = dfp.service(:NetworkService, API_VERSION)

  # Get the root ad unit ID to filter on.
  root_ad_unit_id =
      network_service.get_current_network()[:effective_root_ad_unit_id]

  # Create statement to filter on a parent ad unit with the root ad unit ID
  # to include all ad units in the network.
  statement = {
     :query => 'WHERE PARENT_AD_UNIT_ID = :parent_ad_unit_id',
     :values => [
         {:key => 'parent_ad_unit_id',
          :value => {:value => root_ad_unit_id, :xsi_type => 'NumberValue'}}
     ]
  }

  # Create report query.
  report_query = {
    :date_range_type => 'LAST_WEEK',
    :dimensions => ['DATE', 'AD_UNIT_NAME'],
    :ad_unit_view => 'HIERARCHICAL',
    :columns => [
        'AD_SERVER_IMPRESSIONS',
        'AD_SERVER_CLICKS',
        'DYNAMIC_ALLOCATION_INVENTORY_LEVEL_IMPRESSIONS',
        'DYNAMIC_ALLOCATION_INVENTORY_LEVEL_CLICKS',
        'TOTAL_INVENTORY_LEVEL_IMPRESSIONS',
        'TOTAL_INVENTORY_LEVEL_CPM_AND_CPC_REVENUE'
    ],
    :statement => statement
  }

  # Create report job.
  report_job = {:report_query => report_query}

  # Run report job.
  report_job = report_service.run_report_job(report_job);

  MAX_RETRIES.times do |retry_count|
    # Get the report job status.
    report_job = report_service.get_report_job(report_job[:id])

    break unless report_job[:report_job_status] == 'IN_PROGRESS'
    puts "Report with ID: %d is still running." % report_job[:id]
    sleep(RETRY_INTERVAL)
  end

  puts "Report job with ID: %d finished with status %s." %
      [report_job[:id], report_job[:report_job_status]]
end

if __FILE__ == $0
  begin
    run_inventory_report()

  # HTTP errors.
  rescue AdsCommon::Errors::HttpError => e
    puts "HTTP Error: %s" % e

  # API errors.
  rescue DfpApi::Errors::ApiException => e
    puts "Message: %s" % e.message
    puts 'Errors:'
    e.errors.each_with_index do |error, index|
      puts "\tError [%d]:" % (index + 1)
      error.each do |field, value|
        puts "\t\t%s: %s" % [field, value]
      end
    end
  end
end
