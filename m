Return-Path: <SRS0=BLaD=4M=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78F5C11D2F
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 15:08:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8499C20836
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 15:08:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQ5dRCA6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727646AbgBXPIR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Feb 2020 10:08:17 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45002 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727515AbgBXPIR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Feb 2020 10:08:17 -0500
Received: by mail-pg1-f194.google.com with SMTP id a14so4907684pgb.11
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Feb 2020 07:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uaXDl3dwkiQoleDO+eQ/yO3PO/ZvsKiagRpAyJ2lXOo=;
        b=EQ5dRCA6ME/eAnj/8rWbiCR/NSdl6/Ldln+n7v1RmECafs/MDTkLf/cLhD91eftoHj
         GkLdHoB+OSJuHtd8GgkMXur6qRHResAu+GqCniDFJyEW+O1+pZ2G39AtUYj8ahaB+j3Q
         6/+rsXC5pMWMZEZmObEeeAAZ0qCxzR+3U846ZuKjqribBul/hevTHjW5AWU8egSskcnb
         5Wm6yZC7rckmE0a513YTWv5zMPh5BrUWdus2K2TPRP8S/hWZ6of7vtzS5etf9PSuLwvX
         8X9wvx843k4091qBPBOwqlMhDwSuizCkZOLAVrG2T9AFcF2gSgT1981cSbr1fOCVrjSc
         Kqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uaXDl3dwkiQoleDO+eQ/yO3PO/ZvsKiagRpAyJ2lXOo=;
        b=DSmzH8bSevu3VyhLnuGjjWCxxxJYbPJS5lKPfOKZI1v+vLsBEh2wt1T9c3lGZogmyG
         yGNkIUG5fRyI1u3wQDwBeIY3NV9fCj4RIgagmjad2mwrVzrSmYTVof/GKDLvzhuTemLA
         IliAJvFxMssUz2F7WXNbwhvemCN0pQGWxvQ9dwrmlZp//DefjR9la2ExXO1260aA/qBL
         6VU+y9n25DJbHHu+ufo+kU63GUInOL4Vp0Myd+Uk4+1a3z4ZCljs0Cw3hxK2AxMSLnsA
         hyAkyV3qXGU1/cNv6YvYUhl/Vc3V1qdCDGgiUKCDrZ05SiaNXU+9IkOFmY22/3ZH/kel
         yVKA==
X-Gm-Message-State: APjAAAWb7F9nVMMqhtBo25+bwmheA3iwYOwgNK474o9alfCGx8wkvDxE
        GUAuzFV1ZW4B+6jo9IemlbECC85Q
X-Google-Smtp-Source: APXvYqyZoekccfP/AF4SsURaEYxtKn+FCBnoxtMImctxvEeoTcUS6/MuL89ShcIP43D5ZmMtZ6VWKw==
X-Received: by 2002:a63:1e5e:: with SMTP id p30mr56922512pgm.112.1582556896142;
        Mon, 24 Feb 2020 07:08:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p21sm13183226pfn.103.2020.02.24.07.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2020 07:08:15 -0800 (PST)
Subject: Re: [hwmon-next v1 2/2] hwmon: (pmbus/xdpe12284) Add custom format
 for vout limits conversion
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <20200224131257.28176-1-vadimp@mellanox.com>
 <20200224131257.28176-3-vadimp@mellanox.com>
 <25433626-800a-b9f7-4b39-f49cadddacab@roeck-us.net>
 <DB6PR0501MB23585DF7759762B47792767FA2EC0@DB6PR0501MB2358.eurprd05.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <447374fe-8888-3162-e4dc-cc2f499b7260@roeck-us.net>
