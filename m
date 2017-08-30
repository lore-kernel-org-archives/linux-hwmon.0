Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:42517 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751240AbdH3AqC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Aug 2017 20:46:02 -0400
Date: Tue, 29 Aug 2017 17:45:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: jdelvare@suse.com, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Subject: Re: hwmon: ftsteutates: constify i2c_device_id
Message-ID: <20170830004529.GA15111@roeck-us.net>
References: <f172aa5ff3cae05e9744bcd3b184a732df17bfeb.1503170724.git.arvind.yadav.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f172aa5ff3cae05e9744bcd3b184a732df17bfeb.1503170724.git.arvind.yadav.cs@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun, Aug 20, 2017 at 12:56:34AM +0530, Arvind Yadav wrote:
> i2c_device_id are not supposed to change at runtime. All functions
> working with i2c_device_id provided by <linux/i2c.h> work with
> const i2c_device_id. So mark the non-const structs as const.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>

Appled to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/ftsteutates.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/ftsteutates.c b/drivers/hwmon/ftsteutates.c
> index 0f0277e..317e45f 100644
> --- a/drivers/hwmon/ftsteutates.c
> +++ b/drivers/hwmon/ftsteutates.c
> @@ -60,7 +60,7 @@
>  
>  static const unsigned short normal_i2c[] = { 0x73, I2C_CLIENT_END };
>  
> -static struct i2c_device_id fts_id[] = {
> +static const struct i2c_device_id fts_id[] = {
>  	{ "ftsteutates", 0 },
>  	{ }
>  };
