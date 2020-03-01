search_dir="$1"
extension="$2"
backup_dir="$3"
archive_name="$4"
mkdir -p $backup_dir
files=$(find $search_dir -name *.$extension | sed -n "s|^${search_dir}||p")
for file in $files
do
  dest="${backup_dir}${file}"
  mkdir -p $(dirname $dest)
  cp "${search_dir}${file}" $dest
done
cd $backup_dir
tar -czf "../${archive_name}" *
cd ..
echo done
