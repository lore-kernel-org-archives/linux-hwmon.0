Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:39869 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964967AbeALSUy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 12 Jan 2018 13:20:54 -0500
Received: by mail-pg0-f67.google.com with SMTP id z20so5056484pgv.6
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Jan 2018 10:20:54 -0800 (PST)
Date: Fri, 12 Jan 2018 10:20:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Emiliano Ingrassia <ingrassia@epigenesys.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: sht3x: wait predefined limits loading complete
 before access
Message-ID: <20180112182051.GA15480@roeck-us.net>
References: <20180112172901.GA15784@ingrassia.epigenesys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180112172901.GA15784@ingrassia.epigenesys.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Jan 12, 2018 at 06:29:01PM +0100, Emiliano Ingrassia wrote:
> An sht3x sensor include limits register which contains temperature
> and humidity limit values. After a reset, pre-defined values are loaded
> into that register. During the probe function, the driver reads the
> limits register. However, if the reads are made too early, for example
> because the I2C bus frequency is high (e.g. 400 kHz), the loading could be
> not completed and the sensor returns a NACK which causes the probe to fail.
> A delay of 500 us before the first read solves this issue.
> 
> Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
> ---
>  drivers/hwmon/sht3x.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
> index 6ea99cd6ae79..cec06b76656e 100644
> --- a/drivers/hwmon/sht3x.c
> +++ b/drivers/hwmon/sht3x.c
> @@ -732,6 +732,8 @@ static int sht3x_probe(struct i2c_client *client,
>  	mutex_init(&data->i2c_lock);
>  	mutex_init(&data->data_lock);
>  
> +	udelay(500);
> +

Why is it necessary to perform an active wait, ie why don't you use
usleep_range() ? Please explain.

Also, please add a comment into the code, describing why the delay
is necessary.

Thanks,
Guenter
