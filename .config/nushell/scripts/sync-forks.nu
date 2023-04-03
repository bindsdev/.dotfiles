#!/usr/bin/env nu

def main [] {
  # This directory contains all my forks of opensource repositories.
  cd ~/code/opensource

  ls | get name | each { |dir| 
    
  }
}
