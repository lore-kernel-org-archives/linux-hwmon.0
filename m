Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:48944 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933502AbcIFRUp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Sep 2016 13:20:45 -0400
Date: Tue, 6 Sep 2016 10:20:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH] hwmon: (lm87) Add channel data from the dts file.
Message-ID: <20160906172040.GA18235@roeck-us.net>
References: <20160905053614.7135-1-mahoda.ratnayaka@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160905053614.7135-1-mahoda.ratnayaka@alliedtelesis.co.nz>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Sep 05, 2016 at 05:36:14PM +1200, Mahoda Ratnayaka wrote:
> Currently there is no method for setting the channel
> value from the DTS file. When, the driver uses a dts
> file to initialize the driver platform_data is not set.
> As a the result channel variable may not be set correctly.
> 
> Without the channel variable set correctly, some of the
> sensors will not be initialized correctly. For example
> temp3 sensor sysfs entries.
> 
> This adds the required functionality to set the channel
> variable from the DTS file. This is done via reading the
> reading a property named "channel" from the lm87 driver.
> 
Devicetree properties need to be documented and approved by devicetree
maintainers.

> Signed-off-by: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
> ---
>  drivers/hwmon/lm87.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
> index a5e2958..ac0018b 100644
> --- a/drivers/hwmon/lm87.c
> +++ b/drivers/hwmon/lm87.c
> @@ -858,14 +858,25 @@ static void lm87_remove_files(struct i2c_client *client)
>  static void lm87_init_client(struct i2c_client *client)
>  {
>  	struct lm87_data *data = i2c_get_clientdata(client);
> +	struct device_node *np = NULL;
> +	const char *channel = NULL;
> +	u8 val;
>  
> -	if (dev_get_platdata(&client->dev)) {
> +	np = client->dev.of_node;
> +
> +	/* Use value read from the dts file to setup channel value. */

Isn't that obvious from the code ?

> +	if (np && of_property_read_u8(np, "channels", &val) == 0) {

When using a function, you need to include the file declaring it,
in this case linux/of.h. of_property_read_u8( )already checks for
np == NULL, so there is no need to check it here. Instead of "== 0",
please use "!".

> +		data->channel = val;
> +		lm87_write_value(client,
> +				 LM87_REG_CHANNEL_MODE, data->channel);
> +	} else if (dev_get_platdata(&client->dev)) {
>  		data->channel = *(u8 *)dev_get_platdata(&client->dev);
>  		lm87_write_value(client,
>  				 LM87_REG_CHANNEL_MODE, data->channel);
>  	} else {
>  		data->channel = lm87_read_value(client, LM87_REG_CHANNEL_MODE);
>  	}
> +

Please no unnecessary whitespace changes.

>  	data->config = lm87_read_value(client, LM87_REG_CONFIG) & 0x6F;
>  
>  	if (!(data->config & 0x01)) {
> -- 
> 2.9.3
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
