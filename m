Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57359 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753916AbcC2Wa2 (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 29 Mar 2016 18:30:28 -0400
Date: Tue, 29 Mar 2016 15:30:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thor Thayer <tthayer@opensource.altera.com>
Cc: lee.jones@linaro.org, linus.walleij@linaro.org, gnurou@gmail.com,
	jdelvare@suse.com, robh+dt@kernel.org, pawel.moll@arm.com,
	mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
	dinguyen@opensource.altera.com, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>
Subject: Re: [RFC 7/8] hwmon: Altera Arria10 System Resource Chip - HW Monitor
Message-ID: <20160329223027.GA5495@roeck-us.net>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
 <1459278791-3646-8-git-send-email-tthayer@opensource.altera.com>
 <20160329201648.GA30248@roeck-us.net>
 <56FAF70D.4010109@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56FAF70D.4010109@opensource.altera.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Mar 29, 2016 at 04:43:41PM -0500, Thor Thayer wrote:
> 
> 
> On 03/29/2016 03:16 PM, Guenter Roeck wrote:
> >On Tue, Mar 29, 2016 at 02:13:10PM -0500, tthayer@opensource.altera.com wrote:
> >>From: Thor Thayer <tthayer@opensource.altera.com>
> >>
> >>This patch adds the hwmon functionality to the Arria10 System
> >>Resource Chip. The hwmon encapsulates the PCIe Enable, USB Enable,
> >>and all the Power Good signals on the System Controller.
> >>
> >
> >I may be completely wrong, but a glance through the driver suggests
> >that, if anything, this should be a regulator driver, not a hwmon driver.
> >A hardware monitoring driver would be expected to report the voltages,
> >not (just) the voltage status. Am I missing something ?
> >
> >Please have a look into Documentation/hwmon/sysfs-interface for
> >acceptable hwmon attribute names and their meaning.
> >
> >Thanks,
> >Guenter
> >
> 
> Hi Guenter,
> 
> <adding voltage and current regulator framework moderators>
> 
> Yes, I see your point. In looking at the regulator drivers, I interpret
> those as being controlled by the driver whereas this chip is passively
> reporting status.
> 
> The success/fail indication seemed at first glance to fit the hwmon model. I
> thought the fan indication would be a good analog but even it reports speed
> and not success/fail.
> 
Yes, alarm and/or fault attributes are supposed to be secondary.

> After reading the referenced document, I agree that hwmon probably isn't
> appropriate. However, the regulator doesn't seem appropriate either (the
> only status appears to be tied to battery properties).
> 
Not really sure myself where this would fit if it is just status bits.

Does the chip report anything else besides the status ? One of the attributes
includes "pmbus", so one could conclude that there must be a PMBus compatible
chip somewhere.

Thanks,
Guenter
