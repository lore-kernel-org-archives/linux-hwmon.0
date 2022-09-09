Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8980ECAAD5
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Sep 2022 16:02:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbiIIQCE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 9 Sep 2022 12:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231882AbiIIQCC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Sep 2022 12:02:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7EE910C9B7
        for <linux-hwmon@vger.kernel.org>; Fri,  9 Sep 2022 09:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662739320;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JzIKFIaWRWcxbAMh+x3p2JYz/XfHbOYJG8GRvz0fIxA=;
        b=NTWxRz7twj5uQTP6zXBQ5Pd+dPpQzdbWKGCfCK74oDUg4J+0EWVcxtrMxrobMMEjE4nF/z
        vUAHi7cRNwtKMm2zYQ+xpm6YPUvBtJ+ChbtzdDayqBiljgB4fnUty8KvSQzlmwjaoZf8xs
        Gh91Gt7KFX2n5KboijMtFVvMVpUbj3c=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-258-LaOyFLVhM82qpV1ftyTxMQ-1; Fri, 09 Sep 2022 12:01:58 -0400
X-MC-Unique: LaOyFLVhM82qpV1ftyTxMQ-1
Received: by mail-ej1-f71.google.com with SMTP id gs35-20020a1709072d2300b00730e14fd76eso1254651ejc.15
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Sep 2022 09:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=JzIKFIaWRWcxbAMh+x3p2JYz/XfHbOYJG8GRvz0fIxA=;
        b=cev5lCf9yBWvk+wCA2bQ6SxWCoXBvNHpX8qYdLRLW1UK7e17f10Gez2SBlbWRGssdO
         Wc+xtLttVBVVBjR7eJPIdCmi1ECoHz4QMwyD8A55IIeaS/tCHaJQTOTwcBqwLUXReroc
         SF42TluSTPUCMtOu/Drhv0allLeZuFYfvorEjq5nSAQ3f9xTOoK9MUWw0W25DRYhDNZa
         spOTLDUmF/FYgPd1qyI8ZnQYXJpHavXQ6vQyv+vvpWZZmkxVMi0UpS2r/9UDzqE2+VR4
         SeLfl5C1cPbFTl+vKP2MgINX0VOq3udEy7tL0yG9vjXhNyQ7/zZ2xaKvnhz2qB3yhvnV
         zzjw==
X-Gm-Message-State: ACgBeo3rc6gg/Fdvjb//ImuOkamWJOzKxP4VNCs1XTKO6N6XXG82W1dN
        7SXW1C+hz4BzObvfc5nmo0c3N+L95r6iikcTkDEAn8PonuUgLpNtN6awlNkRGOegsC9UalwEpIt
        OVbMOe+6rU3leKPy7sNekzgk=
X-Received: by 2002:a05:6402:35d0:b0:44e:ca66:7f8a with SMTP id z16-20020a05640235d000b0044eca667f8amr12136337edc.415.1662739317429;
        Fri, 09 Sep 2022 09:01:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7GLFq7pKw3XJQDbdHwcQgoFZvdvbA7uj6tbUiMm1rns+rHP1WtsaS2gCLCX8kITtS9JPhrMg==
X-Received: by 2002:a05:6402:35d0:b0:44e:ca66:7f8a with SMTP id z16-20020a05640235d000b0044eca667f8amr12136321edc.415.1662739317213;
        Fri, 09 Sep 2022 09:01:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id dk9-20020a0564021d8900b0044ea683d04csm611251edb.14.2022.09.09.09.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 09:01:56 -0700 (PDT)
Message-ID: <557cb295-3f3b-a752-16d0-3337321fd48c@redhat.com>
Date:   Fri, 9 Sep 2022 18:01:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 0/2] platform/x86: toshiba_acpi: HWMON Fan RPM support
Content-Language: en-US
To:     Arvid Norlander <lkml@vorpal.se>,
        platform-driver-x86@vger.kernel.org
