Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49532 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750898AbdHMNjU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 13 Aug 2017 09:39:20 -0400
Date: Sun, 13 Aug 2017 06:39:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: eajames@linux.vnet.ibm.com
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, joel@jms.id.au, jk@ozlabs.org,
        andrew@aj.id.au, cbostic@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [v2,3/4] hwmon: (pmbus): Add generic alarm bit for iin and pin
Message-ID: <20170813133918.GA5353@roeck-us.net>
References: <1502402270-15328-4-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1502402270-15328-4-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Aug 10, 2017 at 04:57:49PM -0500, eajames@linux.vnet.ibm.com wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Add PB_STATUS_INPUT as the generic alarm bit for iin and pin. We also
> need to redo the status register checking before setting up the boolean
> attribute, since it won't necessarily check STATUS_WORD if the device
> doesn't support it, which we need for this bit.
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 277d170..ef135d8 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -114,6 +114,7 @@ struct pmbus_data {
>  	 */
>  	u16 status[PB_NUM_STATUS_REG];
>  
> +	bool has_status_word;		/* device uses STATUS_WORD register */
>  	int (*read_status)(struct i2c_client *client, int page);
>  
>  	u8 currpage;
> @@ -1045,6 +1046,7 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
>  				      const struct pmbus_sensor_attr *attr)
>  {
>  	struct pmbus_sensor *base;
> +	bool upper = !!(attr->gbit & 0xff00);	/* need to check STATUS_WORD */
>  	int ret;
>  
>  	if (attr->label) {
> @@ -1065,9 +1067,11 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
>  		/*
>  		 * Add generic alarm attribute only if there are no individual
>  		 * alarm attributes, if there is a global alarm bit, and if
> -		 * the generic status register for this page is accessible.
> +		 * the generic status register (word or byte, depending on
> +		 * which global bit is set) for this page is accessible.
>  		 */
>  		if (!ret && attr->gbit &&
> +		    (!upper || (upper && data->has_status_word)) &&
>  		    pmbus_check_status_register(client, page)) {
>  			ret = pmbus_add_boolean(data, name, "alarm", index,
>  						NULL, NULL,
> @@ -1324,6 +1328,7 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
>  		.func = PMBUS_HAVE_IIN,
>  		.sfunc = PMBUS_HAVE_STATUS_INPUT,
>  		.sbase = PB_STATUS_INPUT_BASE,
> +		.gbit = PB_STATUS_INPUT,
>  		.limit = iin_limit_attrs,
>  		.nlimit = ARRAY_SIZE(iin_limit_attrs),
>  	}, {
> @@ -1408,6 +1413,7 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
>  		.func = PMBUS_HAVE_PIN,
>  		.sfunc = PMBUS_HAVE_STATUS_INPUT,
>  		.sbase = PB_STATUS_INPUT_BASE,
> +		.gbit = PB_STATUS_INPUT,
>  		.limit = pin_limit_attrs,
>  		.nlimit = ARRAY_SIZE(pin_limit_attrs),
>  	}, {
> @@ -1775,6 +1781,8 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
>  			dev_err(dev, "PMBus status register not found\n");
>  			return -ENODEV;
>  		}
> +	} else {
> +		data->has_status_word = true;
>  	}
>  
>  	/* Enable PEC if the controller supports it */
