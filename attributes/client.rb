version = node['percona']['version'].to_s

case node["platform_family"]
when "debian"
  case version
  when "5.0", "5.1", "5.5", "5.6"
    normal['mysql']['client']['packages'] = %W{percona-server-client-#{version}}
  when "latest"
    normal['mysql']['client']['packages'] = %w{percona-server-client}
  end

when "rhel"
  case version
  when "5.0"
    normal['mysql']['client']['packages'] = %W{Percona-SQL-client-#{version.delete('.')}}
  when "5.1", "5.5", "5.6"
    normal['mysql']['client']['packages'] = %W{Percona-Server-client-#{version.delete('.')}}
  when "latest"
    normal['mysql']['client']['packages'] = %w{Percona-Server-client-56}
  end
end
