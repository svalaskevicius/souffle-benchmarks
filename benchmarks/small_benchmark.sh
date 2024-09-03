#!/bin/bash
root="/home/sarunas/code"
benchdir="$root/benchmarks/benchmarks"
# programs=(tc topological_ordering pointsto)
programs=( access1 access2 access3 access-policy cellular_automata components cprog1 cprog2 cprog3 cprog4 cprog5 family nfsa2fsa orbits po1 po2 po3 po4 po5 pointsto ranpo sequences tak tc topological_ordering trans x9)
instance=$1
  
cd $benchdir

for program in ${programs[@]}; do
  $program/gen_facts.sh > /dev/null
  ./timer.sh -p $program/$program.dl -I $instance -F facts
done
