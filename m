Return-Path: <SRS0=BLaD=4M=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB841C11D2F
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 15:10:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8AEDA20828
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 15:10:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pizg+mkt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbgBXPKv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Feb 2020 10:10:51 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35223 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727299AbgBXPKv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Feb 2020 10:10:51 -0500
Received: by mail-pf1-f194.google.com with SMTP id i19so5517472pfa.2
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Feb 2020 07:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gkLJUqy2bU1nQGA9FqQEJWEilctTbZiQoc7uYwjAgD0=;
        b=Pizg+mkt+XVZ73xee988ARHxYlZk9RzzuPZ/gX3hQj9HTHIvXg4tnU9TdM9g19f8PY
         DtxjG/4zdC7n6/pxUMDzUmNkMVSNjsRL8YL6hnjWofky84xFk77VuJUaRxCmGXKe5dKC
         wRdw58fibFa5IEcsj9INT8C0+i1vjVtmtFuZBgoXSecEyxi4yuO01VayPfebZDYaV1PR
         wsUSH2V7Tr12+XO9/EIlX3S6L34DSegRZrDocv70UqM0iRaK8/fd7rl6bEO0pdIyInJU
         3CGM8U6eZ/jO+bSbOwwpVWTxE+JVFJs63g+1sKVIQgc7vtt57UxtIH5Gy6R4NA4uk9jq
         Rvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gkLJUqy2bU1nQGA9FqQEJWEilctTbZiQoc7uYwjAgD0=;
        b=GSdhTMwqb75KSCVk0nxCICERA+H/d8qntkSyo0rqzr6ioJxrFZIwfkG/1bjd8HFJkx
         h7OeruaupzM36Uah0IoGsAsWl84lP1QlrIi27pVizfhFUZ/kARLhIjtjkQ1gyBWtcPES
         QoD2X4S56w68tRnTtKDpMmJDMzC71JnwbR9uEENc5r5rQ11udkFDpfecUCNmih9EHRQP
         hDgJR0UWjZN5+9hJSdYnSxnHk2T53WohNmO7NWl7FpbuzmNqll7YTglmxzj8zAuKPlXv
         vagredpP3G3ASul4SZ8ashw4oR2Z1IjU36a1obhawSJYnoBfNtSYcKQYGW3fA+Pi4yLb
         o16w==
X-Gm-Message-State: APjAAAWDz2cpGOxNgBWAK203/yOKtV3jNZ2v9boiGhHT7hMOddqi+4Qs
        ZLnZuERfH/qoPumI9MsXDYDUtTZ6
X-Google-Smtp-Source: APXvYqxr9RMIyxlDhvqrWjJrQ492moysnKknTFN7pkb7A8/p6vHS0YhbbSSjfW+k2RQf7BOJr5HTEQ==
X-Received: by 2002:a63:ba05:: with SMTP id k5mr8876896pgf.174.1582557049926;
        Mon, 24 Feb 2020 07:10:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c19sm13249980pgh.8.2020.02.24.07.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2020 07:10:49 -0800 (PST)
Subject: Re: [hwmon-next v1] hwmon: (pmbus/tps53679) Add support for
 historical registers for TPS53688
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20200224131316.28238-1-vadimp@mellanox.com>
 <b9b2d96b-1b1d-7445-18a7-21e3d28e6819@roeck-us.net>
