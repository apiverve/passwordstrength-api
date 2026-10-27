Pod::Spec.new do |s|
  s.name             = 'APIVervePasswordStrength'
  s.version          = '1.2.3'
  s.summary          = 'Password Strength is a password strength checker API that scores how strong a password is.'
  s.description      = <<-'DESC'
Password Strength is a password strength checker API that scores how strong a password is. It returns a strength label and score, a breakdown of the character types used, weak-pattern detection, theoretical entropy in bits, and recommendations to improve it.

This iOS/macOS SDK provides a convenient way to access the Password Strength from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/passwordstrength?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/passwordstrength-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVervePasswordStrength/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
