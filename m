Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:52549 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753308AbcFHNYS (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Jun 2016 09:24:18 -0400
Subject: Re: dell-smm-hwmon: security problems
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, Mario_Limonciello@dell.com,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	=?UTF-8?B?TWljaGHFgiBLxJlwaWU=?= =?UTF-8?B?xYQ=?=
	<kernel@kempniu.pl>
References: <201606081157.22900@pali>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <57581C7A.30308@roeck-us.net>
Date: Wed, 8 Jun 2016 06:24:10 -0700
MIME-Version: 1.0
In-Reply-To: <201606081157.22900@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/08/2016 02:57 AM, Pali Rohár wrote:
> Hello!
>
> Mario wrote me about two I think security problems in dell-smm-hwmon
> driver and I would like to ask you, how to fix them.
>
> 1) File /proc/i8k (exists only when kernel is compiled with CONFIG_I8K)
> exports DMI_PRODUCT_SERIAL and it can be read by ordinary user, without
> root permission. Normally DMI_PRODUCT_SERIAL can be read from sysfs file
> /sys/class/dmi/id/product_serial but only by root user.
>
> 2) Via /proc/i8k ordinary user can set fan speed. This is because how
> "restricted" parameter and variable works. Setting fan speed by normal
> non-root user can be dangerous, e.g. malicious application under user
> "nobody" could take control of fans.
>
> Do you have idea how to fix these problems? Just to note that /proc/i8k
> has stable kernel ABI and changing it will break all existing i8k*
> applications. But /proc/i8k is there only for old legacy laptops (year
> 2000).
>
> There is module parameter "restricted" with default value false and
> description: "Allow fan control if SYS_ADMIN capability set". Current
> code do:
>
> 	case I8K_SET_FAN:
> 		if (restricted && !capable(CAP_SYS_ADMIN))
> 			return -EPERM;
>
> For me description is a bit ambiguous. What about setting "restricted"
> by default to true and updating description to something like this?
>
> "Disallow fan control when SYS_ADMIN capability is not set (default: 1)"
>

Sure. I am sure that someone will complain (we learned just recently
that people still use the old commands, after all), but then the old
behavior can be restored by setting the flag to 0.

I would not use a double negative to describe it. Why not just
something like "Allow fan control only if SYS_ADMIN capability set
(default 1)" ?

Guenter

