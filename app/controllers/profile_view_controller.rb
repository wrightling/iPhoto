class ProfileViewController < UIViewController
  def initWithNibName(nibNameOrNil, bundle:nibBundleOrNil)
    super

    self.title = "Profile"

    self
  end

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.whiteColor

    @scrollView = UIScrollView.alloc.initWithFrame self.view.bounds
    @scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight
    @scrollView.contentSize = CGSizeMake(320,550)

    image = UIImage.imageNamed("2009-09-25 16.38.43.jpg")
    katyButton = UIButton.buttonWithType UIButtonTypeCustom
    katyButton.setImage(image, forState:UIControlStateNormal)
    katyButton.setImage(image, forState:UIControlStateHighlighted)
    katyButton.frame = CGRectMake(15, 15, 200, 189)
    @scrollView.addSubview(katyButton)

    katyButton.addTarget(self, action:"showZoomedProfile",
                         forControlEvents:UIControlEventTouchUpInside)

    nameLabel = UILabel.alloc.initWithFrame CGRectMake(20,210,280,40)
    nameLabel.text = "Name: Katy Wright"
    @scrollView.addSubview nameLabel

    cityLabel = UILabel.alloc.initWithFrame CGRectMake(20,280,280,40)
    cityLabel.text = "From: Dallas"
    @scrollView.addSubview cityLabel

    biography = UITextView.alloc.initWithFrame CGRectMake(12,330,300,180)
    biography.font = UIFont.fontWithName("Helvetica", size: 15)
    biography.editable = false
    biography.text = "Katy Wright is the ..."
    @scrollView.addSubview biography

    memberSinceLabel = UILabel.alloc.initWithFrame CGRectMake(20,510,280,40)
    memberSinceLabel.text = "November 2012"
    @scrollView.addSubview memberSinceLabel

    self.view.addSubview @scrollView
  end

  def showZoomedProfile
    zoomedViewController = UIViewController.alloc.init
    zoomedViewController.title = "Zoomed Profile Image"
    image = UIImage.imageNamed("2009-09-25 16.38.43.jpg")
    imageView = UIImageView.alloc.initWithImage(image)
    imageView.contentMode = UIViewContentModeScaleAspectFill
    zoomedViewController.view.addSubview imageView
    self.navigationController.pushViewController(zoomedViewController,
                                                 animated:true)
  end
end
