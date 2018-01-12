Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:40251 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965085AbeALTod (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 12 Jan 2018 14:44:33 -0500
Received: by mail-pg0-f68.google.com with SMTP id q12so5205896pgt.7
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Jan 2018 11:44:33 -0800 (PST)
Date: Fri, 12 Jan 2018 11:44:30 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Emiliano Ingrassia <ingrassia@epigenesys.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: sht3x: wait predefined limits loading complete
 before access
Message-ID: <20180112194430.GA23495@roeck-us.net>
References: <20180112190600.GA21207@ingrassia.epigenesys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180112190600.GA21207@ingrassia.epigenesys.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Jan 12, 2018 at 08:06:00PM +0100, Emiliano Ingrassia wrote:
> An sht3x sensor include limits register which contains temperature
> and humidity limit values. After a reset, pre-defined values are loaded
> into that register. During the probe function, the driver reads the
> limits register. However, if the reads are made too early, for example
> because the I2C bus frequency is high (e.g. 400 kHz), the loading could be
> not completed and the sensor returns a NACK which causes the probe to fail.
> A delay of at least 500 us before the first read solves this issue.
> 
> Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
> ---
>  drivers/hwmon/sht3x.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
> index 6ea99cd6ae79..f2098443df2f 100644
> --- a/drivers/hwmon/sht3x.c
> +++ b/drivers/hwmon/sht3x.c
> @@ -732,6 +732,9 @@ static int sht3x_probe(struct i2c_client *client,
>  	mutex_init(&data->i2c_lock);
>  	mutex_init(&data->data_lock);
>  
> +	/* wait predefined limits loading complete before access */

The commit log explains the problem much better. This here is cryptic.
Would you understand this if you would read it in an arbitrary driver ?
Please consider something like:

	/*
	 * If an attempt to read the limits is made too early after sending
	 * the SHT3X_CMD_LENGTH command, the chip may respond with NACK.
	 * This was observed on BeagleBone Black on an i2c bus clocked
	 * at 400 kHz. The delay was chosen empirically.
	 */

Answering your question, no, I don't have any personal experience
with this chip. My comments are generic.

Guenter

> +	usleep_range(500, 600);
> +
>  	ret = limits_update(data);
>  	if (ret)
>  		return ret;
> -- 
> 2.15.1
> 
