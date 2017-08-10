Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:40262 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753048AbdHJQP0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Aug 2017 12:15:26 -0400
Date: Thu, 10 Aug 2017 09:15:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Anton Vasilyev <vasilyev@ispras.ru>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: Re: [PATCH] hwmon:(stts751) buffer overread on wrong chip
 configuration
Message-ID: <20170810161522.GA8881@roeck-us.net>
References: <1502378614-13011-1-git-send-email-vasilyev@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1502378614-13011-1-git-send-email-vasilyev@ispras.ru>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Aug 10, 2017 at 06:23:34PM +0300, Anton Vasilyev wrote:
> If stts751 hw by some reason reports conversion rate bigger then 9:
> 	ret = i2c_smbus_read_byte_data(priv->client, STTS751_REG_RATE);
> then dereference stts751_intervals[priv->interval] leads to buffer
> overread.
> 
> The path adds sanity check for value read from chip.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Anton Vasilyev <vasilyev@ispras.ru>
> ---
>  drivers/hwmon/stts751.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/hwmon/stts751.c b/drivers/hwmon/stts751.c
> index d56251d..f6eddbd 100644
> --- a/drivers/hwmon/stts751.c
> +++ b/drivers/hwmon/stts751.c
> @@ -718,6 +718,10 @@ static int stts751_read_chip_config(struct stts751_priv *priv)
>  	ret = i2c_smbus_read_byte_data(priv->client, STTS751_REG_RATE);
>  	if (ret < 0)
>  		return ret;
> +	if (ret > ARRAY_SIZE(stts751_intervals)) {

Great catch, but should this be >= ?

Guenter

> +		dev_err(priv->dev, "Unrecognized conversion rate 0x%x\n", ret);
> +		return -ENODEV;
> +	}
>  	priv->interval = ret;
>  
>  	ret = stts751_read_reg16(priv, &priv->event_max,
> -- 
> 2.7.4
> 
