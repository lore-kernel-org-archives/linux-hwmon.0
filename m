Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4DAEB64DA
	for <linux-hwmon@archiver.kernel.org>; Sun,  2 Jul 2023 17:01:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjGBRBG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 2 Jul 2023 13:01:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjGBRBF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Jul 2023 13:01:05 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0241B137
        for <linux-hwmon@vger.kernel.org>; Sun,  2 Jul 2023 10:01:04 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b7e66ff65fso29114605ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Jul 2023 10:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688317263; x=1690909263;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vo6JqYzer6YMHYnQy4AOuTOsFREB8UbCLknF0fQHznI=;
        b=Dx8yyR10m4Mb0zvzRm16aK+cMt+LZ+eRyjjl9NP3O1vuW1+c9UWQ/qjcegRiRYHivQ
         CSVN9XvRD/+j5ujZ53dUMWNm+ArbCcRK6rRxT2IkQhtOHiWDjeYjKYj6vpNuQym11lhn
         chspIgbQbVWnd44GlUorzri4yYvgRfj4WCc8lsnuxdv+TBDlsKn4j+PLRlMsYr1VxrKl
         1i4V7CQ1wVI7+3bKEXbiNgTPcetDD+Xrr4GSwQYjmQRQQj2D+hvAuvhQ6OKX4uEN2y9m
         +owA+3Je/YJu7cYv6CaQBZOALZkk1NnRtTT7DWMx4suFKo/seFHuAFa0c1SxKvZPf/qm
         +zGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688317263; x=1690909263;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vo6JqYzer6YMHYnQy4AOuTOsFREB8UbCLknF0fQHznI=;
        b=V1S2KPGYqxbjMplV0zWRwEwunTWDn7+3Isid+rOh8c4DNaSJp5qQRAHNNr6yRMxsvg
         zbXad/s0yXK9nw67SHKeVW+cwvCVA054QzX4m30CauxO+tfZVBAyrVbeS14+bNfVAO5I
         8WQt43d+2SRhU+tgj3QbPoOBvrIl4UhMZl5DENi5oHE35/RsTZmxSYtPFsOZJc4ng7yO
         ZTvuL4GRPabKZ7TmKCVw9F4X9faO17omz1aXGadrS8spQP90AHQJMIOPVCOe0NnokqLV
         ut3623KbZSL2y6SCT0cWs8qMFQax/U6lcUQN7yhZ3l8NlGTjFleUIIm9aJZGm7EJw4DU
         PwKg==
X-Gm-Message-State: ABy/qLbOhPfDPyFS1ygSYXafx3sy5sd86Tpe4x4/A97KhdMGPEDHXkk2
        g0a6sQACBLdaptAEn96fE8o=
X-Google-Smtp-Source: APBJJlEs1YryeFeeIzjRHUr9QcS/+iudWWT0YrpC6Zp3bWTXXlUwjgQJtZoRYFSrLYGXi9t4af1e+Q==
X-Received: by 2002:a17:903:228e:b0:1b0:6038:2982 with SMTP id b14-20020a170903228e00b001b060382982mr10322651plh.41.1688317263233;
        Sun, 02 Jul 2023 10:01:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m3-20020a170902db0300b001b872695c1csm4093008plx.256.2023.07.02.10.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 10:01:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d571bfca-9156-7280-a5eb-783c431500c3@roeck-us.net>
Date:   Sun, 2 Jul 2023 10:01:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To:     "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc:     Badal Nilawar <badal.nilawar@intel.com>,
        intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <87ilb385fv.wl-ashutosh.dixit@intel.com>
 <5aa93c3a-a4c5-9ca3-6ecd-38cef9f59605@roeck-us.net>
 <874jmme276.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 0/6] Add HWMON support for DGFX
In-Reply-To: <874jmme276.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/2/23 08:57, Dixit, Ashutosh wrote:
> On Sat, 01 Jul 2023 20:02:51 -0700, Guenter Roeck wrote:
>>
>> On 7/1/23 18:31, Dixit, Ashutosh wrote:
>>> On Tue, 27 Jun 2023 11:30:37 -0700, Badal Nilawar wrote:
>>>>
>>>
>>> Hi Badal,
>>>
>>>> This series adds the hwmon support on xe driver for DGFX
>>>
>>> Needs some discussion but I have a general comment on this series
>>> first. The implementation here follow what was done for i915. But how
>>> "hwmon attributes are defined" I think we should look at how this was done
>>> in other drm drivers, namely amdgpu and radeon. Look here (search for
>>> "hwmon_attributes"):
>>>
>>> drivers/gpu/drm/amd/pm/amdgpu_pm.c, and
>>> drivers/gpu/drm/radeon/radeon_pm.c
>>>
>>> Here the hwmon attribute definition is very similar to how general sysfs
>>> attributes are defined (they will just appear in hwmon directories) and
>>> does not carry baggage of the hwmon infrastructure (what i915 has). So my
>>> preference is to shift to this amd/radeon way for xe.
>>>
>>
>> You mean your preference is to use a deprecated hardware monitoring
>> registration function and to explicitly violate the following statement
>> from Documentation/hwmon/hwmon-kernel-api.rst ?
>>
>>    All other hardware monitoring device registration functions are deprecated
>>    and must not be used in new drivers.
> 
> I missed that, but since we also have this in ddaefa209c4a ("hwmon: Make
> chip parameter for with_info API mandatory"), yes that is what it would
> boil down to.
> 

The chip parameter covers all standard hwmon sysfs attributes. A hwmon driver
without standard sysfs attributes is not a hwmon driver. It abuses the hwmon
subsystem and its API/ABI. If I catch such a driver, I'll NACK it. If I find
one in the kernel, I will do my best to get it removed.

>> That is quite interesting. Please elaborate and explain your rationale.
> 
> Basically, like those other drm drivers, the chip parameter is of no use to
> us (or at least we'd be totally fine not using it), hence the desire to
> skip it.
> 
> But we are still required to use what we don't need? Do you care about
> drivers outside drivers/hwmon?
> 

I would suggest to read the hwmon API more closely to understand it. Your claim
that "the chip parameter is of no use to us" is simply wrong, as should be obvious
when you read this submission. Actually, if you would convert the other
drm drivers to use it, it would reduce the size of the hwmon specific code
in those drivers, typically by 20-40%. Given that, I must admit that I am quite
baffled by your claim. Maybe you could explain that in more detail.

Of course, I care about use of the hardware monitoring subsystem
outside drivers/hwmon. Unlike other maintainers, I let people register drivers
from outside that directory, but that doesn't mean that I don't care.

FWIW, you are close to convincing me to add a warning message to the kernel
to tell users of deprecated hwmon APIs that the API is deprecated.
Alternatively, I may stop permitting new hwmon drivers outside drivers/hwmon.

Guenter

> Thanks.
> --
> Ashutosh

