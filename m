Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:43284 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752021AbdHMNew (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 13 Aug 2017 09:34:52 -0400
Date: Sun, 13 Aug 2017 06:34:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Anton Vasilyev <vasilyev@ispras.ru>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: Re: [v2] hwmon:(stts751) buffer overread on wrong chip configuration
Message-ID: <20170813133448.GA4869@roeck-us.net>
References: <1502383592-14389-1-git-send-email-vasilyev@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1502383592-14389-1-git-send-email-vasilyev@ispras.ru>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Aug 10, 2017 at 07:46:32PM +0300, Anton Vasilyev wrote:
> If stts751 hw by some reason reports conversion rate bigger then 9:
>         ret = i2c_smbus_read_byte_data(priv->client, STTS751_REG_RATE);
> then dereference stts751_intervals[priv->interval] leads to buffer
> overread.
> 
> The path adds sanity check for value stored on chip.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Anton Vasilyev <vasilyev@ispras.ru>

Applied (after s/path/patch/)

Thanks,
Guenter

> ---
> v2: Fixed Guenter's remark about comparison
> ---
>  drivers/hwmon/stts751.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/hwmon/stts751.c b/drivers/hwmon/stts751.c
> index d56251d..3f940fb 100644
> --- a/drivers/hwmon/stts751.c
> +++ b/drivers/hwmon/stts751.c
> @@ -718,6 +718,10 @@ static int stts751_read_chip_config(struct stts751_priv *priv)
>  	ret = i2c_smbus_read_byte_data(priv->client, STTS751_REG_RATE);
>  	if (ret < 0)
>  		return ret;
> +	if (ret >= ARRAY_SIZE(stts751_intervals)) {
> +		dev_err(priv->dev, "Unrecognized conversion rate 0x%x\n", ret);
> +		return -ENODEV;
> +	}
>  	priv->interval = ret;
>  
>  	ret = stts751_read_reg16(priv, &priv->event_max,
