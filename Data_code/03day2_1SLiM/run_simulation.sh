
##check whether folder exists, if so, clear them
for dirname in 01sweep_le 02sweep_ld 03redundancy 04qtl_le 05qtl_ld
do
  if test -d $dirname
  then
  rm -r $dirname
  rm -r ${dirname}_seed.log
  fi
done

##create result folder
mkdir 01sweep_le
mkdir 02sweep_ld
mkdir 03redundancy
mkdir 04qtl_le
mkdir 05qtl_ld


##run simulation

for rep in {1..20}
do
  echo "slim  -d \"rep=${rep}\" 01sweep_le.slim"
  echo "slim  -d \"rep=${rep}\" 02sweep_ld.slim"
  echo "slim  -d \"rep=${rep}\" -d \"num_selected_snps=50\" 03redundancy.slim"
  echo "slim  -d \"rep=${rep}\" 04qtl_le.slim"
  echo "slim  -d \"rep=${rep}\" 05qtl_ld.slim"
done | parallel -j 15



