# homebrew-go-get

This project enables you to use brew to manage Go binaries installed to system with `go get`.
Special thanks for [Filippo Valsorda] who came up with the idea.
I just made it slightly more Ruby and installable via Tap.

[Filippo Valsorda]: https://blog.filippo.io/cleaning-up-my-gopath-with-homebrew

## Installation

```sh
brew tap jzelinskie/go-get
```

## Usage

```sh
$ brew go-get golang.org/x/perf/cmd/benchstat
Linking /usr/local/Cellar/go-get-benchstat/2017-08-12... 1 symlinks created

$ brew go-get golang.org/x/perf/cmd/benchstat
Unlinking /usr/local/Cellar/go-get-benchstat/2017-08-12... 1 symlinks removed
Linking /usr/local/Cellar/go-get-benchstat/2017-08-13... 1 symlinks created

$ brew uninstall go-get-benchstat
Uninstalling /usr/local/Cellar/go-get-benchstat/2017-08-13... (8.5MB)
```
