Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:55289 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751532AbdF1Rzk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jun 2017 13:55:40 -0400
Date: Wed, 28 Jun 2017 10:55:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Tom Levens <tom.levens@cern.ch>, jdelvare@suse.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: ltc2990: support all measurement modes
Message-ID: <20170628175537.GB13730@roeck-us.net>
References: <1479384616-12479-1-git-send-email-tom.levens@cern.ch>
 <1479384616-12479-3-git-send-email-tom.levens@cern.ch>
 <410de6c9-a13e-51f7-4d66-6f4e2537c574@roeck-us.net>
 <97eb089f-e0e2-1146-6e17-8f9f790433d8@topic.nl>
 <20170628150130.GC30968@roeck-us.net>
 <alpine.LRH.2.20.1706281723170.31209@lxplus022.cern.ch>
 <20170628160048.GA8915@roeck-us.net>
 <alpine.LRH.2.20.1706281819540.21032@lxplus028.cern.ch>
 <abe96add-88fc-af6c-a5ed-330c7ae422b9@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abe96add-88fc-af6c-a5ed-330c7ae422b9@topic.nl>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jun 28, 2017 at 07:33:33PM +0200, Mike Looijmans wrote:
> ﻿On 28-06-17 19:02, Tom Levens wrote:
> >
> >On Wed, 28 Jun 2017, Guenter Roeck wrote:
> >
> >>On Wed, Jun 28, 2017 at 05:29:38PM +0200, Tom Levens wrote:
> >>>
> >>[ ... ]
> >>
> >>>>
> >>>>>Whatever happened to this patch though? It didn't make it to mainline,
> >>>>>otherwise I'd have found it sooner...
> >>>>>
> >>>>I'll have to look it up, but I guess I didn't get an updated version.
> >>>
> >>>As far as I remember I had a working V3 of this patch, but it is
> >>>entirely
> >>>possible that it was never submitted as I have been busy with other
> >>>projects
> >>>recently. I'll dig it out and check that it is complete.
> >>>
> >>FWIW, I don't see it at
> >>https://patchwork.kernel.org/project/linux-hwmon/list/?submitter=171225&state=*
> >>
> >>
> >>Maybe you were waiting for a reply from Rob. Either case, it might make
> >>sense to only provide valid modes, ie to abstract the mode bits from the
> >>hardware, such as
> >>
> >>0 - internal temp only
> >>1 - Tr1
> >>2 - V1
> >>3 - V1-V2
> >>4 - Tr2
> >>5 - V3
> >>6 - V3-V4
> >>7 to 14 - per bit 0..2
> >>
> >>Guenter
> >>
> >
> >You are right, there was still an open question about how best to handle
> >the mode selection in DT.
> >
> >In the latest version of my patch I have it implemented as an array for
> >setting the two values, for example:
> >
> >     lltc,meas-mode = <7 3>;
> >
> >This sets bits [2..0] = 7 and [4..3] = 3. Of course these could be split
> >into two DT properties, but I was unsure what to name them as both fields
> >are called "mode" in the datasheet and "mode-43"/"mode-20" (or similar) is
> >ugly.
> >
> >With regards to your proposal, it is not clear to me whether the modes
> >which have the same result are exactly equivalent. Does disabling a
> >measurement with the mode[4..3] bits really leaves the part in a safe
> >state for all possible HW connections? With this doubt in my head, I would
> >prefer to keep the option available to the user to select any specific
> >mode. But I am open to suggestions.
> 
> Well, the input restrictions always apply, so disabling V3 measurement
> doesn't imply that you can apply 20V to that input safely now.
> 
> I'd suggest to set unused input to plain voltage measurement. That is
> "passive" and safe for external components.
> 
> So I'd suggest just setting the mode as per device datasheet, I can see no
> real advantage in abstracting it away and forcing users to read yet another
> document to get it right, e.g.:
> 
> lltc,mode = <6>;
> 
> As for the input disabling, since I doubt anyone would use it (why purchase
> a 4-channel device and use only 2), just add two booleans, e.g.
> "disable-inputs-34" and "disable-inputs-12" which set the command bits
> appropriately, and change the mode such that the disabled inputs are voltage
> readout only.
> 
> A case could even be made for changing mode at runtime. This allows using it
> to measure both current and voltage on two inputs, by reading V1, and V3,
> and then switch mode to obtain (accurate) V1-V2 and V4-V3.
> 
The hwmon subsystem doesn't really currently support that, and you'll likely
confuse userspace as well.

> That might be a viable way to handle not setting the mode at all. If the
> mode can be selected via sysfs, the driver can keep the device in a "safe"
> mode until the mode has been selected.
> 

You'll have to present me with a really good use case for me to agree with that
approach.

Guenter

> 
> >Mike, if you would like to test it, the latest version of my code is here:
> >
> >https://github.com/levens/ltc2990/blob/dev/drivers/hwmon/ltc2990.c
> 
> Sure, I even have a board with 2 of these devices now :)
> 
> -- 
> Mike Looijmans
> 
> 
> Kind regards,
> 
> Mike Looijmans
> System Expert
> 
> TOPIC Products
> Materiaalweg 4, NL-5681 RJ Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
> 
> Please consider the environment before printing this e-mail
> 
> 
> 
