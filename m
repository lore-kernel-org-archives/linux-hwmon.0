Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CFFC433DB
	for <linux-hwmon@archiver.kernel.org>; Sun, 21 Mar 2021 16:13:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 100C861928
	for <linux-hwmon@archiver.kernel.org>; Sun, 21 Mar 2021 16:13:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbhCUQNV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 21 Mar 2021 12:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhCUQMs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 21 Mar 2021 12:12:48 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01F1BC061574
        for <linux-hwmon@vger.kernel.org>; Sun, 21 Mar 2021 09:12:47 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 68-20020a9d0f4a0000b02901b663e6258dso13519808ott.13
        for <linux-hwmon@vger.kernel.org>; Sun, 21 Mar 2021 09:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TQWzelgYaxrzGUOQGJSJdxArdUKffZ17vtL8fyO9drs=;
        b=VlWjLK6/yX2/2CipgupIZQmVYVh2PkRPGOnryQRAnQ8yhpq1yFYtqDEKuHo8Mgec/U
         8cmidLpwzZCteYkWXuapDf02L1h3uishXG7W2njWkLnZQHl+5Sf6oIU6UR1+RLOE/klH
         6J3hIdchbdwVN6dSxpI3M1mLp4a6PuqTjQ9lTC2r12osh/bCjxTRnfkhJ+pFM6++jqdb
         UFUCtjuQr3DYHZ48hvDulUDC0CcEHpOXw12pLq0H+yBApAQK05PyTFiMOxeVscqTN+4A
         lbLULOhgyl7sDDLayBE+smTSvssP3kMmgf5rwVqyWzQc4SUxWeGIvH3Gu8Sygf2uXoh4
         zsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=TQWzelgYaxrzGUOQGJSJdxArdUKffZ17vtL8fyO9drs=;
        b=aHVGAI3qGNnpLPvoNmcthMP5rkZDRiCkbW2M5WgndewHQUyoXOWgc2GzPmSOctvRzU
         pE3wlHcAfA5nM+WMXFxtykg+bZaATyee+ue26gbmuubfxu+05EFYbm2iypdgE0Udt3dR
         GNpFwmxMtlI5/V9KDpcgZWS0avpzbBZX3HvLOzPfqoPmoGChnTZURIfYQ+6Q34lCdCGP
         BrIyD65s8AN2zlHNZ79oB9FL5wIm/64ywQ97JYGZx7m/f5zdvO/p+4gYYQL0q7sqlcHD
         cjulA1WQjYQTfJzO2aRMZQVkkZwJjGx5OcoqAx0kSeP5EnKVdo/OPFqHZGbp0HbKH/dx
         T9rQ==
X-Gm-Message-State: AOAM533l7AeHEy35w3qWoOA7Wp9T+X218UQ260uVK1vb7lMbfFuVmNJ+
        Vg0L+ablKDovRjhGyBgvTG3J8047FRs=
X-Google-Smtp-Source: ABdhPJyFXMQfRzdev6Eg170MfsEz7ZIJZZY1qyqkXqsdwlibrl9+GjE3mSDPEFOnXb2L3VgPIPo7oQ==
X-Received: by 2002:a05:6830:1690:: with SMTP id k16mr8735326otr.112.1616343166997;
        Sun, 21 Mar 2021 09:12:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v195sm912542oia.38.2021.03.21.09.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Mar 2021 09:12:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [Re-send PATCH hwmon-next v2 1/1] hwmon: (mlxreg-fan) Add support
 for fan drawers capability and present registers
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <20210316120239.1834485-1-vadimp@nvidia.com>
 <27c1929b-f817-8cc2-3947-5e7314f8b538@roeck-us.net>
 <DM6PR12MB3898FF4C290461A661859810AF669@DM6PR12MB3898.namprd12.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <35416886-eb25-c956-d56c-3f4c3ce02e40@roeck-us.net>
Date:   Sun, 21 Mar 2021 09:12:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB3898FF4C290461A661859810AF669@DM6PR12MB3898.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/21/21 2:39 AM, Vadim Pasternak wrote:
> 
> 
>> -----Original Message-----
>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>> Sent: Friday, March 19, 2021 11:36 PM
>> To: Vadim Pasternak <vadimp@nvidia.com>
>> Cc: linux-hwmon@vger.kernel.org
>> Subject: Re: [Re-send PATCH hwmon-next v2 1/1] hwmon: (mlxreg-fan) Add
>> support for fan drawers capability and present registers
>>
>> On 3/16/21 5:02 AM, Vadim Pasternak wrote:
>>> Add support for fan drawer's capability and present registers in order
>>> to set mapping between the fan drawers and tachometers. Some systems
>>> are equipped with fan drawers with one tachometer inside. Others with
>>> fan drawers with several tachometers inside. Using present register
>>> along with tachometer-to-drawer mapping allows to skip reading missed
>>> tachometers and expose input for them as zero, instead of exposing
>>> fault code returned by hardware.
>>>
>>> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
>>
>> I had asked for a number of changes to v2. Resending v2 without addressing
>> anything isn't really helpful.
> 
> Hi Guenter,
> 
> I am sorry, I missed the change related to your comment: 
> "The outer double (( )) is pointless.".
> I'll fix it.
> 
> I think I handled your other comments or I am wrong?
> 

None of the comments I sent as response to the original v2
have been addressed.

> Should I send patch as v3 or as v2?
> 
Any change requires a new version.

Guenter

> Thanks,
> Vadim.
> 
>>
>> Guenter

