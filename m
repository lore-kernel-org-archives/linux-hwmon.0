Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:33599 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751318AbcC2JOk (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 29 Mar 2016 05:14:40 -0400
Subject: Re: [PATCH] hwmon: (adm1031) Add device tree support
To: Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org
References: <1459241443-28392-1-git-send-email-joel@jms.id.au>
Cc: jk@ozlabs.org, linux-hwmon@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <56FA477C.8030607@roeck-us.net>
Date: Tue, 29 Mar 2016 02:14:36 -0700
MIME-Version: 1.0
In-Reply-To: <1459241443-28392-1-git-send-email-joel@jms.id.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 03/29/2016 01:50 AM, Joel Stanley wrote:
> This adds a of_device_id table so we can probe the driver using the
> device tree.
>
The subject line does not match the driver being modified; it suggests adm1031
while in reality the adm1275 driver is being modified.

> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   Documentation/devicetree/bindings/hwmon/adm1276.txt | 21 +++++++++++++++++++++

The bindings file name doesn't match the driver file name.

Besides, this should already work, through trivial bindings.
Is there a reason to believe that it does not already work ?

Guenter

>   drivers/hwmon/pmbus/adm1275.c                       | 15 +++++++++++++++
>   2 files changed, 36 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/adm1276.txt
>
> diff --git a/Documentation/devicetree/bindings/hwmon/adm1276.txt b/Documentation/devicetree/bindings/hwmon/adm1276.txt
> new file mode 100644
> index 000000000000..45eb51867c1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adm1276.txt
> @@ -0,0 +1,21 @@
> +* Analog Devices ADM1275 and compatabile power monitors
> +
> +Required node properties:
> +
> + - compatible: manufacturer and chip name, one of
> +
> +    "adi,adm1075"
> +    "adi,adm1275"
> +    "adi,adm1276"
> +    "adi,adm1278"
> +    "adi,adm1293"
> +    "adi,adm1294"
> +
> +- reg: I2C bus address of the device
> +
> +Example adm1275 node:
> +
> +power-sensor {
> +	compatible = "adi,adm1278";
> +	reg = <0x4c>;
> +}
> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> index 3baa4f4a8c5e..1476a127dbdb 100644
> --- a/drivers/hwmon/pmbus/adm1275.c
> +++ b/drivers/hwmon/pmbus/adm1275.c
> @@ -22,6 +22,7 @@
>   #include <linux/slab.h>
>   #include <linux/i2c.h>
>   #include <linux/bitops.h>
> +#include <linux/of.h>
>   #include "pmbus.h"
>
>   enum chips { adm1075, adm1275, adm1276, adm1278, adm1293, adm1294 };
> @@ -344,6 +345,19 @@ static const struct i2c_device_id adm1275_id[] = {
>   };
>   MODULE_DEVICE_TABLE(i2c, adm1275_id);
>
> +#ifdef CONFIG_OF
> +static const struct of_device_id adm1275_of_match[] = {
> +	{ .compatible = "adi,adm1075" },
> +	{ .compatible = "adi,adm1275" },
> +	{ .compatible = "adi,adm1276" },
> +	{ .compatible = "adi,adm1278" },
> +	{ .compatible = "adi,adm1293" },
> +	{ .compatible = "adi,adm1294" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, adm1275_of_match);
> +#endif
> +
>   static int adm1275_probe(struct i2c_client *client,
>   			 const struct i2c_device_id *id)
>   {
> @@ -598,6 +612,7 @@ static int adm1275_probe(struct i2c_client *client,
>   static struct i2c_driver adm1275_driver = {
>   	.driver = {
>   		   .name = "adm1275",
> +		   .of_match_table = of_match_ptr(adm1275_of_match),
>   		   },
>   	.probe = adm1275_probe,
>   	.remove = pmbus_do_remove,
>

