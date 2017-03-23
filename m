Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:41114 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754833AbdCWU0I (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Mar 2017 16:26:08 -0400
Date: Thu, 23 Mar 2017 13:26:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Luca Tettamanti <kronos.it@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: asus_atk0110.c fix uninitialized data access
Message-ID: <20170323202605.GA12283@roeck-us.net>
References: <20170323150323.271584-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170323150323.271584-1-arnd@arndb.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Mar 23, 2017 at 04:03:11PM +0100, Arnd Bergmann wrote:
> The latest gcc-7 snapshot adds a warning to point out that when
> atk_read_value_old or atk_read_value_new fails, we copy
> uninitialized data into sensor->cached_value:
> 
> drivers/hwmon/asus_atk0110.c: In function 'atk_input_show':
> drivers/hwmon/asus_atk0110.c:651:26: error: 'value' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> 
> Adding an error check avoids this. All versions of the driver
> are affected.
> 
Nice catch!

Applied, thanks.

Guenter

> Fixes: 2c03d07ad54d ("hwmon: Add Asus ATK0110 support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/hwmon/asus_atk0110.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/asus_atk0110.c b/drivers/hwmon/asus_atk0110.c
> index cccef87963e0..975c43d446f8 100644
> --- a/drivers/hwmon/asus_atk0110.c
> +++ b/drivers/hwmon/asus_atk0110.c
> @@ -646,6 +646,9 @@ static int atk_read_value(struct atk_sensor_data *sensor, u64 *value)
>  		else
>  			err = atk_read_value_new(sensor, value);
>  
> +		if (err)
> +			return err;
> +
>  		sensor->is_valid = true;
>  		sensor->last_updated = jiffies;
>  		sensor->cached_value = *value;
> -- 
> 2.9.0
> 
