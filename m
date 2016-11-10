Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49052 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934560AbcKJXrM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Nov 2016 18:47:12 -0500
Date: Thu, 10 Nov 2016 15:47:07 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] lm87: Allow LM87_REG_CHANNEL_MODE to be set via DT
Message-ID: <20161110234707.GA14199@roeck-us.net>
References: <20161110171936.GA29537@obsidianresearch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161110171936.GA29537@obsidianresearch.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Nov 10, 2016 at 10:19:36AM -0700, Jason Gunthorpe wrote:
> This compliments the existing scheme that lets it be set via
> platform_data.
> 
> Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>

I would prefer https://www.spinics.net/lists/devicetree/msg148819.html
which appears to address the same problem and is less cryptic.

NACK unless someone convinces me otherwise.

Guenter

> ---
>  Documentation/devicetree/bindings/hwmon/lm87.txt | 27 ++++++++++++++++++++++++
>  drivers/hwmon/lm87.c                             |  8 ++++++-
>  2 files changed, 34 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/lm87.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/lm87.txt b/Documentation/devicetree/bindings/hwmon/lm87.txt
> new file mode 100644
> index 00000000000000..4ea2646ce8d2f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/lm87.txt
> @@ -0,0 +1,27 @@
> +* LM87 I2C Temperature and Fan sensor
> +
> +Required properties:
> +- compatible: should contain one of
> +		* "national,lm87"
> +		* "ti,lm87"
> +
> +Optional properties:
> +- channel-mode: Write the specified value to register 0x16. If not specified
> +                the driver will read the value from the chip at startup.
> +
> +		The value controls how the driver operates certain multi-use
> +		pins, eg bit 2 will select between temp_input3 or
> +		in0&in5 operation.
> +
> +See Documentation/devicetree/bindings/i2c/i2c.txt for more required and
> +optional properties.
> +
> +Example:
> +
> +i2c_master {
> +	temperature-sensor@0 {
> +		compatible = "ti,lm87";
> +		channel-mode = <0x4>;
> +		reg = <0>;
> +	};
> +};
> diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
> index 81cb898245a107..ccc0c913b4534e 100644
> --- a/drivers/hwmon/lm87.c
> +++ b/drivers/hwmon/lm87.c
> @@ -853,9 +853,15 @@ static void lm87_restore_config(void *arg)
>  static int lm87_init_client(struct i2c_client *client)
>  {
>  	struct lm87_data *data = i2c_get_clientdata(client);
> +	u32 channel;
>  	int rc;
>  
> -	if (dev_get_platdata(&client->dev)) {
> +	if (client->dev.of_node &&
> +	    !of_property_read_u32(client->dev.of_node, "channel-mode",
> +				  &channel)) {
> +		data->channel = channel;
> +		lm87_write_value(client, LM87_REG_CHANNEL_MODE, data->channel);
> +	} else if (dev_get_platdata(&client->dev)) {
>  		data->channel = *(u8 *)dev_get_platdata(&client->dev);
>  		lm87_write_value(client,
>  				 LM87_REG_CHANNEL_MODE, data->channel);
> -- 
> 2.7.4
