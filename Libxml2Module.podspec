Pod::Spec.new do |s|
    s.name         = 'Libxml2Module'
    s.version      = '0.0.5'
    s.summary      = 'libxml wrapper to use it in Objective-C modules and in Swift'
    s.homepage     = 'https://github.com/pilot34/Libxml2Module'
    s.license      = 'MIT'
    s.author       = { "gtarasov" => "gleb34@gmail.com" }
    s.source       = { git: 'git@github.com:Agisight/Libxml2Module.git' }
    s.platform     = :ios, '11.0'

    s.libraries = 'xml2'
    s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(PODS_ROOT)/Libxml2Module/headers' }
    s.pod_target_xcconfig = { 'HEADER_SEARCH_PATHS' => '$(PODS_ROOT)/Libxml2Module/headers' }

    s.module_map = 'Libxml2.modulemap'
    s.module_name = 'Libxml2'

    s.source_files = 'dummy-source.m', 'Spec_Test.m', 'headers/*.h', 'xmlversion-device.h'
    s.public_header_files = 'headers/*.h', 'xmlversion-device.h'
    s.exclude_files = 'headers/xmlversion-device.h'

    s.prepare_command = <<-CMD
        ruby module_parser.rb > Libxml2.modulemap
    CMD
end
