Return-Path: <SRS0=lH8M=2O=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C028CC2D0CF
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Dec 2019 14:25:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 93D0E206D3
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Dec 2019 14:25:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qzczbesx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbfLXOZt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Dec 2019 09:25:49 -0500
Received: from mail-pf1-f176.google.com ([209.85.210.176]:39802 "EHLO
        mail-pf1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfLXOZt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Dec 2019 09:25:49 -0500
Received: by mail-pf1-f176.google.com with SMTP id q10so10833559pfs.6
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Dec 2019 06:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sOKNbL5JHPWo6GRYbpNS+ZbPdg6ct1GzsKVEHmGqwhs=;
        b=qzczbesx+QxO9Ic1TdtgRkGWOslP786jGrL7G/94XaI1CsG3b3tUS7rzmDjYhDxcJA
         YneRcKe/RC7iUcFHHanP4RgpqYRaQIT2u8vPww/TCk7EGBPmuNDoWozsuf9ZK0UmFh4H
         gwhduxN1RaX1F+rq2CY/9tJV6P2lvJgoktvGEBGWMfSGBYl9Z+UQ5yc3G/Jlga8JmT1V
         LMqLoYKfwCEhxen2GGudmsyd5pNqXkSvomOuKCFc2DKLQkMZoyfsebikSNGwq33L5Lsp
         cU1bO3xXLrvur2s5WT4/U+X+QJzmNgYZq59+mYlWlL0RauahcU3OBwQ6bUVlOeTHK3b7
         60yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sOKNbL5JHPWo6GRYbpNS+ZbPdg6ct1GzsKVEHmGqwhs=;
        b=ms6CNQ9ZG0Pu3XW7etAn2jybf95VDFX2hlH+nb183kroSBBNP0KKalK7gwkUoJ/zKN
         YQWFOOduVu07OYmrWFPsWCottzRpCptwqQz6kEgL04/h6YfIwtsYDHA+1BkERchweLZH
         6/jgKBh8I0OA2Dk+AsFmS8JBYjIwfB/lGTOFdfgMv94owmf/lEEQrUOxdGrD4Ec1mTAe
         2yM19xnGI/u5jkC6LrsZbNErxDQ0c8WNWq05D7VHURi7DobABH6TIjR6OH2okTLHJn/S
         1xzAeFKXGTSbjy7oD9YjwPbFIvq6xla7eDRZSfbZLkyk9mKoRl7wgK56fE9eMOemEz8O
         fX6g==
X-Gm-Message-State: APjAAAUE9toNG6BegKJS4e9iF6WDimYrszjBS95LxhgoSFu3+28SoIFq
        5lkoULP1pfT4XU/quIgoDL3mpUTh
X-Google-Smtp-Source: APXvYqyXRlXB19IMl0EPEsKMv/FcgVIJLkUCnYg2z22uMWaRwOJ3NdAZWO3j+mAsFyFX+GUW9ToAEg==
X-Received: by 2002:a62:b418:: with SMTP id h24mr25024259pfn.192.1577197547735;
        Tue, 24 Dec 2019 06:25:47 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 133sm28714697pfy.14.2019.12.24.06.25.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Dec 2019 06:25:46 -0800 (PST)
Subject: Re: kernel 5.4.6 + Ryzen 3700X: "Can't display frequency and others
 of Ryzen7 3700X"
To:     pgnet.dev@gmail.com, linux-hwmon@vger.kernel.org
Cc:     marcel.p.bocu@gmail.com
References: <bb629ef6-a669-8849-17f4-481c8c9f9347@gmail.com>
 <b2f72e65-4a80-0aaf-ce7e-0880fdcf60c7@roeck-us.net>
 <2c858787-1e5e-77e4-30ef-f17036b205c2@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <121bee85-6369-4b32-2504-c1d104ea2bd6@roeck-us.net>
Date:   Tue, 24 Dec 2019 06:25:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <2c858787-1e5e-77e4-30ef-f17036b205c2@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/23/19 9:50 PM, PGNet Dev wrote:
> hi,
> 
> On 12/23/19 9:28 PM, Guenter Roeck wrote:
>> In the specific issue referenced above, it appears that a Nuvoton NCT6796D
>> was detected but not instantiated. Most likely the problem is that the IO address
>> range necessary to access the chip is reserved by the BIOS. Looking into the
>> kernel log would reveal that information. Again, that has nothing to do with
>> support for the CPU installed on the board, but with the board vendor and,
>> to a substantial degree, the lack of support for Linux by that board vendor.
> 
> not sure if this is of note,
> 
>   superiotool --dump
>    superiotool r
>    No Super I/O found
> 

superiotool only reports about chips it knows about. You might want to try
sensors-detect; it will at least tell you about unknown chips.

> I've contacted Asus tech re: BIOS 'gotchas' that might be interfering; I'll pass on your comments.  So far, on other issues, they've been very cooperative/helpful; we'll see how this goes.
> 
> As for the kernel log, anything specific to look for, share here?  Or just grab & post the whole thing somewhere?
> 
You'll probably see a note about an ACPI resource conflict. If the board
with NCT6796D wasn't yours, that may not be the case.

>> If you think something is missing that should be displayed by k10temp,
>> if you have documentation from AMD describing the necessary registers to
>> obtain this information, and if you have permission from AMD to publish
>> it, please feel free to submit a patch adding it to the k10temp driver.
>> Please make sure that the additional information follows the hardware
>> monitoring ABI (specifically, CPU frequencies are not part of that ABI).
> 
> Not entirely sure on the 'should' of it ... yet.
> 
> I _can_ say that, currently, for the 'new' setup, the limited info with 'k10temp' is
> 
> (1) ASUSTeK PRIME X570-PRO mobo + Ryzen7 3700X
> 
> 	sensors
> 		k10temp-pci-00c3
> 		Adapter: PCI adapter
> 		Tdie:         +59.9°C  (high = +70.0°C)
> 		Tctl:         +59.9°C
> 
> 
> and for an older board/cpu, also with 'k10temp', it's
> 
> (2) Asus M3A78-CM with a non-Ryzen, AMD Phenom II
> 
> 	sensors
> 		k10temp-pci-00c3
> 		Adapter: PCI adapter
> 		temp1:        +42.9°C  (high = +70.0°C)
> 		                       (crit = +99.5°C, hyst = +97.5°C)
> 

The register addresses for temperature limit information (if available) have
not been published by AMD for Ryzen CPUs. The same is true for other chip
specific information (voltages and power); my understanding is that AMD makes
that information only available under NDA, which is not suitable for a Linux
driver. Please feel free to contact AMD and convince them to publish the
necessary information.

> 		atk0110-acpi-0

This is very much _not_ k10temp. As the name says, it is the atk0110 ACPI driver
for ASUS boards. Support is very much board specific, and typically depends on
someone disassembling and analyzing the DSDT of a given board.

> 		Adapter: ACPI interface
> 		Vcore Voltage:       1.02 V  (min =  +0.85 V, max =  +1.60 V)
> 		 +3.3 Voltage:       3.23 V  (min =  +2.97 V, max =  +3.63 V)
> 		 +5 Voltage:         4.86 V  (min =  +4.50 V, max =  +5.50 V)
> 		 +12 Voltage:       12.04 V  (min = +10.20 V, max = +13.80 V)
> 		CPU FAN Speed:     2789 RPM  (min =  600 RPM, max = 7200 RPM)
> 		CHASSIS FAN Speed:    0 RPM  (min =  600 RPM, max = 7200 RPM)
> 		POWER FAN Speed:      0 RPM  (min =  600 RPM, max = 7200 RPM)
> 		CPU Temperature:    +44.0°C  (high = +60.0°C, crit = +95.0°C)
> 		MB Temperature:     +34.0°C  (high = +45.0°C, crit = +95.0°C)
> 

