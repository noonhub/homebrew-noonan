require 'formula'

class Kafka < Formula
  homepage 'http://http://kafka.apache.org'
  url 'https://dist.apache.org/repos/dist/release/kafka/0.8.1.1/kafka_2.10-0.8.1.1.tgz'
  version '0.8.1.1'
  sha1 '7288a43bb0732789ff0d76d820fc7f40553854fe'

  def install
    prefix.install Dir['*']

    inreplace "#{bin}/kafka-run-class.sh", 'base_dir=$(dirname $0)/..', "base_dir=/usr/local/Cellar/kafka/#{version}/"
    cd "#{prefix}/config" do
      inreplace "log4j.properties", "File=", "File=/tmp/kafka-logs/"
    end

  end

  def caveats
    <<-EOS.undent
      put the following in your bash shell before running
      export KAFKA_HOME=#{prefix}
    EOS
  end
end
