function put-key () {
   cat ~/.ssh/id_rsa.pub | ssh $1 "[[ -d ~/.ssh ]] || mkdir ~/.ssh && cat >> ~/.ssh/authorized_keys"
}

function add_to_path () {
    export PATH="$PATH:$1"
}

function strip_diff_leading_symbols () {
	color_code_regex="(\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K])"

	# simplify the unified patch diff header
	sed -E "s/^($color_code_regex)diff --git .*$//g" | \
		sed -E "s/^($color_code_regex)index .*$/\n\1$(rule)/g" | \
		sed -E "s/^($color_code_regex)\+\+\+(.*)$/\1+++\5\n\1$(rule)\x1B\[m/g" |\
		# actually strips the leading symbols
		sed -E "s/^($color_code_regex)[\+\-]/\1 /g"
}

## Print a horizontal rule
rule () {
	printf "%$(tput cols)s\n"|tr " " "─"
}

function sym () {
  link_target="$1"
  link_name="$2"
  if [[ -d "$link_name" ]]
  then
    base_dir="$link_name"
  else
    base_dir="$(dirname "$link_name")"
  fi

  link_target="$(abs2rel "$link_target" "$base_dir")"

  ln -s $link_target $link_name
}
