Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:60802 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936596AbcJQRUd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Oct 2016 13:20:33 -0400
Date: Mon, 17 Oct 2016 10:20:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Joel Stanley <joel@jms.id.au>
Cc: jdelvare@suse.com, Yi Li <adamliyi@msn.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (adm1275) Enable adm1278 VOUT sampling
Message-ID: <20161017172030.GA19820@roeck-us.net>
References: <20161017080853.7627-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161017080853.7627-1-joel@jms.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Oct 17, 2016 at 06:38:53PM +1030, Joel Stanley wrote:
> From: Yi Li <adamliyi@msn.com>
> 
> The adm1278 can optionally monitor the VOUT pin. This functioanltiy is
> not enabled at reset, so PMON_CONFIG needs to be modified in order to
> enable it.
> 
> Signed-off-by: Yi Li <adamliyi@msn.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Applied to -next, after s/functioanltiy/functionality/

Thanks,
Guenter

> ---
> v2:
>  Return an error when unable to enable VOUT monitoring as suggestd by Guenter
> 
>  drivers/hwmon/pmbus/adm1275.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> index 3baa4f4a8c5e..9940849351a1 100644
> --- a/drivers/hwmon/pmbus/adm1275.c
> +++ b/drivers/hwmon/pmbus/adm1275.c
> @@ -499,15 +499,27 @@ static int adm1275_probe(struct i2c_client *client,
>  		pindex = 2;
>  		tindex = 3;
>  
> -		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT;
> +		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
> +			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
> +
> +		/* By default when reset VOUT is not enabled */

I also rephrased the comment a bit to make it easier to understand.

> +		if (!(config & ADM1278_VOUT_EN)) {
> +			config |= ADM1278_VOUT_EN;
> +			ret = i2c_smbus_write_byte_data(client,
> +							ADM1275_PMON_CONFIG,
> +							config);
> +			if (ret < 0) {
> +				dev_err(&client->dev,
> +					"Failed to enable VOUT monitoring\n");
> +				return -ENODEV;
> +			}
> +		}
> +
>  		if (config & ADM1278_TEMP1_EN)
>  			info->func[0] |=
>  				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
>  		if (config & ADM1278_VIN_EN)
>  			info->func[0] |= PMBUS_HAVE_VIN;
> -		if (config & ADM1278_VOUT_EN)
> -			info->func[0] |=
> -				PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
>  		break;
>  	case adm1293:
>  	case adm1294:
> -- 
> 2.9.3
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
