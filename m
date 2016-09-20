Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:36001 "EHLO
        mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755226AbcITRZT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Sep 2016 13:25:19 -0400
Subject: Re: [PATCH v2] lm87: Allow channel data to be set from dts file.
To: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
References: <20160920052240.10242-1-mahoda.ratnayaka@alliedtelesis.co.nz>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <57E170DA.3020006@gmail.com>
Date: Tue, 20 Sep 2016 10:24:42 -0700
MIME-Version: 1.0
In-Reply-To: <20160920052240.10242-1-mahoda.ratnayaka@alliedtelesis.co.nz>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/19/16 22:22, Mahoda Ratnayaka wrote:
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
> Signed-off-by: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
> ---
> 
> Notes:
>      changes since v1:
>      Removed unncessary variables channel and np.
>      Update the code as per review comments.
> 
>  Documentation/devicetree/bindings/hwmon/lm87.txt | 9 +++++++++
>  drivers/hwmon/lm87.c                             | 7 ++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/lm87.txt b/Documentation/devicetree/bindings/hwmon/lm87.txt
> index fefcb48..1906e08 100644
> --- a/Documentation/devicetree/bindings/hwmon/lm87.txt
> +++ b/Documentation/devicetree/bindings/hwmon/lm87.txt

I do not see the file Documentation/devicetree/bindings/hwmon/lm87.txt in
Linux 4.8-rc7.  I am guessing that it might already be in a tree headed
upstream.  Can you point me to it?


> @@ -6,9 +6,18 @@ Required properties:
>  
>  - reg: I2C address
>  
> +optional properties:
> +- channels: Value for the channel mode register.
> +            This allows configuration of pins with
> +            selectable uses on the LM87 device (e.g.
> +            choosing between voltage and temperature
> +            inputs).
> +            See hwmon/lm87 for further information
> +

That is configuration information, not hardware description.
Devicetree contains hardware description.

Hardware description would instead be a property that said what
is hooked up to the shared pins, eg temp3, fan1, fan2, VID, or
IRQ.  The driver should know what value to place in channel for
each of the different cases.

>  Example:
>  
>  lm87@2e {
>  	compatible = "ti,lm87";
>  	reg = <0x2e>;
> +	channels=<0x4>;
>  };
> diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
> index a5e2958..358c1d4 100644
> --- a/drivers/hwmon/lm87.c
> +++ b/drivers/hwmon/lm87.c
> @@ -858,8 +858,13 @@ static void lm87_remove_files(struct i2c_client *client)
>  static void lm87_init_client(struct i2c_client *client)
>  {
>  	struct lm87_data *data = i2c_get_clientdata(client);
> +	u8 val = 0;
>  
> -	if (dev_get_platdata(&client->dev)) {
> +	if (!of_property_read_u8(client->dev.of_node, "channels", &val)) {
> +		data->channel = val;
> +		lm87_write_value(client,
> +				 LM87_REG_CHANNEL_MODE, data->channel);
> +	} else if (dev_get_platdata(&client->dev)) {
>  		data->channel = *(u8 *)dev_get_platdata(&client->dev);
>  		lm87_write_value(client,
>  				 LM87_REG_CHANNEL_MODE, data->channel);
> 

