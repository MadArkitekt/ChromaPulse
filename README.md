# ChromaPulse
<img src="https://raw.githubusercontent.com/MadArkitekt/ChromaPulse/master/DigitalPond/icons/iPhone/Icon-60@2x.png" >

<hr>
<h3>A Digital Pond</h3>
<p>**ChromaPulse**  demonstrates  how responsive, visually brilliant apps don't necessarily
 require a small almanac of code. The app recognizes touch events, as well as any changes therein, and responds by
 spawning boxes of varying colors (none of which are the same as the background color) that "ripple" (growing outward from their touch event) for a few iterations before fading
 their alpha values to 0. </p>
(The screenshot provided is absurdly large to help show how which portions of the code are controlling which aspects of the image)
 <img src="https://raw.githubusercontent.com/MadArkitekt/MadArkitekt.github.io/master/assets/images/chromaSnake@2x.png">
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

 <hr>  

 <h3>Going Forward</h3>
 <p>
-Nearing the official release of iOS 8, I plan on rebuilding the app using the Metal framework explore just how close I can get to recreating ripples on a pond.
</p>
* (I'm not making fun of anyone in the quote above. The voice expressed is actually my inner monologue when coming across interesting app features)
