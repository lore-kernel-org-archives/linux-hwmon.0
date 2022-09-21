Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A05C32771
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Sep 2022 07:58:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbiIUH6Z (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Sep 2022 03:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231179AbiIUH6X (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Sep 2022 03:58:23 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B6086724
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 00:58:20 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id w8so7801751lft.12
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 00:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=PDP2/L/CeOb11s92J9sGh9j2jKfKOL1Pm8pBFioQUZA=;
        b=bOEl89RWD+8cPkCEFrFKsJqal6Abg3mPzUBvtmX6320WfiEEI11BmVEu6MqaJFcFt0
         jzhQfTT+8AGNHKP4A3yVsiSxCexsmqFFnTlL3WB55R2g5VCQarZ2Uoq0aI4zPQufhp2p
         +4aSLNXa0dSbfj0YAIr7gjV6hVQMtyRHgd2Ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=PDP2/L/CeOb11s92J9sGh9j2jKfKOL1Pm8pBFioQUZA=;
        b=i+ryxx9vv5QXcOWMi5JlStmXhPzGI6zMo2BWQBd1DjKVf8j7fFlDP0172ChK1WyPnS
         YO0oNXvPUmAC+5sYbdv9Gi90BL1pm+JaMbC22Hc9jbWTY8GxQsdAFYtwseoukfBVrdU5
         ixDBGq7tkNh+DERC92Mk3XcbX4wQ41AdLA4jfVX8QDBiXUsVuUfOQJ96Qmh5zcx6JG5s
         7gzU8sxIqPUVP2mR+q3POpsL2uU9N0m3MSx/0/fNZE86rLfe0I2a2VHhBZOmBOGgZD2e
         xEbZq/J1kt2B17TiVVvgVAcHopJfoHUpa7+Ft2psFdD19ZinYAKvY9+mbxqyEm3sXagJ
         s+qQ==
X-Gm-Message-State: ACrzQf0OHncjB5YIibpco5OvbEzhW5fz1KfqejRo/uut3mfE01PCF8la
        0ZVobaoJZo6d3oevmYEXAYgxFhYokX2zqjO4t4U=
X-Google-Smtp-Source: AMsMyM5XVgtuygI6nckBf+/S99RDeOTH4d3t6+bMylPmbiWE/DcYNL7n9titjjt1bXCNf9+lUNKh6g==
X-Received: by 2002:a05:6512:c21:b0:49b:d7ab:166f with SMTP id z33-20020a0565120c2100b0049bd7ab166fmr9305919lfu.418.1663747099244;
        Wed, 21 Sep 2022 00:58:19 -0700 (PDT)
Received: from [172.16.11.74] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 9-20020ac25f09000000b00499f9ba6af0sm322365lfq.207.2022.09.21.00.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 00:58:18 -0700 (PDT)
Message-ID: <5602da22-613e-1be9-42e8-c39b8d60f465@rasmusvillemoes.dk>
Date:   Wed, 21 Sep 2022 09:58:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/6] rtc: isl12022: add support for temperature sensor
Content-Language: en-US
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20220830100152.698506-1-linux@rasmusvillemoes.dk>
 <20220830100152.698506-7-linux@rasmusvillemoes.dk>
 <YyHvXh1Zhy/wsHsD@mail.local>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <YyHvXh1Zhy/wsHsD@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 14/09/2022 17.12, Alexandre Belloni wrote:
> On 30/08/2022 12:01:52+0200, Rasmus Villemoes wrote:
>> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
>> ---
>>  drivers/rtc/rtc-isl12022.c | 81 ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 81 insertions(+)
>>
>> diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
>> index b295ec92ee17..1bd72f436318 100644
>> --- a/drivers/rtc/rtc-isl12022.c
>> +++ b/drivers/rtc/rtc-isl12022.c
>> @@ -17,6 +17,8 @@
>>  #include <linux/of.h>
>>  #include <linux/of_device.h>
>>  #include <linux/regmap.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/hwmon-sysfs.h>
> 
> You should keep that list ordered

While the three lines of context happen to be sorted, the list as a
whole is not. I can of course include a patch sorting it.

Rasmus
