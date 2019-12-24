Return-Path: <SRS0=lH8M=2O=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5533AC2D0CF
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Dec 2019 16:29:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 27FF220706
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Dec 2019 16:29:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oiWG/aZg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbfLXQ3m (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Dec 2019 11:29:42 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:39885 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbfLXQ3m (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Dec 2019 11:29:42 -0500
Received: by mail-pj1-f67.google.com with SMTP id t101so1399879pjb.4
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Dec 2019 08:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9tUHdJf94rlrT8Swh5bnkoM2ryFP27G7OGbTXfSqiZU=;
        b=oiWG/aZgT0hMMjPzXVaxqbGyEiiKAG64D/upZJM25xWQoDy9z2Ie987nALs37iZcGS
         zL+VUS0/XFXA4hva3K+rhdbUrbS+6i+9f5MfppOYtb4XrO3VTQDz2+5/aOVV/vkAt1QU
         22dY79xz0ddWjmF6nYwIavgjyh3k94GMApq0CSBUlWSYDUHgpUMLNeD1AyPqzJC0d09+
         iMekb3KFFBVHPssglsFQgEAFk7hf07AzkoDZov7yenftOZAM5y+xaUgbwQmgi1h7bh/7
         Y/aPtCrJphDQ3B0tvPihIYz6Ur/Xj/zxjMAz6mpjQUqEk/MHSgLJILlj8IkNjMAETmOH
         z9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9tUHdJf94rlrT8Swh5bnkoM2ryFP27G7OGbTXfSqiZU=;
        b=BRSiuS9sV6xUqTP9NUpAyQfJeD/YQK78f+UHN2IWbsq15mzJVjhBSIzbJQV01o7tYL
         d3QGIIUY0NHCKPxX4jZIDPKzx+CMKcHXKfRrBaxCF/9+wpfu57BhOUy8XYWvWR+ckDws
         59gZpR/5OrkJllZtm5PWPBe/2uMxHpkhimBNMzogd/CoY4zazjMuaTB7cXAA8pl7PqB/
         CWZsWksowZo5rA4/BqC0ONXkywo1qvpy+w76Tmi0UYeRpgqIITUZWaawX8icCrN/W6EH
         1mr/96FrtaNEP4Q0GLFgiJsSH4oH6MEyLpAzOMc5CXhSGauWyCslOSD6oAnKxLIuAlqZ
         SQqQ==
X-Gm-Message-State: APjAAAWGacuCG3QFQ9DDXaGHTDfuj+g5aKeVk7sFTYN1wfhUvKt4V/mj
        dHVb9A6sqOb+ZyJ5YALHIb6po2xp
X-Google-Smtp-Source: APXvYqwjxbQaV8gHVv4HvZIghhTiTu2sCTZKYIIJUjE0xs52Ux0+VGwivDx9hlOQ8E8zWqGf7HwHiA==
X-Received: by 2002:a17:902:8ec4:: with SMTP id x4mr21464315plo.234.1577204981823;
        Tue, 24 Dec 2019 08:29:41 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u12sm7873938pfm.165.2019.12.24.08.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Dec 2019 08:29:40 -0800 (PST)
Subject: Re: kernel 5.4.6 + Ryzen 3700X: "Can't display frequency and others
 of Ryzen7 3700X"
To:     pgnet.dev@gmail.com, linux-hwmon@vger.kernel.org
Cc:     marcel.p.bocu@gmail.com
References: <bb629ef6-a669-8849-17f4-481c8c9f9347@gmail.com>
 <b2f72e65-4a80-0aaf-ce7e-0880fdcf60c7@roeck-us.net>
 <2c858787-1e5e-77e4-30ef-f17036b205c2@gmail.com>
 <121bee85-6369-4b32-2504-c1d104ea2bd6@roeck-us.net>
 <4a1e2dc9-3303-8dd5-7bbd-3605a43bffe1@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <34008d92-9709-786e-5c76-007edffe0a7c@roeck-us.net>
Date:   Tue, 24 Dec 2019 08:29:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <4a1e2dc9-3303-8dd5-7bbd-3605a43bffe1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/24/19 7:59 AM, PGNet Dev wrote:
> On 12/24/19 6:25 AM, Guenter Roeck wrote:
>> You'll probably see a note about an ACPI resource conflict. If the board
>> with NCT6796D wasn't yours, that may not be the case.
> 
> this certainly looks like it might be the source of the problem,
> 
> ...
> [33002.934396] nct6775: Found NCT6793D or compatible chip at 0x2e:0x290
> [33002.934401] ACPI Warning: SystemIO range 0x0000000000000295-0x0000000000000296 conflicts with OpRegion 0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20190816/utaddress-204)
> [33002.934406] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
> [33017.944153] nct6775: Found NCT6795D or compatible chip at 0x2e:0x290
> [33017.944158] ACPI Warning: SystemIO range 0x0000000000000295-0x0000000000000296 conflicts with OpRegion 0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20190816/utaddress-204)
> [33017.944164] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
> [33033.152135] nct6775: Found NCT6793D or compatible chip at 0x2e:0x290
> [33033.152140] ACPI Warning: SystemIO range 0x0000000000000295-0x0000000000000296 conflicts with OpRegion 0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20190816/utaddress-204)
> [33033.152146] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
> [33085.807200] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
> [33085.807205] ACPI Warning: SystemIO range 0x0000000000000295-0x0000000000000296 conflicts with OpRegion 0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20190816/utaddress-204)
> [33085.807209] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
> [33519.421923] usb 4-1.4.3: reset SuperSpeed Gen 1 USB device number 4 using xhci_hcd
> [34160.099747] it87: Found IT8728F chip at 0xfff8, revision 15
> [34160.099769] it87: Beeping is supported
> [34160.099844] it87: Found IT8728F chip at 0xfff8, revision 15
> [34160.099865] it87: Beeping is supported
> [34212.426003] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
> [34212.426008] ACPI Warning: SystemIO range 0x0000000000000295-0x0000000000000296 conflicts with OpRegion 0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20190816/utaddress-204)
> [34212.426014] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
> [35066.143893] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
> [35066.143900] ACPI Warning: SystemIO range 0x0000000000000295-0x0000000000000296 conflicts with OpRegion 0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20190816/utaddress-204)
> [35066.143907] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
> ...
> 
> 
> if it is, iiuc your earlier comments, sounds like a BIOS issue.
> 
The problem is - most likely - that the BIOS (or, rather, ACPI) accesses the
same memory range, and there is no synchronization. You could try to boot with
"acpi_enforce_resources=lax" command line option, but that would be on your
own risk, and some recent boards don't even boot if that command line option
is present.

You should not try to load the it87 driver on ASUS boards.

Did you try to load "asus_atk0110" ?

Guenter
