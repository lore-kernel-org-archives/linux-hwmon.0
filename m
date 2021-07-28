Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC933C4338F
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 21:28:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9982C6054E
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 21:28:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbhG1V2T (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 17:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbhG1V2R (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 17:28:17 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09CF7C061757
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jul 2021 14:28:15 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id f22so3728833qke.10
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jul 2021 14:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=G81k/vclkB2Sgk/17WHcp/5X9y3C+Cqsd3npHUXo4X0=;
        b=VMjcvVd5/pQ7N5lY/JlqVpR2SeTm0Lh+Ow1lG0J4DPkZacwQgXkAmeGIyx0/OIbs/t
         8z6t4F1fbbDEXszoyIuO9gvF7bzg1J9+3ZGGRPl6NdNlFL09IXro4vX8qnhYFvU7gPS8
         r7/yqGTQ0HXbd5lW4ffEjOY26yQM39NxcW6YSZFI4lQ2CAIaNKZtkSSJT7FIp9Oj195H
         4VDrJrQILIY4LkYRNUbtiEPPOjG6EFhUCsfcQt73jR53NwYNsfjuMK/jsKi88eFuTrp4
         m2/EmSgGHtt8AaBcd2q/rk8Zq5GFptJv+J9nILxP34Q1dS+jRX+kZbIHyWWDtM3cmTKh
         dQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G81k/vclkB2Sgk/17WHcp/5X9y3C+Cqsd3npHUXo4X0=;
        b=kIpLw1rIKOCR6xGog+W+3SXMnWpZoPvSr3P4C+jSmwsL/HdcLkkPdrwlIT5ClejYT9
         V3tlnpf0K/TbzwaIk+enu1j9Mkh7GeRNYzIp3CiJk/jaLCzAGO2yqpb+GTJ7/zgkteYO
         FOgH3NJtZioE8MMEcFJymWYzdLD/9vdLA7AA73uRAi5ilF9qab/lqqEeEh4C7HUhJFCO
         mv+Vwgl68DjhI7vdcXw7r+Daz4J7MTuZlA3N1tfxEsugbUnJagT5RuJXgfZyyDnM/uSU
         cm1xDmOhAFHJv67uT04bt0O63HgXpawrRQcNbSBOnpUPO4Kex2MEgvy0pTLnPtZXb/es
         YzDQ==
X-Gm-Message-State: AOAM532BTL84f87CoumBNrxodqZ0vOh23DG2OKrLgkSi8ISItsMq4aRV
        E2OuIl3jc74fMAOllfcshzHyjMz3h7I=
X-Google-Smtp-Source: ABdhPJxMr35Vv1OIQ3RYC28mhUsy03xL99dUrA0XIG4n3KkW49SB/ngAFEwJ9mvfGSTLZPcY+jl8Ng==
X-Received: by 2002:a37:394:: with SMTP id 142mr1797391qkd.423.1627507693919;
        Wed, 28 Jul 2021 14:28:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l127sm628236qke.86.2021.07.28.14.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 14:28:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v6 0/6] hwmon: (dell-smm-hwmon) Convert to new hwmon
 registration api
To:     Armin Wolf <W_Armin@gmx.de>, pali@kernel.org
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210728205142.8959-1-W_Armin@gmx.de>
 <cb393f4a-44c6-4f67-6c1e-ba04c48a59e5@roeck-us.net>
 <340a960b-3031-77de-8e62-5fd933ec9a62@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <0500dd39-c82c-8268-91a3-0a97103ab3d0@roeck-us.net>
Date:   Wed, 28 Jul 2021 14:28:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <340a960b-3031-77de-8e62-5fd933ec9a62@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/28/21 2:19 PM, Armin Wolf wrote:
> On 28.07.21 23:07 Guenter Roeck wrote:
>> On 7/28/21 1:51 PM, W_Armin@gmx.de wrote:
>>> From: Armin Wolf <W_Armin@gmx.de>
>>>
>>> This patch series is converting the dell-smm-hwmon driver
>>> to the new hwmon registration API. In order to do so,
>>> it introduces a platform device in the first patch, and
>>> applies some optimisations in the next three patches.
>>> The switch to the new hwmon registration API is done in
>>> the next patch. The last patch is fixing a small bug.
>>>
>>> The caching of the fan/temp values was modified to better fit
>>> the new hwmon API.
>>>
>>> The patches work fine for my Dell Latitude C600, but i whould
>>> appreciate someone testing the code on another model too.
>>>
>>> Changes in v6:
>>> - Make pwm1_enable permissions write-only
>>
>> Sorry, guess I am missing something. Why ?
>>
>> Guenter
>>
> pwm1_enable used SENSOR_DEVICE_ATTR_WO before the patch, so the file
> permissions where 0200.
> In the v5 patch series however, the file permission where not 0200, so i
> changed that.
> 

Is there a _reason_ for declaring this attribute write only, other than
"it used to be that way" ?

Guenter
