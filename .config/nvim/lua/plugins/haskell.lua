return {
  -- Fails to install something, it tries to use lua 5.1, but I'm using 5.3,
  -- so it can't find dependencies that are installed, but in 5.3
  {
    "mrcjkb/neotest-haskell",
    enabled = false,
  },
}
