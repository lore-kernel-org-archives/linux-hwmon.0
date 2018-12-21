Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39181 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392288AbeLUXik (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Dec 2018 18:38:40 -0500
Date: Fri, 21 Dec 2018 15:38:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Kangjie Lu <kjlu@umn.edu>
Cc: pakki001@umn.edu, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (lm80) fix a missing check of bus read in lm80
 probe
Message-ID: <20181221233836.GA17485@roeck-us.net>
References: <20181221191039.1519-1-kjlu@umn.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181221191039.1519-1-kjlu@umn.edu>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Dec 21, 2018 at 01:10:39PM -0600, Kangjie Lu wrote:
> In lm80_probe(), if lm80_read_value() fails, it returns a negative
> error number which is stored to data->fan[f_min] and will be further
> used. We should avoid using the data if the read fails.
> 
> The fix checks if lm80_read_value() fails, and if so, returns with the
> error number.
> 
> Signed-off-by: Kangjie Lu <kjlu@umn.edu>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/lm80.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/lm80.c b/drivers/hwmon/lm80.c
> index d91333557f04..85f797501aaf 100644
> --- a/drivers/hwmon/lm80.c
> +++ b/drivers/hwmon/lm80.c
> @@ -627,6 +627,7 @@ static int lm80_probe(struct i2c_client *client,
>  	struct device *dev = &client->dev;
>  	struct device *hwmon_dev;
>  	struct lm80_data *data;
> +	int rv;
>  
>  	data = devm_kzalloc(dev, sizeof(struct lm80_data), GFP_KERNEL);
>  	if (!data)
> @@ -639,8 +640,14 @@ static int lm80_probe(struct i2c_client *client,
>  	lm80_init_client(client);
>  
>  	/* A few vars need to be filled upon startup */
> -	data->fan[f_min][0] = lm80_read_value(client, LM80_REG_FAN_MIN(1));
> -	data->fan[f_min][1] = lm80_read_value(client, LM80_REG_FAN_MIN(2));
> +	rv = lm80_read_value(client, LM80_REG_FAN_MIN(1));
> +	if (rv < 0)
> +		return rv;
> +	data->fan[f_min][0] = rv;
> +	rv = lm80_read_value(client, LM80_REG_FAN_MIN(2));
> +	if (rv < 0)
> +		return rv;
> +	data->fan[f_min][1] = rv;
>  
>  	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
>  							   data, lm80_groups);
