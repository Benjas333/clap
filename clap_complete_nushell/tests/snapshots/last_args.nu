module completions {

  export extern my-app [
    --help(-h)                # Print help
  ]

  def "nu-complete my-app single --" [context: string, offset: int] {
    let tokens = ($context | split row ' ' | each { str trim } | where { $in != "" })
    if ("--" in $tokens) {
      null
    } else {
      null
    }
  }

  export extern "my-app single" [
    --help(-h)                # Print help
    arg: string
    ...args: string@"nu-complete my-app single --"
  ]

  def "nu-complete my-app multiple --" [context: string, offset: int] {
    let tokens = ($context | split row ' ' | each { str trim } | where { $in != "" })
    if ("--" in $tokens) {
      null
    } else {
      null
    }
  }

  export extern "my-app multiple" [
    --help(-h)                # Print help
    ...args: string@"nu-complete my-app multiple --"
  ]

  def "nu-complete my-app choice arg" [] {
    [ "bash" "zsh" "fish" ]
  }

  def "nu-complete my-app choice last_arg" [] {
    [ "nushell" "powershell" ]
  }

  def "nu-complete my-app choice --" [context: string, offset: int] {
    let tokens = ($context | split row ' ' | each { str trim } | where { $in != "" })
    if ("--" in $tokens) {
      (nu-complete my-app choice last_arg)
    } else {
      null
    }
  }

  export extern "my-app choice" [
    --help(-h)                # Print help
    arg: string@"nu-complete my-app choice arg"
    ...args: string@"nu-complete my-app choice --"
  ]

  def "nu-complete my-app multipleChoice args" [] {
    [ "bash" "zsh" "fish" ]
  }

  def "nu-complete my-app multipleChoice last_args" [] {
    [ "nushell" "powershell" ]
  }

  def "nu-complete my-app multipleChoice --" [context: string, offset: int] {
    let tokens = ($context | split row ' ' | each { str trim } | where { $in != "" })
    if ("--" in $tokens) {
      (nu-complete my-app multipleChoice last_args)
    } else {
      (nu-complete my-app multipleChoice args)
    }
  }

  export extern "my-app multipleChoice" [
    --help(-h)                # Print help
    ...args: string@"nu-complete my-app multipleChoice --"
  ]

  def "nu-complete my-app anyPath --" [context: string, offset: int] {
    let tokens = ($context | split row ' ' | each { str trim } | where { $in != "" })
    if ("--" in $tokens) {
      null
    } else {
      null
    }
  }

  export extern "my-app anyPath" [
    --help(-h)                # Print help
    arg: path
    ...args: string@"nu-complete my-app anyPath --"
  ]

  def "nu-complete my-app multipleAnyPath --" [context: string, offset: int] {
    let tokens = ($context | split row ' ' | each { str trim } | where { $in != "" })
    if ("--" in $tokens) {
      null
    } else {
      null
    }
  }

  export extern "my-app multipleAnyPath" [
    --help(-h)                # Print help
    ...args: string@"nu-complete my-app multipleAnyPath --"
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "my-app help" [
  ]

  export extern "my-app help single" [
  ]

  export extern "my-app help multiple" [
  ]

  export extern "my-app help choice" [
  ]

  export extern "my-app help multipleChoice" [
  ]

  export extern "my-app help anyPath" [
  ]

  export extern "my-app help multipleAnyPath" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "my-app help help" [
  ]

}

export use completions *
