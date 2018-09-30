Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35178 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727616AbeI3VdZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 30 Sep 2018 17:33:25 -0400
Date: Sun, 30 Sep 2018 08:00:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, afd@ti.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] hwmon: ina3221: Add INA3221_CONFIG to
 volatile_table
Message-ID: <20180930150001.GA13042@roeck-us.net>
References: <20180929214407.27208-1-nicoleotsuka@gmail.com>
 <20180929214407.27208-2-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180929214407.27208-2-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, Sep 29, 2018 at 02:44:05PM -0700, Nicolin Chen wrote:
> The MSB (15th bit) of INA3221_CONFIG is a self-clear reset bit.
> So this register should be added to the volatile_table of the
> regmap_config. Otherwise, we will see this bit is sticky in the
> regcache which might accidentally reset the chip when an actual
> write happens to the register.
> 
> This might not be a severe bug for the current code line since
> there's no second place touching the INA3221_CONFIG except the
> reset routine in the probe().
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/ina3221.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index e6b49500c52a..cfe65ff01051 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -353,7 +353,7 @@ static struct attribute *ina3221_attrs[] = {
>  ATTRIBUTE_GROUPS(ina3221);
>  
>  static const struct regmap_range ina3221_yes_ranges[] = {
> -	regmap_reg_range(INA3221_SHUNT1, INA3221_BUS3),
> +	regmap_reg_range(INA3221_CONFIG, INA3221_BUS3),
>  	regmap_reg_range(INA3221_MASK_ENABLE, INA3221_MASK_ENABLE),
>  };
>  
