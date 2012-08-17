# encoding: UTF-8

# Author::    Maurizio Casimirri (mailto:maurizio.cas@gmail.com)
# Copyright:: Copyright (c) 2012 Maurizio Casimirri
# 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

module ActionView
  module Helpers
    module FormOptionsHelper
      def country_select(object, method, priority_countries = nil, options = {}, html_options = {})
        InstanceTag.new(object, method, self, options.delete(:object)).to_country_select_tag(priority_countries, options, html_options)
      end
      def country_options_for_select(selected = nil, priority_countries = nil)
        country_options = ""

        if priority_countries
          country_options += options_for_select(priority_countries, selected)
          country_options += "<option value=\"\" disabled=\"disabled\">-------------</option>\n"
          selected=nil if priority_countries.include?(selected)
        end
        return country_options + options_for_select(COUNTRIES, selected)
      end

      COUNTRIES = [["Afghanistan", "AFG"], ["Aland Islands", "ALA"], ["Albania", "ALB"], ["Algeria", "DZA"], ["American Samoa", "ASM"], ["Andorra", "AND"], ["Angola", "AGO"], ["Anguilla", "AIA"], ["Antarctica", "ATA"], ["Antigua and Barbuda", "ATG"], ["Argentina", "ARG"], ["Armenia", "ARM"], ["Aruba", "ABW"], ["Australia", "AUS"], ["Austria", "AUT"], ["Azerbaijan", "AZE"], ["Bahamas", "BHS"], ["Bahrain", "BHR"], ["Bangladesh", "BGD"], ["Barbados", "BRB"], ["Belarus", "BLR"], ["Belgium", "BEL"], ["Belize", "BLZ"], ["Benin", "BEN"], ["Bermuda", "BMU"], ["Bhutan", "BTN"], ["Bolivia, Plurinational State of", "BOL"], ["Bonaire, Sint Eustatius and Saba", "BES"], ["Bosnia and Herzegovina", "BIH"], ["Botswana", "BWA"], ["Bouvet Island", "BVT"], ["Brazil", "BRA"], ["British Indian Ocean Territory", "IOT"], ["Brunei Darussalam", "BRN"], ["Bulgaria", "BGR"], ["Burkina Faso", "BFA"], ["Burundi", "BDI"], ["Cambodia", "KHM"], ["Cameroon", "CMR"], ["Canada", "CAN"], ["Cape Verde", "CPV"], ["Cayman Islands", "CYM"], ["Central African Republic", "CAF"], ["Chad", "TCD"], ["Chile", "CHL"], ["China", "CHN"], ["Christmas Island", "CXR"], ["Cocos (Keeling) Islands", "CCK"], ["Colombia", "COL"], ["Comoros", "COM"], ["Congo", "COG"], ["Congo, the Democratic Republic of the", "COD"], ["Cook Islands", "COK"], ["Costa Rica", "CRI"], ["Cote d'Ivoire", "CIV"], ["Croatia", "HRV"], ["Cuba", "CUB"], ["Curaçao", "CUW"], ["Cyprus", "CYP"], ["Czech Republic", "CZE"], ["Denmark", "DNK"], ["Djibouti", "DJI"], ["Dominica", "DMA"], ["Dominican Republic", "DOM"], ["Ecuador", "ECU"], ["Egypt", "EGY"], ["El Salvador", "SLV"], ["Equatorial Guinea", "GNQ"], ["Eritrea", "ERI"], ["Estonia", "EST"], ["Ethiopia", "ETH"], ["Falkland Islands (Malvinas)", "FLK"], ["Faroe Islands", "FRO"], ["Fiji", "FJI"], ["Finland", "FIN"], ["France", "FRA"], ["French Guiana", "GUF"], ["French Polynesia", "PYF"], ["French Southern Territories", "ATF"], ["Gabon", "GAB"], ["Gambia", "GMB"], ["Georgia", "GEO"], ["Germany", "DEU"], ["Ghana", "GHA"], ["Gibraltar", "GIB"], ["Greece", "GRC"], ["Greenland", "GRL"], ["Grenada", "GRD"], ["Guadeloupe", "GLP"], ["Guam", "GUM"], ["Guatemala", "GTM"], ["Guernsey", "GGY"], ["Guinea", "GIN"], ["Guinea-Bissau", "GNB"], ["Guyana", "GUY"], ["Haiti", "HTI"], ["Heard Island and McDonald Islands", "HMD"], ["Holy See (Vatican City State)", "VAT"], ["Honduras", "HND"], ["Hong Kong", "HKG"], ["Hungary", "HUN"], ["Iceland", "ISL"], ["India", "IND"], ["Indonesia", "IDN"], ["Iran, Islamic Republic of", "IRN"], ["Iraq", "IRQ"], ["Ireland", "IRL"], ["Isle of Man", "IMN"], ["Israel", "ISR"], ["Italy", "ITA"], ["Jamaica", "JAM"], ["Japan", "JPN"], ["Jersey", "JEY"], ["Jordan", "JOR"], ["Kazakhstan", "KAZ"], ["Kenya", "KEN"], ["Kiribati", "KIR"], ["Korea, Democratic People's Republic of", "PRK"], ["Korea, Republic of", "KOR"], ["Kuwait", "KWT"], ["Kyrgyzstan", "KGZ"], ["Lao People's Democratic Republic", "LAO"], ["Latvia", "LVA"], ["Lebanon", "LBN"], ["Lesotho", "LSO"], ["Liberia", "LBR"], ["Libya", "LBY"], ["Liechtenstein", "LIE"], ["Lithuania", "LTU"], ["Luxembourg", "LUX"], ["Macao", "MAC"], ["Macedonia, the former Yugoslav Republic of", "MKD"], ["Madagascar", "MDG"], ["Malawi", "MWI"], ["Malaysia", "MYS"], ["Maldives", "MDV"], ["Mali", "MLI"], ["Malta", "MLT"], ["Marshall Islands", "MHL"], ["Martinique", "MTQ"], ["Mauritania", "MRT"], ["Mauritius", "MUS"], ["Mayotte", "MYT"], ["Mexico", "MEX"], ["Micronesia, Federated States of", "FSM"], ["Moldova, Republic of", "MDA"], ["Monaco", "MCO"], ["Mongolia", "MNG"], ["Montenegro", "MNE"], ["Montserrat", "MSR"], ["Morocco", "MAR"], ["Mozambique", "MOZ"], ["Myanmar", "MMR"], ["Namibia", "NAM"], ["Nauru", "NRU"], ["Nepal", "NPL"], ["Netherlands", "NLD"], ["New Caledonia", "NCL"], ["New Zealand", "NZL"], ["Nicaragua", "NIC"], ["Niger", "NER"], ["Nigeria", "NGA"], ["Niue", "NIU"], ["Norfolk Island", "NFK"], ["Northern Mariana Islands", "MNP"], ["Norway", "NOR"], ["Oman", "OMN"], ["Pakistan", "PAK"], ["Palau", "PLW"], ["Palestinian Territory, Occupied", "PSE"], ["Panama", "PAN"], ["Papua New Guinea", "PNG"], ["Paraguay", "PRY"], ["Peru", "PER"], ["Philippines", "PHL"], ["Pitcairn", "PCN"], ["Poland", "POL"], ["Portugal", "PRT"], ["Puerto Rico", "PRI"], ["Qatar", "QAT"], ["Reunion", "REU"], ["Romania", "ROU"], ["Russian Federation", "RUS"], ["Rwanda", "RWA"], ["Saint Barthélemy", "BLM"], ["Saint Helena, Ascension and Tristan da Cunha", "SHN"], ["Saint Kitts and Nevis", "KNA"], ["Saint Lucia", "LCA"], ["Saint Martin (French part)", "MAF"], ["Saint Pierre and Miquelon", "SPM"], ["Saint Vincent and the Grenadines", "VCT"], ["Samoa", "WSM"], ["San Marino", "SMR"], ["Sao Tome and Principe", "STP"], ["Saudi Arabia", "SAU"], ["Senegal", "SEN"], ["Serbia", "SRB"], ["Seychelles", "SYC"], ["Sierra Leone", "SLE"], ["Singapore", "SGP"], ["Sint Maarten (Dutch part)", "SXM"], ["Slovakia", "SVK"], ["Slovenia", "SVN"], ["Solomon Islands", "SLB"], ["Somalia", "SOM"], ["South Africa", "ZAF"], ["South Georgia and the South Sandwich Islands", "SGS"], ["South Sudan", "SSD"], ["Spain", "ESP"], ["Sri Lanka", "LKA"], ["Sudan", "SDN"], ["Suriname", "SUR"], ["Svalbard and Jan Mayen", "SJM"], ["Swaziland", "SWZ"], ["Sweden", "SWE"], ["Switzerland", "CHE"], ["Syrian Arab Republic", "SYR"], ["Taiwan, Province of China", "TWN"], ["Tajikistan", "TJK"], ["Tanzania, United Republic of", "TZA"], ["Thailand", "THA"], ["Timor-Leste", "TLS"], ["Togo", "TGO"], ["Tokelau", "TKL"], ["Tonga", "TON"], ["Trinidad and Tobago", "TTO"], ["Tunisia", "TUN"], ["Turkey", "TUR"], ["Turkmenistan", "TKM"], ["Turks and Caicos Islands", "TCA"], ["Tuvalu", "TUV"], ["Uganda", "UGA"], ["Ukraine", "UKR"], ["United Arab Emirates", "ARE"], ["United Kingdom", "GBR"], ["United States", "USA"], ["United States Minor Outlying Islands", "UMI"], ["Uruguay", "URY"], ["Uzbekistan", "UZB"], ["Vanuatu", "VUT"], ["Venezuela, Bolivarian Republic of", "VEN"], ["Viet Nam", "VNM"], ["Virgin Islands, British", "VGB"], ["Virgin Islands, U.S.", "VIR"], ["Wallis and Futuna", "WLF"], ["Western Sahara", "ESH"], ["Yemen", "YEM"], ["Zambia", "ZMB"], ["Zimbabwe", "ZWE"]] unless const_defined?("COUNTRIES")
    end
    
    class InstanceTag
      def to_country_select_tag(priority_countries, options, html_options)
        html_options = html_options.stringify_keys
        add_default_name_and_id(html_options)
        value = value(object)
        content_tag("select",
          add_options(
            country_options_for_select(value, priority_countries),
            options, value
          ), html_options
        )
      end
    end
    
    class FormBuilder
      def country_select(method, priority_countries = nil, options = {}, html_options = {})
        @template.country_select(@object_name, method, priority_countries, options.merge(:object => @object), html_options)
      end
    end
  end
end