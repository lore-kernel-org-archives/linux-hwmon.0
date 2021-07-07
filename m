Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDB5C07E95
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Jul 2021 04:14:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D91360FDC
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Jul 2021 04:14:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbhGGER2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 7 Jul 2021 00:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbhGGER2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Jul 2021 00:17:28 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A98C061574
        for <linux-hwmon@vger.kernel.org>; Tue,  6 Jul 2021 21:14:47 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id z3so1068382oib.9
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Jul 2021 21:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fX/hr5KKXEsTsySp4n1R0XI3yeQeWgdL4sdtlR+KA00=;
        b=qQaOSJmM/A10m1AlSBPIsweWUcUBLH5k7EdDSO3Xgoy1OgmWOUrgqhes/TNCkCC7sH
         9XS/IZNCvVj8y8pzCBHJm1QLCVZ3r5tgDcdhumY23UlXf96+SikxU2wh706J3I0uQdny
         TemcChal1TJuao2aH7IjGLbxPVQ142NSiZN9Dq4uGkF0tZAx0z5FaCockMAU6FcGRXT8
         t8cr8VNFCsZr6ZgFFZyppRnihDm60ibID2L/c7CWJO9s3P7Rg4cY4Q04Y+uKR+uJmO7j
         wMheayQKLkbR0SEnYurL8jJDifQznUVGLILuw8M3XAqTSKneSv1Cn/Ow7h4KXvyNmaT5
         YL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fX/hr5KKXEsTsySp4n1R0XI3yeQeWgdL4sdtlR+KA00=;
        b=mqFsrbu0kkCpqb0IzI860bhCybxpfJR5++rBu0KoP0l3tGTh5o1BjDuy+s0c0aghi8
         xHo180NmRNd8jiWvYAxXRdVFhkxeiIeW6NGXcT8FrMlBZ9tRjXDSvVTEHKY3y3dbu16h
         CpTIIA/h8yXbIlkGTrHatzmiqC/LqK8/usBfMOkroPBnkluPn4Z8PfcKI/bLZmjJSAZP
         kMZdHaqfhI7XcStnJdPjXGisU/N8DHpYJn0jzv/56vPPRdxYyypEABnLsw7oveLMpeIm
         mnVxC+YKtQqQAOnTvp/BhhPhF/CV/5BSef0Yc0hzP4aFBJkxoGo5h7J/Gmos3mW5USaw
         zkYQ==
X-Gm-Message-State: AOAM53313wEanv6zahrdAmCoZ/kpE4icNk1DAjQhfzohiUHejt7asQkh
        WRD9cNdchTkZSXFFDXHezmphW0iTSd8=
X-Google-Smtp-Source: ABdhPJwmmNy0DhzNUJ1LWtp+h1RJ2yQIrtMMwRrp8p4/KaoFJ6/B7iRY/qRviHqDmsnznbo4Cpay5Q==
X-Received: by 2002:aca:4082:: with SMTP id n124mr16456544oia.95.1625631286624;
        Tue, 06 Jul 2021 21:14:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b25sm3790022otk.6.2021.07.06.21.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 21:14:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3]: hwmon: nct6775: Fix some issues with NCT6796D
To:     Henk <henk.vergonet@gmail.com>
Cc:     linux-hwmon@vger.kernel.org
References: <CAMFK4TN9jcvwkdBdX1E4zH2NzS0LbCFqGW+MUzCKXor=4UwoBw@mail.gmail.com>
 <f3106f6d-1fa0-129f-28a2-9a85b5f9c453@roeck-us.net>
 <CAMFK4TMzZVAKdbJRMvUHdO3m+V1pNk59PyLXSxPkPFCsgr-rPg@mail.gmail.com>
 <e46d1215-121a-7480-cfa7-38d3f4bc0444@roeck-us.net>
 <CAMFK4TMb+aUVKtcWZkCcpjbeEOP7f=Nh2bOW9nAYZOymUvTA-w@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <10b4c4aa-febb-70e0-b653-67ff2c2841ba@roeck-us.net>
Date:   Tue, 6 Jul 2021 21:14:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMFK4TMb+aUVKtcWZkCcpjbeEOP7f=Nh2bOW9nAYZOymUvTA-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/6/21 7:42 PM, Henk wrote:
> Is it the attchment format?
> 
Please read and follow Documentation/process/submitting-patches.rst.

Guenter

> diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
> index e7e1ddc1d631..385ef79d79c4 100644
> --- a/drivers/hwmon/nct6775.c
> +++ b/drivers/hwmon/nct6775.c
> @@ -28,7 +28,7 @@
>    * nct6792d    15      6       6       2+6    0xc910 0xc1    0x5ca3
>    * nct6793d    15      6       6       2+6    0xd120 0xc1    0x5ca3
>    * nct6795d    14      6       6       2+6    0xd350 0xc1    0x5ca3
> - * nct6796d    14      7       7       2+6    0xd420 0xc1    0x5ca3
> + * nct6796d    16      7       7       2+6    0xd420 0xc1    0x5ca3
>    * nct6797d    14      7       7       2+6    0xd450 0xc1    0x5ca3
>    *                                           (0xd451)
>    * nct6798d    14      7       7       2+6    0xd428 0xc1    0x5ca3
> @@ -209,14 +209,14 @@ superio_exit(int ioreg)
> 
>   /* Common and NCT6775 specific data */
> 
> -/* Voltage min/max registers for nr=7..14 are in bank 5 */
> +/* Voltage min/max registers for nr=7..15 are in bank 5 */
> 
>   static const u16 NCT6775_REG_IN_MAX[] = {
>       0x2b, 0x2d, 0x2f, 0x31, 0x33, 0x35, 0x37, 0x554, 0x556, 0x558, 0x55a,
> -    0x55c, 0x55e, 0x560, 0x562 };
> +    0x55c, 0x55e, 0x560, 0x562, 0x564 };
>   static const u16 NCT6775_REG_IN_MIN[] = {
>       0x2c, 0x2e, 0x30, 0x32, 0x34, 0x36, 0x38, 0x555, 0x557, 0x559, 0x55b,
> -    0x55d, 0x55f, 0x561, 0x563 };
> +    0x55d, 0x55f, 0x561, 0x563, 0x565 };
>   static const u16 NCT6775_REG_IN[] = {
>       0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x550, 0x551, 0x552
>   };
> @@ -478,7 +478,7 @@ static const u16 NCT6776_REG_TEMP_CRIT[32] = {
> 
>   static const u16 NCT6779_REG_IN[] = {
>       0x480, 0x481, 0x482, 0x483, 0x484, 0x485, 0x486, 0x487,
> -    0x488, 0x489, 0x48a, 0x48b, 0x48c, 0x48d, 0x48e };
> +    0x488, 0x489, 0x48a, 0x48b, 0x48c, 0x48d, 0x48e, 0x48f };
> 
>   static const u16 NCT6779_REG_ALARM[NUM_REG_ALARM] = {
>       0x459, 0x45A, 0x45B, 0x568 };
> @@ -1047,9 +1047,9 @@ div_from_reg(u8 reg)
>    * Some of the voltage inputs have internal scaling, the tables below
>    * contain 8 (the ADC LSB in mV) * scaling factor * 100
>    */
> -static const u16 scale_in[15] = {
> +static const u16 scale_in[16] = {
>       800, 800, 1600, 1600, 800, 800, 800, 1600, 1600, 800, 800, 800, 800,
> -    800, 800
> +    800, 800, 800
>   };
> 
>   static inline long in_from_reg(u8 reg, u8 nr)
> @@ -1143,7 +1143,7 @@ struct nct6775_data {
>       /* Register values */
>       u8 bank;        /* current register bank */
>       u8 in_num;        /* number of in inputs we have */
> -    u8 in[15][3];        /* [0]=in, [1]=in_max, [2]=in_min */
> +    u8 in[16][3];        /* [0]=in, [1]=in_max, [2]=in_min */
>       unsigned int rpm[NUM_FAN];
>       u16 fan_min[NUM_FAN];
>       u8 fan_pulses[NUM_FAN];
> @@ -4200,7 +4200,7 @@ static int nct6775_probe(struct platform_device *pdev)
>       case nct6796:
>       case nct6797:
>       case nct6798:
> -        data->in_num = 15;
> +        data->in_num = (data->kind == nct6796) ? 16 : 15;
>           data->pwm_num = (data->kind == nct6796 ||
>                    data->kind == nct6797 ||
>                    data->kind == nct6798) ? 7 : 6;
> 
> 
> Op wo 7 jul. 2021 om 03:51 schreef Guenter Roeck <linux@roeck-us.net>:
>>
>> On 7/6/21 6:40 PM, Henk wrote:
>>> Thank you Guenter,
>>>
>>> This should be fixed now, here is a reading from the sensors output
>>> without any scaling done:
>>>
>>> $ sensors
>>> nct6796-isa-0290
>>> Adapter: ISA adapter
>>> ...
>>> in15 VIN9:   840.00 mV
>>> ...
>>>
>>> Changes available on: https://github.com/hvegh/linux.git
>>>
>>> Op ma 5 jul. 2021 om 16:47 schreef Guenter Roeck <linux@roeck-us.net>:
>>>>
>>>> As for the patch itself, it doesn't define the limit register addresses
>>>> in NCT6775_REG_IN_MAX[] and NCT6775_REG_IN_MIN[], and it doesn't define
>>>> the register address itself in NCT6779_REG_IN[]. That means it won't work.
>>>>
>>>> Guenter
>>
>> This is not an acceptable patch format.
>>
>> Guenter

