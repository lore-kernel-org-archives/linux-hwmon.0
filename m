Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:57054 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751411AbeCUKJr (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Mar 2018 06:09:47 -0400
Date: Wed, 21 Mar 2018 11:09:44 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (lm92) Remove spurious test that prevented
 max6635 detection
Message-ID: <20180321110944.4c6d7b98@endymion>
In-Reply-To: <20180321092709.22377-1-alvaro.gamez@hazent.com>
References: <20180321092709.22377-1-alvaro.gamez@hazent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Alvaro,

On Wed, 21 Mar 2018 10:27:09 +0100, Alvaro Gamez Machado wrote:
> An assumption was made that reads of a max6635 LM92_REG_MAN_ID register
> would return the last value read from any other of its registers.
> 
> This assumption is not only something that is not documented anywhere,

Correct.

> but it is also untrue, so this prevented max6635 recognition.

You can easily imagine that it must have been true at some point. Do
you really believe some developer would put that code in the driver
just for fun?

> 
> Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
> ---
> 
> Changes in v2:
>  Sorry, I seem to be slightly dyslexic and keep confusing max6635 <> max6335
> 
> 
>  drivers/hwmon/lm92.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/hwmon/lm92.c b/drivers/hwmon/lm92.c
> index 2a91974a10bb..a2c3f3080192 100644
> --- a/drivers/hwmon/lm92.c
> +++ b/drivers/hwmon/lm92.c
> @@ -272,16 +272,8 @@ static int max6635_check(struct i2c_client *client)
>  	u8 conf;
>  	int i;
>  
> -	/*
> -	 * No manufacturer ID register, so a read from this address will
> -	 * always return the last read value.
> -	 */
>  	temp_low = i2c_smbus_read_word_data(client, LM92_REG_TEMP_LOW);
> -	if (i2c_smbus_read_word_data(client, LM92_REG_MAN_ID) != temp_low)
> -		return 0;
>  	temp_high = i2c_smbus_read_word_data(client, LM92_REG_TEMP_HIGH);
> -	if (i2c_smbus_read_word_data(client, LM92_REG_MAN_ID) != temp_high)
> -		return 0;
>  
>  	/* Limits are stored as integer values (signed, 9-bit). */
>  	if ((temp_low & 0x7f00) || (temp_high & 0x7f00))

The detection was already rather weak for these devices. With this step
removed, it is below what I think is acceptable in terms of
reliability, as it could easily misdetect another chip and accidentally
bind to it. For a driver which uses SMBus word transactions, this could
be pretty problematic. So if register LM92_REG_MAN_ID does not contain
any useful value on the MAX6635, I would rather drop auto-detection of
these devices altogether, and only support them when explicitly
instantiated.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
