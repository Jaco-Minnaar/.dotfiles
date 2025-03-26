use std/util "path add"

$env.path ++= [
    $"($env.home)/.local/bin"
    $"($env.home)/fvm/default/bin"
    $"($env.home)/.pub-cache/bin"
    $"($env.home)/go/bin"
    $"($env.home)/.dotnet"
    $"($env.home)/.dotnet/tools"
    $"($env.home)/.cargo/bin"
    $"($env.home)/Android/Sdk/cmdline-tools/latest/bin"
    $"($env.home)/.turso"
    $"($env.home)/code/jdtls/bin"
    $"($env.N_PREFIX)/bin"
    $"($env.pnpm_home)"
    $"($env.pnpm_home)/bin"
    $"($env.bun_install)/bin"
    $"($env.bun_install)/bin"
]

path add ($env.pyenv_root | path join "bin")
path add ($env.pyenv_root | path join "shims")