Message-ID: <d38525ac-e7f2-970b-5c7c-e0a84d492492@roeck-us.net>
Date:   Mon, 24 Feb 2020 07:10:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <b9b2d96b-1b1d-7445-18a7-21e3d28e6819@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/24/20 6:50 AM, Guenter Roeck wrote:
> On 2/24/20 5:13 AM, Vadim Pasternak wrote:
>> TPS53688 supports historical registers. Patch allows exposing the next
>> attributes for the historical registers in 'sysfs':
>> - curr{x}_reset_history;
>> - in{x}_reset_history;
>> - power{x}_reset_history;
>> - temp{x}_reset_history;
>> - curr{x}_highest;
>> - in{x}_highest;
>> - power{x}_input_highest;
>> - temp{x}_highest;
>> - curr{x}_lowest;
>> - in{x}_lowest;
>> - power{x}_input_lowest;
>> - temp{x}_lowest.
>>
>> This patch is required patch:
>> "hwmon: (pmbus/core) Add callback for register to data conversion".
>>
>> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
>> ---
>>   drivers/hwmon/pmbus/tps53679.c | 244 ++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 243 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
>> index 157c99ffb52b..ae5ce144e5fe 100644
>> --- a/drivers/hwmon/pmbus/tps53679.c
>> +++ b/drivers/hwmon/pmbus/tps53679.c
>> @@ -34,6 +34,227 @@ enum chips {
>>   #define TPS53681_MFR_SPECIFIC_20    0xe4    /* Number of phases, per page */
>> +/* Registers for highest and lowest historical values records */
>> +#define TPS53688_VOUT_PEAK        0xd1
>> +#define TPS53688_IOUT_PEAK        0xd2
>> +#define TPS53688_TEMP_PEAK        0xd3
>> +#define TPS53688_VIN_PEAK        0xd5
>> +#define TPS53688_IIN_PEAK        0xd6
>> +#define TPS53688_PIN_PEAK        0xd7
>> +#define TPS53688_POUT_PEAK        0xd8
>> +#define TPS53688_HISTORY_REG_BUF_LEN    5
>> +#define TPS53688_HISTORY_REG_MIN_OFFSET    3
>> +#define TPS53688_HISTORY_REG_MAX_OFFSET    1
>> +
>> +const static u8 tps53688_reset_logging[] = { 0x04, 0x00, 0x01, 0x00, 0x00 };
>> +const static u8 tps53688_resume_logging[] = { 0x04, 0x20, 0x00, 0x00, 0x00 };
>> +
> Passing the length as 1st field seems wrong.
> 
>> +static int tps53688_reg2data(u16 reg, int data, long *val)
>> +{
>> +    s16 exponent;
>> +    s32 mantissa;
>> +
>> +    if (data == 0)
>> +        return data;
>> +
>> +    switch (reg) {
>> +    case PMBUS_VIRT_READ_VOUT_MIN:
>> +    case PMBUS_VIRT_READ_VOUT_MAX:
>> +        /* Convert to LINEAR11. */
>> +        exponent = ((s16)data) >> 11;
>> +        mantissa = ((s16)((data & GENMASK(10, 0)) << 5)) >> 5;
>> +        *val = mantissa * 1000L;
>> +        if (exponent >= 0)
>> +            *val <<= exponent;
>> +        else
>> +            *val >>= -exponent;
>> +        return 0;
>> +    default:
>> +        return -ENODATA;
>> +    }
>> +}
>> +
> As with the xpde driver, I would suggest to implement the conversion in the
> read_word_data function.
> 
>> +static int
>> +tps53688_get_history(struct i2c_client *client, int reg, int page, int unused,
>> +             int offset)
> 
> What is the point of passing "unused" to this function ?
> 
>> +{
>> +    u8 buf[TPS53688_HISTORY_REG_BUF_LEN];
>> +    int ret;
>> +
>> +    ret = pmbus_set_page(client, page, 0);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ret = i2c_smbus_read_i2c_block_data(client, reg,
>> +                        TPS53688_HISTORY_REG_BUF_LEN,
>> +                        buf);
>> +    if (ret < 0)
>> +        return ret;
>> +    else if (ret != TPS53688_HISTORY_REG_BUF_LEN)
>> +        return -EIO;
> 
> I am a bit confused here. Are you sure this returns (and is supposed to return)
> 5 bytes of data, not 4, and that the data offsets are 1 and 3, not 0 and 2 ?
> i2c_smbus_read_i2c_block_data() returns the length, and only copies the data
> into the buffer, not the length field.
> 
Wait, you care calling i2c_smbus_read_i2c_block_data() instead of
i2c_smbus_read_block_data(). Maybe that explains why you need to specify
the length twice. This should really be i2c_smbus_read_block_data()
(and, yes, the buffer needs to fit the maximum smbus block length).

Same for write.

Thanks,
Guenter
