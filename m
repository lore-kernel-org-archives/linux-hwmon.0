Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51091 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751630AbeEDWjw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 May 2018 18:39:52 -0400
Date: Fri, 4 May 2018 15:39:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Lucas Magasweran <lucasrangit@gmail.com>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.de
Subject: Re: hwmon_device_register_with_info registration API issue
Message-ID: <20180504223950.GA5392@roeck-us.net>
References: <1525472549.6877.81.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1525472549.6877.81.camel@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, May 05, 2018 at 12:22:29AM +0200, Lucas Magasweran wrote:
> Hi Jean and al,
> 
> Thank you for your Kernel Recipes 2016 talk about the new hwmon
> registration API [1].
> 
> I'm trying to use the latest hwmon_device_register_with_info() API
> where hwmon core handles the sysfs attributes for me. However, I cannot
> use it with a NULL parent struct device *dev and non-NULL struct
> hwmon_chip_info *chip. My platform driver module_init() calls
> hwmon_device_register_with_info(). __hwmon_device_register() has a NULL
> pointer dereference error because it uses device managed memory
> allocation internally.
> 
> For example,
> 
> my_hwmon_dev = hwmon_device_register_with_info(NULL, "my_name", NULL,
>                                                &my_hwmon_chip_info,
>                                                NULL);
> --> __hwmon_device_register(NULL, "my_name", NULL,
>                             &my_hwmon_chip_info, NULL);
> ----> hwdev->groups = devm_kcalloc(NULL, ngroups,
>                                    sizeof(*groups), GFP_KERNEL);
> 
> I see that later in the function dev is checked for NULL in "hdev-
> >of_node = dev ? dev->of_node : NULL;" but it cannot be NULL for
> devm_kcalloc().
> 
> I tried the following 4.10.17 patch because I expected the hwmon
> attributes to be stored with the hwmon device directly and not the
> struct device *dev parent. However, none of my attributes are showing
> up in /sys/class/hwmon#/.
> 

I assume you mean /sys/class/hwmon/hwmon#/.

> Is my approach wrong?
> 

Yes. Parent must not be NULL if chip is used. The use case of parent==NULL
and chip!=NULL is not and will not be supported. Also, the only reason
for supporting a NULL parent is that the thermal code uses it, and it
is all but impossible to change the thermal code to provide a device
pointer.

I would strongly suggest to modify your code and provide
a parent (a pointer to either a platform or hardware device).
Most likely that means to convert it to a platform device.

If you insist in not providing a parent, you'll have to use
hwmon_device_register_with_groups(). Of course, that means you'll
have to handle the attributes.

Guenter
