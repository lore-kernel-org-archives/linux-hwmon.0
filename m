Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1069C00140
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Aug 2022 10:01:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbiHJKBu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Aug 2022 06:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiHJKBq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Aug 2022 06:01:46 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 955755FAF0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Aug 2022 03:01:45 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id b4so14242657pji.4
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Aug 2022 03:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc;
        bh=pQ7xq1c5LS3WVJ3SFc0OCPtwMnaOoVGBpwbytLweJQk=;
        b=ROPFz5B5gUngALaT+Q67jfY4cSVI4kwr84/ZDOQivjqVGwydi10zaa9z7sxs9rhLF8
         cu89OEtCgO2cIADRKEswph2LFlutbja0oiH8Ycxmxy35bs8i16nPPntabr/HT2IAWhRe
         NVJaLtjmv7EDWY6yt/H0tG0X+LTvuNxYAdn/EPUWiZwBXmTyHWSM+ooSU8xxIb1BkTtT
         Ml19wGhxiD9mTk5lfbbPK4kiyKtarQ3XgrbGF9NqupQrFb8YOCup4DVgsb0yj2g6Kuim
         tev69lQEubjQx6ry+2VTGm2vzWvm3EQvGZpYXJ/KGzaYCYRA6uh2DsFAlBkMzo94+LLD
         vj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc;
        bh=pQ7xq1c5LS3WVJ3SFc0OCPtwMnaOoVGBpwbytLweJQk=;
        b=pzMSNxetBjOGzFz0s3Q01INfYXzTHlYZOujAH2iW5bm3CiNxnFAJkwGLRwgGZss3vH
         +aQ9n7x0BtNhtA3kK/UBfVDeNugG8grssRSFUL4S6n1rtg0kAfrcN2PfA97S1BLDi34O
         mHUVN59y+PxlQ1H0BPP6F9RsO9ZUU+76kLhbNbUVhRX7jKdmSfzsUHaVJqhkbc2cWwub
         xT7ZK7Q9Z0EwrD3sGNTEVKfd4sZKbpZxU1PffxAOMNTKyaeQdE+GU50hqbcU+o5C3anw
         HPqMMpLGAlYUFuG4LeLI57FjvG24GfQrzcNIptmVdDNus9xfBXfGQ5CmcDHffL2xhJZy
         r3pg==
X-Gm-Message-State: ACgBeo0qxwbE6YfEka+Hb7mI0p3A/+o/Gj8sn7P9y5HZCt44TdPSCHfs
        up+iKTVnH3PmzBCk8rg5S0g0MnIQjCY=
X-Google-Smtp-Source: AA6agR5gt0v31YIHq/6YQ8orYgO+nGlLBugYV0poIxDhGGrfYKhW0ggp3bXfALNLxVmqNZy+s6wriA==
X-Received: by 2002:a17:90b:1e11:b0:1f4:ee94:6236 with SMTP id pg17-20020a17090b1e1100b001f4ee946236mr2937351pjb.63.1660125705063;
        Wed, 10 Aug 2022 03:01:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902f54e00b0016db441edd7sm12655093plf.40.2022.08.10.03.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 03:01:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <84bbd5ae-44e7-35de-c190-21bdd9af8aaa@roeck-us.net>
Date:   Wed, 10 Aug 2022 03:01:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH hwmon-next v5 0/3] Add support for EMC2305 Fan Speed
 Controller.
Content-Language: en-US
To:     michaelsh@nvidia.com
Cc:     linux-hwmon@vger.kernel.org, vadimp@nvidia.com
References: <20220802081832.6692-1-michaelsh@nvidia.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220802081832.6692-1-michaelsh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/2/22 01:18, michaelsh@nvidia.com wrote:
> From: Michael Shych <michaelsh@nvidia.com>
> 
> Introduce EMC2305 RPM-based PWM Fan Speed Controller
> The EMC2305 is an SMBus compliant fan controller with up to five
> controlled PWM fan drivers. All fan drivers are
> controlled by a programmable frequency PWM driver and Fan Speed
> Control algorithm that operates as a directly PWM-controlled device.
> 
> The closed-loop Fan Speed Control algorithm (FSC) has the capability to
> detect aging fans and alert the system. It will likewise detect stalled
> or locked fans and trigger an interrupt.
> 
> EMC2305 offers a clock output so that multiple devices may be chained
> and slaved to the same clock source for optimal performance in large
> distributed systems.
> 
> Patch set includes:
> Patch#1 - define platform data for EMC2305 driver.
> Patch#2 - add support for EMC2301/2/3/5 RPM-based PWM Fan Speed Controller.
> Patch#3 - add emc2305.rst into docs.
> 
> Michael Shych (3):
>    platform_data/emc2305: define platform data for EMC2305 driver
>    hwmon: (emc2305) add support for EMC2301/2/3/5 RPM-based PWM Fan Speed
>      Controller.
>    docs: hwmon: add emc2305.rst to docs
> 
>   Documentation/hwmon/emc2305.rst       |  40 +++
>   Documentation/hwmon/index.rst         |   1 +
>   drivers/hwmon/Kconfig                 |  13 +
>   drivers/hwmon/Makefile                |   1 +
>   drivers/hwmon/emc2305.c               | 624 ++++++++++++++++++++++++++++++++++
>   include/linux/platform_data/emc2305.h |  22 ++
>   6 files changed, 701 insertions(+)
>   create mode 100644 Documentation/hwmon/emc2305.rst
>   create mode 100644 drivers/hwmon/emc2305.c
>   create mode 100644 include/linux/platform_data/emc2305.h
> 
Please provide a change log.

Guenter

