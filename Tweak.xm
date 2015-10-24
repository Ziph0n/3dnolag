NSUserDefaults *prefs = [[NSUserDefaults alloc] initWithSuiteName:@"com.ziph0n.3dnolag"];
NSInteger lagtype = [[prefs objectForKey:@"lagtype"] intValue];

%hook SBApplicationShortcutMenu

-(void) _updateBackgroundForBlurFraction:(double) arg1 {

	if ([prefs boolForKey:@"enabled"]) {
		if (lagtype == 1) {
			arg1 = 1;
		} else if (lagtype == 2) {
    		arg1 = 0;
    	}
    	%orig (arg1);
    } else {
    	%orig;
    }
}

-(void) _peekWithContentFraction:(double) smoothedBlurFraction:(double) arg2 {

	if ([prefs boolForKey:@"enabled"]) {	
		arg2 = 0;
	    %orig (smoothedBlurFraction, arg2);
	} else {
		%orig;
	}
}

%end

%hook SBSideSwitcherViewController

+(bool) _supportsHighQualityBlurInOverlayMode {

	if ([prefs boolForKey:@"enabled"]) {
		return FALSE;
	} else {
		return %orig;
	}
}

%end