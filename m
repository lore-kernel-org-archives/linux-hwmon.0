Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:36499 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751580AbcFHRnz (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Jun 2016 13:43:55 -0400
Date: Wed, 8 Jun 2016 10:43:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Andrew F. Davis" <afd@ti.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (tmp401) Add support for TI TMP461
Message-ID: <20160608174338.GC16615@roeck-us.net>
References: <20160531162720.460-1-afd@ti.com>
 <57525C13.3040601@roeck-us.net>
 <57584E3D.8070501@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57584E3D.8070501@ti.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jun 08, 2016 at 11:56:29AM -0500, Andrew F. Davis wrote:

[ ... ]

> >>   static const u8 TMP432_TEMP_MSB_READ[4][3] = {
> >> @@ -149,6 +156,7 @@ static const struct i2c_device_id tmp401_id[] = {
> >>       { "tmp431", tmp431 },
> >>       { "tmp432", tmp432 },
> >>       { "tmp435", tmp435 },
> >> +    { "tmp461", tmp461 },
> > 
> > Please also provide code in the detect function to auto-detect the chip.
> > 
> 
> It looks like the ID reg has been removed (at least from the datasheet)
> so I'm not sure there is any good way to ID this part.
> 
Outch :-(

Well, nothing we can do about that. Even if the register was there and provides
a value, it would be undocumented and thus unreliable and unusable. Too bad.

Thanks,
Guenter
