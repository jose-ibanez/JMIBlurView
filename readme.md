#JMIBlur

`JMIBlur` is an attempt to replicate the live blur view that Apple is using all over [**REDACTED**]. It uses the private CAFilter class, so it's probably a no-no.  This implementation was made using Xcode 4.6 and iOS 6.1, but should also work on future versions of Apple's mobile OS.

##How do I use it?

1. Include the following files in your project:

    - `JMIBlur.h`
    - `JMIBlurStyle.h`
    - `JMIBlurView.m|h`
    - `JMIBlurLayer.m|h`

2. Import `JMIBlur.h`

3. Create a JMIBlurView or JMIBlurLayer with one of the following styles: 
  
    - `blurStylePlayerControls`: Mimics MPMoviePlayer controls.
    - `blurStyleBar`: Mimics UINavigationBar, UIToolbar, UITabBar.
    - `blurStyleCustom`: Defaults to filters that essentially do nothing, you will be responsible for configuring the CAFilters yourself.

You can treat `JMIBlurView` as any other view at this point. You can animate moving it around, and even apply a background color.

##How does it work?

According to this post on the [Apple developer forums](https://devforums.apple.com/message/822405#822405), Apple is achieving this effect using a private `UIView` subclass, which employs the private `CAFilter` class to blur whatever it's obscuring in near-real time. Essentially, I swizzled and logged the crap out of `CAFilter` to see exactly what filters they were creating and how they were configuring them. Once I had that info, it was relatively easy to figure out how to apply them to a view.

There are 3 filters created per view:

- **Gaussian Blur:** This is the bread and butter of the blur effect. It's might even be why it's called a blur effect. It's pretty blurry.
- **Color Saturate:** This helps create that color bleeding effect that gives the effect more of a frosted glass effect.
- **Color Matrix:** This filter I'm not so clear about. It appears to be a combination of a contrast filter and a brightness filter. The values used by MPMoviePlayer views and UINavigation/Tool/Tab bars are very different.

##Remaining Questions

What exactly is that third filter do? Will Apple finally let us use CAFilters? The class has been around since iOS 2.0, after all.

##Performance

Performance in the simulator is not great, especially when moving the blur view, but performance on device is actually quite nice.