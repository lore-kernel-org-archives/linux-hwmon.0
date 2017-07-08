Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57509 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752715AbdGHPpT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 8 Jul 2017 11:45:19 -0400
Date: Sat, 8 Jul 2017 08:45:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tom Levens <tom.levens@cern.ch>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Subject: Re: [v3,1/3] hwmon: ltc2990: refactor value conversion
Message-ID: <20170708154515.GA6358@roeck-us.net>
References: <1499056140-6064-1-git-send-email-tom.levens@cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1499056140-6064-1-git-send-email-tom.levens@cern.ch>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Jul 03, 2017 at 06:28:58AM +0200, Tom Levens wrote:
> Conversion from raw values to signed integers has been refactored using
> bitops.h. This also fixes a bug where negative temperatures were
> converted incorrectly.
> 

Documentation/process/submitting-patches.rst, chapter 2: "Solve only one
problem per patch.".

I can understand the urge to merge two sets of changes here. However,
that creates a problem for me: The fix should be applied to stable kernels,
but not the refactoring.

Please split the patch in two, one for the bug fix and one for the
refactoring.

Thanks,
Guenter

> Signed-off-by: Tom Levens <tom.levens@cern.ch>
> ---
>  drivers/hwmon/ltc2990.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/hwmon/ltc2990.c b/drivers/hwmon/ltc2990.c
> index 8f8fe05..e320d21 100644
> --- a/drivers/hwmon/ltc2990.c
> +++ b/drivers/hwmon/ltc2990.c
> @@ -11,6 +11,7 @@
>   * the chip's internal temperature and Vcc power supply voltage.
>   */
>  
> +#include <linux/bitops.h>
>  #include <linux/err.h>
>  #include <linux/hwmon.h>
>  #include <linux/hwmon-sysfs.h>
> @@ -34,15 +35,6 @@
>  #define LTC2990_CONTROL_MODE_CURRENT	0x06
>  #define LTC2990_CONTROL_MODE_VOLTAGE	0x07
>  
> -/* convert raw register value to sign-extended integer in 16-bit range */
> -static int ltc2990_voltage_to_int(int raw)
> -{
> -	if (raw & BIT(14))
> -		return -(0x4000 - (raw & 0x3FFF)) << 2;
> -	else
> -		return (raw & 0x3FFF) << 2;
> -}
> -
>  /* Return the converted value from the given register in uV or mC */
>  static int ltc2990_get_value(struct i2c_client *i2c, u8 reg, int *result)
>  {
> @@ -55,18 +47,16 @@ static int ltc2990_get_value(struct i2c_client *i2c, u8 reg, int *result)
>  	switch (reg) {
>  	case LTC2990_TINT_MSB:
>  		/* internal temp, 0.0625 degrees/LSB, 13-bit  */
> -		val = (val & 0x1FFF) << 3;
> -		*result = (val * 1000) >> 7;
> +		*result = sign_extend32(val, 12) * 1000 / 16;
>  		break;
>  	case LTC2990_V1_MSB:
>  	case LTC2990_V3_MSB:
>  		 /* Vx-Vy, 19.42uV/LSB. Depends on mode. */
> -		*result = ltc2990_voltage_to_int(val) * 1942 / (4 * 100);
> +		*result = sign_extend32(val, 14) * 1942 / 100;
>  		break;
>  	case LTC2990_VCC_MSB:
>  		/* Vcc, 305.18μV/LSB, 2.5V offset */
> -		*result = (ltc2990_voltage_to_int(val) * 30518 /
> -			   (4 * 100 * 1000)) + 2500;
> +		*result = sign_extend32(val, 14) * 30518 / (100 * 1000) + 2500;
>  		break;
>  	default:
>  		return -EINVAL; /* won't happen, keep compiler happy */
