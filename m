Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5E3C4338F
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 18:38:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4E426103C
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 18:38:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbhG1SiP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 14:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbhG1SiO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 14:38:14 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C07C2C061757;
        Wed, 28 Jul 2021 11:38:12 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id x3so3212688qkl.6;
        Wed, 28 Jul 2021 11:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7HRR7nhKUjk1JfK8VR0mwUf9DVteb2WniFYn+45+48M=;
        b=gIRG56Doy9daa8RP1c9wPiexRBDJDv7oYWuM+dnUxfQ8l0OJcVao4Tn+J/8dID0bRr
         Pg+ooL0ZYVjvHnG53UNuyPMnZ9YuNC4DplYRRsiVF1Y6uE3qIASRew0KhpSiGZfzWcCS
         L2FDySP+H5bdWkYe259YCZ/IEpNsnhHBZXJo2NEMOGkmIAObpSWvr/01JCkrg3V4/ZR2
         F1CmGWkImus02CHNe8kVvIEc3SOl5zM1QCfBFe6rKy3xbcUPYNXocSETZpmZdiqgBFBG
         2v0w+A0Vx+MMOXAeKMUkW4Tiy2FPehsBAhDe6kQIAhOlJuiOlPE99nRClxrNXcQG0e6T
         MvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7HRR7nhKUjk1JfK8VR0mwUf9DVteb2WniFYn+45+48M=;
        b=pdRvNBsAeFC3inhyYowfgfq4SDZnastGUwF52DL5yWmT3wRMqQCuvG54JX60V7+CGO
         2D3uMAVP+FxaG+UM3GuPQCq/k6kAbSwDEkawjPmETEb2CE5l1evIciQ2nKw2N12VaUG8
         Pe/CCevDOpVNWpl5skjOmnjbzZJUNVPOB6TmYGzY3baVHOSITzU2gr1fLfjAqpiJyslY
         oFJ4Up51TadPlJ8N99DzTiSl0YPyIBlu2+YRFl/WqZewajVNW/HCQTOesiRwdkNBT72h
         pcQIf3RtidKhM/Hcz7yyt45Razf+y22KpBfYATbNq63KHIzKS7+JK5q6mk24e9e68bss
         xOhg==
X-Gm-Message-State: AOAM531+lktNKMuyEYcLEpMWCKhGgJeSq8WNWgUciQdd6Lbk+kJH2QBK
        4q0Kzzsngw+6tc3RmCOle7L/zxNzAbw=
X-Google-Smtp-Source: ABdhPJyeGp9zFGNGuG15haKUOmltTo6z51BXkKBw4Xn5fHK1oTk2Bd9FrEcnq7SvKgdZhXnwW73HXA==
X-Received: by 2002:a05:620a:20c7:: with SMTP id f7mr1104066qka.186.1627497491944;
        Wed, 28 Jul 2021 11:38:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a16sm377852qkn.107.2021.07.28.11.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 11:38:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [RFC PATCH 0/6] AXI FAN new features and improvements
To:     "Sa, Nuno" <Nuno.Sa@analog.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>
References: <20210708120111.519444-1-nuno.sa@analog.com>
 <PH0PR03MB6366CDE5F062E14F7A8E943F99E99@PH0PR03MB6366.namprd03.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <bcb1160d-adba-53e3-11d9-f93aac1e9137@roeck-us.net>
Date:   Wed, 28 Jul 2021 11:38:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <PH0PR03MB6366CDE5F062E14F7A8E943F99E99@PH0PR03MB6366.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 7/27/21 1:42 AM, Sa, Nuno wrote:
> 
> Hi Guenter,
> 
>> From: Nuno Sá <nuno.sa@analog.com>
>> Sent: Thursday, July 8, 2021 2:01 PM
>> To: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org
>> Cc: Guenter Roeck <linux@roeck-us.net>; Rob Herring
>> <robh+dt@kernel.org>; Jean Delvare <jdelvare@suse.com>
>> Subject: [RFC PATCH 0/6] AXI FAN new features and improvements
>>
>> This series adds some new features to the axi-fan-control driver. On
>> top
>> of that, the HW had some changes (basically it now starts automatically
>> out of reset) so that the driver needed some minor refactoring. The
>> reason I'm sending this as RFC, is mainly because of the last patch
>> ("hwmon: axi-fan-control: support temperature vs pwm points"). The
>> core
>> has some predefined values which define a temperature vs pwm
>> curve [1].
>> It also exposes registers so that users can change it according to their
>> needs. As I could not find standard attributes in the subsystem, I'm
>> proposing some "raw" sysfs files. Looking at [2], the pwm_auto_point
>> stuff looked to be what I want. Obviously I might be wrong :). If this
>> is accepted, I will add a proper sysfs DOC file describing the new files
>> (being lazy in the RFC).
>>
>> For patch 5 ("hwmon: axi-fan-control: clear the fan fault irq at
>> startup"),
>> it's also arguable if we really need it. The main reason I have it is
>> because of some userland apps that might take some drastic measures
>> by
>> just reading 1 fan_fault alarm. Obviously, we can argue that the
>> problem
>> is in the app and not in the driver. Though it's such a minimal change
>> that I decided to include it (I'm more than fine in dropping the patch).
>>
>> [1]: https://wiki.analog.com/resources/fpga/docs/axi_fan_control
>> [2]:
>> https://urldefense.com/v3/__https://www.kernel.org/doc/Documen
>> tation/hwmon/sysfs-
>> interface__;!!A3Ni8CS0y2Y!uwjpaOT8QEBVfKTCWELJNbjJJ69iR7S3tKS
>> WV4B0K742CtcARkTtAqMxknnpPw$
>>
>> Nuno Sá (6):
>>    hwmon: axi-fan-control: make sure the clock is enabled
>>    hwmon: axi-fan-control: add tacho devicetree properties
>>    dt-bindings: axi-fan-control: add tacho properties
>>    hwmon: axi-fan-control: handle irqs in natural order
>>    hwmon: axi-fan-control: clear the fan fault irq at startup
>>    hwmon: axi-fan-control: support temperature vs pwm points
>>
> 
> The HW guy is willing to change how the core works. This means,
> that all that unstable pwm - rpm points will go away and we will
> have a register where we can set the minimum fan speed for
> evaluating the FAN. He also said that the default value for the
> this setting will be pretty low so that we should only have _real_
> faults at startup which means patch 5 should not be needed
> anymore...
> 
> Anyways, I will send a new pull with patches 1,3 and 5 and

That kind of contradicts what you say above, that patch 5 won't be
needed anymore. Am I missing something ?

> as soon as I have some HW ready to test, I will send the other
> patches. With the new mechanism, we can also simplify the IRQ
> handling [1]...
> 
> For the new devicetree property, I think now it really is a fan
> property which makes me wonder if the property will be accepted
> in the controller bindings or if I need to send a fan.yaml...
> 
Not really sure myself. At he very least we'll have sysfs properties,
so the minimum speed could also be updated from userspace. Ultimately
we'll need some set of devicetree properties, not only for fans but
for pretty much everything supported by hwmon, but I have no idea what
is acceptable and what isn't - if I did I might have proposed something
by now.

Guenter
