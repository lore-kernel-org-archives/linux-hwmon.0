Return-path: <jdelvare@suse.de>
Date: Mon, 25 Jul 2016 10:32:01 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, jiri@resnulli.us
Subject: Re: [patch] hwmon: (pmbus) Add explicit support for DPS-460,
 DPS-800, and SGD009
Message-ID: <20160725103201.2c64653a@endymion>
In-Reply-To: <1469434229-162391-1-git-send-email-vadimp@mellanox.com>
References: <1469434229-162391-1-git-send-email-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Hi Vadim,

On Mon, 25 Jul 2016 08:10:29 +0000, Vadim Pasternak wrote:
> Provide support for PSU DPS-460, DPS-800 from Delta Electronics, INC and for
> SGD009 from Acbel Polytech, INC.
> These devices do not support the STATUS_CML register, and reports a
> communication error in response to this command.
> For this reason, the status register check is disabled for these controllers.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> Reviewed-by: Jiri Pirko <jiri@mellanox.com>
> ---
>  drivers/hwmon/pmbus/pmbus.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
> index 0a74991..f28de37 100644
> --- a/drivers/hwmon/pmbus/pmbus.c
> +++ b/drivers/hwmon/pmbus/pmbus.c
> @@ -25,6 +25,7 @@
>  #include <linux/slab.h>
>  #include <linux/mutex.h>
>  #include <linux/i2c.h>
> +#include <linux/i2c/pmbus.h>
>  #include "pmbus.h"
>  
>  /*
> @@ -167,14 +168,27 @@ static int pmbus_probe(struct i2c_client *client,
>  		       const struct i2c_device_id *id)
>  {
>  	struct pmbus_driver_info *info;
> +	struct pmbus_platform_data *pdata = NULL;
> +	struct device *dev = &client->dev;
>  
>  	info = devm_kzalloc(&client->dev, sizeof(struct pmbus_driver_info),
>  			    GFP_KERNEL);
>  	if (!info)
>  		return -ENOMEM;

A blank line here would improve readability IMHO.

> +	if (!strcmp(id->name, "dps460") || !strcmp(id->name, "dps800") ||
> +	    !strcmp(id->name, "sgd009")) {
> +		pdata = devm_kzalloc(&client->dev,

You have defined dev, you might as well use it here, and also in the
other devm_kzalloc call.

> +				     sizeof(struct pmbus_platform_data),
> +				     GFP_KERNEL);
> +		if (!pdata)
> +			return -ENOMEM;
> +
> +		pdata->flags = PMBUS_SKIP_STATUS_CHECK;
> +	}
>  
>  	info->pages = id->driver_data;
>  	info->identify = pmbus_identify;
> +	dev->platform_data = pdata;
>  
>  	return pmbus_do_probe(client, id, info);
>  }
> @@ -186,6 +200,8 @@ static const struct i2c_device_id pmbus_id[] = {
>  	{"adp4000", 1},
>  	{"bmr453", 1},
>  	{"bmr454", 1},
> +	{"dps460", 1},
> +	{"dps800", 1},
>  	{"mdt040", 1},
>  	{"ncp4200", 1},
>  	{"ncp4208", 1},
> @@ -193,6 +209,7 @@ static const struct i2c_device_id pmbus_id[] = {
>  	{"pdt006", 1},
>  	{"pdt012", 1},
>  	{"pmbus", 0},
> +	{"sgd009", 1},
>  	{"tps40400", 1},
>  	{"tps544b20", 1},
>  	{"tps544b25", 1},

(non-authoritative)
Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
