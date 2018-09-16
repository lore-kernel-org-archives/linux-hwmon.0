Return-Path: <natechancellor@gmail.com>
Return-path: <natechancellor@gmail.com>
Date: Sat, 15 Sep 2018 17:06:12 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: Clang warning in drivers/hwmon/scmi-hwmon.c
Message-ID: <20180916000612.GA29020@flashbox>
References: <20180915051032.GA23900@flashbox>
 <bb1167c5-d0d7-7d14-d2ba-0df3830ab53a@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb1167c5-d0d7-7d14-d2ba-0df3830ab53a@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Sat, Sep 15, 2018 at 04:37:20PM -0700, Guenter Roeck wrote:
> On 09/14/2018 10:10 PM, Nathan Chancellor wrote:
> > Hi Sundeep and others,
> > 
> > A group of us are trying to clean up all the warnings we see with an
> > 'allyesconfig' arm64 build done with Clang and this one came up:
> > 
> > drivers/hwmon/scmi-hwmon.c:59:24: warning: address of array 'sensor->name' will always evaluate to 'true' [-Wpointer-bool-conversion]
> >          if (sensor && sensor->name)
> >                     ~~ ~~~~~~~~^~~~
> > 1 warning generated.
> > 
> > Would it be appropriate to just delete that check or does the check
> > need to be adjusted in some way (such as checking for the first value
> > 'sensor->name[0]')? Either option technically solves the warning but I
> > don't have the hardware to check if this breaks the driver.
> > 
> 
> Presumably the check is supposed to validate the content of the data structure,
> so dropping the test doesn't seem to make sense. However, one could argue
> that, if the _content_ is to be checked, it should be checked earlier,
> before the data pointer is stored (ie in scmi_hwmon_probe()).
> 
> Given that, I'll be happy to accept a patch to just drop the check; it
> does not change the behavior of the driver, after all. If a real validation
> is desirable, it can be added (into the probe function) with a separate patch.
> 
> Thanks,
> Guenter
> 

Thank you for the quick response and clarification, patch sent.

Nathan
