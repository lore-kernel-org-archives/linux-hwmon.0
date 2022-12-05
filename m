Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1957C4332F
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Dec 2022 18:15:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbiLESP0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 5 Dec 2022 13:15:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbiLESPX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Dec 2022 13:15:23 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A3CF20188
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Dec 2022 10:15:22 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id n205so14000229oib.1
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Dec 2022 10:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9KB8aIAm/c36t3863MM7IyK0jLat1bp7aXB8d/rD7MU=;
        b=UY0DfI03EvQ7SfQz3Z70INqRaLLkI2xSfSPmACDTwdT03w9o4iQ0SvcCHIJl90rEVi
         m23GOSvqPiu+TcBtcxPdlgcLpXICYyX7lsbXHoB2hrDDinGnNTzjXxiSubReZiC7f6LY
         q+vBmbvTQfJ+OFXbV2R7lFGjceHl4J5MDFsCMJsludx6qBKFez1d22Qi+OIZymYJ8Cgw
         qaG763e7bF18ghGYaV5P2i1T7/+01/I0nYAHh2wQqVyV2f8FY4Dd2R9uW9Zt+Aqh4BbH
         jj8WZp9cttuanq655xxfQM92+uVtHmbEgL9dmoVd2eAjpF+cve6Gbe86IApy1TpaRmWH
         RIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KB8aIAm/c36t3863MM7IyK0jLat1bp7aXB8d/rD7MU=;
        b=iUAXrN4BEfz5YPfcJDQ7UdohZbqMEkxAVgUR5GXT15JeFot7d+2zVY177KotaDZ90r
         rK2OM/qubmi+tYoOr1SuoKUmXtEh2FJqRzFfOCu5kROICNhMXGBWUanmhLFZBmEjl86S
         uovC+3L3G5mStsqriMdXOt4meSe+/kZKugPLCXd2cN34ZMPyGleaXnL01B5k5Sw34XZw
         y1F1+dGVZBuoJeHha/xmTLA5P9cOGa6nlB/00sJ/IKOTSzY4ZEUlRssvIDHrWt4Oiwpq
         viMCOIpcitukqpF7sIWVZNIreERgEXhZU+voxWfjU4bma1713fTsqfjZ8rizvUZhhzLc
         mf8w==
X-Gm-Message-State: ANoB5pnlTHEo3NVQHEZbjf/kKrbhX5AXbwKAd2RaXr/HFtn1ppWMdIYE
        /HqgplYub0QlV7U6S4fwVw0=
X-Google-Smtp-Source: AA0mqf54rbAjqRY/v5HyXOBKChcof1iYpyhxN62idsjzTwz434PIeZagFxEaAZa8lx4pB9RFhZe6yw==
X-Received: by 2002:aca:590a:0:b0:35b:cd76:c89a with SMTP id n10-20020aca590a000000b0035bcd76c89amr13288636oib.175.1670264121760;
        Mon, 05 Dec 2022 10:15:21 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r34-20020a056870e9a200b0013b1301ce42sm9452510oao.47.2022.12.05.10.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 10:15:21 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <47fc8999-647e-be8e-60a6-cc43329746e8@roeck-us.net>
Date:   Mon, 5 Dec 2022 10:15:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] hwmon: (emc2305) fix unable to probe emc2301/2/3/4
Content-Language: en-US
To:     Xingjiang Qiao <nanpuyue@gmail.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org
References: <20221205173611.145571-1-nanpuyue@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20221205173611.145571-1-nanpuyue@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/5/22 09:36, Xingjiang Qiao wrote:
> The definitions of 'EMC2305_REG_PRODUCT_ID' and 'EMC2305_REG_DEVICE' are
> both '0xfd', they actually return the same value, but the values returned
> by emc2301/2/3/4/5 are different, so probe emc2301/2/3/4 will fail, This
> patch fixes that.
> 

This solves the wrong problem. The check for REG_DEVICE should simply
be removed instead (EMC2305_REG_PRODUCT_ID and EMC2305_REG_DEVICE are
both 0xfd). On top of that, moving the functionality of emc2305_identify()
does not improve code quality (quite the contrary) and is thus not acceptable.

> The second parameter of 'emc2305_probe' is actually useless, it is more
> appropriate to use 'probe_new' instead of 'probe' here.
> 

