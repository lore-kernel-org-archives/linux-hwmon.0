Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:44848 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753128AbcKSQZU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 19 Nov 2016 11:25:20 -0500
Date: Sat, 19 Nov 2016 08:25:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: linux-hwmon@vger.kernel.org,
        Jared Bents <jared.bents@rockwellcollins.com>
Subject: Re: [v2] hwmon: (amc6821) sign extension temperature
Message-ID: <20161119162518.GA22443@roeck-us.net>
References: <1479529238-9927-1-git-send-email-matthew.weber@rockwellcollins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1479529238-9927-1-git-send-email-matthew.weber@rockwellcollins.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Nov 18, 2016 at 10:20:38PM -0600, Matt Weber wrote:
> From: Jared Bents <jared.bents@rockwellcollins.com>
> 
> Converts the unsigned temperature values from the i2c read
> to be sign extended as defined in the datasheet so that
> negative temperatures are properly read.
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

Applied.

Guenter

> ---
> v1 -> v2
>  - checkpatch cleanup, removed space between cast
>    and function call.  truncated line over 80chars
> 
> ---
>  drivers/hwmon/amc6821.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
> index 12e851a..eb53e0b 100644
> --- a/drivers/hwmon/amc6821.c
> +++ b/drivers/hwmon/amc6821.c
> @@ -188,7 +188,8 @@ static struct amc6821_data *amc6821_update_device(struct device *dev)
>  			!data->valid) {
>  
>  		for (i = 0; i < TEMP_IDX_LEN; i++)
> -			data->temp[i] = i2c_smbus_read_byte_data(client,
> +			data->temp[i] = (int8_t)i2c_smbus_read_byte_data(
> +				client,
>  				temp_reg[i]);
>  
>  		data->stat1 = i2c_smbus_read_byte_data(client,
