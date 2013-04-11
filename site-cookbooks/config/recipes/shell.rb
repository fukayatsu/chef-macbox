bash "set zsh to default shell" do
  user "root"
  group "wheel"
  code <<-EOT
    _etc_shells=/etc/shells
    _zsh_path=/usr/local/bin/zsh
    _zsh_path_in_etc_shells=$(cat $_etc_shells | grep $_zsh_path)

    if [ "X"$_zsh_path_in_etc_shells = "X" ]; then
      echo _zsh_path >> $_zsh_path
    fi

    chsh -s $_zsh_path fukayatsu
  EOT
end
