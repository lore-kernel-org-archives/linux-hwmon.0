Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39B615A8
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Jun 2024 13:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718026321; cv=none; b=cAXoCnHxZSFaNT5TrXZ6cHeOjq749+5bbRJgsYWxmi7Tft6RA5bH5VG7Z3LDP4t6ZQYJXOw5Xd8r502Cc3wLu7aW3jsLlZ5cHpG393y1KjHti/4/jXHqAgSLyAiJyHHJzv1KudfJ1/GoxlfIRTeHLL/LNivFwrigkwmI3lkOti8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718026321; c=relaxed/simple;
	bh=/+C4pHn0mg2CzN1Ap14AjC5WzankTpKaJdU0N01G4Q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxhcXcvIq0E82/nMtr0Qtw9TCXhogUB4FD3O4nY20V08mq36Dr54XyqvFxKjkapBqzK6E5RRGe4qCqRysuJuPrfZtW4C0/x08WNNVrVGKY6IUuKI9F/Wi/CQ6h6kGSNpv+ni6d9NFnXtJmS8bMRiOUUtfxR+yemTjIAOXzNa27A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTR3+qnw; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTR3+qnw"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-6e3741519d7so1864026a12.2;
        Mon, 10 Jun 2024 06:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718026319; x=1718631119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GwoiR/J88bhbRRZkdD7f1bkTVX4AJgk+RaXv8UVyN5k=;
        b=OTR3+qnwO8raxWFPt8HGIDYCtHIVF6oQXq5vkUFeIzCBpqmjI/7djIL4VaN0oMJHdM
         MOSgwdgcdKUzCq3NF3iezDigxvr30hv0Xe7qnI43V/VTK97jRqIKBWXsBUvIq3stz633
         EC45D29nyopFtznE1fvuE2B3tsKwkyi0jvTxp0Lx6cdWp1t4Xcr5QcbaCuv2OlOALFzm
         i2dTvoh/NcItN1xD/2pSZ0UoJWMR++cIhEE5rei2YeencyI++1OERrhZxzGigFARPXRp
         kXlWZVlVlJk3rdfguZBYAXATO5hS8JJQxLaKZGl0x7mnawBpWme1x9Y8Rb4DaglYtseu
         9W0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718026319; x=1718631119;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GwoiR/J88bhbRRZkdD7f1bkTVX4AJgk+RaXv8UVyN5k=;
        b=BDW1uFnLikEEIgVBLKRn+hRNJy+6Chdo4CtrdO1ZT9foBaQOYlvsYoy+4OgxHQjse1
         XgeqsjVLPpf4RUZp4+ynxErzfuJUA0rMGV0BnTy5P1Dic/2LMo2rpXKQRXzSzsHgqmby
         EOe9yoFisMB+f0+Rgk2Lu8lF3eGuM4YdZv2hj+lG2izgEu5sPu9QsnWDRTEA06Z5aR/N
         zxIDJOYtd2aY9MQGIfL3VfIY3lf2htpwE9OOIIPmgtGQpFeKbyGOlKm9xe0TxUJl7Bev
         CD+liISTvg0NOXx2qMuseh//9mIuPnTzzbRokxkeF7QQ9T+rTLMO+THLWy+rIX6DI32J
         Dnhw==
X-Forwarded-Encrypted: i=1; AJvYcCUDg5EbjVesUoKlFHsRINd2GkuohQAwvBJChwFu0TSaBM5B5KUaQ83aaBNKisbZNtchuGpzTho/8Eu6lajJTcejgP2Qm1mqBciH3RET2oGKqwmO1YK6bdEtOgYYRn7K27EtBgXjkw1r8A==
X-Gm-Message-State: AOJu0YxQq+WFd0L4jTkUFa7rG/yj5hFSdEn2VjN5eGJjxTnvHwH+xCK9
	kaZ6ldiC1r5vYhdAO5841B0coQGwRATjSO8MIU6U998ELcSBS6gubQwzhA==
X-Google-Smtp-Source: AGHT+IGz/siGE93To16AmwUzIqxvklXbgiZ55lN/dwspLqkf41u2rqrJ9CxGPNHE9n3cXlxWFzCzGw==
X-Received: by 2002:a17:90a:f486:b0:2c2:ee34:f309 with SMTP id 98e67ed59e1d1-2c2ee34f7d3mr3519729a91.2.1718026318727;
        Mon, 10 Jun 2024 06:31:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c323329e92sm361129a91.1.2024.06.10.06.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 06:31:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2b67ff47-1f40-49eb-b8c8-a8d5bd61b24d@roeck-us.net>
