Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40249 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727014AbeJRDnU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 17 Oct 2018 23:43:20 -0400
Date: Wed, 17 Oct 2018 12:46:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] hwmon: (ina3221) Return -ENODATA for two alarms
 attributes
Message-ID: <20181017194605.GB6812@roeck-us.net>
References: <20181017012426.26958-1-nicoleotsuka@gmail.com>
 <20181017012426.26958-3-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181017012426.26958-3-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Oct 16, 2018 at 06:24:23PM -0700, Nicolin Chen wrote:
> There is nothing critically wrong to read these two attributes
> without having a is_enabled() check at this point. But reading
> the MASK_ENABLE register would clear the CVRF bit according to
> the datasheet. So it'd be safer to fence for disabled channels
> in order to add pm runtime feature.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/hwmon/ina3221.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index d61688f04594..3e98b59108ee 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -200,6 +200,8 @@ static int ina3221_read_curr(struct device *dev, u32 attr,
>  		return 0;
>  	case hwmon_curr_crit_alarm:
>  	case hwmon_curr_max_alarm:
> +		if (!ina3221_is_enabled(ina, channel))
> +			return -ENODATA;

Makes sense, but can you check what the sensors command does with this ?
If it bails out I'd rather have the code return 0 and no error (after all,
the sensor is disabled, so any alarm would be bogus).

Thanks,
Guenter

>  		ret = regmap_field_read(ina->fields[reg], &regval);
>  		if (ret)
>  			return ret;
> -- 
> 2.17.1
> 
