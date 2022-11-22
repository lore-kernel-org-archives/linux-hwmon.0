Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC0F6C4332F
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Nov 2022 18:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbiKVShl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Nov 2022 13:37:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234027AbiKVShj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Nov 2022 13:37:39 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78D3612633;
        Tue, 22 Nov 2022 10:37:37 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id p27-20020a056830319b00b0066d7a348e20so9841032ots.8;
        Tue, 22 Nov 2022 10:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ozqB6gI5zq66MVgwRB6/+mhngvf/WXv8gTNsNAf1ZUg=;
        b=oFzqpW/NRHaHfo/NjU6hS8Fxphn82Zv+diBxMVYSL9G5G83Db1aasXXQBR8sF3NT76
         IEkOeacWbp7GHMtgHZkqJCqFQ+a+5vIvuPNzRA0YuVyzQKqDU6ex3HQf78rHKNDo4xi4
         g2ChVY3y5Fnq6o3C0Z2PJGkHNRGhCgC11UTZvpkpT5k47M8TqMRXH+5SpEWghHHSOBey
         aJECnF2kixWA1aC+YejiNBs60kVidGSQxPZ3Zd3vJjRSpcBoNdLV6GoeCPMgzwGIOSzQ
         7AVysD7AT89bAIZTLxl8K15rc7f2u3UeGSzx0/82HJllhfZT71pEoH5Tzb06Y5dYdNEc
         9L/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ozqB6gI5zq66MVgwRB6/+mhngvf/WXv8gTNsNAf1ZUg=;
        b=WX8fv6v9FBmzJf+Vhx4JP0E0dRB3qbN1Lb5rK2+DMtZQutqCRSBLjRF3lx06jYFBXP
         NP9EaYcVxGMN8m0DRecqA21fFuSjbJyO/7HIa9YNYS58W+fORjE0dpcr7PLqseIQSJC4
         8SD2HFq8gznCzdhiyYGe8ZySB9Zlu4KuyM6ke1qZj7N7g1bYAGVzzqkGbYwxT/Qlahf0
         wrEDvoGpNU8uDujxaOB3U4Hx4H3lh+3hQTJMZBNVBv/OHBLZ1oH1/GZfhMzaMVrsS6x6
         Imwez2Ej1yqKxlwc2+I6WRCrpaiiRW4KQA3C005D99HFfJ2a77dtXMHyLSazahWaH0R1
         ANxg==
X-Gm-Message-State: ANoB5pl+ue9Oo3wfiLE7V1RmsUh2Gsb84scFaPLscT9vn7vE58fNwzyT
        vgXvemYnic0z5EZK4c40KS4=
X-Google-Smtp-Source: AA0mqf6/bW49mEfn4MWpQeLXd4hXSyIouz6Svd9XJBaM50L0y+iuRZ1O3+uA05C5NAV2x0fFAZiiSQ==
X-Received: by 2002:a05:6830:6387:b0:654:bcaa:aa0 with SMTP id ch7-20020a056830638700b00654bcaa0aa0mr2950483otb.246.1669142256759;
        Tue, 22 Nov 2022 10:37:36 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e18-20020a05683013d200b0063696cbb6bdsm6293790otq.62.2022.11.22.10.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 10:37:35 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1fbf3ddb-3e8a-eac7-5006-b4af8b4404be@roeck-us.net>
Date:   Tue, 22 Nov 2022 10:37:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v6] hwmon: add OneXPlayer mini AMD sensors driver
Content-Language: en-US
To:     Armin Wolf <W_Armin@gmx.de>,
        =?UTF-8?Q?Joaqu=c3=adn_Ignacio_Aramend=c3=ada?= 
        <samsagax@gmail.com>, pobrn@protonmail.com
Cc:     hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20221104140659.593608-1-samsagax@gmail.com>
 <5b7fdb3d-7874-feb3-ad0b-c20201b5a871@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <5b7fdb3d-7874-feb3-ad0b-c20201b5a871@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/13/22 12:41, Armin Wolf wrote:
> Am 04.11.22 um 15:07 schrieb Joaquín Ignacio Aramendía:
> 
>> Sensors driver for OXP Handhelds from One-Netbook that expose fan reading
>> and control via hwmon sysfs.
>>
>> As far as I could gather all OXP boards have the same DMI strings and
>> they can be told appart only by the boot cpu vendor (Intel/AMD).
>> Currently only AMD boards are supported since Intel have different EC
>> registers and values to read/write.
>>
>> Fan control is provided via pwm interface in the range [0-255]. AMD
>> boards have [0-100] as range in the EC, the written value is scaled to
>> accommodate for that.
>>
>> Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
> 
> ...
> 
>> +/*
>> + * module_platform_driver() may be used here but somehow it breaks the module
>> + * either by preventing it from loading or not exposing hwmon attributes.
>> + * Either way I'm not smart enough to figure it out so I'll leave init/exit
>> + * macros for now.
>> + */
>> +module_init(oxp_platform_init);
>> +module_exit(oxp_platform_exit);
>> +
> 
> Hello,
> 
> i know i am a bit late to point that out, but AFAIK module_platform_driver() only registers a platform driver,
> not the corresponding platform device. With the platform device missing, the platform driver will never load.
> This is the reason why platform_create_bundle() exists, it basically registers a platform driver and
> a platform device together.
> 
> Should i send a separate patch to remove the comment?.
> 

Thanks for the note. I dropped the comment; no further action needed.

Guenter

> Armin Wolf
> 
>> +MODULE_AUTHOR("Joaquín Ignacio Aramendía <samsagax@gmail.com>");
>> +MODULE_DESCRIPTION("Platform driver that handles EC sensors of OneXPlayer devices");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 2.38.1
>>

