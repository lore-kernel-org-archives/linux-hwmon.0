Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:59576 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751179AbdCQWQz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Mar 2017 18:16:55 -0400
Date: Fri, 17 Mar 2017 12:46:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Justin Maggard <jmaggard10@gmail.com>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: IT87_REG_PWM[3-5] wrong or obsolete?
Message-ID: <20170317194622.GB24426@roeck-us.net>
References: <CAKgsxVQa-uZb8V2Zgm5P8Gmau9K2a4Z6U4+_W7bjSdS+m6f5ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKgsxVQa-uZb8V2Zgm5P8Gmau9K2a4Z6U4+_W7bjSdS+m6f5ng@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Mar 17, 2017 at 11:42:13AM -0700, Justin Maggard wrote:
> Hi,
> 
> We've started using an IT8613E chip in some hardware designs, and I
> was planning to submit our it87 driver changes to support this new
> chip.  IT8613 supports 4 fans, but the fans it supports are fans 2-5.
> One of our designs has 3 fans, with the third fan connected to FAN4;
> however, I'm unable to control that fan using the current driver.
> 
> The reason is, in the current driver, IT87_REG_PWM[3-4] is set to
> 0x7f, 0xa7. But on IT8613E this should be 0x1e, 0x1f.  I see that
> these registers were defined when adding support for IT8620E.  Can
> anybody confirm that 0x7f, 0xa7 are correct on that chip?  I'm sure
> they weren't just pulled out of thin air, but it seems odd that ITE
> would have changed only those register indexes.
> 
> Assuming that those registers indexes are important for at least
> IT8620E, what would be the desired way to proceed with adding IT8613E
> support?
> 

We are currently trying to deal with that problem. Here is a quick
summary of what I know so far.

		IT8620E	IT8622E	IT8628E	IT8665E	IT8686E	IT8732
PWM4_CTL	0x7f	0x1e	0x7f	0x1e	0x7f	?
PWM5_CTL	0xa7	0x1f	0xa7	0x1f	0xa7	-
PWM6_CTL	0xaf	-	0xaf	0x92	0xaf	-

On top of that, not all chips share the same register definition.
Only bit 7 is the same.

This means the current code is wrong for at least IT8622E,
won't work for IT8665E (and IT8613E), and we'll need to find
a solution that works for all chips.

Guenter
