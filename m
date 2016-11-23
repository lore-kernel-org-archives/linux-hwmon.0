Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:55380 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938429AbcKWN0R (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Nov 2016 08:26:17 -0500
Subject: Re: hwmon: (adt7470) fix checking of num_temp_sensors
To: Martin Etnestad <martin.etnestad@appeartv.com>,
        linux-hwmon@vger.kernel.org
References: <b4aaa8a9-6a8b-6d5f-1aac-718e46fbcc7d@appeartv.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <e9492c7a-e356-c0f5-5f75-50d4630e1eae@roeck-us.net>
Date: Wed, 23 Nov 2016 05:26:15 -0800
MIME-Version: 1.0
In-Reply-To: <b4aaa8a9-6a8b-6d5f-1aac-718e46fbcc7d@appeartv.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/23/2016 03:34 AM, Martin Etnestad wrote:
> The ADT7470 driver uses num_temp_sensors to check whether or not it
> actually needs to read the temperature registers. However, the check
> currently has a broken comparison: "num_temp_sensors >= 0" instead of
> "num_temp_sensors == 0".
>
> This causes the driver to only read the temperature registers _once_
> because num_temp_sensors gets set to a non-negative number after the
> check, in the same function.
>
> Additionally, the check is currently done _after_ the measurement
> sequence has been completed. The check should be done before the
> measurement sequence is initiated, as it can be skipped altogether if
> num_temp_sensors is 0.
>

The check is there to ensure that num_temp_sensors is calculated only once.
Your change breaks that. After the initial probe, temperature sensor
values are read in adt7470_update_device(), and it is no longer necessary
to do the read from adt7470_read_temperatures().

NACK, sorry.

Guenter

> This patch fixes the comparison and moves the check.
>
> Signed-off-by: Martin Etnestad <martin.etnestad@appeartv.com>
> ---
>  drivers/hwmon/adt7470.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index f5da39a..d1f9a54 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -201,6 +201,10 @@ static int adt7470_read_temperatures(struct i2c_client *client,
>      int i;
>      u8 cfg, pwm[4], pwm_cfg[2];
>
> +    /* only read sensors if we have to */
> +    if (data->num_temp_sensors == 0)
> +        return 0;
> +
>      /* save pwm[1-4] config register */
>      pwm_cfg[0] = i2c_smbus_read_byte_data(client, ADT7470_REG_PWM_CFG(0));
>      pwm_cfg[1] = i2c_smbus_read_byte_data(client, ADT7470_REG_PWM_CFG(2));
> @@ -243,10 +247,6 @@ static int adt7470_read_temperatures(struct i2c_client *client,
>          return -EAGAIN;
>      }
>
> -    /* Only count fans if we have to */
> -    if (data->num_temp_sensors >= 0)
> -        return 0;
> -
>      for (i = 0; i < ADT7470_TEMP_COUNT; i++) {
>          data->temp[i] = i2c_smbus_read_byte_data(client,
>                          ADT7470_TEMP_REG(i));

