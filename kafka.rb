require 'formula'

class Kafka < Formula
  homepage 'http://http://kafka.apache.org'
  url 'https://dist.apache.org/repos/dist/release/kafka/kafka_2.8.0-0.8.0-beta1.tgz'
  version '2.0.8.0-beta1'
  sha1 'd7a81829929197905adfc07573dc4a91cdab3857'

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
