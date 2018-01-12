Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:46542 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965156AbeALWU3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 12 Jan 2018 17:20:29 -0500
Received: by mail-pg0-f65.google.com with SMTP id s9so3635128pgq.13
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Jan 2018 14:20:29 -0800 (PST)
Date: Fri, 12 Jan 2018 14:20:27 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Emiliano Ingrassia <ingrassia@epigenesys.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: sht3x: wait predefined limits loading complete
 before access
Message-ID: <20180112222027.GA2804@roeck-us.net>
References: <20180112204228.GA1182@ingrassia.epigenesys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180112204228.GA1182@ingrassia.epigenesys.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Jan 12, 2018 at 09:42:28PM +0100, Emiliano Ingrassia wrote:
> An sht3x sensor include limits register which contains temperature
> and humidity limit values. After a reset, pre-defined values are loaded
> into that register. During the probe function, the driver reads the
> limits register. However, if the reads are made too early, and the bus
> is clocked at high frequencies (e.g. 100 kHz or more), the loading could be
> not completed and the sensor returns a NACK which causes the probe to fail.
> A delay of at least 500 us before the first read solves this issue.
> 
> Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/sht3x.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
> index 6ea99cd6ae79..370b57dafab7 100644
> --- a/drivers/hwmon/sht3x.c
> +++ b/drivers/hwmon/sht3x.c
> @@ -732,6 +732,13 @@ static int sht3x_probe(struct i2c_client *client,
>  	mutex_init(&data->i2c_lock);
>  	mutex_init(&data->data_lock);
>  
> +	/*
> +	 * An attempt to read limits register too early
> +	 * causes a NACK response from the chip.
> +	 * Waiting for an empirical delay of 500 us solves the issue.
> +	 */
> +	usleep_range(500, 600);
> +
>  	ret = limits_update(data);
>  	if (ret)
>  		return ret;
> -- 
> 2.15.1
> 
