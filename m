Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:58478 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1424325AbcFHRh4 (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Jun 2016 13:37:56 -0400
Date: Wed, 8 Jun 2016 10:37:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Mario_Limonciello@dell.com,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	=?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: dell-smm-hwmon: security problems
Message-ID: <20160608173743.GA16615@roeck-us.net>
References: <201606081157.22900@pali>
 <57581C7A.30308@roeck-us.net>
 <201606081555.48907@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <201606081555.48907@pali>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jun 08, 2016 at 03:55:48PM +0200, Pali Rohár wrote:
> On Wednesday 08 June 2016 15:24:10 Guenter Roeck wrote:
> > On 06/08/2016 02:57 AM, Pali Rohár wrote:
> > > Hello!
> > > 
> > > Mario wrote me about two I think security problems in
> > > dell-smm-hwmon driver and I would like to ask you, how to fix
> > > them.
> > > 
> > > 1) File /proc/i8k (exists only when kernel is compiled with
> > > CONFIG_I8K) exports DMI_PRODUCT_SERIAL and it can be read by
> > > ordinary user, without root permission. Normally
> > > DMI_PRODUCT_SERIAL can be read from sysfs file
> > > /sys/class/dmi/id/product_serial but only by root user.
> > > 
> > > 2) Via /proc/i8k ordinary user can set fan speed. This is because
> > > how "restricted" parameter and variable works. Setting fan speed
> > > by normal non-root user can be dangerous, e.g. malicious
> > > application under user "nobody" could take control of fans.
> > > 
> > > Do you have idea how to fix these problems? Just to note that
> > > /proc/i8k has stable kernel ABI and changing it will break all
> > > existing i8k* applications. But /proc/i8k is there only for old
> > > legacy laptops (year 2000).
> > > 
> > > There is module parameter "restricted" with default value false and
> > > description: "Allow fan control if SYS_ADMIN capability set".
> > > Current code do:
> > >
> > > 	case I8K_SET_FAN:
> > > 		if (restricted && !capable(CAP_SYS_ADMIN))
> > > 			return -EPERM;
> > > 
> > > For me description is a bit ambiguous. What about setting
> > > "restricted" by default to true and updating description to
> > > something like this?
> > > 
> > > "Disallow fan control when SYS_ADMIN capability is not set
> > > (default: 1)"
> > 
> > Sure. I am sure that someone will complain (we learned just recently
> > that people still use the old commands, after all), but then the old
> > behavior can be restored by setting the flag to 0.
> 
> Either setting that flag to 0 or running that tool under root or with 
> capability CAP_SYS_ADMIN.
> 
> > I would not use a double negative to describe it. Why not just
> > something like "Allow fan control only if SYS_ADMIN capability set
> > (default 1)" ?
> 
> I was thinking about that description too, but there is problem with 
> meaning too...
> 
> 0 means fan control is allowed for any user
> 1 means fan control is allowed only for CAP_SYS_ADMIN
> 
> Description should be unambiguous for situation when flag is set to 0.
> 
Sorry, I don't understand how a double negation "disallow ... if not set"
would make things less ambiguous than "allow ... only if set".

> ===
> 
> And do you have idea what to do with problem 1)?
> 

If you really want to do something about it, you could whiteout the serial
number if CAP_SYS_ADMIN is not set.

Guenter
