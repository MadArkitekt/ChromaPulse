<<<<<<< HEAD
<div style="text-align: center"><h1>ChromaPulse</h1></div>

<img src="https://raw.githubusercontent.com/MadArkitekt/ChromaPulse/master/DigitalPond/icons/iPhone/Icon-60@2x.png">

<hr>
<h3>A Digital Pond</h3>
<p>**ChromaPulse**  demonstrates  how responsive, visually brilliant apps don't necessarily
 require a small almanac of code. The app recognizes touch events, as well as any changes therein, and responds by
 spawning boxes of varying colors (none of which are the same as the background color) that "ripple" (growing outward from their touch event) for a few iterations before fading
 their alpha values to 0. </p>
(The screenshot provided is absurdly large to help show how which portions of the code are controlling which aspects of the image)
 <img style="float: center" src="https://raw.githubusercontent.com/MadArkitekt/ChromaPulse/master/ChromaPulse0.png" width=195.25 height=375>
 <hr>  
 <h3>Construction and UI Elements</h3>
 <p>
-The entirety of this app was built using Xcode's *Single View Controller* template. A lone UIView subclass
 joins the party playing the role of the  various "ripples" (fading boxes).<br>
-At the top of the screenshot, you'll notice the translucent bar, a *subclassed UIButton*, which recognizes left/right swipe gestures only.<br>
-Subclassing a button scratches my personal itch of the somewhat gratuitous use of a *UIScreenEdgePanGestureRecognizer* when one-offing a button
 not only provides the visual que of  "Hey, I bet these pages change somehow. Tried pressing it, maybe if I drag my finger... oooooo!", but also shows
 that the *developer put some thought into the end-user's device accessories, such as cases and possible restriction to certain portions of the screen* I keep my iPhone protected from
 myself with a LifeProof case, and because the iPhone's screen is recessed into the case, managing to pull off a pan gesture becomes somewhat of a craps shoot.
 </p>  
=======
<center><h1>ChromaPulse</h1></center>  
<center><img src="https://raw.githubusercontent.com/MadArkitekt/ChromaPulse/master/DigitalPond/icons/iPhone/Icon-60@2x.png"></center>

>>>>>>> Swift_Version

<hr>
<center><h3>A Digital Pond</h3></center>
<p><strong>ChromaPulse</strong> demonstrates how responsive, visually brilliant apps don't always require copious code. <strong>ChromPulse</strong> recognizes touch events, as well as any changes therein, responding with a myriad of polychromatic boxes (none of the same color as the current background) pulse, growing outward from their perspective touch events for 2 iterations before fading out.</p>
<center><em>The screenshot below illustrates the growing "rippes" tracking touch events on the green "pond". Touches began with the large purple square just left of center and curled around twice before ending in the top-righthand corner, demarcated by the smallest square. </em></center>  
<center><img style="float: center" src="ChromaPulse.gif" width=195.25 height=375></center>
<center><h3>Construction and UI Elements</h3></center>
- <strong><u>Template:</u></strong>
 - <strong>Single View Application</strong>
- <strong><u>Frameworks:</u></strong>
 - <strong>Core Graphics</strong>
- <strong><u>Mechanism:</u></strong>
 - Squares/"ripples" = subclassed <strong>UIView</strong> called according to touch event
 - Background colors are an array indexed into by swiping left or right on the occluded region<br>
	  - Occluded region = subclassed <strong>UIButton</strong> responsive only to left and right swiping (*The Swift version I'm currently building will use a <strong>UIPanGestureRecognizer</strong>*)

-
 <center><h3>Going Forward</h3></center>
<p>Make a Swift version and quantify differences in speed and size of app.</p>
