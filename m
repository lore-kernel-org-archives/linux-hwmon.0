Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD1DC0015E
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jul 2023 17:48:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjGORsi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Jul 2023 13:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjGORsh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jul 2023 13:48:37 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B0F11FEE
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 10:48:37 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6682909acadso2107896b3a.3
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 10:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689443315; x=1692035315;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F5OpF0v/NaL2cxqYGIw6BIy7VuoKznqE1Jc1TlLyO5U=;
        b=cVQ8kIKmKYvyov1hxcqMnnhntTwtmpQxvnKI0DhI5czmY92Zg5pKJ8+4NqOapO5udY
         O/YXiF+mDX1NON3EhJcshHH9P1nioZURxvRU89/HqXiWl61SkTqNIPzAfO4cTIKkbF5y
         nxMseexBgbHnBriUv84yWBy7Qi8SZdzB/r/xt9NCmyK+UUuWXySQ4/Jo90DzBVD4LXNr
         vU2pfFaH/uigm7kgQWXIwp4HTPTLwahuQmCBONabUska+8FIzHbZJZm3EJBOwVu99aD7
         P1JKfcO01deJIomyboely226ZCJ6OdtnmjNAWfrQf4keGpsP8D6f4g2ocFchabz9/ZG/
         UFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689443315; x=1692035315;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F5OpF0v/NaL2cxqYGIw6BIy7VuoKznqE1Jc1TlLyO5U=;
        b=bvnZBno7v8nt70IQsASoNfIffLX4Y4uTwEYvKdcMVoDkVgq68kcCdaaTRKiBqM7a5J
         zhcspypUGD+cFltVr9AeWKNf6nEyqn4yzmLTwZH7SCq0MyehWRlv315UXbjj1EYEg5pm
         DKcUKxSDtfDKJ31EsgruR2jOmn5uLgdtC63s9+FJJzAe0GF3FZRR9FvYW0umnT8yqoGd
         7Dk+bSVF2sOxMQPg/HdliSoSX8XJuglXw3rETnxEhhKqwwjkpbTmkjdLGlXybtnzuFDt
         KhGiqlBjxeK+b52nadl8SJqANoA1OS5DULWzaRmTYNGcFlDXgbZrxiJe99IZbJxynSsz
         ERXQ==
X-Gm-Message-State: ABy/qLaw0rdLVX4gwO8q56EmKhwC6o9UcdTaaheznWVaJkhY0pnZnZye
        LkGv9RwCGEz/IiET82K9KMrocd0DVxw=
X-Google-Smtp-Source: APBJJlHQJyFyI1it6FhaPMloH7JpJ4ATKkiGWvo2KW9uYa9tEpABJeHPvy97HqEQyGDZ5ZegEmey+Q==
X-Received: by 2002:a05:6a00:1401:b0:676:4c90:ca60 with SMTP id l1-20020a056a00140100b006764c90ca60mr8732733pfu.7.1689443314924;
        Sat, 15 Jul 2023 10:48:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h20-20020aa786d4000000b0065dd1e7c2c1sm9111588pfo.63.2023.07.15.10.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 10:48:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6012aa53-fa6c-103a-faf8-56ed8e990277@roeck-us.net>
Date:   Sat, 15 Jul 2023 10:48:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Ahmad Khalifa <ahmad@khalifa.ws>, linux-hwmon@vger.kernel.org
References: <20230715153113.1307220-1-ahmad@khalifa.ws>
 <9c4d7f9d-d417-077d-a709-d372214bf35c@roeck-us.net>
 <9271e276-7727-25ee-5c46-c25f479b73d7@khalifa.ws>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (nct6775) Add support for 18 IN readings for
 nct6799
In-Reply-To: <9271e276-7727-25ee-5c46-c25f479b73d7@khalifa.ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/15/23 10:03, Ahmad Khalifa wrote:
> On 15/07/2023 17:48, Guenter Roeck wrote:
>> On 7/15/23 08:31, Ahmad Khalifa wrote:
>>> nct6799 supports 18 voltage readings where this driver stops at 16.
>> You are adding three sets of registers, though, not just two. I think
>> you meant to say that the driver stops at 15.
> 
> Yes, currently 15 IN defined. It was influenced by the ALARM bits
> comment. I'll change it.
> 
>>> +/* NCT6799 layout of alarm bits is indexed by the REG_VIN
>>> + * order, which is
>>> + *      CPUVC,  VIN1,  AVSB,  3VCC,  VIN0,  VIN8,  VIN4, 3VSB
>>> + *       VBAT,   VTT,  VIN5,  VIN6,  VIN2,  VIN3,  VIN7, VIN9
>>> + * no space for 16-17: VHIF, VIN10 (bits 31, -1)
>>
>> Why not use bit 31 ?
> 
> Well, this is the part that made me say "driver supports up to 16".
> The ALARM bits have FAN_BASE starting at index 16, so the IN alarms
> can only take up 0-15, unless all alarm bits have extra padding
> added to push FAN_BASE/TEMP_BASE/INTRUSION_BASE up.
> 
> I took the easy option here and left out the 16 IN alarm.
> 
> Did I count this wrong?
> nct6775_fan_is_visible()
>      `data->ALARM_BITS[FAN_ALARM_BASE + fan]`
> 
>

The 16 was just for convenience when setting the alarm base values,
and to keep some space for voltages. That doesn't mean the driver as
a whole supports 16 voltage inputs (or 8 fan control inputs, for
that matter).

We need to revisit the entire alarm handling at some point.
nct6798 and nct6799 support 8 sets of temperature limits and
alarms, and that isn't currently supported either. 'alarms'
is already 64 bits wide, so it should be possible to shift
the bits around and make space for more alarms (such as 24
voltages, 8 fans, and 8 or even 16 temperatures).

Thanks,
Guenter

