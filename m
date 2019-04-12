Return-Path: <SRS0=9bva=SO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62042C10F0E
	for <linux-hwmon@archiver.kernel.org>; Fri, 12 Apr 2019 22:40:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1694A2086D
	for <linux-hwmon@archiver.kernel.org>; Fri, 12 Apr 2019 22:40:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQIwwdjS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbfDLWkq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 12 Apr 2019 18:40:46 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45952 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbfDLWkq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 12 Apr 2019 18:40:46 -0400
Received: by mail-pf1-f193.google.com with SMTP id e24so5779426pfi.12
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Apr 2019 15:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m8rM1h+r/nhReahQCJJL1UuX9wCpeDnKM4MK1tzq3Fs=;
        b=XQIwwdjSM/5N96PNOJiuryd3N2fwxcvKeG7kntZTbqy8PeOybXLwfedCDIoeT1Qkk/
         Zw85QOXBmR58AyUuyLUUAhbrhprDtv6aroJiXAyCHAK0CPhJtjBsUiHS5Ow7iaG+xc+3
         uzBiOLQH+FHIkxksy+VFJ2A/75aoaaVZkOVmWNUgpjWp08zPH9+YaOwwtof7luVBi2zN
         F0LXzKKuUcHSjT6Ogoz9k+wo5PSs+AIkO/symQXAG+9dCh4jK62T/mEbFPKLoQNZ5tIE
         6YGzzddUPQP3IjU+T/M7wHJKiEp5oGtjhnTthSpHCCCfwOow+IrYUfWP6Nx8UxCGdMre
         YNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=m8rM1h+r/nhReahQCJJL1UuX9wCpeDnKM4MK1tzq3Fs=;
        b=Xi+LPX3thTeN/nFMiSBp0bghSQ+sP2qyhK+24NG7sOvjZ8m7c89NLFILj8tZe73Bq/
         gYTWcjAN7EmAMRTRkYVWijn/Ep3Ys0lqpW0Z5gA1PNHCaRvXf3FKoY1Ae7gTl2D6Wu0M
         u5bZmU3DxGlPapSVyQ/OlM3jqQAGmDfaUwB+dLexLhiVp1t+lF2zfk3Jz4GRYZFsI2cV
         w53KzSqDG99Va5Qtuqe4o82byUMjobUxzdGmBKwcs7paeqP/WEuSQ4029EH9LS8in26s
         db6LyM004fboIkhwFbEn3brzU/9oJne4o7hBe3QvZ+Bb+lFtdhRXmfrfW77Pygb9mwg4
         2aig==
X-Gm-Message-State: APjAAAXdfA8kMrDc9R9CTuEYvr7LFOYRr4n3lf3TBLvWfGfTVLUL3mEx
        HJjUjYN58xfiBXidQGQEQ/CQIfmf
X-Google-Smtp-Source: APXvYqxL4Vxcr1zEXKn0FHhWWMPcyRaPPiQoTj/KopxkxWD+LIMt5IDj2XgZ0BlnmeZm+K2QVXYIEg==
X-Received: by 2002:a63:f40d:: with SMTP id g13mr57294359pgi.345.1555108845087;
        Fri, 12 Apr 2019 15:40:45 -0700 (PDT)
Received: from [10.67.49.126] ([192.19.223.250])
        by smtp.googlemail.com with ESMTPSA id x16sm96241354pge.27.2019.04.12.15.40.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Apr 2019 15:40:44 -0700 (PDT)
Subject: Re: Couple of questions on SCMI sensor protocol and Linux
 implementation
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
References: <1902f151-7ddd-6b4b-4135-a2affe20c009@gmail.com>
 <20190412135747.GC23351@e107155-lin>
From:   Florian Fainelli <f.fainelli@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 M5kY0ACeNhCZJvZ5g4C2Lc9fcTHu8jxmEkI=
Message-ID: <44845164-3544-23b7-a9b3-8ebb65fc88a8@gmail.com>
Date:   Fri, 12 Apr 2019 15:40:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190412135747.GC23351@e107155-lin>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/12/19 6:57 AM, Sudeep Holla wrote:
> On Tue, Apr 02, 2019 at 08:22:58PM -0700, Florian Fainelli wrote:
>> Hi Sudeep,
>>
>> There are a couple of things on which I would appreciate your feedback
>> regarding the Linux SCMI sensor protocol:
>>
>> 1) The Linux SCMI implementation has all the nuts and bolts to allow
>> configuring trip points, but the hwmon subsystem through the use of
>> hwmon_thermal_add_sensor() API does not actually make use of that
>> capability. Would it be a big stretch to use the hwmon_ops::write
>> function to get to support that feature?
> 
> As a concept, it sounds good. Though I am not sure if write API semantics
> match with what we want here with trip point configuration.
> 
>> The other thing that puzzles me
>> is that there does not appear to be provision in the SCMI sensor
>> protocol to describe thermal zones, so I assume that people still have
>> to provide supplemental data through Device Tree for
>> devm_thermal_zone_of_sensor_register() to pick up the thermal zones
>> definitions?
>>
> 
> Yes, I tend to agree. When SCMI v1.0 was designed we were not sure if
> we can incorporate thermal zones into the specification without losing
> the flexibility that vendors have today with DT. If you think we should
> update the specification for this, can you send me brief summary so that
> the discussion on the specification side can be kicked off.

For now, I am fine with the supplemental data in Device Tree to
advertise thermal zones and that seems to work nicely. I will reply to
Guenter's comment though.

> 
>> 2) Support for regulators through SCMI
>>
>> I work with a device where the regulators can only be controlled via a
>> dedicated piece of HW which is accessible through SCMI from the Linux
>> side. Do you think there is value in coming up with a scmi-regulator.c
>> driver that makes use of the sensor protocol for discovering and
>> reporting regulators or would that be something that belongs more to the
>> power domain protocol?
>>
> 
> Controlling regulators directly from OSPM/Linux via SCMI was intentionally
> not added to the specification. One of the issues SCMI wanted to address
> is clockscrew[1] kind of security attacks exploiting direct regulator control.

So that is also precisely why we did that architecture where there is an
indirection layer through the SCMI provider. In our case we have a PMIC
device that is controllable only through a dedicated processor which we
consider trusted in the system. That processor can be made aware of
specific board level details such as, which PMIC rail controls the power
of which peripheral.

The main use case here is really that when you enter system standby into
a deep sleep you may want to leave some of those regulators on such
that, say: Wake-on-LAN/WLAN can take the system out of suspend.
Traditionally these regulators were controlled over GPIOs, but now they
are controlled by the isolated PMIC. This is the background for this
question essentially.

Thanks!
-- 
Florian
