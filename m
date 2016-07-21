Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:39485 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750884AbcGUNld (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Thu, 21 Jul 2016 09:41:33 -0400
Subject: Re: [patch] Disable PMBus status check for DPS400 PSU controller
To: Vadim Pasternak <vadimp@mellanox.com>
References: <1469112953-77032-1-git-send-email-vadimp@mellanox.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, jiri@resnulli.us
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5790D10A.9070404@roeck-us.net>
Date: Thu, 21 Jul 2016 06:41:30 -0700
MIME-Version: 1.0
In-Reply-To: <1469112953-77032-1-git-send-email-vadimp@mellanox.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Vadim,

On 07/21/2016 07:55 AM, Vadim Pasternak wrote:
> pmbus/dps400: disable PMBus status check through platform data structure to
> provide support for PSU DPS-460, DPS-800 from Delta Electronics, INC and for
> SGD009 from Acbel Polytech, INC.
> These devices do not support the STATUS_CML register, and reports communication
> error in response to this command.
> For this reason for these controllers, the status register check is disabled.
>

The subject should be "hwmon: (pmbus) Add explicit support for DPS-460, DPS-800,
and SGD009", followed by something like

"Provide support for PSU DPS-460, DPS-800 from Delta Electronics, INC and for
SGD009 from Acbel Polytech, INC.
These devices do not support the STATUS_CML register and report a communication
error in response to this command. For this reason, the status register check
is disabled for these controllers."

> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
>
Unnecessary blank line

> Reviewed-by: Jiri Pirko <jiri@mellanox.com>
> ---
>   drivers/hwmon/pmbus/pmbus.c      | 16 ++++++++++++++++
>   drivers/hwmon/pmbus/pmbus_core.c |  3 +++
>   2 files changed, 19 insertions(+)
>
> diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
> index 0a74991..44c736a 100644
> --- a/drivers/hwmon/pmbus/pmbus.c
> +++ b/drivers/hwmon/pmbus/pmbus.c
> @@ -25,6 +25,7 @@
>   #include <linux/slab.h>
>   #include <linux/mutex.h>
>   #include <linux/i2c.h>
> +#include <linux/i2c/pmbus.h>
>   #include "pmbus.h"
>
>   /*
> @@ -167,14 +168,26 @@ static int pmbus_probe(struct i2c_client *client,
>   		       const struct i2c_device_id *id)
>   {
>   	struct pmbus_driver_info *info;
> +	struct pmbus_platform_data *pdata = NULL;
> +	struct device *dev = &client->dev;
>
>   	info = devm_kzalloc(&client->dev, sizeof(struct pmbus_driver_info),
>   			    GFP_KERNEL);
>   	if (!info)
>   		return -ENOMEM;
> +	if (!strcmp(id->name, "dps460") || !strcmp(id->name, "dps460") ||

Should the second string be dps800 ?

> +	    !strcmp(id->name, "sgd009")) {
> +		pdata = kzalloc(sizeof(struct pmbus_platform_data), GFP_KERNEL);

Please use devm_kzalloc().

> +		if (!pdata) {
> +			kfree(info);

info was allocated with devm_kzalloc() and thus does not need kfree (besides,
if at all, it would have to be devm_kfree).

> +			return -ENOMEM;
> +		}
> +		pdata->flags = PMBUS_SKIP_STATUS_CHECK;
> +	}
>
>   	info->pages = id->driver_data;
>   	info->identify = pmbus_identify;
> +	dev->platform_data = pdata;
>
>   	return pmbus_do_probe(client, id, info);
>   }
> @@ -199,6 +212,9 @@ static const struct i2c_device_id pmbus_id[] = {
>   	{"tps544c20", 1},
>   	{"tps544c25", 1},
>   	{"udt020", 1},
> +	{"dps460", 1},
> +	{"dps800", 1},
> +	{"sgd009", 1},

Please list in alphabetic order.

>   	{}
>   };
>
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index ba59eae..3d98070 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -1931,8 +1931,11 @@ EXPORT_SYMBOL_GPL(pmbus_do_probe);
>   int pmbus_do_remove(struct i2c_client *client)
>   {
>   	struct pmbus_data *data = i2c_get_clientdata(client);
> +	const struct pmbus_platform_data *pdata =
> +				dev_get_platdata(&client->dev);
>   	hwmon_device_unregister(data->hwmon_dev);
>   	kfree(data->group.attrs);
> +	kfree(pdata);
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(pmbus_do_remove);
>

