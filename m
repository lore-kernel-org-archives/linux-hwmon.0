Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38537 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727018AbeJRAwU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 17 Oct 2018 20:52:20 -0400
Date: Wed, 17 Oct 2018 09:55:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] hwmon: (ina3221) Make sure data is ready after
 channel enabling
Message-ID: <20181017165543.GA22822@roeck-us.net>
References: <20181017012426.26958-1-nicoleotsuka@gmail.com>
 <20181017012426.26958-5-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181017012426.26958-5-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Oct 16, 2018 at 06:24:25PM -0700, Nicolin Chen wrote:
> The data might need some time to get ready after channel enabling,
> although the data register is readable without CVRF being set. So
> this patch adds a CVRF polling to make sure that data register is
> updated with the new data.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/hwmon/ina3221.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index 5fc375bf6635..160ddc404d73 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -45,6 +45,7 @@
>  #define INA3221_CONFIG_MODE_BUS		BIT(1)
>  #define INA3221_CONFIG_MODE_CONTINUOUS	BIT(2)
>  #define INA3221_CONFIG_CHx_EN(x)	BIT(14 - (x))
> +#define INA3221_CONFIG_CHs_EN_MASK	GENMASK(14, 12)
>  
>  #define INA3221_RSHUNT_DEFAULT		10000
>  
> @@ -52,6 +53,9 @@ enum ina3221_fields {
>  	/* Configuration */
>  	F_RST,
>  
> +	/* Status Flags */
> +	F_CVRF,
> +
>  	/* Alert Flags */
>  	F_WF3, F_WF2, F_WF1,
>  	F_CF3, F_CF2, F_CF1,
> @@ -63,6 +67,7 @@ enum ina3221_fields {
>  static const struct reg_field ina3221_reg_fields[] = {
>  	[F_RST] = REG_FIELD(INA3221_CONFIG, 15, 15),
>  
> +	[F_CVRF] = REG_FIELD(INA3221_MASK_ENABLE, 0, 0),
>  	[F_WF3] = REG_FIELD(INA3221_MASK_ENABLE, 3, 3),
>  	[F_WF2] = REG_FIELD(INA3221_MASK_ENABLE, 4, 4),
>  	[F_WF1] = REG_FIELD(INA3221_MASK_ENABLE, 5, 5),
> @@ -111,6 +116,19 @@ static inline bool ina3221_is_enabled(struct ina3221_data *ina, int channel)
>  	return ina->reg_config & INA3221_CONFIG_CHx_EN(channel);
>  }
>  
> +static inline int ina3221_wait_for_data_if_active(struct ina3221_data *ina)
> +{
> +	u32 cvrf;
> +
> +	/* No need to wait if all channels are disabled */
> +	if ((ina->reg_config & INA3221_CONFIG_CHs_EN_MASK) == 0)
> +		return 0;
> +
> +	/* Polling the CVRF bit to make sure read data is ready */
> +	return regmap_field_read_poll_timeout(ina->fields[F_CVRF],
> +					      cvrf, cvrf, 100, 100000);
> +}
> +
>  static int ina3221_read_value(struct ina3221_data *ina, unsigned int reg,
>  			      int *val)
>  {
> @@ -258,6 +276,13 @@ static int ina3221_write_enable(struct device *dev, int channel, bool enable)
>  	if (ret)
>  		return ret;
>  
> +	/* Make sure data conversion is finished */
> +	ret = ina3221_wait_for_data_if_active(ina);
> +	if (ret) {
> +		dev_err(dev, "Timed out at waiting for CVRF bit\n");
> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -676,6 +701,13 @@ static int __maybe_unused ina3221_resume(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> +	/* Make sure data conversion is finished */
> +	ret = ina3221_wait_for_data_if_active(ina);

This is quite expensive and would delay resume (and enable, for that matter).
A less expensive solution would be to save the enable time here and in
ina3221_write_enable(). ina3221_wait_for_data_if_active() can then be called
from read functions and would wait if not enough time has expired.

	if (time_before(...))
		usleep_range(missing wait time, missing_wait_time * 2);

or something like that. This could be done per channel or, to keep
things simple, just using a single time for all channels.

Thanks,
Guenter

> +	if (ret) {
> +		dev_err(dev, "Timed out at waiting for CVRF bit\n");
> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  
> -- 
> 2.17.1
> 
