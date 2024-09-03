#!/bin/bash
root="/home/sarunas/code"
benchdir="$root/benchmarks/benchmarks"
# programs=(tc topological_ordering pointsto)
programs=(cprog1 pointsto access3 po1 cprog5 po4 cprog2 tc cellular_automata po5 x9 po3 orbits sequences ranpo access2 po2 tak components nfsa2fsa cprog4 trans family topological_ordering access1 access-policy cprog3)
instance=$1
  
cd $benchdir

for program in ${programs[@]}; do
  $program/gen_facts.sh > /dev/null
  ./timer.sh -p $program/$program.dl -I $instance -F facts
done
