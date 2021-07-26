Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CA9C4338F
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jul 2021 13:42:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C9BC60E08
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jul 2021 13:42:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234272AbhGZNCT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Jul 2021 09:02:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234307AbhGZNBl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Jul 2021 09:01:41 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A006C061760
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jul 2021 06:42:06 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id p38so5045705qvp.11
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jul 2021 06:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=s/McWaaWhTc4FDUYmmf7GC4U+4W8IHxKcvTXe2ZT1/I=;
        b=PbdqbkqXibXY5QdM4jnVCtl6+FcU2QkNCMwchlvmTmeu8gJu1W6nHWQhr2vSqu335n
         gm8ZCxnPJOPJNUV0o2IFFvbFC71s9JTOMX6v4peK3Nt5KNEbpRBCHkHIyR8N0x0BTar0
         SKSWur+TzcaoWCuUsmxIbJuVdijIADWRi71Kh6VGgPEpW+CLoGhhCzPyXMXfR/co03/H
         ZCC3TDibtdeX07hitNnpeZCtD7LZPEtCrgmiZEcYqXPqFRPHBhoLV0b8rfueEH8IHWSd
         ol7CPZVbzVpxSQp49bB1DrlIu49/8e+9RsgRIOGduDtmETbYCSZjtzxC2IqlSWssAjNr
         Jzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s/McWaaWhTc4FDUYmmf7GC4U+4W8IHxKcvTXe2ZT1/I=;
        b=sN52tSLiigFo36l1uC+k7wWCesJhRW4GlVbCuXMvxOE76ueudSyyGIbJVvGLy/K0s2
         Kvn6hzyKXKrhL32R5SM+X0d3VOBnZNF5hGueaauo9MENicej1QfqoDcCgEnzL0aCIPJG
         LecHybEcBXD3v33NPcd9imaRMpefKcLL98+6MO9e18veGmH3v+w9UGAlQdilPBPFeXFf
         dqWFc3oQHLEQh3JVh9dvKCoY/lWBI3hiWKW7wWy3XD+FDewXm7sxK6nYP0IEUg8NnOdJ
         37alvTWoKkKGyLFoe9921X56UYXj/Fajk46C9mi7fX5Jy7CEjL9fEp/ZcQmlHyss6upY
         YWdw==
X-Gm-Message-State: AOAM530c5VWxC3GFK41hDn/wPG+uTBtpU1j5z6chcf4m6lfidBY/TD74
        nn9W4CO4rYF5KHiTlT9i6o/dQ6viefI=
X-Google-Smtp-Source: ABdhPJyEhOhtvMy/jWMXiGEEJ+UNqfpHOT02mV+r1YgrrsYevn3dOHqA7R5dFprpltPZHSypPjt1nQ==
X-Received: by 2002:a05:6214:29c7:: with SMTP id gh7mr17901991qvb.36.1627306925451;
        Mon, 26 Jul 2021 06:42:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b23sm16117395qkl.113.2021.07.26.06.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jul 2021 06:42:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 0/5] hwmon: Add driver for MAX6620 Fan controller
To:     "Balac, Arun Saravanan" <ArunSaravanan.Balach@Dell.com>,
        "jdelvare@suse.com" <jdelvare@suse.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <MW2PR1901MB20287B190088EC2608094AF2A61B9@MW2PR1901MB2028.namprd19.prod.outlook.com>
 <c058d3c0-2977-00cc-fba8-2eb81b28095a@roeck-us.net>
 <MW2PR1901MB2028749607502C9E63FC25AEA6E89@MW2PR1901MB2028.namprd19.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <324a2bad-81b6-422d-d327-4969755363b6@roeck-us.net>
Date:   Mon, 26 Jul 2021 06:42:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <MW2PR1901MB2028749607502C9E63FC25AEA6E89@MW2PR1901MB2028.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/26/21 12:47 AM, Balac, Arun Saravanan wrote:
> Thank you for the review comments.
> Am currently working on the suggested changes and will submit the same for your review.
> 
> Request your insights on the recommended method to include the author information of the earlier patches,
> in the commit message while squashing them into one.
> 

Either "based on ..." in the commit description or, more formally, "Originally-from:".

Guenter

> Regards,
> Arun Saravanan
> 
> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Tuesday, July 6, 2021 6:42 PM
> To: Balac, Arun Saravanan; jdelvare@suse.com
> Cc: linux-hwmon@vger.kernel.org
> Subject: Re: [PATCH 0/5] hwmon: Add driver for MAX6620 Fan controller
> 
> 
> On 7/6/21 6:01 AM, Balac, Arun Saravanan wrote:
>> From: Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>
>>
>> Add driver for MAX6620 Fan controller
>>
>> Arun Saravanan Balachandran (2):
>>     Add attributes in MAX6620 driver to retrieve fan fault status
>>     Update MAX6620 driver as per linux code guidelines
>>
>> Cumulus Networks (2):
>>     Driver for MAX6620 Fan sensor
>>     MAX6620 fix rpm calculation accuracy
>>    
>> Shuotian Cheng (1):
>>     Update MAX6620 driver to support newer kernel version
>>
>>    drivers/hwmon/Kconfig   |  10 +
>>    drivers/hwmon/Makefile  |   1 +
>>    drivers/hwmon/max6620.c | 625 ++++++++++++++++++++++++++++++++++++++++
>>    3 files changed, 636 insertions(+)
>>    create mode 100644 drivers/hwmon/max6620.c
>>
>>
>> base-commit: 303392fd5c160822bf778270b28ec5ea50cab2b4
>>
> Please squash all patches into one, and please use
> devm_hwmon_device_register_with_info to register the hardware
> monitoring device.
> 
> Also please follow the guidelines in
> Documentation/hwmon/submitting-patches.rst.
> 
> Thanks,
> Guenter
> 

