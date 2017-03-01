Pod::Spec.new do |s|
    s.name         = 'Libxml2Module'
    s.version      = '0.0.1'
    s.summary      = 'libxml wrapper to use it in Objective-C modules'
    s.homepage     = 'https://github.com/pilot34/Libxml2Module'
    s.license      = 'MIT'
    s.author       = { "gtarasov" => "gleb34@gmail.com" }
    s.source       = { git: 'https://github.com/pilot34/Libxml2Module.git', tag: "0.0.1" }
    s.platform     = :ios, '8.0'

    s.libraries = 'xml2'
    s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }
    s.module_map = 'Libxml2.modulemap'
    s.module_name = 'Libxml2'
    s.source_files = 'dummy-source.m'
end