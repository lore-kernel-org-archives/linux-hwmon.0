Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46557 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbeKCE5b (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 3 Nov 2018 00:57:31 -0400
Date: Fri, 2 Nov 2018 12:48:54 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] hwmon: (core) Add pm ops to hwmon class
Message-ID: <20181102194854.GA26329@Asurada-Nvidia.nvidia.com>
References: <20181025235122.3240-1-nicoleotsuka@gmail.com>
 <20181025235122.3240-2-nicoleotsuka@gmail.com>
 <20181102175435.GA4749@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181102175435.GA4749@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Nov 02, 2018 at 10:54:35AM -0700, Guenter Roeck wrote:

> > Actually, pm_runtime core also scans a class-level pm pointer:
> >          else if (dev->class && dev->class->pm)
> >                   ops = dev->class->pm;
> > 
> > This means that hwmon class in the hwmon core could actually
> > have its own generic pm callbacks so that a registered driver
> > would have the capability to link their own callbacks to the
> > hwmon core's.
> > 
> > So this patch adds a pm pointer to the hwmon class with some
> > generic pm callbacks of system suspend/resume and pm_runtime
> > suspend/resume, and also allows hwmon drivers to pass valid
> > pm pointers through _with_info API when registering devices.
> > 
> 
> Just to give an update: I am not happy with having to add hwmon
> specific pm callbacks. That doesn't look right to me. I'll have
> to spend time figuring out how other virtual devices handle this
> situation. Unfortunately, time is always scarce, so this will likely
> take a while.

That's okay. Would it be possible then for me to add PM runtime
functions just in ina3221, without touching hwmon core? It will
belong to the I2C device, not hwmon device any more.

> Also, please note that I won't accept function macros. I understand
> that are used a lot, especially in older hwmon drivers, but they just
> make the code more difficult to read and often add unnecessary code.

Okay. Will be careful to use them in future hwmon patches.

Thanks
Nicolin