Date: Mon, 10 Jun 2024 06:31:56 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] mfd/hwmon sbrmi: Use regmap subsystem
To: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 linux-hwmon@vger.kernel.org, inux-kernel@vger.kernel.org
Cc: lee@kernel.org, gregkh@linuxfoundation.org, arnd@arndb.de,
 Akshay Gupta <akshay.gupta@amd.com>
References: <20240530112307.3089696-1-naveenkrishna.chatradhi@amd.com>
 <20240530112307.3089696-4-naveenkrishna.chatradhi@amd.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240530112307.3089696-4-naveenkrishna.chatradhi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/30/24 04:23, Naveen Krishna Chatradhi wrote:
> From: Akshay Gupta <akshay.gupta@amd.com>
> 
> - regmap subsystem provides multiple benefits over direct smbus APIs
> - The susbsytem can be helpful in following cases
>    - Differnet types of bus (i2c/i3c)
>    - Different Register address size (1byte/2byte)
> 
> Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>

The "hwmon" in the subject should be dropped.

> ---
>   drivers/mfd/Kconfig        |  2 +-
>   drivers/mfd/sbrmi-core.c   | 30 ++++++++++++------------------
>   drivers/mfd/sbrmi-i2c.c    | 25 ++++++++++++++++---------
>   include/linux/mfd/amd-sb.h |  6 +++---
>   4 files changed, 32 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 0411cb29b6df..d89513e5a06b 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1444,8 +1444,8 @@ config MFD_STMPE
>   
>   config MFD_SBRMI_I2C
>           tristate "APML SBRMI support"
> -        depends on I2C
>           select MFD_CORE
> +        select REGMAP_I2C
>           help
>             APML RMI core support for AMD out of band management
>   	  This driver can also be built as a module. If so, the module will
> diff --git a/drivers/mfd/sbrmi-core.c b/drivers/mfd/sbrmi-core.c
> index d872b5107b36..5617b91787ba 100644
> --- a/drivers/mfd/sbrmi-core.c
> +++ b/drivers/mfd/sbrmi-core.c
> @@ -7,9 +7,9 @@
>    */
>   #include <linux/delay.h>
>   #include <linux/err.h>
> -#include <linux/i2c.h>
>   #include <linux/mfd/amd-sb.h>
>   #include <linux/mutex.h>
> +#include <linux/regmap.h>
>   
>   /* Mask for Status Register bit[1] */
>   #define SW_ALERT_MASK	0x2
> @@ -44,6 +44,7 @@ enum sbrmi_reg {
>   int rmi_mailbox_xfer(struct sbrmi_data *data,
>   		     struct sbrmi_mailbox_msg *msg)
>   {
> +	unsigned int bytes;
>   	int i, ret, retry = 10;
>   	int sw_status;
>   	u8 byte;
> @@ -51,14 +52,12 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
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
> @@ -69,8 +68,7 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
>   	 */
>   	for (i = 0; i < 4; i++) {
>   		byte = (msg->data_in >> i * 8) & 0xff;
> -		ret = i2c_smbus_write_byte_data(data->client,
> -						SBRMI_INBNDMSG1 + i, byte);
> +		ret = regmap_write(data->regmap, SBRMI_INBNDMSG1 + i, byte);
>   		if (ret < 0)
>   			goto exit_unlock;
>   	}
> @@ -79,8 +77,7 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
>   	 * Write 0x01 to SBRMI::SoftwareInterrupt to notify firmware to
>   	 * perform the requested read or write command
>   	 */
> -	ret = i2c_smbus_write_byte_data(data->client,
> -					SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
> +	ret = regmap_write(data->regmap, SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
>   	if (ret < 0)
>   		goto exit_unlock;
>   
> @@ -90,8 +87,7 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
>   	 * of the requested command
>   	 */
>   	do {
> -		sw_status = i2c_smbus_read_byte_data(data->client,
> -						     SBRMI_STATUS);
> +		ret = regmap_read(data->regmap, SBRMI_STATUS, &sw_status);
>   		if (sw_status < 0) {
>   			ret = sw_status;

This is wrong. It should be
		if (ret < 0)
			goto exit_unlock;

>   			goto exit_unlock;
> @@ -102,8 +98,6 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
>   	} while (retry--);
>   
>   	if (retry < 0) {
> -		dev_err(&data->client->dev,
> -			"Firmware fail to indicate command completion\n");
>   		ret = -EIO;
>   		goto exit_unlock;
>   	}
> @@ -115,11 +109,11 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
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
> @@ -127,8 +121,8 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
>   	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
>   	 * ALERT to initiator
>   	 */
> -	ret = i2c_smbus_write_byte_data(data->client, SBRMI_STATUS,
> -					sw_status | SW_ALERT_MASK);
> +	ret = regmap_write(data->regmap, SBRMI_STATUS,
> +			   sw_status | SW_ALERT_MASK);
>   
>   exit_unlock:
>   	mutex_unlock(&data->lock);
> diff --git a/drivers/mfd/sbrmi-i2c.c b/drivers/mfd/sbrmi-i2c.c
> index c19f0b3eb0cd..bdf15a7a2167 100644
> --- a/drivers/mfd/sbrmi-i2c.c
> +++ b/drivers/mfd/sbrmi-i2c.c
> @@ -15,6 +15,7 @@
>   #include <linux/module.h>
>   #include <linux/mutex.h>
>   #include <linux/of.h>
> +#include <linux/regmap.h>
>   
>   #define SBRMI_CTRL	0x1
>   
> @@ -22,22 +23,21 @@ static struct mfd_cell apml_sbrmi[] = {
>   	{ .name = "sbrmi-hwmon" },
>   };
>   
> -static int sbrmi_enable_alert(struct i2c_client *client)
> +static int sbrmi_enable_alert(struct sbrmi_data *data)
>   {
> -	int ctrl;
> +	int ctrl, ret;
>   
>   	/*
>   	 * Enable the SB-RMI Software alert status
>   	 * by writing 0 to bit 4 of Control register(0x1)
>   	 */
> -	ctrl = i2c_smbus_read_byte_data(client, SBRMI_CTRL);
> -	if (ctrl < 0)
> -		return ctrl;
> +	ret = regmap_read(data->regmap, SBRMI_CTRL, &ctrl);
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
> @@ -62,17 +62,24 @@ static int sbrmi_i2c_probe(struct i2c_client *client)
>   {
>   	struct device *dev = &client->dev;
>   	struct sbrmi_data *data;
> +	struct regmap_config sbrmi_i2c_regmap_config = {
> +		.reg_bits = 8,
> +		.val_bits = 8,
> +	};
>   	int ret;
>   
>   	data = devm_kzalloc(dev, sizeof(struct sbrmi_data), GFP_KERNEL);
>   	if (!data)
>   		return -ENOMEM;
>   
> -	data->client = client;
>   	mutex_init(&data->lock);
>   
> +	data->regmap = devm_regmap_init_i2c(client, &sbrmi_i2c_regmap_config);
> +	if (IS_ERR(data->regmap))
> +		return PTR_ERR(data->regmap);
> +
>   	/* Enable alert for SB-RMI sequence */
> -	ret = sbrmi_enable_alert(client);
> +	ret = sbrmi_enable_alert(data);
>   	if (ret < 0)
>   		return ret;
>   
> diff --git a/include/linux/mfd/amd-sb.h b/include/linux/mfd/amd-sb.h
> index 7805f31fb6ea..977b8228ffa1 100644
> --- a/include/linux/mfd/amd-sb.h
> +++ b/include/linux/mfd/amd-sb.h
> @@ -7,7 +7,7 @@
>   #define _AMD_SB_H_
>   
>   #include <linux/mutex.h>
> -#include <linux/i2c.h>
> +#include <linux/regmap.h>
>   /*
>    * SB-RMI supports soft mailbox service request to MP1 (power management
>    * firmware) through SBRMI inbound/outbound message registers.
> @@ -22,10 +22,10 @@ enum sbrmi_msg_id {
>   
>   /* Each client has this additional data */
>   struct sbrmi_data {
> -	struct i2c_client *client;
> +	struct regmap *regmap;
>   	struct mutex lock;
>   	u32 pwr_limit_max;
> -};
> +} __packed;
>   
>   struct sbrmi_mailbox_msg {
>   	u8 cmd;

