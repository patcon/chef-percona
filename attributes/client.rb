case node["platform_family"]
when "debian"
  case node['percona']['version']
  when "5.0", "5.1", "5.5", "5.6"
    normal['mysql']['client']['packages'] = %W{percona-server-client-#{node['percona']['version']}}
  when "latest"
    normal['mysql']['client']['packages'] = %w{percona-server-client}
  end

when "rhel"
  case node['percona']['version']
  when "5.0"
    normal['mysql']['client']['packages'] = %W{Percona-SQL-client-#{node['percona']['version'].delete('.')}}
  when "5.1", "5.5", "5.6"
    normal['mysql']['client']['packages'] = %W{Percona-Server-client-#{node['percona']['version'].delete('.')}}
  when "latest"
    normal['mysql']['client']['packages'] = %w{Percona-Server-client-56}
  end
end
