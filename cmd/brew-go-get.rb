#:  * `go-get`
#:    Easily build and install Go repositories
#:
#:    `brew go-get` <repository>
#:    Install <repository>.


require 'date'

module GoGetCli
  class << self
    def bin
      "brew go-get"
    end

    def run!
      GoGetCli.executing_under_brew!
      if ARGV.empty?
        abort `#{bin} --help`
      end

      repository = ARGV[-1]
      basename = File.basename(repository)
      version = DateTime.now.strftime("%Y-%m-%d")
      gopath = "$(brew --prefix)/Cellar/go-get-#{basename}/#{version}"
      script = <<-EOS
        set -euo pipefail
        go get #{ARGV.join(" ")}
        rm -rf "#{gopath}/pkg" "#{gopath}/src"
        brew unlink "go-get-#{basename}" 2> /dev/null || true
        brew link "go-get-#{basename}"
      EOS

      `GOBIN="#{gopath}/bin" GOPATH="#{gopath}" bash -c '#{script}'`
    end

    def executing_under_brew!
      abort("Runtime error: Homebrew is required. Please start via `#{bin} ...`") unless defined?(HOMEBREW_LIBRARY_PATH)
    end
  end
end

GoGetCli.run!
