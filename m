Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2C9C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Jan 2022 21:01:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350888AbiAaVBc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 31 Jan 2022 16:01:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44937 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237935AbiAaVBc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 Jan 2022 16:01:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643662891;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QPBUUUSIbdCMKHscebuvK+qxfZIc2zafw8L5TR48Ec8=;
        b=GlZmo6PLqF0LgSCzptDMaKgmKaHdkqoDyQwFVvqbyhewksDH4zMiG1Z9XbLr+9KkGl50rt
        ykoAZDxrAHayoKS3Wdputjv7/+DGpYzkTK3pbQf0/E0SeSbFkwDsxmWC2AaSFjCVoie42A
        hVVc2TPjryanJXQ03lYgFNGkhjDJ4lE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-Nxkf1C3qNxGKVBdjbZyWUA-1; Mon, 31 Jan 2022 16:01:30 -0500
X-MC-Unique: Nxkf1C3qNxGKVBdjbZyWUA-1
Received: by mail-ej1-f69.google.com with SMTP id i21-20020a1709063c5500b006b4c7308c19so5525396ejg.14
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Jan 2022 13:01:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QPBUUUSIbdCMKHscebuvK+qxfZIc2zafw8L5TR48Ec8=;
        b=L2xePzi7GkhstF+lOdA75WVc+BOvALRrwf/A481HiDtcNRZyal0lMuBKaoAtt0hVWr
         O5TI1tIpb3G+zTEsssAT316kTlAND2YrI09KmQDqyG5+RUB1EnW7UQNqUjK2a0Vbrjbb
         KCPcfPPL/08+GRdKRzmhoJZO7nK1uTMGwNOwdPdUSYZtjf7MXQIAKVKXV3bJgSmrnCfI
         2SMUmZcEYKHCsCTRvHEq97Cp0DqqXz2ImjJz5qm5Gl/g9XPcp54VTvnlx2sXClcdPnSL
         7VvwZNxKXHiJ6mhI4yalRXnGxQh4sSz38t4Ri/0NyA1uvOjf9Wk5icFLf2GtbkW2Ex0B
         YVjA==
X-Gm-Message-State: AOAM532eoa98yf9IRtm/SbYXe7A9fviE4o/LQUVSPsxpCv80kjsTvVQ6
        Vktagu1wWdGcdQ1WMqNn6VKL2zR3IpymTpb2cvEAvs9nx9xNIyEHJ2P+GeIuFtxwXbyKumBft8m
        kCIg/6DYE6NX3n4c0DcB6XeA=
X-Received: by 2002:a05:6402:34ca:: with SMTP id w10mr22805810edc.145.1643662888879;
        Mon, 31 Jan 2022 13:01:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQNpwY4VLzE85jbEqyTtYB3+udLiLxDc3EUrydHMlJ567geR0t5numq2jG5NKxlB0w9Q46VQ==
X-Received: by 2002:a05:6402:34ca:: with SMTP id w10mr22805800edc.145.1643662888671;
        Mon, 31 Jan 2022 13:01:28 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id lo15sm13780659ejb.28.2022.01.31.13.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jan 2022 13:01:28 -0800 (PST)
Message-ID: <e1ac452b-0c72-6f22-764a-f34532ae6cce@redhat.com>
Date:   Mon, 31 Jan 2022 22:01:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 3/4] hwmon: (sch56xx-common) Replace msleep() with
 usleep_range()
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>, Armin Wolf <W_Armin@gmx.de>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220131193137.3684-1-W_Armin@gmx.de>
 <20220131193137.3684-4-W_Armin@gmx.de>
 <3af7602a-1703-4ff2-3905-dfd35742dd90@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3af7602a-1703-4ff2-3905-dfd35742dd90@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 1/31/22 21:10, Guenter Roeck wrote:
> On 1/31/22 11:31, Armin Wolf wrote:
>> msleep(1) will often sleep more than 20ms, slowing down sensor
>> and watchdog reads/writes. Use usleep_range() as recommended
>> in timers-howto.rst to fix that.
>>
>> Tested on a Fujitsu Esprimo P720.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/hwmon/sch56xx-common.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/sch56xx-common.c b/drivers/hwmon/sch56xx-common.c
>> index 0172aa16dc0c..f66e1ed4b1aa 100644
>> --- a/drivers/hwmon/sch56xx-common.c
>> +++ b/drivers/hwmon/sch56xx-common.c
>> @@ -139,7 +139,7 @@ static int sch56xx_send_cmd(u16 addr, u8 cmd, u16 reg, u8 v)
>>       /* EM Interface Polling "Algorithm" */
>>       for (i = 0; i < max_busy_polls + max_lazy_polls; i++) {
>>           if (i >= max_busy_polls)
>> -            msleep(1);
>> +            usleep_range(1, 2);
> 
> This replaces a 1-millisecond sleep with a 1-2 microsecond sleep.
> 
> Are you sure this is what you want to do ? Given that task switches typically
> take several microseconds, the new code is pretty much identical to a busy
> loop, and the maximum sleep time is reduced significantly.

Ah good catch, I missed that will reviewing v1, sorry about that.

The issue is actually worse then busy-waiting the max wait time
in this code is expressed in a maximum number of polls, so
if usleep_range(1, 2) would really only sleep 1 usec, we would
wait much too short and may hit a false-positive timeout condition
here.

Regards,

Hans



