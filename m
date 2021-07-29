Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79D6C4338F
	for <linux-hwmon@archiver.kernel.org>; Thu, 29 Jul 2021 02:26:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC1D76103A
	for <linux-hwmon@archiver.kernel.org>; Thu, 29 Jul 2021 02:26:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233414AbhG2C05 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 22:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233310AbhG2C05 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 22:26:57 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C57C061757
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jul 2021 19:26:53 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id c9so4396673qkc.13
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jul 2021 19:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eiyX2wHae/vd3SwSS6Ebgzz1GIzV8lRhvKFHbBeIfxk=;
        b=FxdEY24Sy1k9UwTLTxjlZojnVGTSrjrG05sBFN576j+45qDV/YKiC3L99TfqvT4eOe
         ygxu7r2SPCIyvglp6g9mlkyIcl1qvEe1aQ2xPaBfScHFrsEjfFp4zxFRPiM2wmPJaxpf
         L2nRwlzpMowdoZ2JMr/y9LC9sZRzZJDHaT9sCKYV51SGSqYaOIHJ4tQYw3wSAfwat1qs
         whRTHisW2KnLSc/iJUKcjEvEMgGel3kiF4V2VHzHeL3ywdfTtQ6fcxbznrg4wp9ZDVZP
         xln/oj30JDIHu7tIq8JROI1rf9zAv1fi18wwgTW5BT0njQHqdXX5Xj2cG3nugnCZr23k
         LeKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eiyX2wHae/vd3SwSS6Ebgzz1GIzV8lRhvKFHbBeIfxk=;
        b=W2GUqhQRJ9W+RyUc4UjRy4NTC4Le826x+lsakMw+hDsYnikD9YltSQKvBXNeGRj9QF
         CfYTlPvJ468deKkX6FXt73HAAZlOrF11RvCu/P/N+pDGHkNOimTTApXwDnO6etqqBXBg
         imFA0H0HOaB/Llh8Hv+jtAYnsoH5rrrIaiII1pmCEbdcpoPK5NO548Y3/PREpYd8Tg6/
         serKe4ArB65Y3/IllF+CNjca4OH5wS3tq49hOnejNhWWFK375AcuMjXf3cbWngHfD1o2
         GCNvgLYDCTNcAGRehGjsPaMggSQeSSNTjqf332EJtnxou2TaBlfeeg5RaxW7Cr8cSP8g
         Fazg==
X-Gm-Message-State: AOAM530pUPDMZ5lNG3r2pmFY/76FdwtEq+0gfn9Gr40joU5gPzT0nB8N
        iXxd2ZvObnx/JBydVM92ewQn2GxGmf4=
X-Google-Smtp-Source: ABdhPJy9/tTzgP5XzFDKlmLBZrjhDW0WBT3D1iapQl1jNqQKIt19zB7KwD64Yaa+2YWrVdey/nQAkw==
X-Received: by 2002:a37:45c9:: with SMTP id s192mr2967547qka.21.1627525612792;
        Wed, 28 Jul 2021 19:26:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t6sm999313qkg.75.2021.07.28.19.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 19:26:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v7 0/6] hwmon: (dell-smm-hwmon) Convert to new hwmon
 registration api
To:     Armin Wolf <W_Armin@gmx.de>, pali@kernel.org
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210728221557.8891-1-W_Armin@gmx.de>
 <fb82b50e-fa7d-c735-262b-0ac930c4d8ee@roeck-us.net>
 <95502d8b-8a18-c600-4a42-9479a0f5c681@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f63299d4-34e0-87ab-5f27-970d81281a9b@roeck-us.net>
Date:   Wed, 28 Jul 2021 19:26:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <95502d8b-8a18-c600-4a42-9479a0f5c681@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/28/21 3:49 PM, Armin Wolf wrote:
> Am 29.07.21 um 00:43 schrieb Guenter Roeck:
>> On 7/28/21 3:15 PM, W_Armin@gmx.de wrote:
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
>>
>> At this point I'd suggest to queue the series up in -next and see
>> what happens. I don't think we'll get additional feedback.
>>
>> Thought ? Objections ?
>>
>> Guenter
>>
> I agree, its unlikely that the code still has big issues, it works on
> the C600.
> The only thing still untested is reading fan rpm/changing fan control, but
> i expect them to work.

Let's see if Pali has any objections. If not, I'll apply the series tomorrow.

Guenter

