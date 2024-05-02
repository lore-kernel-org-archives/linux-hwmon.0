Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5481B810
	for <linux-hwmon@vger.kernel.org>; Thu,  2 May 2024 22:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714689868; cv=none; b=soU2hrrJ73CJjMZL37raNW1rdpW005H5w/qgVzNY2nlY9QbhSs2xnWY5KG6B3b8Hc58VF2RC/aoWe3VNqutX+vsQJbwz1QgV5iKbGxY3V2h5Bdxal99AABU3qaCV8WizJrPPNq3bz/RljFJwgkOJ6je9K4abujAZtFrdeTILByk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714689868; c=relaxed/simple;
	bh=RowiZGRLB4DTlNOnDA0LrJZ9SZ3L12iXCL9Oyru1UUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uo1vUXvUg20N0pLaR4X1u7O8QI5uPKmTS1N6xX/2+nBKbJfEU9L49E4kMBBB9vuHOXSmZlSmuQTZqdVpJiigfpINDRZAoFy9s1rOBoLOVuO9J0dwAkl/PdT6e1oitdFhj5IHGKhgQ4b/gjC5BGgkGgzzsERalvT0ZKX33lypWAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icKffrtE; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icKffrtE"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e5c7d087e1so74089875ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 02 May 2024 15:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714689866; x=1715294666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GHv3WxTkCryvOAt+9+kD/FpvYszEiBSwVc1DtDnQrgU=;
        b=icKffrtEDzh22c3AYbIjrsEsPbdiJa7keH/v9xGCekufXA7Ve8CDm+qRuBKKxMinhF
         J2sg+qII8Qa+5CkpC3d8PuoZfVxkmph/0rSSOEYU84RpqRb1W7WJAkUMOm1cHH6mdNAC
         0FTTolRx9wASJDYxEdeQSBpK03Q2IK6rgxlAW0nv09pPGPg0Gsl9aFYTzIQN95VTz5wh
         EdkN7wXXAQ30Ya9frhdBEwZGobl70Tq8eQfv023sCEkp+kZaBTP1rgaWWe4GHLMFmUPk
         qkVgkOcQQcfrMnLPNuaNGgNtdQBfD0TwQEsiLFoXp7roMR79eJVoP78WeQfrixzo5Xx7
         qiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714689866; x=1715294666;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHv3WxTkCryvOAt+9+kD/FpvYszEiBSwVc1DtDnQrgU=;
        b=ouVrk01XI8BA3/A1FnwDP+35hjjV2YYzK2x0CXKCbVQ5mhz/gMfbvr43eWd4yo9ZTk
         GptojHG82s9F55F/09hxf/kQXmM08JIT6qKvoMr31nwvN3ibAajTu5NWmpYkpGs6SKs/
         6ngVSx3glKIA1OAcjVbwsnEGett9rqS3H+Q7VlEv4QbxMcqumsqqgYObczoNIDDafDmH
         kUFyp/kh3G21jgUzEB9/KSu4IcFdaAufCKJL+vwoNNPOzPzym/RR2zCIu6jgVpQ1Npsl
         ccdz4p7qlD7fjWdE4gQuXCNSF3Myo8jUgUr5yKnlgIOlwAyxBtP9o6DvkLJ2t/RlOKE2
         2Axg==
X-Forwarded-Encrypted: i=1; AJvYcCXJPkYwEbvrQajJQy5RaNh3XtAtuHWLdtf9dKJi/9es/FSx4WMUYcbR+2VKnhDZfRSB8psyecYJ6FGo+HITVDM/FXZHPLxkCGPMsSQ=
X-Gm-Message-State: AOJu0YzNYuCKhhqMb3axYOf8bBv6xfQGSEZdH2ix1Ak4d7TdzzsWcyGf
	6eIhbyo7S/Z6OTk+bO5PwEVKwP5afekE8RcFOejXa9NaEMrDAlL6//JmKQ==
X-Google-Smtp-Source: AGHT+IFXlFjISRAIKfpdLiX1KWwMoPRklCSIsUiYUQ5UHm0rN3k1rtnMa2bhGlH9VzdcCTIvjCimXA==
X-Received: by 2002:a17:903:2312:b0:1e4:6253:75db with SMTP id d18-20020a170903231200b001e4625375dbmr1210833plh.17.1714689866342;
        Thu, 02 May 2024 15:44:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l11-20020a170902f68b00b001ec4db46318sm1868436plg.232.2024.05.02.15.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 May 2024 15:44:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e0f0808f-bbd1-4c1d-8b09-205949e766be@roeck-us.net>
