Return-Path: <SRS0=zZlJ=SH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD235C4360F
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 13:25:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 754B221850
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 13:25:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n8q55nJo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbfDENZS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 5 Apr 2019 09:25:18 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35292 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbfDENZR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 5 Apr 2019 09:25:17 -0400
Received: by mail-pf1-f195.google.com with SMTP id t21so973142pfh.2
        for <linux-hwmon@vger.kernel.org>; Fri, 05 Apr 2019 06:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ShshAktaeH0pROYetCn9Uov7BgY59aTe09cI+pNIfKk=;
        b=n8q55nJoXYfblCLFDjRt77ezInf7l8K+9+zKCXZMwRq9AsuYUfuK5upMII8XnbeYRZ
         T2VXNe+9CleK62z6Mw5cDUKf0zlSdcTswD6IYoMTDV6+M4Z67I81dBCuFW1WvR+BO8Vj
         NGTv1Lp7KK6mv+gn2lufrY+zaJmnHXxTaU7OasfsNg+EbGjqgfZqsuV6qtnEZVVZklEu
         F/U52UwvTr75yl3a6Zv6gBd0QInf88oKsEm+bQbGYERsHtcURsU189+XyuyrCVe48CS2
         dxIbTIwox6hIO6YDrOlc5I6c62wcjAjpNi2sLdfLwlDHyHbK7rDb/xDz9nMv+OAis76m
         Cfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ShshAktaeH0pROYetCn9Uov7BgY59aTe09cI+pNIfKk=;
        b=W72TMta2iJFeqRDVTladV8QCyvfINljQYfroPdog8Nlruvuj26JRj5Wq5hVtQWhIbZ
         eQUCq4q+PnX+9ON033EQClgHmfRnu0vlOBvlcWDm8LvMvEiDovzhAPE6wW/8srP0MQlA
         kG7zd54HlaRjgY45I4Ga55bZS66d3/copbb9EYRwcTXlpqch0YSNcuiCnYNf8S3hyE71
         jxPSCWPwLXVMmOBBT3rq2Eeb8zR2jz8bwYeT7Qd02AhRjKrbAK1EOB1u0I9MyKIubQtY
         vdr9+qBeSC2e1bch2uT7c8PIjBynvAaR2nXUzjRuhJkZvPv1ToEsomCpG6PqyfoMlcj0
         vMfQ==
X-Gm-Message-State: APjAAAW4SAbgh6nrBgzxpVWWOPEs2tfEu6IV2V/OtkHLre/eHYJJl9ao
        7x4K5rSUWApT0nJ7fL9z/VQ=
X-Google-Smtp-Source: APXvYqzXoDP+fZbgAAYKUsWgRxs5Q8R83DtoqYwdNk8+46GVZ8kgoDVC0RoNXZEGJvrtQuE0myaZ6w==
X-Received: by 2002:a63:df12:: with SMTP id u18mr12131863pgg.135.1554470717158;
        Fri, 05 Apr 2019 06:25:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c22sm19497149pfn.136.2019.04.05.06.25.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Apr 2019 06:25:15 -0700 (PDT)
Subject: Re: [PATCH 4/4] hwmon: (smsc47b397) Use request_muxed_region for
 Super-IO accesses
To:     John Garry <john.garry@huawei.com>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>
References: <1554402838-19008-1-git-send-email-linux@roeck-us.net>
 <1554402838-19008-4-git-send-email-linux@roeck-us.net>
 <dc742840-7a20-701d-87c7-775f2f85a2e2@huawei.com>
 <cacf8805-e253-79a3-40cc-cad573fbd3ed@huawei.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <5a95deed-db26-4795-6234-f0509e845b16@roeck-us.net>
Date:   Fri, 5 Apr 2019 06:25:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cacf8805-e253-79a3-40cc-cad573fbd3ed@huawei.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/5/19 1:46 AM, John Garry wrote:
> On 05/04/2019 08:47, John Garry wrote:
>> On 04/04/2019 19:33, Guenter Roeck wrote:
>>> Super-IO accesses may fail on a system with no or unmapped LPC bus.
>>>
> 
> BTW, these may still require attention:
> 
> sch56xx-common
> smsc47m1

Those two already call request_muxed_region() in superio_enter().
Though error handling in the latter is less than perfect - I may send
a patch to fix it.

> w83627hf > vt1211

I missed those two. Patches will follow.

Thanks,
Guenter

> 
> Thanks,
> John
> 
>>> Also, other drivers may attempt to access the LPC bus at the same time,
>>> resulting in undefined behavior.
>>>
>>> Use request_muxed_region() to ensure that IO access on the requested
>>> address space is supported, and to ensure that access by multiple drivers
>>> is synchronized.
>>>
>>> Fixes: 8d5d45fb1468 ("I2C: Move hwmon drivers (2/3)")
>>> Reported-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>>> Reported-by: John Garry <john.garry@huawei.com>
>>> Cc: John Garry <john.garry@huawei.com>
>>
>> Acked-by: John Garry <john.garry@huawei.com>
>>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>> ---
>>>  drivers/hwmon/smsc47m1.c | 13 +++++++++++--
>>>  1 file changed, 11 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/smsc47m1.c b/drivers/hwmon/smsc47m1.c
>>> index c7b6a425e2c0..0736ca6a3aee 100644
>>> --- a/drivers/hwmon/smsc47m1.c
>>> +++ b/drivers/hwmon/smsc47m1.c
>>> @@ -73,16 +73,21 @@ superio_inb(int reg)
>>>  /* logical device for fans is 0x0A */
>>>  #define superio_select() superio_outb(0x07, 0x0A)
>>>
>>> -static inline void
>>> +static inline int
>>>  superio_enter(void)
>>>  {
>>> +    if (!request_muxed_region(REG, 2, DRVNAME))
>>> +        return -EBUSY;
>>> +
>>>      outb(0x55, REG);
>>> +    return 0;
>>>  }
>>>
>>>  static inline void
>>>  superio_exit(void)
>>>  {
>>>      outb(0xAA, REG);
>>> +    release_region(REG, 2);
>>>  }
>>>
>>>  #define SUPERIO_REG_ACT        0x30
>>> @@ -531,8 +536,12 @@ static int __init smsc47m1_find(struct
>>> smsc47m1_sio_data *sio_data)
>>>  {
>>>      u8 val;
>>>      unsigned short addr;
>>> +    int err;
>>> +
>>> +    err = superio_enter();
>>> +    if (err)
>>> +        return err;
>>>
>>> -    superio_enter();
>>>      val = force_id ? force_id : superio_inb(SUPERIO_REG_DEVID);
>>>
>>>      /*
>>>
>>
> 
> 
> 

