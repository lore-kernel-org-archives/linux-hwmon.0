Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F02C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Nov 2022 23:49:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234581AbiKVXt6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Nov 2022 18:49:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233984AbiKVXt5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Nov 2022 18:49:57 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B1008FB1C
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Nov 2022 15:49:56 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id b124so17484192oia.4
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Nov 2022 15:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lwq/gF3gR8Vw1SB7qBc/KjZhbD59HNgIlVgDiExfBtQ=;
        b=p/4AkLRPo7KPgfr2/tbUjaHA9qS32Dr8aK9Mz6S64C6hlRMRSFudK2plouXhCR8Hbr
         LolRAcHAj9LwdU93RSrKSZEijPziNPBSnYM3lmSKUFaqn/gxKgFqkh722Xe4JWXLOW3/
         xlIjPVplPfJbbU8Lby1kJ9xVOtPuoWqoEa2wDLfMWI1P+iXpTtb4j+rGkUz6B3xxHTvx
         WvWrTFj9AFWXs7NjPXRXBip+cXBTx3fqdUefttfCWiITvrSttr4JWtMM+y5rjQoJxbpo
         N8dYiHoyRXhBF9PQwT2HvnYnXa2lN7XapKxs0r+4iU4iGMaynknUnrXiHPz/L/WLAz9N
         VTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lwq/gF3gR8Vw1SB7qBc/KjZhbD59HNgIlVgDiExfBtQ=;
        b=LtzsOXnr/EtAH85YE6a3KapymRBjitelZ5Az9vc7nWdADzrpOLe2UNf/Od/s/kAS97
         LeNivvoYC78CspZuwiOnmM85jz8xrt5MWIPKLayWzlJWCut/IEN7+8LqKIhgzq4/ufhq
         jM9CTdXQ6yPB/7MLdhVwO6/EsL3Xwgn5SBtuxdDqMxsy246Kqd5MT/uoUUzKFWsXcRYL
         L2Uf5T1I0v6S0k4OwgQ+ymFKxRNjHdZtH9RCQ3c+SQulpXs44ufrmoX2s1nbprI44qr1
         sn0hYQ9HuqXW9yBrZxqlDhirKzPobR9yNBejTqBiFgFr466yZ6bb2ZfiGZl/TK8zrmY4
         j0wA==
X-Gm-Message-State: ANoB5pkmvbopk4t/7wOH5GyYXpEgpdsjfNp5BtiwJHXBMZfNHK7PdF51
        Jy8Og197kHfeORo+BFQSDe1a2cqMz+k=
X-Google-Smtp-Source: AA0mqf7N0n2G4S6VINXbrN7E0OgNVG2CP7m29872tOhfjGvB/JbWXYDv6+z6HLz14ZVmG7MydQPCoQ==
X-Received: by 2002:a05:6808:30a0:b0:359:f059:ed05 with SMTP id bl32-20020a05680830a000b00359f059ed05mr14669489oib.148.1669160995342;
        Tue, 22 Nov 2022 15:49:55 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n24-20020a4ae1d8000000b0049fd73ccf72sm3871843oot.42.2022.11.22.15.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 15:49:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <54770368-e8be-49b2-57d9-4946cc22f12d@roeck-us.net>
Date:   Tue, 22 Nov 2022 15:49:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20221121025718.160667-1-frank@crawford.emu.id.au>
 <20221122184328.GA553935@roeck-us.net>
 <b1441faf2883a693f41439de7be0a96f60b76f05.camel@crawford.emu.id.au>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/1] hwmon: (it87) Automatic handling of ACPI resource
 failure
In-Reply-To: <b1441faf2883a693f41439de7be0a96f60b76f05.camel@crawford.emu.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/22/22 15:28, Frank Crawford wrote:
> 
> 
> On Tue, 2022-11-22 at 10:46 -0800, Guenter Roeck wrote:
>> On Mon, Nov 21, 2022 at 01:57:18PM +1100, Frank Crawford wrote:
>>> On some Gigabyte boards sensors are marked as ACPI regions but not
>>> really handled by ACPI calls, as they return no data.
>>> Most commonly this is seen on boards with multiple ITE chips.
>>> In this case we just ignore the failure and continue on.
>>>
>>> This is effectively the same as the use of either
>>>      acpi_enforce_resources=lax (kernel)
>>> or
>>>      ignore_resource_conflict=1 (it87)
>>> but set programatically.
>>>
>>> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
>>> ---
>>
>> Sorry, I can not accept this patch. Ignoring resource conflicts
>> may have unintentional side effects and _has_ to be explicitly
>> requested by the user.
> 
> I do have two comments on that decision, firstly, for the bulk of the
> boards listed I've dumped the ACPI tables and data and the conflicting
> address ranges do nothing with ACPI.  It looks like Gigabyte planned to
> implement WMI access, but stopped after developing some code for single
> chipset boards, and just nulled out anything to do with boards with two
> chips.  However, getting any information from Gigabyte about this is
> impossible, as you know.
> 
> Secondly, unfortunately most users have no idea what the ACPI error
> means, and just follow random comments on the Internet, which currently
> is to set "acpi_enforce_resources=lax" which is even more dangerous.
> At least the recent addition of "ignore_resource_conflict=1" restricts
> the issue to a known area, and this would take it one step further in


That is exactly why I had added to flag in the out-of-tree driver.

> that we are just automating it for known "safe" boards.
> 
> However, if you are not willing to accept it, I'll just drop it there.

Sorry, I'd rather live with 100 users mad with me for not permitting
the patch than permitting it and having to deal with one user who
ended up with broken hardware or random reboots. This _has_ to be a
conscious decision made by users.

Also, ignoring ACPI resource conflicts always was and always will be risky.
There is no such thing as a "known safe board". Who knows what Gigabyte
is going to do in the next version of their BIOS.

Guenter

