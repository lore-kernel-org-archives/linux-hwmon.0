Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53674 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751240AbdH3CCX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Aug 2017 22:02:23 -0400
Date: Tue, 29 Aug 2017 19:02:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Xo Wang <xow@google.com>
Cc: jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org
Subject: Re: [1/2] hwmon: (pmbus/lm25066) Offset coefficient depends on CL
Message-ID: <20170830020214.GA21901@roeck-us.net>
References: <20170829212117.143441-2-xow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170829212117.143441-2-xow@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Aug 29, 2017 at 02:21:16PM -0700, Xo Wang wrote:
> When converting the DIRECT format CURRENT_IN and POWER commands, make
> the offset coefficient ("b") predicate on the value of the current limit
> setting.
> 
> Signed-off-by: Xo Wang <xow@google.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/lm25066.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
> index a3d912cd3b8d..232b4af13e12 100644
> --- a/drivers/hwmon/pmbus/lm25066.c
> +++ b/drivers/hwmon/pmbus/lm25066.c
> @@ -488,16 +488,18 @@ static int lm25066_probe(struct i2c_client *client,
>  	info->m[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].m;
>  	info->b[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].b;
>  	info->R[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].R;
> -	info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].b;
>  	info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].R;
> -	info->b[PSC_POWER] = coeff[PSC_POWER].b;
>  	info->R[PSC_POWER] = coeff[PSC_POWER].R;
>  	if (config & LM25066_DEV_SETUP_CL) {
>  		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].m;
> +		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].b;
>  		info->m[PSC_POWER] = coeff[PSC_POWER_L].m;
> +		info->b[PSC_POWER] = coeff[PSC_POWER_L].b;
>  	} else {
>  		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].m;
> +		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].b;
>  		info->m[PSC_POWER] = coeff[PSC_POWER].m;
> +		info->b[PSC_POWER] = coeff[PSC_POWER].b;
>  	}
>  
>  	return pmbus_do_probe(client, id, info);
