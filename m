Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F561EB64D9
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Jul 2023 02:37:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbjGCChP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 2 Jul 2023 22:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjGCChO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Jul 2023 22:37:14 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31E19D
        for <linux-hwmon@vger.kernel.org>; Sun,  2 Jul 2023 19:37:13 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6b74e2d8c98so3417628a34.2
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Jul 2023 19:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688351833; x=1690943833;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pDiG+CPbhtFJghCNWRmO2+RA3sajkkk6Da/IYBHKlec=;
        b=Zuh/p2B6VeBCCPeLtFH1lmRL2LI8gk3RZW+24QRpp/5RTSKcsMTVf7sFgEyHn53y7/
         xOaRNmexVatysb1UMJBGbZgshe4jPJFCihWzSsL2GAyC/XLA5dp+EySydVBUWRs4piT2
         95ZEnEhsntcFUG5iTF+wNau4f3kgeQvIaKU1Gua95kTIZ7VN8y0Cu1slCGGK8TwPkUVX
         E/7R7bsQZRMl7r6B0vb0uAm7Y7vWsP7bdWx19GqGpkn/uo7aAN9XQ49ikgZeOId/hwCK
         6Ymvgi0UoBepXjLm/dQenYscpz0iy74NmhPdzvzyrgF6ZTDiJOqPAE/V9wAMmb4e49gv
         7lYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688351833; x=1690943833;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pDiG+CPbhtFJghCNWRmO2+RA3sajkkk6Da/IYBHKlec=;
        b=N1K5omU3rrVBHJsigkjQIMjdpHGvq8ltzHZ+nwiicyeduFAWRH+gJC9E3eh/wFAIH7
         WfK2iH3AR/g5a3VJFNfgzffWuzwi20gY07+T6MmmO2FfBCOdQeZiLWwv74OCgsj7TVYv
         8wVsn96BSv8bZXYg2lY1zbswY35ekNDpZq98ZBimILFMI/CKxYCMZ703Lm9QoMsd9DA2
         d7L3Cd+2IelkNLqgeToJ/XjfS+vqHujGUBusKXxckGkr1VUvDD3Xocpca+JcuUJ762fr
         Y1hlCr9BUU2Icl+UpuIVh8YoeoxN4UdDVF794jHw5A5YFR7iBE/vfJzi2fJEzWcA2Xof
         DboA==
X-Gm-Message-State: AC+VfDzKdis809P87HPQBVnX8m9M1BxaKNwTVleg66R+vjJBNCC144ID
        x0xRN+7EeT1jvm44gk0z8EHWE27ufFQ=
X-Google-Smtp-Source: ACHHUZ44L6R7+SNVvscbxcPfCQgULnZFcVMDXA58+YY/Jd/auHQYMeb4RHAbZe/1fZSeiVaNY/LIRg==
X-Received: by 2002:a05:6830:1d54:b0:6b8:9a3a:ea12 with SMTP id p20-20020a0568301d5400b006b89a3aea12mr8814916oth.12.1688351833199;
        Sun, 02 Jul 2023 19:37:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 18-20020a17090a001200b002610468d738sm15563939pja.19.2023.07.02.19.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 19:37:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <83220aa1-5456-fcd4-a4c4-17e5c54f148b@roeck-us.net>
Date:   Sun, 2 Jul 2023 19:37:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc:     Badal Nilawar <badal.nilawar@intel.com>,
        intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <87ilb385fv.wl-ashutosh.dixit@intel.com>
 <5aa93c3a-a4c5-9ca3-6ecd-38cef9f59605@roeck-us.net>
 <874jmme276.wl-ashutosh.dixit@intel.com>
 <d571bfca-9156-7280-a5eb-783c431500c3@roeck-us.net>
 <873526dpl3.wl-ashutosh.dixit@intel.com>
 <4b71ba43-4cbb-0840-a46a-3fe4518254d0@roeck-us.net>
 <871qhpepej.wl-ashutosh.dixit@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 0/6] Add HWMON support for DGFX
In-Reply-To: <871qhpepej.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/2/23 18:48, Dixit, Ashutosh wrote:
> On Sun, 02 Jul 2023 13:51:40 -0700, Guenter Roeck wrote:
>>
>> On 7/2/23 13:29, Dixit, Ashutosh wrote:
>>
>>> Of course people might have been abusing the deprecated API's (or NULL chip
>>> parameter) but to me it seems there is also some legitimate use for them.
>>>
>>
>> You still neglect to explain what you think that legitimate use would be.
> 
> To me "drivers/gpu/drm/amd/pm/amdgpu_pm.c" is a legitimate use case which
> doesn't use chip_info (both standard and custom hwmon attributes are
> defined without using chip_info). "drivers/gpu/drm/i915/i915_hwmon.c" has

In new code, standard hwmon attributes MUST be defined using chip_info.
Declaring the use of a deprecated API as "legitimate use case" and use it
as example for new code is never appropriate.

> all this extra code related to chip_info/channel_info which is not
> needed. i915 could well move to the amdgpu model and that would reduce i915

Yes, and the proposed i915 code _doesn't_ have all the extra code that would
otherwise be needed to generate and read/write sysfs attributes directly.

> code. That is what I was originally proposing for this new patch series.
> 

This is wrong. Using chip_info _always_ reduces code size for standard
hwmon attributes, because the code can concentrate on reading and
writing values from/to the chip and doesn't have to bother with sysfs
attribute handling. Convert drivers/gpu/drm/amd/pm/amdgpu_pm.c to use
the with_info API and you'll see.

Guenter

