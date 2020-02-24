Return-Path: <SRS0=BLaD=4M=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A00C11D2F
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 14:50:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B478420714
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 14:50:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="osa2VYM/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbgBXOuo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Feb 2020 09:50:44 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45003 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727589AbgBXOuo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Feb 2020 09:50:44 -0500
Received: by mail-pl1-f193.google.com with SMTP id d9so4136642plo.11
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Feb 2020 06:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bJcQy+bJfHa7Rgl4m0SHODQsf3VfWhRu4yqNGTgWwCU=;
        b=osa2VYM/ANDU2PhuQ5HcMedcBFCF+0UMM0GLkaz76WBfx2HvD8S8nkhNDwzsX7B+JS
         ojWLjg+YlUawUgmyNkBW5ZSrLgqBti3vSNTLtJ1DSIh8i3jsWUUKUKOQ2621VC4HZ4dh
         KC4HJufuN8zcYnt3z2w6/Rrtz7Ys8gIK/jpG+RPAMW0IrsU4OYlMmGSLiTOsTYRTYzeJ
         d7Shd6mXm1wO9eh+8PlycdVJ+jfrjm/O6ac1N0Uh+0XeOJ+krjTBlcx4IHeAQR4R+Oxh
         CdPu16O/+wx7cJaOqTrLuhaHtPI6V5oUS/1046AWhFoFpOhCB8osRQGtMCuK0XVGfpfA
         kPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bJcQy+bJfHa7Rgl4m0SHODQsf3VfWhRu4yqNGTgWwCU=;
        b=tjZGYKnd8/veV0lPvk3/3Lw1JM9RhQE1N3ZpaEJV6Nm2eqgGA4EcBXalC9QaFWHFP/
         IGBdr9rUAdCENUmVf8PDvocjaW0wmdVS1qyU4JJZQysZreKm16xMWUKvSNaLVrJ2ouGO
         s031jDQZpENSm7l4v8yWOgQ0mp5DMao3nA2NVW057LcGZ7bsauUubFTjixiAjGW1PJcK
         gIY3PItngWvEkAAPRwhYd3qy1IIvZEkDEF0DY4cd82j5R1jeg/KEqUnU+A64L7dcLgKy
         3gALVdFfvm0tvQ3/SHI0m2Vz48xqPSxjd0hCV3PQxe8NwyBKEMt0y6y4VBagK3EsfEVb
         0NUw==
X-Gm-Message-State: APjAAAXQSav5En8DnsD2UxMbTfuHm9uE3l7crTIJMbSrP3ma/McDM7Wu
        dhVlgZPYpVw43UAQMtAifrIOmP5d
X-Google-Smtp-Source: APXvYqw9MNQLIlS6cZp3c99HtmaIQjjw8RacQZ7l0cDjZF3Zm5DODxr1rmjT4Xb62XphjgYsrPP49A==
X-Received: by 2002:a17:90a:c216:: with SMTP id e22mr20802400pjt.134.1582555842358;
        Mon, 24 Feb 2020 06:50:42 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g9sm13473305pfm.150.2020.02.24.06.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2020 06:50:41 -0800 (PST)
