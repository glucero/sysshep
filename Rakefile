include Rake::DSL

require 'open-uri'
require_relative 'lib/sysshep/version'

desc 'build gem'
task(:gem) do
  puts 'Building SysShep Gem'
  FileUtils.mkdir_p 'build'
  system 'gem build sysshep.gemspec', out: '/dev/null'

  gem = "sysshep-#{SysShep::VERSION}.gem"
  FileUtils.mv gem, 'build'

  puts "Gem: ./build/#{gem}"
  puts "setup: gem install #{gem}"
  puts 'usage: sysshep --help'
end

desc 'build jar'
task(:jar) do
  FileUtils.mkdir_p 'build/jruby'
  Dir.chdir('build') do
    ver = '1.7.12'
    jar = "jruby-complete-#{ver}.jar"
    url = ['http://jruby.org.s3.amazonaws.com/downloads', ver, jar].join ?/

    puts 'Downloading JRuby'
    File.write jar, open(url).read, mode: 'wb'

    puts 'Extracting JRuby'
    Dir.chdir('jruby') { system "jar -xf ../#{jar}", out: '/dev/null' }
    FileUtils.rm_rf jar

    puts 'Installing SysShep Gem'
    system "gem install ./sysshep-#{SysShep::VERSION}.gem -i ./jruby", out: '/dev/null'

    FileUtils.cp 'jruby/bin/sysshep', 'jruby/META-INF/jruby.home/bin/sysshep'

    puts 'Building JRuby jar'
    File.write 'jruby/MANIFEST', <<-MANIFEST
Manifest-Version: 1.0
Class-Path: .
Main-Class: org.jruby.Main
MANIFEST

    system 'jar -cfm jruby.jar ./jruby/MANIFEST -C ./jruby .', out: '/dev/null'
    FileUtils.rm_rf 'jruby'

    puts 'Jar: ./build/jruby.jar'
    puts 'usage: java -jar jruby.jar --2.0 -S sysshep --help'
  end
end

desc 'build man pages'
task(:man) do
  exec 'ronn -br5 --organization=GLUCERO doc/sysshep.1.ronn'
end

desc 'clean build directory'
task(:clean) { FileUtils.rm_rf 'build' }
