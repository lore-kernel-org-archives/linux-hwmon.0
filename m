Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:34862 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753202AbdCWPc4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Mar 2017 11:32:56 -0400
MIME-Version: 1.0
In-Reply-To: <20170323150323.271584-1-arnd@arndb.de>
References: <20170323150323.271584-1-arnd@arndb.de>
From: Luca Tettamanti <kronos.it@gmail.com>
Date: Thu, 23 Mar 2017 16:32:44 +0100
Message-ID: <CAKPcRGqTQK3Lp_c5fbDctPV24Q47HteVYkdo_sBVX5WoNq8YjQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon: asus_atk0110.c fix uninitialized data access
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 23 March 2017 at 16:03, Arnd Bergmann <arnd@arndb.de> wrote:
> The latest gcc-7 snapshot adds a warning to point out that when
> atk_read_value_old or atk_read_value_new fails, we copy
> uninitialized data into sensor->cached_value:
>
> drivers/hwmon/asus_atk0110.c: In function 'atk_input_show':
> drivers/hwmon/asus_atk0110.c:651:26: error: 'value' may be used uninitialized in this function [-Werror=maybe-uninitialized]

Ops, thanks for catching this.

>
> Adding an error check avoids this. All versions of the driver
> are affected.
>
> Fixes: 2c03d07ad54d ("hwmon: Add Asus ATK0110 support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Luca Tettamanti <kronos.it@gmail.com>


> ---
>  drivers/hwmon/asus_atk0110.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/hwmon/asus_atk0110.c b/drivers/hwmon/asus_atk0110.c
> index cccef87963e0..975c43d446f8 100644
> --- a/drivers/hwmon/asus_atk0110.c
> +++ b/drivers/hwmon/asus_atk0110.c
> @@ -646,6 +646,9 @@ static int atk_read_value(struct atk_sensor_data *sensor, u64 *value)
>                 else
>                         err = atk_read_value_new(sensor, value);
>
> +               if (err)
> +                       return err;
> +
>                 sensor->is_valid = true;
>                 sensor->last_updated = jiffies;
>                 sensor->cached_value = *value;
> --
> 2.9.0
>
