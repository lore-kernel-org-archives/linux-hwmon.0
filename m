Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:59945 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753643AbcHSEh2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 Aug 2016 00:37:28 -0400
Subject: Re: [PATCH] hwmon: (amc6821) basic device tree support
To: Matt Weber <matthew.weber@rockwellcollins.com>,
        linux-hwmon@vger.kernel.org
References: <1471579258-16148-1-git-send-email-matthew.weber@rockwellcollins.com>
Cc: jdelvare@suse.com, Ronak Desai <ronak.desai@rockwellcollins.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <4b6be325-7949-62ac-5125-71382b84c4b9@roeck-us.net>
Date: Thu, 18 Aug 2016 21:37:26 -0700
MIME-Version: 1.0
In-Reply-To: <1471579258-16148-1-git-send-email-matthew.weber@rockwellcollins.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 08/18/2016 09:00 PM, Matt Weber wrote:
> Enables basic enumeration of a amc6821 device via device tree.
>

Same question as with ucd9000. i2c devices normally instantiate on devicetree
based on the i2c id table. Are you sure this is needed ?

Guenter

> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
> ---
>  drivers/hwmon/amc6821.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
> index 12e851a..77b5cf4 100644
> --- a/drivers/hwmon/amc6821.c
> +++ b/drivers/hwmon/amc6821.c
> @@ -32,6 +32,9 @@
>  #include <linux/err.h>
>  #include <linux/mutex.h>
>
> +#ifdef CONFIG_OF
> +#include <linux/of.h>
> +#endif
>  /*
>   * Addresses to scan.
>   */
> @@ -996,6 +999,12 @@ static int amc6821_probe(struct i2c_client *client,
>  	return PTR_ERR_OR_ZERO(hwmon_dev);
>  }
>
> +#ifdef CONFIG_OF
> +static const struct of_device_id amc6821_dt_match[] = {
> +	{ .compatible = "ti,amc6821", .data = (void *)amc6821 },
> +	{ }
> +};
> +#endif
>  static const struct i2c_device_id amc6821_id[] = {
>  	{ "amc6821", amc6821 },
>  	{ }
> @@ -1007,6 +1016,9 @@ static struct i2c_driver amc6821_driver = {
>  	.class = I2C_CLASS_HWMON,
>  	.driver = {
>  		.name	= "amc6821",
> +#ifdef CONFIG_OF
> +		.of_match_table = of_match_ptr(amc6821_dt_match),
> +#endif
>  	},
>  	.probe = amc6821_probe,
>  	.id_table = amc6821_id,
>