Cc:     Azael Avalos <coproscefalo@gmail.com>, linux-hwmon@vger.kernel.org
References: <20220902174018.1720029-1-lkml@vorpal.se>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220902174018.1720029-1-lkml@vorpal.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 9/2/22 19:40, Arvid Norlander wrote:
> Hi,
> 
> Lets hope for third time being the charm!
> 
> Changelog
> =========
> v2: Fixed feedback on usage of HWMON interfaces in patch 2.
> v3: Fixed #ifdef handling in patch 2.
> 
> Fan
> ===
> 
> Currently /sys/bus/acpi/devices/TOS6208:00/fan allows controlling the fan
> by writing 0 (off) or 1 (on at low speed). However when reading I have
> observed values up to 64 (fan at full speed during prime95 stress test).
> 
> Removing the check for "zero or one" shows that on the Z830 at least 64
> levels do indeed seem possible. In fact higher values can be written.
> 
> But anything above ~50 seems to max out the RPM.
> 
> I don't know how to detect the supported range, so I have not created a
> patch for this. Advice is welcome.
> 
> 
> Fan RPM
> =======
> 
> There is a way to read Fan RPM:
> 
> #define HCI_FAN_RPM 0x45
> 
> This one is weird. On windows I have observed the cooling self test program
> (which supposedly verifies that the cooling is working correctly) calling
> this a few different ways. Here is a summary of what I managed to figure
> out:
> 
> HCI_SET, 0x45, 0, 1, 0, 0: This sets the fan to run at max speed, but it
> will not be visible when reading /sys/bus/acpi/devices/TOS6208:00/fan.
> I will refer to this operation as "set-max-fan" below.
> 
> The only way I found to stop it running at max RPM is to use HCI_FAN
> (e.g. 0 > /sys/bus/acpi/devices/TOS6208:00/fan or call the ACPI method
> directly).
> 
> However the get method is more interesting:
> 
> HCI_GET, 0x45, 0, 1, 0, 0 returns: {0x0, 0x45, fan_rpm, 0x1db0, 0x0, 0x0}
> 
> I believe fan_rpm is accurate, without any scaling factors needed:
> * It behaves properly (higher value when fan is louder/faster/higher
>   pitched, 0 when fan is off).
> * It matches the value range reported by HwInfo64 on Windows (which seems
>   to be able to read this, I have not looked into how it does that).
> * Unfortunately there is no tool by Toshiba that exposes the numerical
>   value that I can find (that would have been ideal). Nor is it shown in
>   BIOS. The Windows tools "Toshiba PC Health Monitor" reports everything in
>   percentages. Yes even the temperatures!
> * It is definitely a loud and whiny fan, even by laptop standards, so the
>   high reported RPM range of 3540-7600 RPM could make sense. Though it did
>   seem a bit high.
> * Finally, to be sure, I borrowed a tachometer from work. Yes, the fan
>   really spins that fast. Byt it is only 30 mm, so I guess that makes
>   sense.
> 
> HCI_GET 0x45, 0, 0, 0, 0 returns: {0x0, 0x45, fan_rpm, 0x0, 0x0, 0x0}
> 
> The Windows software does *not* use this variant as far as I have observed.
> It appears to work the same except that it doesn't return 0x1db0 in index 3.
> 
> I'm not sure, but I strongly suspect 0x1db0 could be the max RPM (7600).
> The most I have observed when using "set-max-fan" is 0x1da6 (7590 RPM),
> which is very close. Note that this is significantly more than I can get
> using just HCI_FAN, which seems to max out at 0x17ac (6060 RPM).
> 
> 
> Patches
> =======
> 
> I'm not personally particularly interested in user space control of fan
> speed, plus the fact that there is a way to make the fan go faster than
> the *other* max speed makes me wonder about the safety of running the fan
> at that speed for prolonged periods of time. Thus, I have only added a
> read-only hwmon interface for reading the fan RPM.
> 
> I elected to use the same call that the Windows code does, which fetches
> what I believe is the max RPM. I think it is safer to stay as close as
> possible to that code. However I don't currently make use of this value,
> suggestions for where to use it are welcome.
> 
> Note! I assume that if the FAN RPM call do not result in an error, that
> it is in fact supported. This may not be true. I would welcome testing by
> anyone who owns a Toshiba laptop!
> 
> Best regards,
> Arvid Norlander
> 
> Arvid Norlander (2):
>   platform/x86: toshiba_acpi: Add fan RPM reading (internals)
>   platform/x86: toshiba_acpi: Add fan RPM reading (hwmon interface)

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



