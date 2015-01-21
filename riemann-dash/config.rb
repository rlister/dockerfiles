# Example configuration file for riemann-dash.

# Serve HTTP traffic on this port
set  :port, ENV.fetch('PORT', 4567)

# Answer queries sent to this IP address
set  :bind, ENV.fetch('BIND', '0.0.0.0')

if ENV['RIEMANN_BASE']
  riemann_base = ENV['RIEMANN_BASE']
  riemann_src = "#{riemann_base}/lib/riemann/dash"

  # Add custom controllers in controller/
  config.store[:controllers] = ["#{riemann_src}/controller"]

  # Use the local view directory instead of the default
  config.store[:views] = "#{riemann_src}/views"

  # Specify a custom path to your workspace config.json
  config.store[:ws_config] = "#{riemann_base}/config/config.json"

  # Serve static files from this directory
  config.store[:public] = "#{riemann_src}/public"
end

# Save workspace configuration to Amazon S3 (you'll need to have the "fog"
# gem installed)
if ENV['WS_CONFIG']
  config.store[:ws_config] = ENV['WS_CONFIG'] ## eg 's3://my-bucket/config.json'
end

if ENV['AWS_ACCESS_KEY_ID'] and ENV['AWS_SECRET_ACCESS_KEY']
  config.store[:s3_config] = {
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
  }
end
