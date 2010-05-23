require File.join(File.dirname(__FILE__), '..', '..', 'test_helper')

class PlatformTest < Test::Unit::TestCase
  context "file options" do
    should "include add binary bit to options on windows platform" do
      # This constant is not defined on non-windows platforms, so define it here
      File::BINARY = 4096 unless defined?(File::BINARY)

      Mario::Platform.expects(:windows?).returns(true)
      assert_equal Vagrant::Util::Platform.tar_file_options, File::CREAT|File::EXCL|File::WRONLY|File::BINARY
    end

    should "not include binary bit on other platforms" do
      Mario::Platform.expects(:windows?).returns(false)
      assert_equal Vagrant::Util::Platform.tar_file_options, File::CREAT|File::EXCL|File::WRONLY
    end
  end
end
