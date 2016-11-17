Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:45455 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754521AbcKQRH3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Nov 2016 12:07:29 -0500
Subject: Re: [PATCH v2 1/3] hwmon: ltc2990: refactor value conversion
To: Tom Levens <tom.levens@cern.ch>
References: <1479384616-12479-1-git-send-email-tom.levens@cern.ch>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <86c28b4f-c78b-8d3e-5c48-fa42ca614ba4@roeck-us.net>
Date: Thu, 17 Nov 2016 07:06:16 -0800
MIME-Version: 1.0
In-Reply-To: <1479384616-12479-1-git-send-email-tom.levens@cern.ch>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Tom,

On 11/17/2016 04:10 AM, Tom Levens wrote:
> Conversion from raw values to signed integers has been refactored using
> the macros in bitops.h.
>
Please also mention that this fixes a bug in negative temperature conversions.

> Signed-off-by: Tom Levens <tom.levens@cern.ch>
> ---
>  drivers/hwmon/ltc2990.c |   27 ++++++++++-----------------
>  1 files changed, 10 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/hwmon/ltc2990.c b/drivers/hwmon/ltc2990.c
> index 8f8fe05..0ec4102 100644
> --- a/drivers/hwmon/ltc2990.c
> +++ b/drivers/hwmon/ltc2990.c
> @@ -9,8 +9,12 @@
>   * This driver assumes the chip is wired as a dual current monitor, and
>   * reports the voltage drop across two series resistors. It also reports
>   * the chip's internal temperature and Vcc power supply voltage.
> + *
> + * Value conversion refactored
> + * by Tom Levens <tom.levens@cern.ch>

Kind of unusual to do that for minor changes like this. Imagine if everyone would do that.
The commit log is what gives you credit.

>   */
>
> +#include <linux/bitops.h>
>  #include <linux/err.h>
>  #include <linux/hwmon.h>
>  #include <linux/hwmon-sysfs.h>
> @@ -34,19 +38,10 @@
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
> -static int ltc2990_get_value(struct i2c_client *i2c, u8 reg, int *result)
> +static int ltc2990_get_value(struct i2c_client *i2c, u8 reg, s32 *result)
>  {
> -	int val;
> +	s32 val;

Please just leave the variable type alone. it is also used for the return value
from i2c_smbus_read_word_swapped(), which is an int, and changing it to s32 doesn't
really make the code better.

Can you send me a register map for the chip ? I would like to write a module test.

Thanks,
Guenter

