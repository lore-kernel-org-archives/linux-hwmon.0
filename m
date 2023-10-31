Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D72C4167B
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 Oct 2023 19:28:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231990AbjJaT2O (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 31 Oct 2023 15:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbjJaT2O (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Oct 2023 15:28:14 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11454DA
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Oct 2023 12:28:12 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-28041176e77so2121377a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Oct 2023 12:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698780491; x=1699385291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ovv3WQ7FRMmEnWu6A/ZZBnQWoUTuziU06UNXPBgQjeY=;
        b=L9bpVJhmMuSumAQYii8Z5ZsNHP5+agLZxFi/bYBsmfR/qssPlVN9EzYhmfMuEXD+TP
         Lcs80kxHYkJx7N6iKUJYuhuiOSt/FQYK3dF7EQ3pBaeCd+AFx5my9BlWsuy+W6uDrTvM
         4fXLm7pBIIr/8xOZaJ/n6GgZWrIz8qN7cVPHQW5YKuCh5cKPqqgCnpAeooMHVpUsrwxU
         jNjRcqOW5Nm4zrPBufbgsXE59JcN5jY5MRq57quwCJS4ZPUvaFlEzbvwqPrvUdrLNRKL
         AJCifzrofMjQqFB2mjeUt0C7PwfX0XX1GOZo8kfTBJ7gJ6s3OmSwWAtsY6Ws4CdOJSX4
         4uHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698780491; x=1699385291;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovv3WQ7FRMmEnWu6A/ZZBnQWoUTuziU06UNXPBgQjeY=;
        b=g2haK0s+hmhhZtgghJeZRYKzfC4tpMRsNHqwJfwxDYUUW4M1nyuaO9wRCZJ3U/dhlv
         hStCm9fHosI1J2fRpy0yU+cuYg63zZbEp43ySQDSgxmO7rpmV3Amw1UuRb1hS4hTDyi0
         aejDzZy36nXZgkVt/0N1byEg3J2teCzvkT+A9Xiyvnz2XUfxh+KYwPa4X+++cErcTd8b
         WXSbuRq7h7WCFCc6/ehOuEH+2zaTd0cByTkvZxro/T13jG5LFgwryyLIvMb99FMz9vgW
         xu4i4LWWf0m6/0+x9oXDLnfCWO6zABRNGcZ/07+SOAf/WQgq3uB6SPBiGqU/DFENUYV3
         T7BQ==
X-Gm-Message-State: AOJu0YwfVbAm70tpXxkcrkg4V2n9tFXK2qcAVL6A7jzsev4WUMgnWnD4
        IWmpB5aI2Hr1d7MbhgHJklM=
X-Google-Smtp-Source: AGHT+IGHBinC7V/1kUOM6jVjX8HBGTHMbirNbqRfh6jLI48DGMaUOHCmLLpaUsc/ifZQm6wfCDswtg==
X-Received: by 2002:a17:90a:fc94:b0:27d:c499:14f3 with SMTP id ci20-20020a17090afc9400b0027dc49914f3mr10889807pjb.9.1698780491276;
        Tue, 31 Oct 2023 12:28:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id pj7-20020a17090b4f4700b00278ff752eacsm1426222pjb.50.2023.10.31.12.28.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Oct 2023 12:28:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <65a80c25-5646-4928-b6c8-914fb4b63046@roeck-us.net>
Date:   Tue, 31 Oct 2023 12:28:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] hp-wmi-sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -22
Content-Language: en-US
To:     Lukasz Stelmach <l.stelmach@samsung.com>,
        James Seo <james@equiv.tech>
Cc:     Armin Wolf <W_Armin@gmx.de>, linux-hwmon@vger.kernel.org
References: <ZUEIcOBpVzxC/+c1@equiv.tech>
 <CGME20231031190753eucas1p25afeef1c5372a0da4549ebea01ec0ea9@eucas1p2.samsung.com>
 <oypijdsf5qehkx.fsf%l.stelmach@samsung.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <oypijdsf5qehkx.fsf%l.stelmach@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/31/23 12:07, Lukasz Stelmach wrote:

[ ... ]

>> For what it's worth, I personally don't see much value in doing much
>> more than a machine-limited workaround for now. To me it's clear that
>> this UTF-16 corner case is a BIOS bug and its consequences are minimal
>> once a workaround is in place.
>>
>> Thoughts?
> 
> I am no expert regarding x86 platforms and I don't know how often bugs
> like this happen and if making it more generic makes sens. Maybe.
> 

That really depends on the system vendor, less on the CPU architecture.

> My solution would be to add a module option, let's name it `quirks` and
> make it a bit field for future use, that enables the workaound. Plus an
> additional error message when probe fails to suggest user to add the
> option to kernel command line or whatever file that contains module
> options. A nice touch would be to detect if the workaround is still
> required.
> 

Please no module option. Use DMI data or similar.

Guenter

