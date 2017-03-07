Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:47980 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756596AbdCHDHk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Mar 2017 22:07:40 -0500
Subject: Re: Question about hwmon_attr_show_string
To: Jean Delvare <jdelvare@suse.de>
References: <201703030133.01363.PeterHuewe@gmx.de>
 <201703062148.36101.PeterHuewe@gmx.de> <20170306234755.GA16512@roeck-us.net>
 <20170307100846.0487135b@endymion>
Cc: =?UTF-8?Q?Peter_H=c3=bcwe?= <PeterHuewe@gmx.de>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <333a9a55-e6d3-97ed-6223-6d09cb5d3c03@roeck-us.net>
Date: Tue, 7 Mar 2017 06:16:15 -0800
MIME-Version: 1.0
In-Reply-To: <20170307100846.0487135b@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 03/07/2017 01:08 AM, Jean Delvare wrote:
> Hi Guenter,
>
> On Mon, 6 Mar 2017 15:47:55 -0800, Guenter Roeck wrote:
>> On Mon, Mar 06, 2017 at 09:48:35PM +0100, Peter Hüwe wrote:
>>> Hi Guenter,
>>>
>>> I was wondering whether there was a particular reason why
>>> hwmon_attr_show_string passes only an "empty" pointer(pointer) to the ops-
>>>> read_string function rather than the buffer itself?
>>>
>>> Wouldn't this mean that in ops->read_string I'd have to reserve some space for
>>> the value on the heap (and taking care to free it somewhere, since returning
>>> an address on the stack is bad idea), instead of calling sprintf(buf, "%s\n",
>>> s) directly?
>>>
>>> With the current implementation I have to sprintf it into my local buffer and
>>> you sprintf it again into the final buffer.
>>
>> The idea was that the called code would return a pointer to a constant string,
>> ie one that isn't changing from call to call.
>
> In that case, what about the following change?
>
> Subject: hwmon: Constify str parameter of hwmon_ops->read_string
>
> The read_string callback is supposed to retrieve a pointer to a
> constant string.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

Makes sense. I'll add it to -next.

Thanks,
Guenter

> ---
>  drivers/hwmon/hwmon.c |    2 +-
>  include/linux/hwmon.h |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> --- linux-4.10.orig/drivers/hwmon/hwmon.c	2017-02-19 23:34:00.000000000 +0100
> +++ linux-4.10/drivers/hwmon/hwmon.c	2017-03-07 08:22:27.784527968 +0100
> @@ -186,7 +186,7 @@ static ssize_t hwmon_attr_show_string(st
>  				      char *buf)
>  {
>  	struct hwmon_device_attribute *hattr = to_hwmon_attr(devattr);
> -	char *s;
> +	const char *s;
>  	int ret;
>
>  	ret = hattr->ops->read_string(dev, hattr->type, hattr->attr,
> --- linux-4.10.orig/include/linux/hwmon.h	2017-02-19 23:34:00.000000000 +0100
> +++ linux-4.10/include/linux/hwmon.h	2017-03-07 08:21:28.247998585 +0100
> @@ -336,7 +336,7 @@ struct hwmon_ops {
>  	int (*read)(struct device *dev, enum hwmon_sensor_types type,
>  		    u32 attr, int channel, long *val);
>  	int (*read_string)(struct device *dev, enum hwmon_sensor_types type,
> -		    u32 attr, int channel, char **str);
> +		    u32 attr, int channel, const char **str);
>  	int (*write)(struct device *dev, enum hwmon_sensor_types type,
>  		     u32 attr, int channel, long val);
>  };
>
>

