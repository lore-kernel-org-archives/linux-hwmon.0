Return-Path: <SRS0=fIHL=VG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE79C73C46
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Jul 2019 13:39:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5975520861
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Jul 2019 13:39:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4GNzB4m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbfGINj7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Jul 2019 09:39:59 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40890 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbfGINj7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Jul 2019 09:39:59 -0400
Received: by mail-pg1-f196.google.com with SMTP id w10so9465413pgj.7
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jul 2019 06:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/h4UtQW6Empdg7JX7AymPC9sAAtaNRNxCjw2GRkWVaw=;
        b=A4GNzB4m6CNVhnZYl+vVI6HTM7Azp6NfEo+DydUr/dJtWH0j388NABKQuXbTqqGozc
         6frsbhDX3Voi4jgIy73gamy/6qitlklniud6lXQqHeHWYYFsZ+e81bDh3XfiP7N3aOX0
         M/6KflhkCbtbV+WMsMUO3k3JPuEWuIfcpo9N0ALWaMMBrKJwABcCZhZvcbImGF1kNwF7
         1Vr7HMePPth2OS4tOGkVz0BJcnTqUkUONB87QOr17PAcIoVmeENSjjWPZEzP7EmQApx4
         B6dOqCgaHyl8R+c+jtQxLeeqoizFMBOwQzqK8miOAL9xQmDHqosbGuDdDV7XtO77Lt+r
         85uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/h4UtQW6Empdg7JX7AymPC9sAAtaNRNxCjw2GRkWVaw=;
        b=LpV1FX9wIY/C3HKeTBF9/fEGJ5Ke83dL2AGlKoby0AWWC6sa6JIaIw4OiCguLYf8B+
         fPlOqzQjHKGACVJT3PXvNgmkGAWMDSWBg/3E2VpbMckEFLAJPoMc8nJgTklaKyPEFMx3
         BSv7C2XBqT18U3sOESvwKBTqqNHReCEHCCLiS+XYPNITNG2+ysGPf0MCyZKlFm+SKKo+
         qk53AF5LSwKp8hlDuaxADxw+HIw8RA8bK/pKQGTD0qVZKLu26VqWVMpmIe46MCmyWLpn
         Vx+UXYhwvXZBODsGk/OVeavmmEMO4/Bc220vD6LKBJhylIifhD/DBnbGdZe7yD9DGsRg
         vkmw==
X-Gm-Message-State: APjAAAUHp0/XKaS+11MX0O0iCQaZBuniC+4lcYHAD6ALK0MZ8vi04VdR
        RhznHYw/2YE11FI8c9v1R7Jj6csz
X-Google-Smtp-Source: APXvYqw4U+eLeKp1VbwRJs/Pt3mhKupkzZ2h2R8wUU0PoxtRo7mCMHNSUxGAsltUEV9rJcLDzzfEtA==
X-Received: by 2002:a63:2004:: with SMTP id g4mr29397073pgg.97.1562679597806;
        Tue, 09 Jul 2019 06:39:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h26sm34003083pfq.64.2019.07.09.06.39.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 06:39:57 -0700 (PDT)
Subject: Re: [PATCH v1 4/5] hwmon: (lm75) Create function from code to write
 into registers
To:     Iker Perez <iker.perez@codethink.co.uk>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20190709095052.7964-1-iker.perez@codethink.co.uk>
 <20190709095052.7964-5-iker.perez@codethink.co.uk>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <ccc9310a-e13d-c327-0467-d6f82674a4ac@roeck-us.net>
Date:   Tue, 9 Jul 2019 06:39:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190709095052.7964-5-iker.perez@codethink.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/9/19 2:50 AM, Iker Perez wrote:
> From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
> 
> This function will be needed later to configure update_interval
> 
> Signed-off-by: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
> ---
>   drivers/hwmon/lm75.c | 63 ++++++++++++++++++++++++++++++----------------------
>   1 file changed, 36 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index 1d4d060bd695..5ba7277dac69 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -78,6 +78,40 @@ static inline long lm75_reg_to_mc(s16 temp, u8 resolution)
>   	return ((temp >> (16 - resolution)) * 1000) >> (resolution - 8);
>   }
>   
> +static void lm75_remove(void *data)
> +{
> +	struct lm75_data *lm75 = data;
> +	struct i2c_client *client = lm75->client;
> +
> +	i2c_smbus_write_byte_data(client, LM75_REG_CONF, lm75->orig_conf);
> +}
> +static int configure_reg(u8 set_mask, u8 clr_mask, struct lm75_data *data,
> +		struct i2c_client *client)
> +{
> +	int status, err, new;
> +	struct device *dev = &client->dev;
> +
> +	/* configure as specified */
> +	status = i2c_smbus_read_byte_data(client, LM75_REG_CONF);
> +	if (status < 0) {
> +		dev_dbg(dev, "Can't read config? %d\n", status);
> +		return status;
> +	}
> +	data->orig_conf = status;

Overwriting the "original" configuration each time the update time is changed
is really a bad idea.

You'll want to cache the current configuration register value, and not
re-read it each time the configuration is updated.


> +	new = status & ~clr_mask;
> +	new |= set_mask;
> +	if (status != new)
> +		i2c_smbus_write_byte_data(client, LM75_REG_CONF, new);
> +
> +	err = devm_add_action_or_reset(dev, lm75_remove, data);
> +	if (err)
> +		return err;
> +

The function is a good idea, but you can't use devm_add_action_or_reset() here.
That will have to remain in the probe function. Otherwise an action will be added
each time the resolution/update time is changed.

> +	dev_dbg(dev, "Config %02x\n", new);
> +
> +	return 0;
> +}
> +
>   static int lm75_read(struct device *dev, enum hwmon_sensor_types type,
>   		     u32 attr, int channel, long *val)
>   {
> @@ -238,14 +272,6 @@ static const struct regmap_config lm75_regmap_config = {
>   	.use_single_write = true,
>   };
>   
> -static void lm75_remove(void *data)
> -{
> -	struct lm75_data *lm75 = data;
> -	struct i2c_client *client = lm75->client;
> -
> -	i2c_smbus_write_byte_data(client, LM75_REG_CONF, lm75->orig_conf);
> -}
> -
>   static int
>   lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
>   {
> @@ -253,9 +279,8 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
>   	struct device *hwmon_dev;
>   	struct lm75_data *data;
>   	struct lm75_data device_data;
> -	int status, err;
> +	int status;
>   	u8 set_mask, clr_mask;
> -	int new;
>   
>   	data = &device_data;
>   	if (client->dev.of_node)
> @@ -370,23 +395,7 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
>   		break;
>   	}
>   
> -	/* configure as specified */
> -	status = i2c_smbus_read_byte_data(client, LM75_REG_CONF);
> -	if (status < 0) {
> -		dev_dbg(dev, "Can't read config? %d\n", status);
> -		return status;
> -	}
> -	data->orig_conf = status;
> -	new = status & ~clr_mask;
> -	new |= set_mask;
> -	if (status != new)
> -		i2c_smbus_write_byte_data(client, LM75_REG_CONF, new);
> -
> -	err = devm_add_action_or_reset(dev, lm75_remove, data);
> -	if (err)
> -		return err;
> -
> -	dev_dbg(dev, "Config %02x\n", new);
> +	status = configure_reg(set_mask, clr_mask, data, client);
>   
>   	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
>   							 data, &lm75_chip_info,
> 