Date: Thu, 2 May 2024 15:44:24 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] sbrmi: Use regmap subsystem
To: Naveen Krishna Chatradhi <nchatrad@amd.com>, linux-hwmon@vger.kernel.org
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Akshay Gupta <Akshay.Gupta@amd.com>
References: <20240502220554.2768611-1-nchatrad@amd.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240502220554.2768611-1-nchatrad@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/24 15:05, Naveen Krishna Chatradhi wrote:
> From: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> 
> - regmap subsystem provides multiple benefits over direct smbus APIs
> - The susbsytem can be helpful in following cases
>    - Differnet types of bus (i2c/i3c)
>    - Different Register address size (1byte/2byte)
> 
> Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
>   drivers/hwmon/Kconfig |  1 +
>   drivers/hwmon/sbrmi.c | 61 ++++++++++++++++++++++++-------------------
>   2 files changed, 35 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index a608264da87d..903a8ebbd2d7 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1759,6 +1759,7 @@ config SENSORS_SBTSI
>   config SENSORS_SBRMI
>   	tristate "Emulated SB-RMI sensor"
>   	depends on I2C
> +	select REGMAP_I2C
>   	help
>   	  If you say yes here you get support for emulated RMI
>   	  sensors on AMD SoCs with APML interface connected to a BMC device.
> diff --git a/drivers/hwmon/sbrmi.c b/drivers/hwmon/sbrmi.c
> index 484703f0ea5f..901bd82d71d4 100644
> --- a/drivers/hwmon/sbrmi.c
> +++ b/drivers/hwmon/sbrmi.c
> @@ -14,6 +14,7 @@
>   #include <linux/module.h>
>   #include <linux/mutex.h>
>   #include <linux/of.h>
> +#include <linux/regmap.h>
> 
>   /* Do not allow setting negative power limit */
>   #define SBRMI_PWR_MIN	0
> @@ -63,6 +64,7 @@ enum sbrmi_reg {
>   struct sbrmi_data {
>   	struct i2c_client *client;

There is only one user of this structure left, and it is for a
questionable error message (questionable since all other errors
are handled silently). I would suggest to drop both.


>   	struct mutex lock;
> +	struct regmap *regmap;
>   	u32 pwr_limit_max;
>   };
> 
> @@ -73,22 +75,21 @@ struct sbrmi_mailbox_msg {
>   	u32 data_out;
>   };
> 
> -static int sbrmi_enable_alert(struct i2c_client *client)
> +static int sbrmi_enable_alert(struct sbrmi_data *data)
>   {
> -	int ctrl;
> +	int ctrl, ret = 0;
> 
Unnecessary initialization

>   	/*
>   	 * Enable the SB-RMI Software alert status
>   	 * by writing 0 to bit 4 of Control register(0x1)
>   	 */
> -	ctrl = i2c_smbus_read_byte_data(client, SBRMI_CTRL);
> -	if (ctrl < 0)
> -		return ctrl;
> +	ret = regmap_read(data->regmap, SBRMI_STATUS, &ctrl);
> +	if (ret < 0)
> +		return ret;
> 
>   	if (ctrl & 0x10) {
>   		ctrl &= ~0x10;
> -		return i2c_smbus_write_byte_data(client,
> -						 SBRMI_CTRL, ctrl);
> +		return regmap_write(data->regmap, SBRMI_CTRL, ctrl);
>   	}
> 
>   	return 0;
> @@ -97,6 +98,7 @@ static int sbrmi_enable_alert(struct i2c_client *client)
>   static int rmi_mailbox_xfer(struct sbrmi_data *data,
>   			    struct sbrmi_mailbox_msg *msg)
>   {
> +	unsigned int bytes = 0;

Unnecessary initialization

>   	int i, ret, retry = 10;
>   	int sw_status;
>   	u8 byte;
> @@ -104,14 +106,12 @@ static int rmi_mailbox_xfer(struct sbrmi_data *data,
>   	mutex_lock(&data->lock);
> 
>   	/* Indicate firmware a command is to be serviced */
> -	ret = i2c_smbus_write_byte_data(data->client,
> -					SBRMI_INBNDMSG7, START_CMD);
> +	ret = regmap_write(data->regmap, SBRMI_INBNDMSG7, START_CMD);
>   	if (ret < 0)
>   		goto exit_unlock;
> 
>   	/* Write the command to SBRMI::InBndMsg_inst0 */
> -	ret = i2c_smbus_write_byte_data(data->client,
> -					SBRMI_INBNDMSG0, msg->cmd);
> +	ret = regmap_write(data->regmap, SBRMI_INBNDMSG0, msg->cmd);
>   	if (ret < 0)
>   		goto exit_unlock;
> 
> @@ -122,8 +122,7 @@ static int rmi_mailbox_xfer(struct sbrmi_data *data,
>   	 */
>   	for (i = 0; i < 4; i++) {
>   		byte = (msg->data_in >> i * 8) & 0xff;
> -		ret = i2c_smbus_write_byte_data(data->client,
> -						SBRMI_INBNDMSG1 + i, byte);
> +		ret = regmap_write(data->regmap, SBRMI_INBNDMSG1 + i, byte);
>   		if (ret < 0)
>   			goto exit_unlock;
>   	}
> @@ -132,8 +131,7 @@ static int rmi_mailbox_xfer(struct sbrmi_data *data,
>   	 * Write 0x01 to SBRMI::SoftwareInterrupt to notify firmware to
>   	 * perform the requested read or write command
>   	 */
> -	ret = i2c_smbus_write_byte_data(data->client,
> -					SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
> +	ret = regmap_write(data->regmap, SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
>   	if (ret < 0)
>   		goto exit_unlock;
> 
> @@ -143,8 +141,7 @@ static int rmi_mailbox_xfer(struct sbrmi_data *data,
>   	 * of the requested command
>   	 */
>   	do {
> -		sw_status = i2c_smbus_read_byte_data(data->client,
> -						     SBRMI_STATUS);
> +		ret = regmap_read(data->regmap, SBRMI_STATUS, &sw_status);
>   		if (sw_status < 0) {
>   			ret = sw_status;
>   			goto exit_unlock;
> @@ -168,11 +165,11 @@ static int rmi_mailbox_xfer(struct sbrmi_data *data,
>   	 */
>   	if (msg->read) {
>   		for (i = 0; i < 4; i++) {
> -			ret = i2c_smbus_read_byte_data(data->client,
> -						       SBRMI_OUTBNDMSG1 + i);
> +			ret = regmap_read(data->regmap,
> +					  SBRMI_OUTBNDMSG1 + i, &bytes);
>   			if (ret < 0)
>   				goto exit_unlock;
> -			msg->data_out |= ret << i * 8;
> +			msg->data_out |= bytes << i * 8;
>   		}
>   	}
> 
> @@ -180,9 +177,8 @@ static int rmi_mailbox_xfer(struct sbrmi_data *data,
>   	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
>   	 * ALERT to initiator
>   	 */
> -	ret = i2c_smbus_write_byte_data(data->client, SBRMI_STATUS,
> -					sw_status | SW_ALERT_MASK);
> -
> +	ret = regmap_write(data->regmap, SBRMI_STATUS,
> +			   sw_status | SW_ALERT_MASK);
>   exit_unlock:
>   	mutex_unlock(&data->lock);
>   	return ret;
> @@ -265,7 +261,7 @@ static umode_t sbrmi_is_visible(const void *data,
>   	return 0;
>   }
> 
> -static const struct hwmon_channel_info * const sbrmi_info[] = {
> +static const struct hwmon_channel_info *sbrmi_info[] = {
>   	HWMON_CHANNEL_INFO(power,
>   			   HWMON_P_INPUT | HWMON_P_CAP | HWMON_P_CAP_MAX),
>   	NULL
> @@ -302,6 +298,10 @@ static int sbrmi_probe(struct i2c_client *client)
>   	struct device *dev = &client->dev;
>   	struct device *hwmon_dev;
>   	struct sbrmi_data *data;
> +	struct regmap_config sbrmi_i2c_regmap_config = {
> +		.reg_bits = 8,
> +		.val_bits = 8,
> +	};
>   	int ret;
> 
>   	data = devm_kzalloc(dev, sizeof(struct sbrmi_data), GFP_KERNEL);
> @@ -310,9 +310,12 @@ static int sbrmi_probe(struct i2c_client *client)
> 
>   	data->client = client;
>   	mutex_init(&data->lock);
> +	data->regmap = devm_regmap_init_i2c(client, &sbrmi_i2c_regmap_config);
> +	if (IS_ERR(data->regmap))
> +		return PTR_ERR(data->regmap);
> 
>   	/* Enable alert for SB-RMI sequence */
> -	ret = sbrmi_enable_alert(client);
> +	ret = sbrmi_enable_alert(data);
>   	if (ret < 0)
>   		return ret;
> 
> @@ -321,8 +324,12 @@ static int sbrmi_probe(struct i2c_client *client)
>   	if (ret < 0)
>   		return ret;
> 
> -	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
> -							 &sbrmi_chip_info, NULL);
> +	dev_set_drvdata(dev, (void *)data);
> +

Why would this be needed ? On a side note, the typecast is unnecessary.

Guenter

