pyenv rehash | ignore

def --wrapped pyenv [command: string = "", ...args: string] {
  if $command == "rehash" or $command == "shell" {
    pyenv $"sh-($command)" ...$args
  } else {
    ^pyenv $command ...$args
  }
}


