Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEDC7C38A02
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 Oct 2022 13:52:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiJ2Nwp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Oct 2022 09:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiJ2Nwp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Oct 2022 09:52:45 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46D6052087
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Oct 2022 06:52:44 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id d26-20020a05683018fa00b0066ab705617aso4465092otf.13
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Oct 2022 06:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=id7D/RuJa6d2k8qNBkRXUChMakaD+cw5eIuySubAyLk=;
        b=KjBxNJ/IYBgneKWHv+bQ6wYImABMYt7BXfgOyzJe2QFU08NsjfaL/oT21GoBHE9vy0
         I88RZQdvFeDlZUEKvRpZoDVsXrtpbvgwIZGw9RhfhAl/7O+jocECw4/OQcDeoCGZi0hm
         D58T0ThY4FVpwd16TmePf2G/0LCVXeNyW2ciuqW9XaYs/vSTetxONmqTRrONVLvNQvWm
         MNwrV6P9UGiV26pgSLf3j2IRNhdw2eWB4EC6PcO+9gKb50Y2wvr3P+xeI8i6F35+pD2o
         aoA0ykwQeC0FH2GQ+L+BDarh0wIaHQ8t3xmLNErdVPlX+jz54BQyWzAlLPMmQO0YLlHR
         Z++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=id7D/RuJa6d2k8qNBkRXUChMakaD+cw5eIuySubAyLk=;
        b=0nf3mZVEyaN1kEB0aaVUgqqnygT7G+5XptQb1i/V8P2Cl2K0OFYm9hvHnP0NxUAFDT
         9z0K5BBi02UWlEZr6AUgh0O0nW5aJwi9lDUpzTpfWUWnPmOxsDOQs6xl7p33SEEt3Jz4
         M6fqsIkdOaX/VcA10jX2tzzDAq4aHY20VS9M7nlVtCM0JEvIJl1O6aYP33IAsjjjJ0gn
         YQYHLiVAp1xYSLkKne+CvlmBBU5u/oDc5CTu8ij0BHP9M5kiOsHpZ3wEs/Z4OQVxAH3R
         +PHNX7rXnMjmEZoUTPMpqgR0zmVfzpGcHnV3DW4OVOLFxgc3VYVsneBKIRGTGFqLoCyq
         Hy3A==
X-Gm-Message-State: ACrzQf1CPcVhuu/jzOu5Wxju0kjVvatxUk9wWljDGcoBKxOLxtZ6bGwQ
        Z/XglrR7Ce3R8qcVA37GQumeVfzbCfg=
X-Google-Smtp-Source: AMsMyM4nXf976Ct4Zsyg2X2xqEalY1XMkT2rmiv/WvD2Fyna8B3FVP1OSzjEd+vtHyFSNBhcS4SXeQ==
X-Received: by 2002:a05:6830:2a8f:b0:661:b9c8:9a63 with SMTP id s15-20020a0568302a8f00b00661b9c89a63mr2109128otu.210.1667051563590;
        Sat, 29 Oct 2022 06:52:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b5-20020a056870d1c500b0013ae5246449sm696941oac.22.2022.10.29.06.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Oct 2022 06:52:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <532f711c-6566-8a69-a199-4753bd24111e@roeck-us.net>
Date:   Sat, 29 Oct 2022 06:52:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To:     Marc SCHAEFER <schaefer@alphanet.ch>, linux-hwmon@vger.kernel.org
References: <20221029123338.GA11915@alphanet.ch>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: Power measurement wrong when idle
In-Reply-To: <20221029123338.GA11915@alphanet.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/29/22 05:33, Marc SCHAEFER wrote:
> Hello,
> 
> I am using the apu2 embedded platform, which uses an amd64 AMD GX-412TC SOC,
> stepping        : 1
> microcode       : 0x7030105
> 
> With Debian bullseye, the power measurement when idle is very big, and wrong (>
> 80 .. 100 W). We have observed this behaviour on multiple systems.
> 
> The problem did not occur with Debian buster, does not occur with the
> temperature sensor, and the power measurement goes back to apparently correct
> values when the system is no longer idle.
> 
> It does not seem to be linked to amd64 specific firmwares.
> 
> The problem lies in the /sys/class/hwmon/hwmon0/power1_average not in the
> lm-sensors package (direct reading the /sys files gives the same isue).
> 
> So it appears to be within the kernel: 4.19.0-22-amd64 seems ok and
> 5.10.0-18-amd64 is not.
> 
> Funnily, there does not seem to be relevant changes in the specific kernel
> driver (fam15h_power).
> 
> Any idea what could lead to this strange behaviour?
> 

A few, but they are all more or less unlikely.

- Debian might carry some non-upstream driver patches causing the problem
   (or fixing it in the older kernel, and the patch was not applied to the
   new kernel).
- Debian installs its own version of the CPU firmware, and the version
   installed with the newer kernel introduces the problem.
   Normally the BIOS would update the CPU firmware, but that may not be
   the case for older systems.
- The problem is caused by some change in the kernel outside the
   fam15h_power driver. I can not imagine what that might be, but it is
   a possibility.

You should be able to check the first two possibilities. For the last one,
the only means I could think of would be to bisect between the good and
the bad version.

Guenter

> Thank you for any ideas or pointers.
> 
> Examples:
> 
> When bullseye is idle, it's completely wrong (' are from me):
> 
> cat /sys/class/hwmon/hwmon0/power1_average
> 94'019'396
> 
> When bullseye has 100% CPU used (one core):
> cat /sys/class/hwmon/hwmon0/power1_average
> 10'917'309
> 
> The only visible change is that hwmon1 and hwmon0 are interchanged:
> 
> bullseye:
>     fam15h_power-pci-00c4
>     Adapter: PCI adapter
>     power1:       88.61 W  (interval =   0.01 s, crit =   6.00 W)
>     
>     k10temp-pci-00c3
>     Adapter: PCI adapter
>     temp1:        +54.5 C  (high = +70.0 C)
>                            (crit = +105.0 C, h94019396yst = +104.0 C)
>     
> buster:
>     k10temp-pci-00c3
>     Adapter: PCI adapter
>     temp1:        +59.6°C  (high = +70.0°C)
>                            (crit = +105.0°C, hyst = +104.0°C)
>     
>     fam15h_power-pci-00c4
>     Adapter: PCI adapter
>     power1:        8.00 W  (interval =   0.01 s, crit =   6.00 W)
>     

