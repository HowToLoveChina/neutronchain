Pod::Spec.new do |spec|
  spec.name         = 'Gntc'
  spec.version      = '{{.Version}}'
  spec.license      = { :type => 'GNU Lesser General Public License, Version 3.0' }
  spec.homepage     = 'https://github.com/ntc/go-ntc'
  spec.authors      = { {{range .Contributors}}
		'{{.Name}}' => '{{.Email}}',{{end}}
	}
  spec.summary      = 'iOS ntc Client'
  spec.source       = { :git => 'https://github.com/ntc/go-ntc.git', :commit => '{{.Commit}}' }

	spec.platform = :ios
  spec.ios.deployment_target  = '9.0'
	spec.ios.vendored_frameworks = 'Frameworks/Gntc.framework'

	spec.prepare_command = <<-CMD
    curl https://gntcstore.blob.core.windows.net/builds/{{.Archive}}.tar.gz | tar -xvz
    mkdir Frameworks
    mv {{.Archive}}/Gntc.framework Frameworks
    rm -rf {{.Archive}}
  CMD
end