Subject: Re: [hwmon-next v1] hwmon: (pmbus/tps53679) Add support for
 historical registers for TPS53688
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20200224131316.28238-1-vadimp@mellanox.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <b9b2d96b-1b1d-7445-18a7-21e3d28e6819@roeck-us.net>
Date:   Mon, 24 Feb 2020 06:50:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224131316.28238-1-vadimp@mellanox.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/24/20 5:13 AM, Vadim Pasternak wrote:
> TPS53688 supports historical registers. Patch allows exposing the next
> attributes for the historical registers in 'sysfs':
> - curr{x}_reset_history;
> - in{x}_reset_history;
> - power{x}_reset_history;
> - temp{x}_reset_history;
> - curr{x}_highest;
> - in{x}_highest;
> - power{x}_input_highest;
> - temp{x}_highest;
> - curr{x}_lowest;
> - in{x}_lowest;
> - power{x}_input_lowest;
> - temp{x}_lowest.
> 
> This patch is required patch:
> "hwmon: (pmbus/core) Add callback for register to data conversion".
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>   drivers/hwmon/pmbus/tps53679.c | 244 ++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 243 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
> index 157c99ffb52b..ae5ce144e5fe 100644
> --- a/drivers/hwmon/pmbus/tps53679.c
> +++ b/drivers/hwmon/pmbus/tps53679.c
> @@ -34,6 +34,227 @@ enum chips {
>   
>   #define TPS53681_MFR_SPECIFIC_20	0xe4	/* Number of phases, per page */
>   
> +/* Registers for highest and lowest historical values records */
> +#define TPS53688_VOUT_PEAK		0xd1
> +#define TPS53688_IOUT_PEAK		0xd2
> +#define TPS53688_TEMP_PEAK		0xd3
> +#define TPS53688_VIN_PEAK		0xd5
> +#define TPS53688_IIN_PEAK		0xd6
> +#define TPS53688_PIN_PEAK		0xd7
> +#define TPS53688_POUT_PEAK		0xd8
> +#define TPS53688_HISTORY_REG_BUF_LEN	5
> +#define TPS53688_HISTORY_REG_MIN_OFFSET	3
> +#define TPS53688_HISTORY_REG_MAX_OFFSET	1
> +
> +const static u8 tps53688_reset_logging[] = { 0x04, 0x00, 0x01, 0x00, 0x00 };
> +const static u8 tps53688_resume_logging[] = { 0x04, 0x20, 0x00, 0x00, 0x00 };
> +
Passing the length as 1st field seems wrong.

> +static int tps53688_reg2data(u16 reg, int data, long *val)
> +{
> +	s16 exponent;
> +	s32 mantissa;
> +
> +	if (data == 0)
> +		return data;
> +
> +	switch (reg) {
> +	case PMBUS_VIRT_READ_VOUT_MIN:
> +	case PMBUS_VIRT_READ_VOUT_MAX:
> +		/* Convert to LINEAR11. */
> +		exponent = ((s16)data) >> 11;
> +		mantissa = ((s16)((data & GENMASK(10, 0)) << 5)) >> 5;
> +		*val = mantissa * 1000L;
> +		if (exponent >= 0)
> +			*val <<= exponent;
> +		else
> +			*val >>= -exponent;
> +		return 0;
> +	default:
> +		return -ENODATA;
> +	}
> +}
> +
As with the xpde driver, I would suggest to implement the conversion in the
read_word_data function.

> +static int
> +tps53688_get_history(struct i2c_client *client, int reg, int page, int unused,
> +		     int offset)

What is the point of passing "unused" to this function ?

> +{
> +	u8 buf[TPS53688_HISTORY_REG_BUF_LEN];
> +	int ret;
> +
> +	ret = pmbus_set_page(client, page, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_smbus_read_i2c_block_data(client, reg,
> +					    TPS53688_HISTORY_REG_BUF_LEN,
> +					    buf);
> +	if (ret < 0)
> +		return ret;
> +	else if (ret != TPS53688_HISTORY_REG_BUF_LEN)
> +		return -EIO;

I am a bit confused here. Are you sure this returns (and is supposed to return)
5 bytes of data, not 4, and that the data offsets are 1 and 3, not 0 and 2 ?
i2c_smbus_read_i2c_block_data() returns the length, and only copies the data
into the buffer, not the length field.

> +
> +	return *(u16 *)(buf + offset);

This implies host byte order. I don't think it will work on big endian systems.
Besides, it won't work on systems which can not directly read from odd
addresses (if the odd offsets are indeed correct).

> +}
> +
> +static int
> +tps53688_reset_history(struct i2c_client *client, int reg)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_write_i2c_block_data(client, reg,
> +					     TPS53688_HISTORY_REG_BUF_LEN,
> +					     tps53688_reset_logging);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_smbus_write_i2c_block_data(client, reg,
> +					     TPS53688_HISTORY_REG_BUF_LEN,
> +					     tps53688_resume_logging);
> +	if (ret < 0)
> +		return ret;
> +
Are you sure that a single write of 00 00 01 00 wouldn't do it ?
Is it indeed necessary to resume logging after resetting it ?

> +	return 0;
> +}
> +
> +static int tps53688_reset_history_all(struct i2c_client *client, int page)
> +{
> +	int ret;
> +
> +	ret = pmbus_set_page(client, page, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = tps53688_reset_history(client, TPS53688_TEMP_PEAK);
> +	ret = !ret ? tps53688_reset_history(client, TPS53688_VIN_PEAK) : ret;
> +	ret = !ret ? tps53688_reset_history(client, TPS53688_IIN_PEAK) : ret;
> +	ret = !ret ? tps53688_reset_history(client, TPS53688_PIN_PEAK) : ret;
> +	ret = !ret ? tps53688_reset_history(client, TPS53688_POUT_PEAK) : ret;
> +	ret = !ret ? tps53688_reset_history(client, TPS53688_VOUT_PEAK) : ret;
> +	ret = !ret ? tps53688_reset_history(client, TPS53688_IOUT_PEAK) : ret;
> +
> +	return ret;
> +}
> +
> +static int tps53688_read_word_data(struct i2c_client *client, int page,
> +				   int unused, int reg)
> +{
> +	int histreg, offset;
> +
> +	switch (reg) {
> +	case PMBUS_VIRT_READ_TEMP_MIN:
> +		histreg = TPS53688_TEMP_PEAK;
> +		offset = TPS53688_HISTORY_REG_MIN_OFFSET;
> +		break;
> +	case PMBUS_VIRT_READ_TEMP_MAX:
> +		histreg = TPS53688_TEMP_PEAK;
> +		offset = TPS53688_HISTORY_REG_MAX_OFFSET;
> +		break;
> +	case PMBUS_VIRT_READ_VIN_MIN:
> +		histreg = TPS53688_VIN_PEAK;
> +		offset = TPS53688_HISTORY_REG_MIN_OFFSET;
> +		break;
> +	case PMBUS_VIRT_READ_VIN_MAX:
> +		histreg = TPS53688_VIN_PEAK;
> +		offset = TPS53688_HISTORY_REG_MAX_OFFSET;
> +		break;
> +	case PMBUS_VIRT_READ_IIN_MIN:
> +		histreg = TPS53688_IIN_PEAK;
> +		offset = TPS53688_HISTORY_REG_MIN_OFFSET;
> +		break;
> +	case PMBUS_VIRT_READ_IIN_MAX:
> +		histreg = TPS53688_IIN_PEAK;
> +		offset = TPS53688_HISTORY_REG_MAX_OFFSET;
> +		break;
> +	case PMBUS_VIRT_READ_PIN_MIN:
> +		histreg = TPS53688_PIN_PEAK;
> +		offset = TPS53688_HISTORY_REG_MIN_OFFSET;
> +		break;
> +	case PMBUS_VIRT_READ_PIN_MAX:
> +		histreg = TPS53688_PIN_PEAK;
> +		offset = TPS53688_HISTORY_REG_MAX_OFFSET;
> +		break;
> +	case PMBUS_VIRT_READ_POUT_MIN:
> +		histreg = TPS53688_POUT_PEAK;
> +		offset = TPS53688_HISTORY_REG_MIN_OFFSET;
> +		break;
> +	case PMBUS_VIRT_READ_POUT_MAX:
> +		histreg = TPS53688_POUT_PEAK;
> +		offset = TPS53688_HISTORY_REG_MAX_OFFSET;
> +		break;
> +	case PMBUS_VIRT_READ_VOUT_MIN:
> +		histreg = TPS53688_VOUT_PEAK;
> +		offset = TPS53688_HISTORY_REG_MIN_OFFSET;
> +		break;
> +	case PMBUS_VIRT_READ_VOUT_MAX:
> +		histreg = TPS53688_VOUT_PEAK;
> +		offset = TPS53688_HISTORY_REG_MAX_OFFSET;
> +		break;
> +	case PMBUS_VIRT_READ_IOUT_MIN:
> +		histreg = TPS53688_IOUT_PEAK;
> +		offset = TPS53688_HISTORY_REG_MIN_OFFSET;
> +		break;
> +	case PMBUS_VIRT_READ_IOUT_MAX:
> +		histreg = TPS53688_IOUT_PEAK;
> +		offset = TPS53688_HISTORY_REG_MAX_OFFSET;
> +		break;
> +	case PMBUS_VIRT_READ_TEMP2_MIN:
> +		histreg = TPS53688_TEMP_PEAK;
> +		offset = TPS53688_HISTORY_REG_MIN_OFFSET;
> +		break;
> +	case PMBUS_VIRT_READ_TEMP2_MAX:
> +		histreg = TPS53688_TEMP_PEAK;
> +		offset = TPS53688_HISTORY_REG_MAX_OFFSET;
> +		break;
> +	case PMBUS_VIRT_RESET_TEMP_HISTORY:
> +	case PMBUS_VIRT_RESET_TEMP2_HISTORY:
> +	case PMBUS_VIRT_RESET_VIN_HISTORY:
> +	case PMBUS_VIRT_RESET_IIN_HISTORY:
> +	case PMBUS_VIRT_RESET_PIN_HISTORY:
> +	case PMBUS_VIRT_RESET_POUT_HISTORY:
> +	case PMBUS_VIRT_RESET_VOUT_HISTORY:
> +	case PMBUS_VIRT_RESET_IOUT_HISTORY:
> +		return 0;
> +	default:
> +		return -ENODATA;
> +	}
> +
> +	return tps53688_get_history(client, histreg, page, unused, offset);
> +}
> +
> +static int tps53688_write_word_data(struct i2c_client *client, int unused1,
> +				    int reg, u16 unused2)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_VIRT_RESET_TEMP_HISTORY:
> +	case PMBUS_VIRT_RESET_TEMP2_HISTORY:
> +		ret = tps53688_reset_history(client, TPS53688_TEMP_PEAK);
> +		break;
> +	case PMBUS_VIRT_RESET_VIN_HISTORY:
> +		ret = tps53688_reset_history(client, TPS53688_VIN_PEAK);
> +		break;
> +	case PMBUS_VIRT_RESET_IIN_HISTORY:
> +		ret = tps53688_reset_history(client, TPS53688_IIN_PEAK);
> +		break;
> +	case PMBUS_VIRT_RESET_PIN_HISTORY:
> +		ret = tps53688_reset_history(client, TPS53688_PIN_PEAK);
> +		break;
> +	case PMBUS_VIRT_RESET_POUT_HISTORY:
> +		ret = tps53688_reset_history(client, TPS53688_POUT_PEAK);
> +		break;
> +	case PMBUS_VIRT_RESET_VOUT_HISTORY:
> +		ret = tps53688_reset_history(client, TPS53688_VOUT_PEAK);
> +		break;
> +	case PMBUS_VIRT_RESET_IOUT_HISTORY:
> +		ret = tps53688_reset_history(client, TPS53688_IOUT_PEAK);
> +		break;
> +	default:
> +		return -ENODATA;
> +	}
> +	return ret;
> +}
> +
>   static int tps53679_identify_mode(struct i2c_client *client,
>   				  struct pmbus_driver_info *info)
>   {
> @@ -188,7 +409,9 @@ static int tps53679_probe(struct i2c_client *client,
>   {
>   	struct device *dev = &client->dev;
>   	struct pmbus_driver_info *info;
> +	bool reset_history = false;
>   	enum chips chip_id;
> +	int i, ret;
>   
>   	if (dev->of_node)
>   		chip_id = (enum chips)of_device_get_match_data(dev);
> @@ -206,9 +429,16 @@ static int tps53679_probe(struct i2c_client *client,
>   		info->identify = tps53679_identify;
>   		break;
>   	case tps53679:
> +		info->pages = TPS53679_PAGE_NUM;
> +		info->identify = tps53679_identify;
> +		break;
>   	case tps53688:
>   		info->pages = TPS53679_PAGE_NUM;
>   		info->identify = tps53679_identify;
> +		info->read_word_data = tps53688_read_word_data;
> +		info->write_word_data = tps53688_write_word_data;
> +		info->reg2data = tps53688_reg2data;
> +		reset_history = true;
>   		break;
>   	case tps53681:
>   		info->pages = TPS53679_PAGE_NUM;
> @@ -220,7 +450,19 @@ static int tps53679_probe(struct i2c_client *client,
>   		return -ENODEV;
>   	}
>   
> -	return pmbus_do_probe(client, id, info);
> +	ret = pmbus_do_probe(client, id, info);
> +	if (ret)
> +		return ret;
> +
> +	if (reset_history) {
> +		for (i = 0; i < info->pages; i++) {
> +			ret = tps53688_reset_history_all(client, i);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
Why ? Values recorded prior to loading the driver are just as important,
as values recorded afterwards, or even more important.

> +	return ret;
>   }
>   
>   static const struct i2c_device_id tps53679_id[] = {
> 

