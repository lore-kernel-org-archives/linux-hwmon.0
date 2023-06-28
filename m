Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFB8EB64DA
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jun 2023 20:33:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbjF1UdT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jun 2023 16:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbjF1UdS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jun 2023 16:33:18 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AA0519B0
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jun 2023 13:33:17 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b7f2239bfdso3091925ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jun 2023 13:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687984396; x=1690576396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zt7h3UQHaF0WrXQrNX211B/2tPUsW/uiE6lYPaP0OTo=;
        b=Sl3ynQkXfdWc10w6ByPUW0FHgAVIcWA1odm9iQ6siY1I5z8ddFMY4vX7K/ROY/KgI1
         BpiaiKfUSoZFUvmXRkbEMX26tn7UUfhRksTdOKVTlJQjzVgMNxKFxK9CTBFdqwJr324P
         HL5tbjrspEAP+kffYNXdmYtC4Gl1aPJ2+0Fp8r9OmK7svMNB7xU0i8uZlWmXIE9r3dkf
         GeonFOL+I9Uvk4WSVsTL50ITfWiuzZRoAUGql6e5SxHCcQD0CCBaaJQ6kvlfeFzAAGyp
         FAEpYVsE6E06kaiH1KguG0LWeoAJ5ragsqSP4e4IzuN51lr30O6BlPTjXbnbQSg5g8MW
         rznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687984396; x=1690576396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zt7h3UQHaF0WrXQrNX211B/2tPUsW/uiE6lYPaP0OTo=;
        b=S4a7MrvZl7zDaYaSIAaCBqmHMSx+4ZkAPukkFM+3GzKNb78pYmPRbMGPU5K59W9p8o
         CfM3eJsjjD2yt5/vDDcAnS6BQ88PImhbFuYHK99aKVWGIqYk32nUrgrc9UWxToEBraJe
         sWWNEZR98r01v4Z9NPTDVK4iIHHK8RRX3Q/TS+xpJv4ADVkHca8JpsIg2VyKE4H36ALi
         E6C5ldnocN6Lkf+ZeQr1ci8StM6PUOJMJDANHlAQXszoICpSMftzoXX0mze0phNAnHzL
         IWOlu1yPkoyzSAG6h6QiVtXMABQ1Ug0C5HJ2TZ/UvE7sHiplMjubNx63hozREt4FfFn8
         ZLKQ==
X-Gm-Message-State: AC+VfDw0G39yjx8rFndg16Rr/cxB94HaTsbGJDSSdMKegRsV5TBVHiHl
        KvQEkwKwoBarQv7MdeciNmU=
X-Google-Smtp-Source: ACHHUZ4OgGde3wUKP5O7GkNZtKZDQZoCJn3eEKQb3lTDf8xFqK0ZttTgZNF/UD/oF7Mg/NkM3S9osg==
X-Received: by 2002:a17:903:41cf:b0:1a1:b3bb:cd5b with SMTP id u15-20020a17090341cf00b001a1b3bbcd5bmr15122663ple.62.1687984396496;
        Wed, 28 Jun 2023 13:33:16 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e3-20020a170902744300b001b1c3542f57sm6553079plt.103.2023.06.28.13.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 13:33:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f405f0fb-4ac6-2343-e1f5-32c4adca32c0@roeck-us.net>
Date:   Wed, 28 Jun 2023 13:33:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] hwmon: (pmbus) Update documentation to not use
 .probe_new() any more
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de, Jonathan Corbet <corbet@lwn.net>
References: <20230627064948.593804-1-u.kleine-koenig@pengutronix.de>
 <ba6e1b94-f79e-954a-592e-dfefe2a71f1f@roeck-us.net>
 <20230628200009.6iu6b55keem3u4az@pengutronix.de>
Content-Language: en-US
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230628200009.6iu6b55keem3u4az@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/28/23 13:00, Uwe Kleine-König wrote:
> Hello Guenter,
> 
> On Wed, Jun 28, 2023 at 09:46:26AM -0700, Guenter Roeck wrote:
>> On 6/26/23 23:49, Uwe Kleine-König wrote:
>>> Since commit 03c835f498b5 ("i2c: Switch .probe() to not take an id
>>> parameter") .probe() is the recommended callback to implement an i2c
>>> driver (again). Reflect this in the documentation and don't mention
>>> .probe_new() which will be dropped soon.
>>>
>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>> ---
>>> Hello,
>>>
>>> this patch was part of a patch dropping .probe_new() before (see
>>> https://lore.kernel.org/linux-i2c/20230626094548.559542-1-u.kleine-koenig@pengutronix.de).
>>>
>>> However this change makes already sense without dropping .probe_new, so
>>> here it comes as a separate patch.
>>
>> I got this after sending my pull request, and I don't currently plan to send
>> another one. What is the time line for the probe_new removal ? If it is
>> still planned for 6.5, you might want to keep it as part of the series.
>> In that case,
>>
>> Acked-by: Guenter Roeck <linux@roeck-us.net>
> 
> Getting this final patch into next after 6.5-rc1 was my initial plan,
> but on Monday I found a few newly introduced users of .probe_new().
> Patches were send out, but I intend to postpone by one release cycle. So
> if you take it during the merge window for 6.6-rc1 that's fine.
> 

Sure, no problem.

Guenter


