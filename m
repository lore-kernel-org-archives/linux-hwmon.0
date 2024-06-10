Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0761C82495
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Jun 2024 13:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718025870; cv=none; b=ZQK+VAZD5xtfzKRRWwwc6UqmIhS5aSfJ9fLao1InCqvMLEE1JJWKy2h4qSvanYXHU/nNhq8WIWZ0mFGRLdPjWeLZWebnnMLkMG5dt9naMZzm/jzP4WrfC8QAkOvfpmExIuyqaGSIgv1bL1czrh1SD2tibugmU6mzFONYn9V6XMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718025870; c=relaxed/simple;
	bh=xgg1OM6zeOOEUJCwVwWswGez3ZG0rvjVs6SdBEsr+FM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YwDQLUl76g2doQEEH3nWtDY42bDaNvc6EZl/qCozlE/PQT5SOTjVQBRo6O1nFYNpXin4mKFOJaPIvsJ7Fh9MNMfK1GUh+7ZzS5evQ6+9SrkG+u/Ez77oFKP0MaVSwDqhvF1HcJduF/TO6mJXtGnejwLHojmEZvge0DtVTFRqNpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5L/ymLm; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5L/ymLm"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f47f07acd3so40573435ad.0;
        Mon, 10 Jun 2024 06:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718025867; x=1718630667; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=TyhxGZTCAEu1+DhMTgRTKm/Yjz41fzjkQaXMks7dVB4=;
        b=a5L/ymLmR9qeqsz07Uqa70TW0qHL6MXzB8NQ448AB9P0mfhG6wd+Qozc6JaVfVn/ko
         HbGThIWAx/na05MWtvOV+6Hg+grl33Od8Nn0p7a7EeH+qE719Ij9EEeN3NaNbg87p1jv
         1PsNxz2lxUebDOvQeHsZeaLCppuiDc7C3W6efJL2kc1teaL2AUPzBou3E2IsF5xjCRPS
         rBRTo4RrJ9h0/5qE8BWftR97zL8imFRqjwkqt4ozxBseXss86ZlDKo6POXtPYEVXCKdm
         mlhxh9u+WOGItELTr8tE+X7ibESBaNuypMM4x5pwTENro6MKc7s0l/R71ECbDN+SJW0R
         6lzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718025867; x=1718630667;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyhxGZTCAEu1+DhMTgRTKm/Yjz41fzjkQaXMks7dVB4=;
        b=DHgq3vLdkafReBWMp81+WjisLWKMC8LdAOIdRqleUpZ+w2KHukreTbzG6p8Cteg8Zu
         mGctb1qb2APhl+WxjDORU6r1yS5Le2eYkuhioMBKtAlGFChcQOtsvp/Je6PgpMwi1mc3
         FMRYUWwhNJAG0xpbEURS0jy6lb7NQs0AMTtD+AtvrLwmDK8xdCP0g+GsaDg6WMaSBLvB
         uo2F2+Yr+8tAUdEnrwG86KjjdOeeOKb8kwEbsgBXpHYfyiQvSa8uVj9gl1VqjTJUmPHx
         3BO8FoNlkWHcpgsIiG/bcnDj/9/Sj/BcV5hMS3Vuli+TOu9ALXgv9qjy+yKhREJwMIMZ
         FLrA==
X-Forwarded-Encrypted: i=1; AJvYcCWFEx6HbPqj3eh+5r91F9hgEtIWcUh9VYOdf/ZgtDZA+OdT3+L0a1H/YD0x/TOQyFu2YsXFXaV29Gdg3Rvp3wV+97vJ1fXCyPa+pz0ECiG2xGQvhVuTSNuycLHSAS/v72oubctOAbdjew==
X-Gm-Message-State: AOJu0Yz4LcjodRK4Z37tr1UTbrra0LEiyOGlkBFDCunjV9cmEcQcwnLI
	615t2XhvegC0OH87bI5isHDnt2LJcaa1OOZj2BRYpV6+9qAj1CFh9AeTfg==
