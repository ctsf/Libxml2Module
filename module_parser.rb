simulator_path = "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/usr/include/libxml2/libxml"
device_path = "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/include/libxml2/libxml"
local_folder = "headers"
simulator_suffix = "simulator"
device_suffix = "device"

def process_contents(contents, suffix)
    contents = contents.gsub(/\#include <libxml\/(.*?)\.h>/, "#import \"\\1-#{suffix}.h\"")
    contents = contents.gsub(/\#include <(.*?)\.h>/, '@import Darwin.C.\1;')

    return contents
end

def process_folder(headers_folder, local_folder, suffix)
    imports = ""
    
    Dir.foreach(headers_folder) do |fname|
        if fname == "." or fname == ".." then next end

        if fname == "DOCBparser.h" then next end #deprecated file
        if fname == "module.modulemap" then next end #not a header
        if fname == "xmlversion-device.h" then next end #not a header
        
        local = fname.sub(/\.h/, "-#{suffix}.h")
        imports += "    header \"#{local}\"\n"

        contents = File.read(File.join(headers_folder, fname))
        contents = process_contents(contents, suffix)

        writer = File.open(File.join(local_folder, local), "w")
        writer.write(contents)
    end

    return imports
end

Dir.mkdir(local_folder) unless File.exists?(local_folder)

puts "framework module Libxml2 {"
puts
puts process_folder(device_path, local_folder, device_suffix)
puts
puts "    export *"
puts "}"
puts
