Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:46841 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753362AbdJUQKR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 21 Oct 2017 12:10:17 -0400
Date: Sat, 21 Oct 2017 09:10:13 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: eajames@linux.vnet.ibm.com
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, andrew@aj.id.au,
        "Edward A. James" <eajames@us.ibm.com>
Subject: Re: drivers (pmbus): ir35221: Set PMBUS_PAGE before reading id and
 model
Message-ID: <20171021161013.GA12794@roeck-us.net>
References: <1508446628-13112-1-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1508446628-13112-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Oct 19, 2017 at 03:57:08PM -0500, eajames@linux.vnet.ibm.com wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> The MFR_ID and MFR_MODEL, which are manually read before probing the
> pmbus core,  are only valid for the two pages that the ir35221 has
> available. Since we don't know the state of the device when we start
> probing, set the page number first before reading id and model.
> 
If the device only has two pages, it is highly unlikely that it is possible
to select another page which is not supported; any attempts to do so should
result in a command error.

Is this theory or based on an actual problem observed ? If so, it will require
some additional explanation.

Thanks,
Guenter

> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/hwmon/pmbus/ir35221.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/ir35221.c b/drivers/hwmon/pmbus/ir35221.c
> index 8b906b4..9a53930 100644
> --- a/drivers/hwmon/pmbus/ir35221.c
> +++ b/drivers/hwmon/pmbus/ir35221.c
> @@ -267,6 +267,12 @@ static int ir35221_probe(struct i2c_client *client,
>  				| I2C_FUNC_SMBUS_READ_BLOCK_DATA))
>  		return -ENODEV;
>  
> +	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Failed to set PMBUS_PAGE\n");
> +		return ret;
> +	}
> +
>  	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
>  	if (ret < 0) {
>  		dev_err(&client->dev, "Failed to read PMBUS_MFR_ID\n");