X-Google-Smtp-Source: AGHT+IF0tTIEgvNYGrSxfFfklPP9JBLvakR8cabRPgHnDfGEq+HiAstNfzumaGj61SFJK/XToMJ0Ng==
X-Received: by 2002:a17:903:2a83:b0:1f6:e5af:3b60 with SMTP id d9443c01a7336-1f6e5af3d5bmr97730665ad.60.1718025866675;
        Mon, 10 Jun 2024 06:24:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71b934e22sm12453755ad.53.2024.06.10.06.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 06:24:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <05715246-70d5-4726-8ce4-04fd211e04d3@roeck-us.net>
Date: Mon, 10 Jun 2024 06:24:23 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] hwmon/mfd sbrmi: Move core sbrmi from hwmon to MFD
To: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 linux-hwmon@vger.kernel.org, inux-kernel@vger.kernel.org
Cc: lee@kernel.org, gregkh@linuxfoundation.org, arnd@arndb.de,
 Akshay Gupta <akshay.gupta@amd.com>
References: <20240530112307.3089696-1-naveenkrishna.chatradhi@amd.com>
 <20240530112307.3089696-2-naveenkrishna.chatradhi@amd.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240530112307.3089696-2-naveenkrishna.chatradhi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/30/24 04:23, Naveen Krishna Chatradhi wrote:
> From: Akshay Gupta <akshay.gupta@amd.com>
> 
> This is done to support other functionality provided by the SBRMI, which
> does not fit in the hwmon subsystem.
> 
> - Move the core SBRMI core functionality and I2C device probing to MFD
> - Modify this module to be probed as a platform device by the MFD cell.
> 
> Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>

