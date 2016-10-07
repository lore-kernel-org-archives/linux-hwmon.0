Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:40173 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932229AbcJGSoW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Oct 2016 14:44:22 -0400
Date: Fri, 7 Oct 2016 11:44:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH] hwmon: (lm73) Add temp1_max_hyst entry to sysfs
Message-ID: <20161007184410.GA10013@roeck-us.net>
References: <20161007044221.25577-1-joshua.scott@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161007044221.25577-1-joshua.scott@alliedtelesis.co.nz>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Oct 07, 2016 at 05:42:21PM +1300, Joshua Scott wrote:
> Currently, the lm73 driver has a temp1_max and a temp1_min. These make
> sense when using temp1_max_alarm and temp1_min_alarm to determine if the
> temperature has exceeded the chosen limits.
> 
> However, when using the ALARM output pin on the lm73 chip, the lower
> temperature value behaves as a hysteresis value. Rather than the low value
> triggering a "too cold" alarm, it is the point at which an existing high
> temperature alarm is turned off.
> 
> Add a sysfs entry for temp1_max_hyst, tied to the same register as
> temp1_min.
> 
Reading through the datasheet, resetting alert is really a side effect,
not really a hysteresis value. Hysteresis would be if THIGH would be
reset if the temperature goes below Tmin, but that is not the case.

It also looks like the alert bit should be reset by software, by
writing 1 into bit 3 of the configuration register. 

Given that, I don't think we should change anything. One option,
though, might be to implement alert and/or interrupt support and handle
the alert condition as expected, ie send an event to user space and
reset the alert bit in the interrupt/alert handler.

Guenter

> Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
> ---
>  drivers/hwmon/lm73.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/lm73.c b/drivers/hwmon/lm73.c
> index 9653bb8..b46a91a 100644
> --- a/drivers/hwmon/lm73.c
> +++ b/drivers/hwmon/lm73.c
> @@ -170,6 +170,8 @@ abort:
>  
>  static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO,
>  			show_temp, set_temp, LM73_REG_MAX);
> +static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IWUSR | S_IRUGO,
> +			show_temp, set_temp, LM73_REG_MIN);
>  static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO,
>  			show_temp, set_temp, LM73_REG_MIN);
>  static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO,
> @@ -184,6 +186,7 @@ static SENSOR_DEVICE_ATTR(temp1_min_alarm, S_IRUGO,
>  static struct attribute *lm73_attrs[] = {
>  	&sensor_dev_attr_temp1_input.dev_attr.attr,
>  	&sensor_dev_attr_temp1_max.dev_attr.attr,
> +	&sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
>  	&sensor_dev_attr_temp1_min.dev_attr.attr,
>  	&sensor_dev_attr_update_interval.dev_attr.attr,
>  	&sensor_dev_attr_temp1_max_alarm.dev_attr.attr,
> -- 
> 2.9.3
> 
