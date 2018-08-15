Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38698 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbeHOXgz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Aug 2018 19:36:55 -0400
Date: Wed, 15 Aug 2018 13:43:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) Fix potential Spectre v1
Message-ID: <20180815204308.GC18407@roeck-us.net>
References: <20180815131437.GA25639@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180815131437.GA25639@embeddedor.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Aug 15, 2018 at 08:14:37AM -0500, Gustavo A. R. Silva wrote:
> val can be indirectly controlled by user-space, hence leading to
> a potential exploitation of the Spectre variant 1 vulnerability.
> 
> This issue was detected with the help of Smatch:
> 
> vers/hwmon/nct6775.c:2698 store_pwm_weight_temp_sel() warn: potential
> spectre issue 'data->temp_src' [r]
> 
> Fix this by sanitizing val before using it to index data->temp_src
> 
> Notice that given that speculation windows are large, the policy is
> to kill the speculation on the first load and not worry if it can be
> completed with a dependent load/store [1].
> 
> [1] https://marc.info/?l=linux-kernel&m=152449131114778&w=2
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/nct6775.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
> index c6bd61e..944f5b6 100644
> --- a/drivers/hwmon/nct6775.c
> +++ b/drivers/hwmon/nct6775.c
> @@ -63,6 +63,7 @@
>  #include <linux/bitops.h>
>  #include <linux/dmi.h>
>  #include <linux/io.h>
> +#include <linux/nospec.h>
>  #include "lm75.h"
>  
>  #define USE_ALTERNATE
> @@ -2689,6 +2690,7 @@ store_pwm_weight_temp_sel(struct device *dev, struct device_attribute *attr,
>  		return err;
>  	if (val > NUM_TEMP)
>  		return -EINVAL;
> +	val = array_index_nospec(val, NUM_TEMP + 1);
>  	if (val && (!(data->have_temp & BIT(val - 1)) ||
>  		    !data->temp_src[val - 1]))
>  		return -EINVAL;
> -- 
> 2.7.4
> 
