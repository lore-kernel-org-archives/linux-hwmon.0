Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25854C6FA83
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Sep 2022 15:02:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233208AbiIZPCp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Sep 2022 11:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235392AbiIZPCL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Sep 2022 11:02:11 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B69C9FD9
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Sep 2022 06:33:21 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id g1-20020a17090a708100b00203c1c66ae3so6814855pjk.2
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Sep 2022 06:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=0tueKURqqmltUxLK2nUeRD5lUcLY7m2p1mvBLH6GWHI=;
        b=G6u/mvJjjJBgA2rleWdVrSAWSOEoHvS97rpzutkNAtUbE1LEeOZHTeikoVRkZV+ikV
         wG2OvitV/235BqhyDqPhTRbLW4+CSKR2Bb9BK0C3qaGF4RmiUvPQDZO2BEwXJhjPpkmF
         nQJdeBM7q37DEkG3Jk26zKxJ+k6RnuCOEbsKT6ts8V0zXlf6GZUHCUSXDcJCwwfNVSth
         P4gTiLIvpDHv2MODjDlOnJnzZUhM3Z2yznVAtItoOHmF7brnFA7aB3EFsvsdkySb4FIC
         Qhh9vTHkNr86kqtLGo8ubvO+d3bL7Qili4ctYXObgJJZCnaESXSgVA8Yom4XQ1PnmtQB
         aHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=0tueKURqqmltUxLK2nUeRD5lUcLY7m2p1mvBLH6GWHI=;
        b=djz9xWb6D+t1xBGmsbHJhKxPtFi/uYqKI1Qrm8bm4Ic6hQYELCxaEiHsXygvPv+Mrm
         uV46sKG63+BRaG1o7GZhqwFYTPxohbKSI5CkaIoN1Ow6rpobw1xrx4uzTWhqeewrVoSi
         buk7ptlvIe/9P2eLWhxPx47NvRGwWANWY16zI4FiAk8pz5aScXEyaZJPesI2m2q9xt54
         t/IOzMFuc5eChUx2jgvWfjBJyaNLYsdVeMJVVeru2GaHCiK6u5+bo40mB9hyo/lRqc33
         41sTReshO8DtgW4LDBLwLIb7g8xNn3xwt8FFwx9tQNIC2lYIFg03/PDMZZx0ceHp8AZ3
         2iRA==
X-Gm-Message-State: ACrzQf0yE+TgDk4C/OT+gQbXiaBRem903UkrWUQnh4q6wBzHxsKCSsmG
        gMSzyJZAS7rcMWqHaA3i8ls=
X-Google-Smtp-Source: AMsMyM6udgclxkT3qg1Pz3gqv47uv1PH1c65BVX8CtJh0lzESND33qBTNdtybp/2rDYbJuCYacZ0oQ==
X-Received: by 2002:a17:90a:4688:b0:1ef:a94:7048 with SMTP id z8-20020a17090a468800b001ef0a947048mr24802299pjf.244.1664199200554;
        Mon, 26 Sep 2022 06:33:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w19-20020aa79553000000b00540fee4a680sm12126144pfq.41.2022.09.26.06.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 06:33:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <df162cce-17b1-3d9e-6712-37c08b0bb3eb@roeck-us.net>
Date:   Mon, 26 Sep 2022 06:33:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] hwmon: f71882fg: Reorder symbols to get rid of a few
 forward declarations
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        kernel@pengutronix.de
References: <20220925142631.GA1751571@roeck-us.net>
 <20220925191810.gnlkg53jifxk2glq@pengutronix.de>
 <02b28838-846d-e3cd-ce3b-25fc2a9d5881@roeck-us.net>
 <20220926070346.u665ljwqpoycpl5w@pengutronix.de>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220926070346.u665ljwqpoycpl5w@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/26/22 00:03, Uwe Kleine-König wrote:
> Hello Guenter,
> 
> On Sun, Sep 25, 2022 at 12:50:55PM -0700, Guenter Roeck wrote:
>> On 9/25/22 12:18, Uwe Kleine-König wrote:
>>> On Sun, Sep 25, 2022 at 07:26:31AM -0700, Guenter Roeck wrote:
>>>> On Sat, Sep 24, 2022 at 11:28:52PM +0200, Uwe Kleine-König wrote:
>>>>> Declarations for static symbols are useless code repetition (unless
>>>>> there are cyclic dependencies).
>>>>>
>>>>> Reorder some functions and variables which allows to get rid of 42
>>>>> forward declarations.
>>>>>
>>>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>>>
>>>> Applied to hwmon-next.
>>>
>>> Thanks for your prompt action on my patches, very appreciated!
>>>
>>> Let me just note two things:
>>>
>>> a) vger refused to accept this mail with "Message too long (>100000
>>> chars)", so I guess it won't appear in the archives
>>
>> I guess that explains why I don't see all patches in patchwork.
> 
> The f71882fg was the first one of my patches that vger refused. I didn't
> check, but vger at least didn't tell me about my other patches that it
> refused any of them.
> 

Not of yours, but it happens once in a while that I don't see a patch there.
Though thinking about it they are not typically that large.

> 
> Both of these mails have the In-Reply-To header.
> 

Odd. No idea what causes it to get lost.

Guenter
