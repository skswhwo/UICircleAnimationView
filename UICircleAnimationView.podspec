Pod::Spec.new do |s|
  s.name             = 'UICircleAnimationView'
  s.version          = '0.9.2'
  s.platform         = :ios, '7.0'
  s.summary          = 'Circle animating view with a small circle point'
  s.homepage         = 'https://github.com/skswhwo/UICircleAnimationView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'skswhwo' => 'skswhwo@gmail.com' }
  s.source           = { :git => 'https://github.com/skswhwo/UICircleAnimationView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.source_files     = 'UICircleAnimationView/Classes/**/*.{h,m}'
  s.requires_arc     = true
end