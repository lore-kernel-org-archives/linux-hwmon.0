Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD56EC636D4
	for <linux-hwmon@archiver.kernel.org>; Mon, 30 Jan 2023 18:42:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235545AbjA3Smn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 30 Jan 2023 13:42:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236120AbjA3Smk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 30 Jan 2023 13:42:40 -0500
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49DBA2138
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Jan 2023 10:42:39 -0800 (PST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-163ba2b7c38so4426275fac.4
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Jan 2023 10:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mwQ90WN7hGutRn+8+JfFDyi61llfAAzsJ/3LE5BLw94=;
        b=bsSiytm2hBdFkLEltokTt03Ye/ktZ5j4kRFK/yADQqkw/5zcy9JfzlVlcZrXOSH4yd
         ylebtMxCW7CG9r8GGQkRzNxkuT1Itv8XB4Sc9ahvoLvuO/Fy0r17rV6RsXap05jTXctu
         kUaBIGX/KsB43rHc3/j87O3v3kn0Q/J8CBAA6QLYVmmrDV5xgYVgKHEYE6+LKo7He7UM
         aWO1OfW0hVJFHpJW9i5rjXTakPWSARHKaUNH1mhLoRJ7ef1cUQ7TgVAxjNyLGEkHybpD
         k4+m7VHBhx6r1tr8WEvfDph8EjkAgMDxkEug9DSXSlLZbzO5ityPOvAhZAGE7zygPWO0
         zxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mwQ90WN7hGutRn+8+JfFDyi61llfAAzsJ/3LE5BLw94=;
        b=qdoHT9MbSbe+S8jquSdzrTFBKpZeb/omoyPO7mMw0RW35hUGJWwkgqjZF4EvQfojLG
         DfZC0AgGMkCeD+5qicx6WMKkZ11iMvXXiFNZ1x09vCrc9I37saXmLpkmYprAP/00DDv3
         YnJinYrZx9ORWXSJz94C8vEZ56a56JY4h4GM12KgCxmImWfa56ikhvkcWSk6XR6Wp8HS
         CV8AwjBkqxVudVfGfx6+V/qRCec5arunK/bZVBIOUDQMd0Oai6EQS9kPCz/6uIDHWgaC
         AqSmNGF29iOmfxB7W7lR5+wHooVgaxfkPEOpyb5x6HKvKY3mfksl3MQomZc7p3oRACPS
         4K1g==
X-Gm-Message-State: AO0yUKUWiqITE+w4Nloc0zmHsQiku0E85BrIBlrBFYIircSNIvG+g0uL
        zKuSD6KIf3nnovCRlrDxgTIXsNrrOmg=
X-Google-Smtp-Source: AK7set8iJRA0z5JnUdIEcYjwozGuzskI8xf8404ICs5m+MLPYqQqvHbHyigHMQJtUvp7eeflmogmpQ==
X-Received: by 2002:a05:6870:470e:b0:163:c9c1:3f4c with SMTP id b14-20020a056870470e00b00163c9c13f4cmr1449322oaq.45.1675104158653;
        Mon, 30 Jan 2023 10:42:38 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g5-20020a05687054c500b0014866eb34cesm5482671oan.48.2023.01.30.10.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 10:42:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1d51e281-15a9-7997-acbd-6ea1518ef596@roeck-us.net>
Date:   Mon, 30 Jan 2023 10:42:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/7] hwmon: (it87) Allow disabling exiting of
 configuration mode
Content-Language: en-US
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20230128060308.1549707-1-frank@crawford.emu.id.au>
 <20230128060308.1549707-2-frank@crawford.emu.id.au>
 <20230129205647.GA1951466@roeck-us.net>
In-Reply-To: <20230129205647.GA1951466@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/29/23 12:56, Guenter Roeck wrote:
> On Sat, Jan 28, 2023 at 05:03:02PM +1100, Frank Crawford wrote:
>> Disabling configuration mode on some chips can result in system
>> hang-ups and access failures to the Super-IO chip at the
>> second SIO address. Never exit configuration mode on these
>> chips to avoid the problem.
>>
>> This patch should be applied in conjunction with a previous one to
>> initialise the second chip for certain mother boards.
>>
>> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
>> ---
>>
>> v3:
>>   * Correct possible uninitialised pointer issue.
>>
>> v2:
>>   * Convert to use feature flag and related macros rather than a separate
>>     field, as suggested in review.
>>   * Reverse sense of flag in superio_exit to simplify feature macro.
>>
>> ---
>>   drivers/hwmon/it87.c | 26 ++++++++++++++++++--------
>>   1 file changed, 18 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
>> index a8a6a0ffee82..923a9563be92 100644
>> --- a/drivers/hwmon/it87.c
>> +++ b/drivers/hwmon/it87.c
>> @@ -128,10 +128,12 @@ static inline int superio_enter(int ioreg)
>>   	return 0;
>>   }
>>   
>> -static inline void superio_exit(int ioreg)
>> +static inline void superio_exit(int ioreg, bool noexit)
>>   {
>> -	outb(0x02, ioreg);
>> -	outb(0x02, ioreg + 1);
>> +	if (!noexit) {
>> +		outb(0x02, ioreg);
>> +		outb(0x02, ioreg + 1);
>> +	}
>>   	release_region(ioreg, 2);
>>   }
>>   
>> @@ -300,6 +302,13 @@ struct it87_devices {
>>   #define FEAT_PWM_FREQ2		BIT(16)	/* Separate pwm freq 2 */
>>   #define FEAT_SIX_TEMP		BIT(17)	/* Up to 6 temp sensors */
>>   #define FEAT_VIN3_5V		BIT(18)	/* VIN3 connected to +5V */
>> +/*
>> + * Disabling configuration mode on some chips can result in system
>> + * hang-ups and access failures to the Super-IO chip at the
>> + * second SIO address. Never exit configuration mode on these
>> + * chips to avoid the problem.
>> + */
>> +#define FEAT_CONF_NOEXIT	BIT(28)	/* Chip should not exit conf mode */
> 
> Feature bits are supposed to be numbered sequentially, not randomly
> assigned. Please use bit 19.
> 

Given that the commit window is coming up, and since I don't have
other issues with your series, I am inclined to apply it with the
bit changed. Please let me know in the next day or two if this is
acceptable for you. If not, the series will have to wait until v6.4.

Thanks,
Guenter

