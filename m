Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:55097 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753215AbcKPWvH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 16 Nov 2016 17:51:07 -0500
Date: Wed, 16 Nov 2016 14:51:03 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: linux-hwmon@vger.kernel.org,
        Jared Bents <jared.bents@rockwellcollins.com>
Subject: Re: [PATCH] hwmon: (amc6821) sign extension temperature
Message-ID: <20161116225103.GB11821@roeck-us.net>
References: <1479335033-44479-1-git-send-email-matthew.weber@rockwellcollins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1479335033-44479-1-git-send-email-matthew.weber@rockwellcollins.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Nov 16, 2016 at 04:23:53PM -0600, Matt Weber wrote:
> From: Jared Bents <jared.bents@rockwellcollins.com>
> 
> Converts the unsigned temperature values from the i2c read
> to be sign extended as defined in the datasheet so that
> negative temperatures are properly read.
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  drivers/hwmon/amc6821.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
> index 12e851a..d7368f7 100644
> --- a/drivers/hwmon/amc6821.c
> +++ b/drivers/hwmon/amc6821.c
> @@ -188,7 +188,7 @@ static struct amc6821_data *amc6821_update_device(struct device *dev)
>  			!data->valid) {
>  
>  		for (i = 0; i < TEMP_IDX_LEN; i++)
> -			data->temp[i] = i2c_smbus_read_byte_data(client,
> +			data->temp[i] = (int8_t) i2c_smbus_read_byte_data(client,

How does that fix anything ? The only difference is that errors reported from
i2c_smbus_read_byte_data() are now capped off and stored as 0xff and no longer
as negative numbers.  I don't see how a value of 0xff read from the chip would
now be reported as -1 degrees C; it should be reported as 255 degrees C as it
was all along. What am I missing here ?

A real fix would be to actually check for errors either here or in the show
function (temp[] < 0 indicates a transfer error), and to use sign_extend()
to convert the 8-bit reading to a signed value.

Guenter

>  				temp_reg[i]);
>  
>  		data->stat1 = i2c_smbus_read_byte_data(client,
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