Date:   Mon, 24 Feb 2020 07:08:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <DB6PR0501MB23585DF7759762B47792767FA2EC0@DB6PR0501MB2358.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/24/20 7:00 AM, Vadim Pasternak wrote:
> 
> 
>> -----Original Message-----
>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>> Sent: Monday, February 24, 2020 4:27 PM
>> To: Vadim Pasternak <vadimp@mellanox.com>
>> Cc: linux-hwmon@vger.kernel.org
>> Subject: Re: [hwmon-next v1 2/2] hwmon: (pmbus/xdpe12284) Add custom
>> format for vout limits conversion
>>
>> On 2/24/20 5:12 AM, Vadim Pasternak wrote:
>>> Provide callback for overvoltage and undervoltage output readouts
>>> conversion. These registers are presented in 'slinear11' format, while
>>> default conversion for 'vout' class for the devices is 'vid'. It is
>>> resulted in wrong conversion in pmbus_reg2data() for in{3-4}_lcrit and
>>> in{3-4}_crit attributes.
>>>
>>> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
>>> ---
>>>    drivers/hwmon/pmbus/xdpe12284.c | 23 +++++++++++++++++++++++
>>>    1 file changed, 23 insertions(+)
>>>
>>> diff --git a/drivers/hwmon/pmbus/xdpe12284.c
>>> b/drivers/hwmon/pmbus/xdpe12284.c index ecd9b65627ec..751c8e18c881
>>> 100644
>>> --- a/drivers/hwmon/pmbus/xdpe12284.c
>>> +++ b/drivers/hwmon/pmbus/xdpe12284.c
>>> @@ -18,6 +18,28 @@
>>>    #define XDPE122_AMD_625MV		0x10 /* AMD mode 6.25mV */
>>>    #define XDPE122_PAGE_NUM		2
>>>
>>> +static int xdpe122_reg2data(u16 reg, int data, long *val) {
>>> +	s16 exponent;
>>> +	s32 mantissa;
>>> +
>>> +	switch (reg) {
>>> +	case PMBUS_VOUT_OV_FAULT_LIMIT:
>>> +	case PMBUS_VOUT_UV_FAULT_LIMIT:
>>
>> Another situation where having a datasheet would be quite valuable.
>>
>> I would suggest to implement reading those two registers locally and convert
>> them to the expected data format. That seems to be more straightforward than
>> re-implementing slinear conversion.
> 
> Hi Guenter,
> 
> Do you mean to implement them locally through the virtual registers?
> 	case PMBUS_VIRT_VMON_OV_FAULT_LIMIT:
> 	case PMBUS_VIRT_VMON_UV_FAULT_LIMIT:
> 

No, just implement reading PMBUS_VOUT_OV_FAULT_LIMIT and PMBUS_VOUT_UV_FAULT_LIMIT
locally, or in other words intercept it in a read_word_data function.

Thanks,
Guenter

> Thanks,
> Vadim.
> 
>>
>> Thanks,
>> Guenter
>>
>>> +		/* Convert to LINEAR11. */
>>> +		exponent = ((s16)data) >> 11;
>>> +		mantissa = ((s16)((data & GENMASK(10, 0)) << 5)) >> 5;
>>> +		*val = mantissa * 1000L;
>>> +		if (exponent >= 0)
>>> +			*val <<= exponent;
>>> +		else
>>> +			*val >>= -exponent;
>>> +		return 0;
>>> +	default:
>>> +		return -ENODATA;
>>> +	}
>>> +}
>>> +
>>>    static int xdpe122_identify(struct i2c_client *client,
>>>    			    struct pmbus_driver_info *info)
>>>    {
>>> @@ -70,6 +92,7 @@ static struct pmbus_driver_info xdpe122_info = {
>>>    		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
>>>    		PMBUS_HAVE_POUT | PMBUS_HAVE_PIN |
>> PMBUS_HAVE_STATUS_INPUT,
>>>    	.identify = xdpe122_identify,
>>> +	.reg2data = xdpe122_reg2data,
>>>    };
>>>
>>>    static int xdpe122_probe(struct i2c_client *client,
>>>
> 

