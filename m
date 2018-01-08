Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:45252 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755225AbeAHVa1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 8 Jan 2018 16:30:27 -0500
Date: Mon, 8 Jan 2018 13:30:25 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        joel@jms.id.au
Subject: Re: [PATCH] hwmon (pmbus): cffps: Add PMBUS_SKIP_STATUS_CHECK
Message-ID: <20180108213025.GA5972@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Jan 08, 2018 at 03:10:09PM -0600, Eddie James wrote:
> This power supply device regularly fails to read VOUT_MODE due to the
> CML bit going high. This results in an incorrect exponent used for the
> voltage data, and therefore the power supply reports incorrect voltage.
> Work around this by setting the pmbus flag to skip the CML check.
> 
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/ibm-cffps.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
> index de254747..2d6f4f4 100644
> --- a/drivers/hwmon/pmbus/ibm-cffps.c
> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> @@ -15,6 +15,7 @@
>  #include <linux/jiffies.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/pmbus.h>
>  
>  #include "pmbus.h"
>  
> @@ -268,6 +269,10 @@ static int ibm_cffps_read_word_data(struct i2c_client *client, int page,
>  	.read_word_data = ibm_cffps_read_word_data,
>  };
>  
> +static struct pmbus_platform_data ibm_cffps_pdata = {
> +	.flags = PMBUS_SKIP_STATUS_CHECK,
> +};
> +
>  static int ibm_cffps_probe(struct i2c_client *client,
>  			   const struct i2c_device_id *id)
>  {
> @@ -276,6 +281,7 @@ static int ibm_cffps_probe(struct i2c_client *client,
>  	struct dentry *ibm_cffps_dir;
>  	struct ibm_cffps *psu;
>  
> +	client->dev.platform_data = &ibm_cffps_pdata;
>  	rc = pmbus_do_probe(client, id, &ibm_cffps_info);
>  	if (rc)
>  		return rc;
> -- 
> 1.8.3.1
> 
