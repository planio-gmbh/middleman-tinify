Feature: Minify PNGs

  Scenario: No changes if tinify is not activated
    Given a fixture app "image-app"
    And a file named "config.rb" with:
      """
      """
    And a successfully built app at "image-app"
    Then the file "build/images/panda.png" should have 56907 bytes


  Scenario: PNGs in images folder are minimized
    Given a fixture app "image-app"
    And a file named "config.rb" with:
      """
        activate :tinify, key: ENV['TINIFY_KEY']
      """
    And a successfully built app at "image-app"
    Then the file "build/images/panda.png" should have 15237 bytes

  Scenario: Image folder may be set explicitly
    Given a fixture app "image-app"
    And a file named "config.rb" with:
      """
        set :images_dir, 'pictures'
        activate :tinify, key: ENV['TINIFY_KEY'], path: 'images'
      """
    And a successfully built app at "image-app"
    Then the file "build/images/panda.png" should have 15237 bytes
