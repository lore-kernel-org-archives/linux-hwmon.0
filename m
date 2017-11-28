Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33983 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752088AbdK1E0G (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 27 Nov 2017 23:26:06 -0500
Subject: Re: [PATCH] hwmon: (pmbus/lm25066) Default coefficients for low
 current limit
To: Robert Lippert <roblip@gmail.com>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
        linux-kernel@vger.kernel.org, xow@google.com,
        Robert Lippert <rlippert@google.com>
References: <20171128002858.1821-1-rlippert@google.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <40bff1ab-dd3f-0d70-5ca2-8132af350380@roeck-us.net>
Date: Mon, 27 Nov 2017 20:26:03 -0800
MIME-Version: 1.0
In-Reply-To: <20171128002858.1821-1-rlippert@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/27/2017 04:28 PM, Robert Lippert wrote:
> There seems to be no way to detect the value of the CL/GAIN pin
> from the device using PMBus.
> 
> Low current mode seems to be recommended (from LM5066 datasheet) for
> improved current reporting accuracy in a typical design.
> 
> Assume the device is in low current mode unless the register override
> bit is set and indicates high current limit mode.
> 
> Signed-off-by: Robert Lippert <rlippert@google.com>

Applied (silently fixed continuation line alignment).

Looking at the most recent version of various datasheets for the chips supported
by the driver, looks like TI changed the coefficients (again). Not the first time.
Time to go through all chips and update coefficients. Might be worthwhile
to do that at least for the chips(s) which are of interest for you.

Thanks,
Guenter

> ---
>   drivers/hwmon/pmbus/lm25066.c | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
> index aa052f4449a9..f6ae7b4cf705 100644
> --- a/drivers/hwmon/pmbus/lm25066.c
> +++ b/drivers/hwmon/pmbus/lm25066.c
> @@ -43,6 +43,7 @@ enum chips { lm25056, lm25063, lm25066, lm5064, lm5066, lm5066i };
>   #define LM25066_READ_AVG_IIN		0xde
>   #define LM25066_READ_AVG_PIN		0xdf
>   
> +#define LM25066_DEV_SETUP_CL_CONFIG	BIT(2)	/* Use pin or SMBus values */
>   #define LM25066_DEV_SETUP_CL		BIT(4)	/* Current limit */
>   
>   /* LM25056 only */
> @@ -526,16 +527,22 @@ static int lm25066_probe(struct i2c_client *client,
>   	info->R[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].R;
>   	info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].R;
>   	info->R[PSC_POWER] = coeff[PSC_POWER].R;
> -	if (config & LM25066_DEV_SETUP_CL) {
> -		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].m;
> -		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].b;
> -		info->m[PSC_POWER] = coeff[PSC_POWER_L].m;
> -		info->b[PSC_POWER] = coeff[PSC_POWER_L].b;
> -	} else {
> +
> +	/*
> +	 * Assume chip is in low current limit/gain mode by default unless
> +	 * the register override is asserted AND indicates high limit mode.
> +	 */
> +	if ((config & LM25066_DEV_SETUP_CL_CONFIG) &&
> +		(config & LM25066_DEV_SETUP_CL)) {
>   		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].m;
>   		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].b;
>   		info->m[PSC_POWER] = coeff[PSC_POWER].m;
>   		info->b[PSC_POWER] = coeff[PSC_POWER].b;
> +	} else {
> +		info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].m;
> +		info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].b;
> +		info->m[PSC_POWER] = coeff[PSC_POWER_L].m;
> +		info->b[PSC_POWER] = coeff[PSC_POWER_L].b;
>   	}
>   
>   	return pmbus_do_probe(client, id, info);
> 