This would be a second patch. Besides, this change is already queued in
hwmon-next for v6.2.

Guenter

> Signed-off-by: Xingjiang Qiao <nanpuyue@gmail.com>
> ---
>   drivers/hwmon/emc2305.c | 58 ++++++++++++++---------------------------
>   1 file changed, 19 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index aa1f25add0b6..4df84065cbfb 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c
> @@ -21,9 +21,7 @@ emc2305_normal_i2c[] = { 0x27, 0x2c, 0x2d, 0x2e, 0x2f, 0x4c, 0x4d, I2C_CLIENT_EN
>   #define EMC2305_FAN_MAX			0xff
>   #define EMC2305_FAN_MIN			0x00
>   #define EMC2305_FAN_MAX_STATE		10
> -#define EMC2305_DEVICE			0x34
>   #define EMC2305_VENDOR			0x5d
> -#define EMC2305_REG_PRODUCT_ID		0xfd
>   #define EMC2305_TACH_REGS_UNUSE_BITS	3
>   #define EMC2305_TACH_CNT_MULTIPLIER	0x02
>   #define EMC2305_TACH_RANGE_MIN		480
> @@ -488,43 +486,14 @@ static const struct hwmon_chip_info emc2305_chip_info = {
>   	.info = emc2305_info,
>   };
>   
> -static int emc2305_identify(struct device *dev)
> -{
> -	struct i2c_client *client = to_i2c_client(dev);
> -	struct emc2305_data *data = i2c_get_clientdata(client);
> -	int ret;
> -
> -	ret = i2c_smbus_read_byte_data(client, EMC2305_REG_PRODUCT_ID);
> -	if (ret < 0)
> -		return ret;
> -
> -	switch (ret) {
> -	case EMC2305:
> -		data->pwm_num = 5;
> -		break;
> -	case EMC2303:
> -		data->pwm_num = 3;
> -		break;
> -	case EMC2302:
> -		data->pwm_num = 2;
> -		break;
> -	case EMC2301:
> -		data->pwm_num = 1;
> -		break;
> -	default:
> -		return -ENODEV;
> -	}
> -
> -	return 0;
> -}
> -
> -static int emc2305_probe(struct i2c_client *client, const struct i2c_device_id *id)
> +static int emc2305_probe(struct i2c_client *client)
>   {
>   	struct i2c_adapter *adapter = client->adapter;
>   	struct device *dev = &client->dev;
>   	struct emc2305_data *data;
>   	struct emc2305_platform_data *pdata;
>   	int vendor, device;
> +	int pwm_num;
>   	int ret;
>   	int i;
>   
> @@ -536,20 +505,31 @@ static int emc2305_probe(struct i2c_client *client, const struct i2c_device_id *
>   		return -ENODEV;
>   
>   	device = i2c_smbus_read_byte_data(client, EMC2305_REG_DEVICE);
> -	if (device != EMC2305_DEVICE)
> +	switch (device) {
> +	case EMC2305:
> +		pwm_num = 5;
> +		break;
> +	case EMC2303:
> +		pwm_num = 3;
> +		break;
> +	case EMC2302:
> +		pwm_num = 2;
> +		break;
> +	case EMC2301:
> +		pwm_num = 1;
> +		break;
> +	default:
>   		return -ENODEV;
> +	}
>   
>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)
>   		return -ENOMEM;
>   
>   	i2c_set_clientdata(client, data);
> +	data->pwm_num = pwm_num;
>   	data->client = client;
>   
> -	ret = emc2305_identify(dev);
> -	if (ret)
> -		return ret;
> -
>   	pdata = dev_get_platdata(&client->dev);
>   	if (pdata) {
>   		if (!pdata->max_state || pdata->max_state > EMC2305_FAN_MAX_STATE)
> @@ -604,10 +584,10 @@ static void emc2305_remove(struct i2c_client *client)
>   
>   static struct i2c_driver emc2305_driver = {
>   	.class  = I2C_CLASS_HWMON,
> +	.probe_new = emc2305_probe,
>   	.driver = {
>   		.name = "emc2305",
>   	},
> -	.probe    = emc2305_probe,
>   	.remove	  = emc2305_remove,
>   	.id_table = emc2305_ids,
>   	.address_list = emc2305_normal_i2c,

