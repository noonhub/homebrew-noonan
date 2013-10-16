require 'formula'

class Kafka < Formula
  homepage 'http://http://kafka.apache.org'
  url 'https://dist.apache.org/repos/dist/release/kafka/kafka_2.8.0-0.8.0-beta1.tgz'
  version '2.0.8.0-beta1'
  sha1 'd7a81829929197905adfc07573dc4a91cdab3857'

  def install
    prefix.install %w(bin config libs kafka_2.8.0-0.8.0-beta1.jar)

    bin.install_symlink "/usr/local/bin"
  end
end
