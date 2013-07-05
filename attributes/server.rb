version = node['percona']['version'].to_s
normal['mysql']['use_upstart'] = false

case node["platform_family"]
when "debian"
  case version
  when "5.0", "5.1", "5.5", "5.6"
    normal['mysql']['server']['packages'] = %W{percona-server-server-#{version}}
  when "latest"
    normal['mysql']['server']['packages'] = %w{percona-server-server}
  end
when "rhel"
  normal['mysql']['service_name'] = "mysql"
  normal['mysql']['pid_file'] = ""

  case version
  when "5.0"
    normal['mysql']['server']['packages'] = %W{Percona-SQL-server-#{version.delete('.')}}
  when "5.1", "5.5", "5.6"
    normal['mysql']['server']['packages'] = %W{Percona-Server-server-#{version.delete('.')}}
  when "latest"
    normal['mysql']['server']['packages'] = %w{Percona-Server-server-56}
  end
end
