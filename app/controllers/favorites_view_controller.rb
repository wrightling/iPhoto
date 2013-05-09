class FavoritesViewController < UIViewController
  def initWithNibName(nibNameOrNil, bundle:nibBundleOrNil)
    super

    self.title = "Favorites"

    self
  end

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.redColor

    image = UIImage.imageNamed("2009-11-05 08.45.17.jpg")
    logoView = UIButton.buttonWithType UIButtonTypeCustom
    logoView.setImage(image, forState:UIControlStateNormal)
    logoView.setImage(image, forState:UIControlStateHighlighted)
    logoView.frame = CGRectMake(15,15,100,100)
    self.view.addSubview(logoView)
    logoView.addTarget(self, action:"showZoomedPicture",
                       forControlEvents:UIControlEventTouchUpInside)

    profileButton = UIButton.buttonWithType UIButtonTypeRoundedRec
    profileButton.frame = CGRectMake(60,300,200,44)
    profileButton.setTitle("View Profile", forState:UIControlStateNormal)
    self.view.addSubview profileButton
    profileButton.addTarget(self, action:"showProfile",
                            forControlEvents:UIControlEventTouchUpInside)
  end

  def showProfile
    profileController = ProfileViewController.alloc.init
    self.navigationController.pushViewController(profileController,
                                                 animated:true)
  end

  def showZoomedPicture
    image = UIImage.imageNamed("2009-11-05 08.45.17.jpg")
    logoViewController = UIViewController.alloc.init
    logoViewController.title = "Katy iOS img"

    logoView = UIImageView.alloc.initWithImage(image)
    logoView.setContentMode(UIViewContentModeScaleAspectFit)
    logoView.frame = logoViewController.view.frame
    logoViewController.view.addSubview logoView

    self.navigationController.pushViewController(logoViewController,
                                                 animated:true)
  end
end
