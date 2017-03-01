Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:59571 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753710AbdCBADa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Mar 2017 19:03:30 -0500
Date: Wed, 1 Mar 2017 12:04:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Carlo Caione <carlo@caione.org>
Cc: Punit Agrawal <punit.agrawal@arm.com>,
        Carlo Caione <carlo@endlessm.com>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Linux Upstreaming Team <linux@endlessm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, rui.zhang@intel.com,
        edubezval@gmail.com
Subject: Re: [PATCH] hwmon: (scpi) Add slope and offset to SCP sensor readings
Message-ID: <20170301200444.GB20160@roeck-us.net>
References: <20170301132028.25309-1-carlo@caione.org>
 <41f19cd3-5086-1da9-915a-8987cfc119f9@roeck-us.net>
 <CAL9uMOG5qEgyGTue=n7abbFROKGBpUrWDOPi5_bEDUWuiHEUKg@mail.gmail.com>
 <87inntorz7.fsf@e105922-lin.cambridge.arm.com>
 <20170301175618.GB15246@roeck-us.net>
 <CAOQ7t2Y1=fL9a4A_gPtvrrWR_uOOP_gGT-61Q+1B39t2gRJBmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOQ7t2Y1=fL9a4A_gPtvrrWR_uOOP_gGT-61Q+1B39t2gRJBmw@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Mar 01, 2017 at 07:45:50PM +0100, Carlo Caione wrote:
> On Wed, Mar 1, 2017 at 6:56 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> > On Wed, Mar 01, 2017 at 04:57:00PM +0000, Punit Agrawal wrote:
> 
> >> Another way to fix this would be to add optional properties to the scpi
> >> sensors binding and use them instead. This could then be used to fixup
> >> values reported to both thermal and hwmon.
> >>
> >
> > Yes, this would be much more appropriate.
> 
> What about something like:
> 
> sensor-coefficients = <x1 y1 z1>,
>                                   <x2 y2 z2>,
>                                   ...;

As mentioned before, I don't think 'slope' and 'offset' are well enough
defined, so I would rather not use that approach.

I don't know if there are DT examples on how to specify a translation
from an arbitrary value to well-defined units; we could use that
if it exists. Otherwise, we might just go with a combination of
sensor class and the unit scale used for that sensor class.
A simple approach might be something like
    scpi,sensor-scale =	// pick preferred property name 
	<0 1000>,
	<1 1000>,
	<2 1000>,
	<3 1000000>,
	<4 1000000>;
or even simpler
	scpi,sensor-scale = <1000, 1000, 1000, 1000000, 1000000>;
since the class index is really redundant.

This would describe the units for the Juno ARM development platform.

In your case, that would be something like
	scpi,sensor-scale = <1, 1000, 1000, 1000000, 1000000>;
assuming that the other units are as expected (which may not be the case). 

Guenter
