require 'formula'

class KafkaSrc < Formula
  homepage 'http://http://kafka.apache.org'
  url 'https://dist.apache.org/repos/dist/release/kafka/kafka-0.8.0-beta1-src.tgz'
  version '0.8.0-beta1'
  sha1 '8a5349b18355f044f30b980c7e589188af9a28f9'

  def install
    prefix.install Dir['*']

    system './sbt update'
    #bin.install_symlink "/usr/local/bin"
  end

  def plist_manual
    "kafka-server-start.sh #{libexec}/config/server.properties"
  end

  def plist
    <<-EOS.undent
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>KeepAlive</key>
        <true/>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{bin}/kafka-server-start.sh</string>
          <string>#{libexec}/config/server.properties</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>UserName</key>
        <string>#{ENV['USER']}</string>
        <key>WorkingDirectory</key>
        <string>#{var}</string>
        <key>StandardErrorPath</key>
        <string>/dev/null</string>
        <key>StandardOutPath</key>
        <string>/dev/null</string>
      </dict>
      </plist>
    EOS
  end
end



