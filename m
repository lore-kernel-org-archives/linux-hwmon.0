Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57923 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751393AbcJNRar (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Oct 2016 13:30:47 -0400
Date: Fri, 14 Oct 2016 10:06:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Joel Stanley <joel@jms.id.au>
Cc: jdelvare@suse.com, Yi Li <adamliyi@msn.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (adm1275) Enable adm1278 VOUT sampling
Message-ID: <20161014170601.GC21425@roeck-us.net>
References: <20161014100605.23887-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161014100605.23887-1-joel@jms.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Oct 14, 2016 at 08:36:05PM +1030, Joel Stanley wrote:
> From: Yi Li <adamliyi@msn.com>
> 
> The adm1278 can optionally monitor the VOUT pin. This functionality is
> not enabled at reset, so PMON_CONFIG needs to be modified in order to
> enable it.
> 
> Signed-off-by: Yi Li <adamliyi@msn.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> 
> Guenter, I'm not sure if this is a valid thing to do in the probe function. If
> not, can you suggest an alternative method for enabling this?
> 
Normally it would be set by the BIOS or ROMMON, though it doesn't seem to make
much sense to not enable it with this chip. Another option would be to enable it
through devicetree, but that would add quite some complexity which I'd rather
avoid. So doing it here is fine.

>  drivers/hwmon/pmbus/adm1275.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> index 3baa4f4a8c5e..7d1f5f7891cc 100644
> --- a/drivers/hwmon/pmbus/adm1275.c
> +++ b/drivers/hwmon/pmbus/adm1275.c
> @@ -500,6 +500,19 @@ static int adm1275_probe(struct i2c_client *client,
>  		tindex = 3;
>  
>  		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT;
> +
> +		/* By default when reset VOUT is not enabled */
> +		if (!(config & ADM1278_VOUT_EN)) {
> +			config |= ADM1278_VOUT_EN;
> +			ret = i2c_smbus_write_byte_data(client,
> +							ADM1275_PMON_CONFIG,
> +							config);
> +			if (ret < 0) {
> +				dev_warn(&client->dev,
> +					"Failed to enable VOUT monitoring\n");

Two options: Either abort in this case (after all, something _is_ wrong)
and return an error (and always set PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT),
or clear ADM1278_VOUT_EN in config to make sure it is not enabled further below.

Thanks,
Guenter

> +			}
> +		}
> +
>  		if (config & ADM1278_TEMP1_EN)
>  			info->func[0] |=
>  				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
> -- 
> 2.9.3
> 
