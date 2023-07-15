Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44590C0015E
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jul 2023 16:39:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbjGOQjd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Jul 2023 12:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjGOQjd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jul 2023 12:39:33 -0400
Received: from doubleyoutf.uk (doubleyoutf.uk [IPv6:2a00:da00:1800:3a8::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 213ECE43
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 09:39:32 -0700 (PDT)
Received: from [2a00:23c5:dcb3:8b33::b56]
        by doubleyoutf.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1qKiIr-002vCA-VJ; Sat, 15 Jul 2023 16:39:29 +0000
Message-ID: <76e2ca3d-f8dc-8196-e2e5-d8f1e00b0b4d@khalifa.ws>
Date:   Sat, 15 Jul 2023 17:39:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] hwmon: (nct6775) Change labels for nct6799
Content-Language: en-GB
To:     Guenter Roeck <linux@roeck-us.net>
References: <20230715152931.1307087-1-ahmad@khalifa.ws>
 <fbd3724f-2c89-cdf6-5fcf-3ddbbffd8aec@roeck-us.net>
From:   Ahmad Khalifa <ahmad@khalifa.ws>
Cc:     linux-hwmon@vger.kernel.org
In-Reply-To: <fbd3724f-2c89-cdf6-5fcf-3ddbbffd8aec@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 15/07/2023 17:09, Guenter Roeck wrote:
> On 7/15/23 08:29, Ahmad Khalifa wrote:
>>    * #temp lists the number of monitored temperature sources (first 
>> value) plus
>>    * the number of directly connectable temperature sensors (second 
>> value).
>> + *
>> + * (*) nct6799d-r based on nct6796d-s and both quite different to 
>> nct6796d
> 
> We should not say "based on" without evidence (that is, someone from 
> Nuvoton confirming
> that this is the case), and "both quite different to nct6796d" is just 
> confusing.
> nct6799d is _expected_ to be different to nct6796d. This should say 
> something like
> "nct6796d-s is similar to nct6799d-r with minor differences which do not 
> affect the
> driver".

It was Nuvoton support that told me that NCT6799D-R was a customer-
specific chip, but "very similar" to 6796d-S.

The point here was to specify the relevant chip ids and to say that the
driver treats both the same way, so I can rephrase it to say "driver
treats both the same way" maybe?

However, I'm somewhat sure the temperature sources on 6799d-R use one of
the reserved values when setup through the bios.

> Apparently there are also NCT6796D-E (Nuvoton's web site) and NCT6796D-R
> (LibreHardwareMonitor). Do you know anything about those chips ? Based 
> on the
> chip ID, NCT6796-R seems to be a variant of NCT6798D with chip ID 0xd42a.

Do you know which board had the NCT6796-R, it seems the R suffix is
"customer-specific"?

> Any chance you can share the datasheet for NCT6796D-S ?

Of course:
https://khalifa.ws/randomfiles/nuvoton/NCT6796D-S_Datasheet_V0_6.pdf


>> +    "NCT6799D-R/NCT6796D-S",
> 
> Alphabetic order, please ("NCT6796D-S/NCT6799D-R").

Will update.

