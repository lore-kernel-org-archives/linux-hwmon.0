Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:48480 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750831AbcIIEPB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Sep 2016 00:15:01 -0400
Subject: Re: [PATCH] hwmon: adt7470: Add write support to alarm_mask
To: Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20160906222519.30842-1-joshua.scott@alliedtelesis.co.nz>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <80fda518-a83e-4aaf-7d27-282b26124087@roeck-us.net>
Date: Thu, 8 Sep 2016 21:14:57 -0700
MIME-Version: 1.0
In-Reply-To: <20160906222519.30842-1-joshua.scott@alliedtelesis.co.nz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/06/2016 03:25 PM, Joshua Scott wrote:
> Add write support for the alarm_mask. A base of 0 is provided so that
> either hex or decimal can be used. The hex format when reading alarm_mask
> is unchanged.
>
> Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
> ---
>  drivers/hwmon/adt7470.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index 94550d7..7d185a9 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -545,6 +545,27 @@ static ssize_t show_alarm_mask(struct device *dev,
>  	return sprintf(buf, "%x\n", data->alarms_mask);
>  }
>
> +static ssize_t set_alarm_mask(struct device *dev,
> +			      struct device_attribute *devattr,
> +			      const char *buf,
> +			      size_t count)
> +{
> +	struct adt7470_data *data = dev_get_drvdata(dev);
> +	long mask;
> +
> +	if (kstrtol(buf, 0, &mask))

This accepts negative values. Please consider unsigned long and kstrtoul().

> +		return -EINVAL;
> +
> +	mask &= 0xffff;
> +

This accepts and auto-fixes a bad provided mask. Please make it something like

	if (mask & ~0xffff)
		return -EINVAL;

Thanks,
Guenter

