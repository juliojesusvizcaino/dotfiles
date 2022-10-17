function p
    set vds_dir ~/Documents/vandersat/repositories
    set goto (ls $vds_dir | fzf)
    cd "$vds_dir/$goto"
end
