simulator_path = "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/usr/include/libxml2/libxml"
device_path = "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/include/libxml2/libxml"

local_simulator_path = "iphonesimulator"
local_device_path = "iphoneos"

def process_contents(contents)
    contents = contents.gsub(/\#include <libxml\/(.*?\.h)>/, '#import "\1"')
    contents = contents.gsub(/\#include <(.*?)\.h>/, '@import Darwin.C.\1;')

    return contents
end

def process_folder(headers_folder, local_folder)
    Dir.mkdir(local_folder) unless File.exists?(local_folder)
    
    Dir.foreach(headers_folder) do |fname|
        if fname == "." or fname == ".." then next end

        if fname == "DOCBparser.h" then next end #deprecated file
        
        local = File.join(local_folder, fname)
        puts "header \"#{local}\""

        contents = File.read(File.join(headers_folder, fname))
        contents = process_contents(contents)

        writer = File.open(local, "w")
        writer.write(contents)
    end

end

puts
puts
puts "-----------simulator----------------"
puts
process_folder(simulator_path, local_simulator_path)

puts
puts
puts "-----------device----------------"
puts
process_folder(device_path, local_device_path)