For the hwmon part:

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/hwmon/Kconfig      |   1 +
>   drivers/hwmon/sbrmi.c      | 245 +++----------------------------------
>   drivers/mfd/Kconfig        |  10 +-
>   drivers/mfd/Makefile       |   2 +
>   drivers/mfd/sbrmi-core.c   | 137 +++++++++++++++++++++
>   drivers/mfd/sbrmi-i2c.c    | 106 ++++++++++++++++
>   include/linux/mfd/amd-sb.h |  45 +++++++
>   7 files changed, 316 insertions(+), 230 deletions(-)
>   create mode 100644 drivers/mfd/sbrmi-core.c
>   create mode 100644 drivers/mfd/sbrmi-i2c.c
>   create mode 100644 include/linux/mfd/amd-sb.h
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index e14ae18a973b..56b73e665424 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1839,6 +1839,7 @@ config SENSORS_SBTSI
>   config SENSORS_SBRMI
>   	tristate "Emulated SB-RMI sensor"
>   	depends on I2C
> +	depends on MFD_SBRMI_I2C
>   	help
>   	  If you say yes here you get support for emulated RMI
>   	  sensors on AMD SoCs with APML interface connected to a BMC device.
> diff --git a/drivers/hwmon/sbrmi.c b/drivers/hwmon/sbrmi.c
> index d48d8e5460ff..aaeb5050eb0c 100644
> --- a/drivers/hwmon/sbrmi.c
> +++ b/drivers/hwmon/sbrmi.c
> @@ -3,190 +3,18 @@
>    * sbrmi.c - hwmon driver for a SB-RMI mailbox
>    *           compliant AMD SoC device.
>    *
> - * Copyright (C) 2020-2021 Advanced Micro Devices, Inc.
> + * Copyright (C) 2020-2024 Advanced Micro Devices, Inc.
>    */
>   
> -#include <linux/delay.h>
>   #include <linux/err.h>
>   #include <linux/hwmon.h>
> -#include <linux/i2c.h>
> -#include <linux/init.h>
> +#include <linux/mfd/amd-sb.h>
>   #include <linux/module.h>
> -#include <linux/mutex.h>
> -#include <linux/of.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
>   
>   /* Do not allow setting negative power limit */
>   #define SBRMI_PWR_MIN	0
> -/* Mask for Status Register bit[1] */
> -#define SW_ALERT_MASK	0x2
> -
> -/* Software Interrupt for triggering */
> -#define START_CMD	0x80
> -#define TRIGGER_MAILBOX	0x01
> -
> -/*
> - * SB-RMI supports soft mailbox service request to MP1 (power management
> - * firmware) through SBRMI inbound/outbound message registers.
> - * SB-RMI message IDs
> - */
> -enum sbrmi_msg_id {
> -	SBRMI_READ_PKG_PWR_CONSUMPTION = 0x1,
> -	SBRMI_WRITE_PKG_PWR_LIMIT,
> -	SBRMI_READ_PKG_PWR_LIMIT,
> -	SBRMI_READ_PKG_MAX_PWR_LIMIT,
> -};
> -
> -/* SB-RMI registers */
> -enum sbrmi_reg {
> -	SBRMI_CTRL		= 0x01,
> -	SBRMI_STATUS,
> -	SBRMI_OUTBNDMSG0	= 0x30,
> -	SBRMI_OUTBNDMSG1,
> -	SBRMI_OUTBNDMSG2,
> -	SBRMI_OUTBNDMSG3,
> -	SBRMI_OUTBNDMSG4,
> -	SBRMI_OUTBNDMSG5,
> -	SBRMI_OUTBNDMSG6,
> -	SBRMI_OUTBNDMSG7,
> -	SBRMI_INBNDMSG0,
> -	SBRMI_INBNDMSG1,
> -	SBRMI_INBNDMSG2,
> -	SBRMI_INBNDMSG3,
> -	SBRMI_INBNDMSG4,
> -	SBRMI_INBNDMSG5,
> -	SBRMI_INBNDMSG6,
> -	SBRMI_INBNDMSG7,
> -	SBRMI_SW_INTERRUPT,
> -};
> -
> -/* Each client has this additional data */
> -struct sbrmi_data {
> -	struct i2c_client *client;
> -	struct mutex lock;
> -	u32 pwr_limit_max;
> -};
> -
> -struct sbrmi_mailbox_msg {
> -	u8 cmd;
> -	bool read;
> -	u32 data_in;
> -	u32 data_out;
> -};
> -
> -static int sbrmi_enable_alert(struct i2c_client *client)
> -{
> -	int ctrl;
> -
> -	/*
> -	 * Enable the SB-RMI Software alert status
> -	 * by writing 0 to bit 4 of Control register(0x1)
> -	 */
> -	ctrl = i2c_smbus_read_byte_data(client, SBRMI_CTRL);
> -	if (ctrl < 0)
> -		return ctrl;
> -
> -	if (ctrl & 0x10) {
> -		ctrl &= ~0x10;
> -		return i2c_smbus_write_byte_data(client,
> -						 SBRMI_CTRL, ctrl);
> -	}
> -
> -	return 0;
> -}
> -
> -static int rmi_mailbox_xfer(struct sbrmi_data *data,
> -			    struct sbrmi_mailbox_msg *msg)
> -{
> -	int i, ret, retry = 10;
> -	int sw_status;
> -	u8 byte;
> -
> -	mutex_lock(&data->lock);
> -
> -	/* Indicate firmware a command is to be serviced */
> -	ret = i2c_smbus_write_byte_data(data->client,
> -					SBRMI_INBNDMSG7, START_CMD);
> -	if (ret < 0)
> -		goto exit_unlock;
> -
> -	/* Write the command to SBRMI::InBndMsg_inst0 */
> -	ret = i2c_smbus_write_byte_data(data->client,
> -					SBRMI_INBNDMSG0, msg->cmd);
> -	if (ret < 0)
> -		goto exit_unlock;
> -
> -	/*
> -	 * For both read and write the initiator (BMC) writes
> -	 * Command Data In[31:0] to SBRMI::InBndMsg_inst[4:1]
> -	 * SBRMI_x3C(MSB):SBRMI_x39(LSB)
> -	 */
> -	for (i = 0; i < 4; i++) {
> -		byte = (msg->data_in >> i * 8) & 0xff;
> -		ret = i2c_smbus_write_byte_data(data->client,
> -						SBRMI_INBNDMSG1 + i, byte);
> -		if (ret < 0)
> -			goto exit_unlock;
> -	}
> -
> -	/*
> -	 * Write 0x01 to SBRMI::SoftwareInterrupt to notify firmware to
> -	 * perform the requested read or write command
> -	 */
> -	ret = i2c_smbus_write_byte_data(data->client,
> -					SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
> -	if (ret < 0)
> -		goto exit_unlock;
> -
> -	/*
> -	 * Firmware will write SBRMI::Status[SwAlertSts]=1 to generate
> -	 * an ALERT (if enabled) to initiator (BMC) to indicate completion
> -	 * of the requested command
> -	 */
> -	do {
> -		sw_status = i2c_smbus_read_byte_data(data->client,
> -						     SBRMI_STATUS);
> -		if (sw_status < 0) {
> -			ret = sw_status;
> -			goto exit_unlock;
> -		}
> -		if (sw_status & SW_ALERT_MASK)
> -			break;
> -		usleep_range(50, 100);
> -	} while (retry--);
> -
> -	if (retry < 0) {
> -		dev_err(&data->client->dev,
> -			"Firmware fail to indicate command completion\n");
> -		ret = -EIO;
> -		goto exit_unlock;
> -	}
> -
> -	/*
> -	 * For a read operation, the initiator (BMC) reads the firmware
> -	 * response Command Data Out[31:0] from SBRMI::OutBndMsg_inst[4:1]
> -	 * {SBRMI_x34(MSB):SBRMI_x31(LSB)}.
> -	 */
> -	if (msg->read) {
> -		for (i = 0; i < 4; i++) {
> -			ret = i2c_smbus_read_byte_data(data->client,
> -						       SBRMI_OUTBNDMSG1 + i);
> -			if (ret < 0)
> -				goto exit_unlock;
> -			msg->data_out |= ret << i * 8;
> -		}
> -	}
> -
> -	/*
> -	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
> -	 * ALERT to initiator
> -	 */
> -	ret = i2c_smbus_write_byte_data(data->client, SBRMI_STATUS,
> -					sw_status | SW_ALERT_MASK);
> -
> -exit_unlock:
> -	mutex_unlock(&data->lock);
> -	return ret;
> -}
>   
>   static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
>   		      u32 attr, int channel, long *val)
> @@ -282,76 +110,35 @@ static const struct hwmon_chip_info sbrmi_chip_info = {
>   	.info = sbrmi_info,
>   };
>   
> -static int sbrmi_get_max_pwr_limit(struct sbrmi_data *data)
> +static int sbrmi_probe(struct platform_device *pdev)
>   {
> -	struct sbrmi_mailbox_msg msg = { 0 };
> -	int ret;
> -
> -	msg.cmd = SBRMI_READ_PKG_MAX_PWR_LIMIT;
> -	msg.read = true;
> -	ret = rmi_mailbox_xfer(data, &msg);
> -	if (ret < 0)
> -		return ret;
> -	data->pwr_limit_max = msg.data_out;
> -
> -	return ret;
> -}
> -
> -static int sbrmi_probe(struct i2c_client *client)
> -{
> -	struct device *dev = &client->dev;
> +	struct device *dev = &pdev->dev;
>   	struct device *hwmon_dev;
> -	struct sbrmi_data *data;
> -	int ret;
> -
> -	data = devm_kzalloc(dev, sizeof(struct sbrmi_data), GFP_KERNEL);
> -	if (!data)
> -		return -ENOMEM;
> -
> -	data->client = client;
> -	mutex_init(&data->lock);
> -
> -	/* Enable alert for SB-RMI sequence */
> -	ret = sbrmi_enable_alert(client);
> -	if (ret < 0)
> -		return ret;
> +	struct sbrmi_data *data  = dev_get_drvdata(pdev->dev.parent);
>   
> -	/* Cache maximum power limit */
> -	ret = sbrmi_get_max_pwr_limit(data);
> -	if (ret < 0)
> -		return ret;
> -
> -	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, "sbrmi", data,
>   							 &sbrmi_chip_info, NULL);
> -
>   	return PTR_ERR_OR_ZERO(hwmon_dev);
>   }
>   
> -static const struct i2c_device_id sbrmi_id[] = {
> -	{"sbrmi"},
> -	{}
> -};
> -MODULE_DEVICE_TABLE(i2c, sbrmi_id);
> -
> -static const struct of_device_id __maybe_unused sbrmi_of_match[] = {
> +static const struct platform_device_id sbrmi_id[] = {
>   	{
> -		.compatible = "amd,sbrmi",
> +		.name = "sbrmi-hwmon",
>   	},
>   	{ },
>   };
> -MODULE_DEVICE_TABLE(of, sbrmi_of_match);
> +MODULE_DEVICE_TABLE(platform, sbrmi_id);
>   
> -static struct i2c_driver sbrmi_driver = {
> +static struct platform_driver amd_sbrmi_hwmon_driver = {
> +	.probe = sbrmi_probe,
>   	.driver = {
> -		.name = "sbrmi",
> -		.of_match_table = of_match_ptr(sbrmi_of_match),
> +		.name = "amd-sbrmi",
>   	},
> -	.probe = sbrmi_probe,
>   	.id_table = sbrmi_id,
>   };
> -
> -module_i2c_driver(sbrmi_driver);
> +module_platform_driver(amd_sbrmi_hwmon_driver);
>   
>   MODULE_AUTHOR("Akshay Gupta <akshay.gupta@amd.com>");
> +MODULE_AUTHOR("Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>");
>   MODULE_DESCRIPTION("Hwmon driver for AMD SB-RMI emulated sensor");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 266b4f54af60..0411cb29b6df 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1442,6 +1442,15 @@ config MFD_STMPE
>   		Touchscreen: stmpe-ts
>   		ADC: stmpe-adc
>   
> +config MFD_SBRMI_I2C
> +        tristate "APML SBRMI support"
> +        depends on I2C
> +        select MFD_CORE
> +        help
> +          APML RMI core support for AMD out of band management
> +	  This driver can also be built as a module. If so, the module will
> +	  be called sbrmi.
> +
>   menu "STMicroelectronics STMPE Interface Drivers"
>   depends on MFD_STMPE
>   
> @@ -2333,6 +2342,5 @@ config MFD_RSMU_SPI
>   	  This driver provides common support for accessing the device.
>   	  Additional drivers must be enabled in order to use the functionality
>   	  of the device.
> -
>   endmenu
>   endif
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index c66f07edcd0e..6bc807c2e5ed 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -284,3 +284,5 @@ rsmu-i2c-objs			:= rsmu_core.o rsmu_i2c.o
>   rsmu-spi-objs			:= rsmu_core.o rsmu_spi.o
>   obj-$(CONFIG_MFD_RSMU_I2C)	+= rsmu-i2c.o
>   obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu-spi.o
> +apml_sbrmi-objs  		:= sbrmi-i2c.o sbrmi-core.o
> +obj-$(CONFIG_MFD_SBRMI_I2C)     += apml_sbrmi.o
> diff --git a/drivers/mfd/sbrmi-core.c b/drivers/mfd/sbrmi-core.c
> new file mode 100644
> index 000000000000..d872b5107b36
> --- /dev/null
> +++ b/drivers/mfd/sbrmi-core.c
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * sbrmi-common.c - file defining SB-RMI protocols
> + *		    compliant AMD SoC device.
> + *
> + * Copyright (C) 2021-2024 Advanced Micro Devices, Inc.
> + */
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/mfd/amd-sb.h>
> +#include <linux/mutex.h>
> +
> +/* Mask for Status Register bit[1] */
> +#define SW_ALERT_MASK	0x2
> +
> +/* Software Interrupt for triggering */
> +#define START_CMD	0x80
> +#define TRIGGER_MAILBOX	0x01
> +
> +/* SB-RMI registers */
> +enum sbrmi_reg {
> +	SBRMI_CTRL		= 0x01,
> +	SBRMI_STATUS,
> +	SBRMI_OUTBNDMSG0	= 0x30,
> +	SBRMI_OUTBNDMSG1,
> +	SBRMI_OUTBNDMSG2,
> +	SBRMI_OUTBNDMSG3,
> +	SBRMI_OUTBNDMSG4,
> +	SBRMI_OUTBNDMSG5,
> +	SBRMI_OUTBNDMSG6,
> +	SBRMI_OUTBNDMSG7,
> +	SBRMI_INBNDMSG0,
> +	SBRMI_INBNDMSG1,
> +	SBRMI_INBNDMSG2,
> +	SBRMI_INBNDMSG3,
> +	SBRMI_INBNDMSG4,
> +	SBRMI_INBNDMSG5,
> +	SBRMI_INBNDMSG6,
> +	SBRMI_INBNDMSG7,
> +	SBRMI_SW_INTERRUPT,
> +};
> +
> +int rmi_mailbox_xfer(struct sbrmi_data *data,
> +		     struct sbrmi_mailbox_msg *msg)
> +{
> +	int i, ret, retry = 10;
> +	int sw_status;
> +	u8 byte;
> +
> +	mutex_lock(&data->lock);
> +
> +	/* Indicate firmware a command is to be serviced */
> +	ret = i2c_smbus_write_byte_data(data->client,
> +					SBRMI_INBNDMSG7, START_CMD);
> +	if (ret < 0)
> +		goto exit_unlock;
> +
> +	/* Write the command to SBRMI::InBndMsg_inst0 */
> +	ret = i2c_smbus_write_byte_data(data->client,
> +					SBRMI_INBNDMSG0, msg->cmd);
> +	if (ret < 0)
> +		goto exit_unlock;
> +
> +	/*
> +	 * For both read and write the initiator (BMC) writes
> +	 * Command Data In[31:0] to SBRMI::InBndMsg_inst[4:1]
> +	 * SBRMI_x3C(MSB):SBRMI_x39(LSB)
> +	 */
> +	for (i = 0; i < 4; i++) {
> +		byte = (msg->data_in >> i * 8) & 0xff;
> +		ret = i2c_smbus_write_byte_data(data->client,
> +						SBRMI_INBNDMSG1 + i, byte);
> +		if (ret < 0)
> +			goto exit_unlock;
> +	}
> +
> +	/*
> +	 * Write 0x01 to SBRMI::SoftwareInterrupt to notify firmware to
> +	 * perform the requested read or write command
> +	 */
> +	ret = i2c_smbus_write_byte_data(data->client,
> +					SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
> +	if (ret < 0)
> +		goto exit_unlock;
> +
> +	/*
> +	 * Firmware will write SBRMI::Status[SwAlertSts]=1 to generate
> +	 * an ALERT (if enabled) to initiator (BMC) to indicate completion
> +	 * of the requested command
> +	 */
> +	do {
> +		sw_status = i2c_smbus_read_byte_data(data->client,
> +						     SBRMI_STATUS);
> +		if (sw_status < 0) {
> +			ret = sw_status;
> +			goto exit_unlock;
> +		}
> +		if (sw_status & SW_ALERT_MASK)
> +			break;
> +		usleep_range(50, 100);
> +	} while (retry--);
> +
> +	if (retry < 0) {
> +		dev_err(&data->client->dev,
> +			"Firmware fail to indicate command completion\n");
> +		ret = -EIO;
> +		goto exit_unlock;
> +	}
> +
> +	/*
> +	 * For a read operation, the initiator (BMC) reads the firmware
> +	 * response Command Data Out[31:0] from SBRMI::OutBndMsg_inst[4:1]
> +	 * {SBRMI_x34(MSB):SBRMI_x31(LSB)}.
> +	 */
> +	if (msg->read) {
> +		for (i = 0; i < 4; i++) {
> +			ret = i2c_smbus_read_byte_data(data->client,
> +						       SBRMI_OUTBNDMSG1 + i);
> +			if (ret < 0)
> +				goto exit_unlock;
> +			msg->data_out |= ret << i * 8;
> +		}
> +	}
> +
> +	/*
> +	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
> +	 * ALERT to initiator
> +	 */
> +	ret = i2c_smbus_write_byte_data(data->client, SBRMI_STATUS,
> +					sw_status | SW_ALERT_MASK);
> +
> +exit_unlock:
> +	mutex_unlock(&data->lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL(rmi_mailbox_xfer);
> diff --git a/drivers/mfd/sbrmi-i2c.c b/drivers/mfd/sbrmi-i2c.c
> new file mode 100644
> index 000000000000..96215e986740
> --- /dev/null
> +++ b/drivers/mfd/sbrmi-i2c.c
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * sbrmi.c - hwmon driver for a SB-RMI mailbox
> + *           compliant AMD SoC device.
> + *
> + * Copyright (C) 2020-2024 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/mfd/amd-sb.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +
> +#define SBRMI_CTRL	0x1
> +
> +static int sbrmi_enable_alert(struct i2c_client *client)
> +{
> +	int ctrl;
> +
> +	/*
> +	 * Enable the SB-RMI Software alert status
> +	 * by writing 0 to bit 4 of Control register(0x1)
> +	 */
> +	ctrl = i2c_smbus_read_byte_data(client, SBRMI_CTRL);
> +	if (ctrl < 0)
> +		return ctrl;
> +
> +	if (ctrl & 0x10) {
> +		ctrl &= ~0x10;
> +		return i2c_smbus_write_byte_data(client,
> +						 SBRMI_CTRL, ctrl);
> +	}
> +
> +	return 0;
> +}
> +
> +static int sbrmi_get_max_pwr_limit(struct sbrmi_data *data)
> +{
> +	struct sbrmi_mailbox_msg msg = { 0 };
> +	int ret;
> +
> +	msg.cmd = SBRMI_READ_PKG_MAX_PWR_LIMIT;
> +	msg.read = true;
> +	ret = rmi_mailbox_xfer(data, &msg);
> +	if (ret < 0)
> +		return ret;
> +	data->pwr_limit_max = msg.data_out;
> +
> +	return ret;
> +}
> +
> +static int sbrmi_i2c_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct sbrmi_data *data;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(struct sbrmi_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +	mutex_init(&data->lock);
> +
> +	/* Enable alert for SB-RMI sequence */
> +	ret = sbrmi_enable_alert(client);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Cache maximum power limit */
> +	return sbrmi_get_max_pwr_limit(data);
> +}
> +
> +static const struct i2c_device_id sbrmi_id[] = {
> +	{"sbrmi-mfd"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, sbrmi_id);
> +
> +static const struct of_device_id __maybe_unused sbrmi_of_match[] = {
> +	{
> +		.compatible = "amd,sbrmi",
> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, sbrmi_of_match);
> +
> +static struct i2c_driver sbrmi_driver = {
> +	.driver = {
> +		.name = "sbrmi-mfd",
> +		.of_match_table = of_match_ptr(sbrmi_of_match),
> +	},
> +	.probe = sbrmi_i2c_probe,
> +	.id_table = sbrmi_id,
> +};
> +
> +module_i2c_driver(sbrmi_driver);
> +
> +MODULE_AUTHOR("Akshay Gupta <akshay.gupta@amd.com>");
> +MODULE_AUTHOR("Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>");
> +MODULE_DESCRIPTION("Hwmon driver for AMD SB-RMI emulated sensor");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/amd-sb.h b/include/linux/mfd/amd-sb.h
> new file mode 100644
> index 000000000000..7805f31fb6ea
> --- /dev/null
> +++ b/include/linux/mfd/amd-sb.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2021-2024 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _AMD_SB_H_
> +#define _AMD_SB_H_
> +
> +#include <linux/mutex.h>
> +#include <linux/i2c.h>
> +/*
> + * SB-RMI supports soft mailbox service request to MP1 (power management
> + * firmware) through SBRMI inbound/outbound message registers.
> + * SB-RMI message IDs
> + */
> +enum sbrmi_msg_id {
> +	SBRMI_READ_PKG_PWR_CONSUMPTION = 0x1,
> +	SBRMI_WRITE_PKG_PWR_LIMIT,
> +	SBRMI_READ_PKG_PWR_LIMIT,
> +	SBRMI_READ_PKG_MAX_PWR_LIMIT,
> +};
> +
> +/* Each client has this additional data */
> +struct sbrmi_data {
> +	struct i2c_client *client;
> +	struct mutex lock;
> +	u32 pwr_limit_max;
> +};
> +
> +struct sbrmi_mailbox_msg {
> +	u8 cmd;
> +	bool read;
> +	u32 data_in;
> +	u32 data_out;
> +};
> +
> +#if IS_ENABLED(CONFIG_MFD_SBRMI_I2C)
> +int rmi_mailbox_xfer(struct sbrmi_data *data, struct sbrmi_mailbox_msg *msg);
> +#else
> +int rmi_mailbox_xfer(struct sbrmi_data *data, struct sbrmi_mailbox_msg *msg)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif
> +#endif /*_AMD_SB_H_*/

