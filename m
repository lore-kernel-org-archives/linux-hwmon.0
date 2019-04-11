Return-Path: <SRS0=Is7H=SN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42FAC282CE
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 13:39:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AECC6217F4
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 13:39:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqwQGyfu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfDKNjP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 Apr 2019 09:39:15 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46602 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbfDKNjO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Apr 2019 09:39:14 -0400
Received: by mail-pl1-f195.google.com with SMTP id y6so3415327pll.13
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Apr 2019 06:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gzAhCyJ3nFIGf+rKb7nfXWPyRXuJtSv5DhoKs6h1OUM=;
        b=RqwQGyfuEWB6D/0V8nX09KagSWHZyaYMfhT8DQ5CVVfV0nh9wcrbbqaituqIefCo8U
         Wz4oLB1JgWpfg35pPkmOLsNmNT7C3NjgicwNh/a2oRvG6KrzXmBLzeU8982JP6DWF8nR
         wqW3WgS0dxL8GkJEwZDBLzyDe2S/ev535KmernSg2dl7ZQ+3sdJmv1aQb3UqDNi4TNpj
         yMlue24iabZiXkMxx/fQ6zygO6U91v7xVfYx5ZGRuslM+qwsc2jRbhEbnJz2U2D2wjcG
         ixQud9GgmT7xdqOUUiikGbwxhPt2VQzPYtS10cN6GHEWk7/mAUbvnQ7x/W8G4i10aeVP
         /n5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gzAhCyJ3nFIGf+rKb7nfXWPyRXuJtSv5DhoKs6h1OUM=;
        b=OBIoN2qHvvgoxhgm265XkotgRGm/JF1JCRAXYsvGstl/2gFaQ84AUGQ/prVFIbu3vp
         PR9ky2+U+g2NRQu7MV8tU9wo6N1TTnP31eegvfqjY8/pVGZpjfaRMPdF3e2gwKSOaEM4
         ld9yk3vdW1S1QySvC/yTiGOlbfRYoOLtwaudnlh+webewAmYMo0tvmW7ddH1ivNiBeT2
         2/Z3rT1VUjlq+tqRMQqfUnEljipkp5ylKDtNpsiTcXTdWvWPwiKPtxH374JnBwuZhvOq
         eMVDRJNr2lZ29DNblrwPhf3GsXRm9QrDpT281hJP8IdLE7tYiYAUuOY8vrwMJO2EwN7x
         EWpA==
X-Gm-Message-State: APjAAAVKX5I60RgTg0eG5P76iZ3IA/VqrJ3rtCFzszA0lkjdRuMC81hQ
        kg53nkPVu/ffTux/ayGrRUA=
X-Google-Smtp-Source: APXvYqzXelQ+PSEgssqtVMkJjvNyUt3oJoBQ7QD7VYfA1uqtO4TepArCww39NC9/35ZTo+kEoxEOdw==
X-Received: by 2002:a17:902:3381:: with SMTP id b1mr50565344plc.5.1554989953603;
        Thu, 11 Apr 2019 06:39:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p189sm57622453pfg.184.2019.04.11.06.39.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Apr 2019 06:39:12 -0700 (PDT)
Subject: Re: [PATCH 3/3] pmbus: export coefficients via sysfs
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
References: <cover.1554934898.git.krzysztof.adamski@nokia.com>
 <8087920a011662114ca151d4e04186c121a9a737.1554934898.git.krzysztof.adamski@nokia.com>
 <6366cab6-8db2-9d22-a43b-7df0377f75fb@roeck-us.net>
 <20190411074547.GA28466@localhost.localdomain>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <09ebb2f5-a34b-0733-aa14-cd963519d702@roeck-us.net>
Date:   Thu, 11 Apr 2019 06:39:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411074547.GA28466@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/11/19 12:45 AM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
> On Wed, Apr 10, 2019 at 05:30:08PM -0700, Guenter Roeck wrote:
>> On 4/10/19 3:39 PM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
>>> In order to get best accuracy, in case of some devices it is required to
>>> tweak coefficient values. This is especially true for devices using
>>> some external shunt resistor or being operated in non-usual environment.
>>> Those values may be measured during device production and stored as
>>> calibration values in some place (like EEPROM or even a file).
>>>
>>> To support wide range of possible use cases, lets export those to
>>> user space via sysfs attributes so that it can implement its own
>>> policies about them. All those attributes are put into separate
>>> attribute_group struct so that we can set its name to group all of them
>>> in a "coefficients" subdirectory in sysfs.
>>>
>>
>> Coefficients are hardcoded into the chip, and the hwmon ABI reports raw
>> values. Any correction should be done using sensors3.conf.
> 
> I'm not sure what you mean by the fact they are hardcoded into chip. I
> am targeting a case where direct values are being converted to real
> world values using coefficients by pmbus_reg2data_direct() function. My
> understanding is that the reason why the devices does not report values
> in real world units but requires using coefficients for calculation is to
> ease the calibration. For example the LM5064[1] has a chapter called
> "determining telemetry coefficients empirically with linear fit" which
> describes how to calculate them, based on the sense resistor used. Some
> drivers, like adm1275.c, have a custom way to indirectly influence the
> coefficients values by using Devicetree ("shunt-resistor-micro-ohms")
> but this is not really flexible nor general approach. In case of
> adm1275, only "m" coefficient is adjusted this way. Depending on "m"
> value, "R" might require adjustments as well and we also need "b" to
> achieve best accuracy. Then, again, using Device Tree is not suitable
> for per device calibration.
> 
'
Why not ? You'll have to explain that one. It is not as if coefficients
would change on the fly. They are chip and/or board properties.

> My argument here is that the kernel does not return raw value in this
> case - it returns (supposedly) real-world values that are calculated
> internally based of coefficients according to the formula specified by
> pmbus specification. In my opinion it would make sense to provide it
> with proper coeffs if defaults are not suitable. Otherwise reporting
> "real-values" doesn't make much sense. In other words, our
> implementation would currently report real-world values if your case
> happens to match default coeffs for some shunt resistor and
> environment specified in datasheet of the device.
> 

This is why I dislike making exceptions. It always creates a bad precedence.
hwmon devices are supposed to report raw values, to be converted to real
values using the configuration file.

We can discuss scaling and possible ABI enhancements, but it will have
to be generic. b/m/r is not generic. You also don't make the case why
those values would have to be runtime-adjustable.

Note that there are several issues with the patch itself: There is no
validation, the names are questionable ("p" ?), the scope is questionable
(if an adjustment is needed, it would likely have to be per sensor, not
per group), and the attributes are created unconditionally even if the
chip does not report values in direct mode, just to name a few.

However, that is all irrelevant: At this point I'll resist further chip
specific changes in that area. If we move from reporting raw values
towards reporting adjusted values, the solution will have to be generic
and must not be chip specific.

Thanks,
Guenter
