# Trash Specto

Submitted to EarthXHack 2020!

# Inspiration
Trash Specto was inspired by a massive pile of trash that was put on display at UTD. The goal there was to give students a visual reference to how much trash is produced in a day, so that they might be inspired to learn more about reducing waste. With Trash Specto, we’ve brought the concept of waste visualization to the home with an AR visualization of the amount of waste a user creates on a daily basis.

We think that with the ability to see the large amount of trash that is generated on a daily basis right in front of you helps to inspire action in reducing the amount of waste that you generate.

# What it does
Trash Specto asks the user a variety of questions asking about their water usage, food waste habits, and about their general waste habits as a whole. Using statistics from a variety of sources and the answers to the questions, the app then calculates the amount of garbage, wastewater, and food waste a user generates on a daily, weekly, monthly, or yearly (there’s even a Lifetime option) basis and then projects the amount of waste in AR.

# How I built it
Trash Specto was built almost entirely on Flutter, with an API for ARCore implementation. The entire UI was built from scratch, from the functional sliders all the way to the metric system switch. All the background graphics were created during this hackathon in the 48 hours of building, including the 3d textures and the logo.

The overall app is split in 8 .dart files that each have their own functionality. Main.dart is the initializer which loads SplashScreen.dart, giving the app time to load without black screens as well as preloading the assets of the wallpapers, images, and 3d texture maps. Then, there are a couple class pages inside Main.dart that compile the main page as well as a separate settings page with customizable settings.

From the main page, there are navigations to separate pages that specifically calculate how much waste the user generates. This is accomplished with several stacked cards that each have a question, input (more on CustomSlider.dart), and “Learn More” button, each of which sends information to the final slide of the page: the ARCore page, ARCore.dart. This page uses all the user-input data of the earlier cards to generate a user-customized size of garbage cubes, 55-gallon drum-sized waste water, and pizza boxes (representing food waste).

Finally, the final .dart file, CustomSlider.dart, is a custom widget with custom attributes and customization, which works as a slider that the user slides back and forth. The user’s input contributes to a formula that outputs the amount of each waste back to ARCore.dart, so no two user’s trash generation will be the same.

# Challenges I ran into
A couple challenges that were run into included how in order to get Sceneform (from AR Core) to work, we had to revert to an older version of Android Studio, and in certain errors the solution was to update to a newer version of Android Studio. In order to avoid this Catch-22, we had to work around the Sceneform errors to get our 3D assets to render. A couple others included the challenge of making an aesthetic and user-friendly UI/UX, since none of the team members have had much experience with the app design aspect.
We wanted initially to render in trash bags, have the app’s gravity place them in a stack, for relevancy with the user, but we realized with 48 hours and no experience at all with AR, we had to start with the basics first.

Another challenge we had was wanting to build the iOS app as functional as the Android version. Obviously, with a native app development software like Flutter, this should’ve been pretty easy, but due to the restrictions that Apple puts on their app developers, it was impossible to get the ARCore plugin working without a Mac. Unfortunately, none of our team members have a Mac, so instead of downloading a VM or going out and purchasing a new computer, we decided it would be for the better to focus on making the Android side of the app fully functional and App Store ready.

A final challenge with the AR Core is the quantities of objects we had to render. Turns out, rendering hundreds of objects at once is a very good way to crash a phone with even the beefiest processor. To mitigate this we added special scaling to the trash cubes which, instead of rendering a fixed size, rendered cubes based on a particular subunit of time, for instance, a month. This solution worked wonderfully but we ran out of time to implement it for food and water waste, leading to the app having issues when simulating more than a years worth of waste in those two categories.

# Accomplishments that I'm proud of
We are very proud of how the overall UI turned out: with a good overall color scheme, intricate and relevant background images, as well as overall great functionality. A couple specific accomplishments include preloaded assets, where the splashScreen loads in the backgrounds, images, and 3d textures before the app even loads. This helps optimize load time and make seamless transitions from page to page. We also created our own 3d texture map .pngs for all three of our AR generated items: the waste cubes, pizza boxes, and Redbull texture. In fact, the Redbull texture was created from one of our team members, Ryan, literally drinking a Redbull and using a knife to cut it open. It was then photographed and stitched together to create a texture map.

Another thing is the customizable background images that were all built-fit for this app. Using photoshop and royalty-free assets, these backdrops were combined, layer masked, and painted over by hand. They even double for Easter Eggs: on the Food Waste page, depending on the user’s input diet, the background image in fact changes to include what food the user might see on their plate. The background images’ themes were also quite important, as it helped us split up the questions into manageable sections without much clutter.

We also implemented metric and imperial units into the app by circumventing the problem. If the user sets the app into imperial units, a state is passed to the rest of the app that changes any metric option to imperial units in the user’s view. Behind the scenes, metric units are used regardless so that there doesn’t have to be any extra conversion, and we were able to provide the illusion of unit conversion.

Finally, the additional “Learn More” buttons that provide tips for individuals to live more sustainably were a feature that we were proud of. These additional information blurbs help add an overall sustainability activism feel to the app that help users actually cut down on how much food waste, overall garbage, or wastewater they produce.


# What I learned
We learned a lot about Flutter and Dart’s inbuilt qualities, such as creating custom widgets, managing state between stateful and stateless classes, formatting Columns inside Rows inside Paddings inside Scaffolds, and other Flutter widgets. We created some custom classes and custom sliders, which had attributes of their own and custom inputs. Another thing that was learned was how to implement Augmented Reality in Flutter: none of us had ever coded for VR or AR before and the implementation definitely wasn’t flawless. After many hours of debugging and testing, we are quite proud of the final product.

# What's next for Trash Specto
The next step for Trash Specto is the creation of an IOS version of the app, as well as increasing functionality and customizability of the app. The future goal is to make the app work on more devices more consistently, as well as be more able to accurately measure user waste.
