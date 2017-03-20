Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:32906 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753305AbdCTWp7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Mar 2017 18:45:59 -0400
Date: Mon, 20 Mar 2017 15:45:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: (it87) Fix feature mask for IT8792E (IT8733E)
Message-ID: <20170320224522.GA7679@roeck-us.net>
References: <1489245446-6352-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1489245446-6352-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, Mar 11, 2017 at 07:17:26AM -0800, Guenter Roeck wrote:
> The chip features match those of IT8790E. Most important is the
> ADC resolution, which is 12 mV, not 10.9 mV. It also uses the 'new'
> set of registers for PECI control, and has a second PWM frequency
> register.
> 
Actually, turns out the ADC resolution is wrong. Both chips have an ADC
resolution of 10.9mV. Only the datasheet for IT8792E contradicts itself
and claims in one place that the resolution is 12mV and elsewhere that
it is 10.9mV. A test with a real chip suggests that 10.9mV is correct.

Guenter

> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/it87.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index efb01c247e2d..3e57a6120551 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -428,11 +428,10 @@ static const struct it87_devices it87_devices[] = {
>  	[it8792] = {
>  		.name = "it8792",
>  		.suffix = "E",
> -		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
> -		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
> -		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL,
> +		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
> +		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
> +		  | FEAT_PWM_FREQ2,
>  		.peci_mask = 0x07,
> -		.old_peci_mask = 0x02,	/* Actually reports PCH */
>  	},
>  	[it8603] = {
>  		.name = "it8603",
> -- 
> 2.7.4
> 
