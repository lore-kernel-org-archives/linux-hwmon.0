Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8834C4338F
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 21:37:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFE3F60F02
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 21:37:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbhG1Vhd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 17:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231917AbhG1Vhb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 17:37:31 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 593B0C0613CF
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jul 2021 14:37:29 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id a12so2464120qtb.2
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jul 2021 14:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LIMBzC60vXQ7efCBZCq5Wtd1TqxOKuud1LYiwsRk3oU=;
        b=C69JWlDJfXBa2/B4/bOzwV19h38T5snxOolgAuUOaoRxHH32Q9KOQUp5MBddAFmZ11
         PoVEZIHGYysMOqMeoHUN6Jc/XE72gVAQCOflEUdA3dhDWjE9bXzbJGrR1E9Bcv4NUGX+
         zsInMDAf+39S+Upocxrqg8PJtuFSmZaJ19W5cVyHo7YZ8jXhrygjo5SPGx+whNufgw5u
         aY5zKxWvhkwnvrKa3VhFyjgxvtkrkzshToNnfavdGmh5wSMdqWbyaTOTPSHcvCkXm4gN
         vQG4RhiT83gUzipJ6+Br3WT7D6NLOKd+uZzYq+QgoNWX6hiudodsC8iseNu6McQLG2/v
         rQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LIMBzC60vXQ7efCBZCq5Wtd1TqxOKuud1LYiwsRk3oU=;
        b=ejSpV+4rTSXFjIl8hHVV+jq6mAKmKrWt2UrMGd4WMkZk5mQ8uh+aygwL0jQGMQifV7
         wGATJzeb+ZnS2HJ6PrA73XN9NngAyvtCQuIdKa2VfUukam9H8hcls3+YZ/Bwtml46T84
         JfwZf5kJlzV2MGmkhbgdpWY1PMa7F6Hegbaf6UcH0VfLHdZAr1tHzPAVppiLkzO2hNze
         KZFRdsVtNoYwlG2HzfNSmxWiFjrphn0TCCzUECraFlWun1dJZ89YJ7OlvivmMXaqsl8g
         MeXSO+2peBVmYyfNjs2R2b1/fn0CZZkR1UlwB0wnJH0PWNe6nBN6mFqj5jNDofFl8oGM
         YUFQ==
X-Gm-Message-State: AOAM533/SnT4cccuqQCt4ydgIQ7zCLTZrT3xX4YRr3PQy+Dji8YvQyEg
        qC1s2KBgNYF7Wy4GtLUtuHDQMoFHtz0=
X-Google-Smtp-Source: ABdhPJwqjXcZ5gzljOcUnCOdLLxxev0h5cKwZFRuyRyOiPJlQ0Xu59yVwr2IvWdaLnDa6bAt9CCtIg==
X-Received: by 2002:ac8:44da:: with SMTP id b26mr1526020qto.81.1627508247976;
        Wed, 28 Jul 2021 14:37:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 143sm666245qkf.3.2021.07.28.14.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 14:37:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v6 0/6] hwmon: (dell-smm-hwmon) Convert to new hwmon
 registration api
To:     Armin Wolf <W_Armin@gmx.de>, pali@kernel.org
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210728205142.8959-1-W_Armin@gmx.de>
 <cb393f4a-44c6-4f67-6c1e-ba04c48a59e5@roeck-us.net>
 <340a960b-3031-77de-8e62-5fd933ec9a62@gmx.de>
 <0500dd39-c82c-8268-91a3-0a97103ab3d0@roeck-us.net>
 <cac1b3ef-b51c-4514-cc7b-000b0d48ac8e@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <938db8a5-3199-d468-5979-9978171bb138@roeck-us.net>
Date:   Wed, 28 Jul 2021 14:37:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cac1b3ef-b51c-4514-cc7b-000b0d48ac8e@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/28/21 2:34 PM, Armin Wolf wrote:
> Am 28.07.21 um 23:28 schrieb Guenter Roeck:
>> On 7/28/21 2:19 PM, Armin Wolf wrote:
>>> On 28.07.21 23:07 Guenter Roeck wrote:
>>>> On 7/28/21 1:51 PM, W_Armin@gmx.de wrote:
>>>>> From: Armin Wolf <W_Armin@gmx.de>
>>>>>
>>>>> This patch series is converting the dell-smm-hwmon driver
>>>>> to the new hwmon registration API. In order to do so,
>>>>> it introduces a platform device in the first patch, and
>>>>> applies some optimisations in the next three patches.
>>>>> The switch to the new hwmon registration API is done in
>>>>> the next patch. The last patch is fixing a small bug.
>>>>>
>>>>> The caching of the fan/temp values was modified to better fit
>>>>> the new hwmon API.
>>>>>
>>>>> The patches work fine for my Dell Latitude C600, but i whould
>>>>> appreciate someone testing the code on another model too.
>>>>>
>>>>> Changes in v6:
>>>>> - Make pwm1_enable permissions write-only
>>>>
>>>> Sorry, guess I am missing something. Why ?
>>>>
>>>> Guenter
>>>>
>>> pwm1_enable used SENSOR_DEVICE_ATTR_WO before the patch, so the file
>>> permissions where 0200.
>>> In the v5 patch series however, the file permission where not 0200, so i
>>> changed that.
>>>
>>
>> Is there a _reason_ for declaring this attribute write only, other than
>> "it used to be that way" ?
>>
>> Guenter
> 
> I dont think so, dell_smm_read will just return -EOPNOTSUPP if someone tries to read pwm1_enable.
> 
> Armin
> 
That is not what I meant. Is there a reason to not report
the current status of pwm1_enable to the user ? In other
words, does the firmware not report its current status ?

Guenter
