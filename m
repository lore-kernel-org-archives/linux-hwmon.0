Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F39C32771
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Sep 2022 21:09:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbiIZVJ3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Sep 2022 17:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbiIZVJ3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Sep 2022 17:09:29 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E4C49E0CE
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Sep 2022 14:09:28 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id rt12so7466799pjb.1
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Sep 2022 14:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=7hiR0SpuwZReSlXLRcigPQKkR3hTLdfiyP448cVXiFw=;
        b=UJBQZykTPhHzdrrtre+mxfDn7aatmmKTmhDUKtx/UD5YqWSGbNAis4tgmo8DmeJSZv
         XL5fJxmytRdVeDwZ9HhK0uHyLYN+YoM+5t96uHoX9raiqOhfeEp3Hv+Fwt1GMf3IolMS
         FWHsM5rPdOmdno7sBNUIN57XY5Rq/qzK2DyOc3jSdSLk56zb7KyVA21N1pHtuzhb0g9D
         0Hzam8fwYOpQmxyRLDG6jSF4FY7ZBjW5JU4RARl2MYuAOBeq1k3ibI/yEAsjXXZF5a3w
         ffKP1ghdPpsDpwqzu9EQTtxK/o5IB7pXGozTYaBkeLdt01DMx9PMMv/M41jRgbz51RIT
         IJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=7hiR0SpuwZReSlXLRcigPQKkR3hTLdfiyP448cVXiFw=;
        b=LmuUDNw2bL96BMmSTnsL0HEQ8x45ARqyNRJ7HJcBoMD5d2CepSrOhXNzrUijC4zajA
         wxwiRTS2k2qlkStc0rl2cu6g4d7WgEG4TvsDwUOboVG3aKwpVvlgCGVjBajS7aROxVvD
         t4baJRihxNJE7hPLx0/godJLjLtsZrxiYOajMiUzMKDiMJO+BQF3JZmz5eZV7HcJV7Rj
         8D6nGxE2bkbDdkVJeRC8k/PJax+Nuyp+bMZ9TjkDrXmRmENn+j1hmlTUdos25S6gqgE9
         /TdfbtTAHr8NaLxm9rwNH1hkxOkq9N/kCeP+y4O6GXtjtFBNCWgoXSi8CVn6Ern+xhQx
         NZBg==
X-Gm-Message-State: ACrzQf2Q4KQVWnrhsOtqA4kVvE1fyIi6vA7omCG4ISU67Jk1qqpXxvYw
        itG+IXT3QwCj/7kZcMMhi7bWPtg3Rv2zvA==
X-Google-Smtp-Source: AMsMyM6XWAWe+Zn9tyh4ERXFKmtuqTiYVsHZEu4hNEGpIYT0A9opTtsNkUidS6jbXuYJmr0utLcNbw==
X-Received: by 2002:a17:90a:5508:b0:205:783c:7b6a with SMTP id b8-20020a17090a550800b00205783c7b6amr731777pji.218.1664226567748;
        Mon, 26 Sep 2022 14:09:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h13-20020a170902f54d00b00178af82a000sm11646470plf.122.2022.09.26.14.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 14:09:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f995da40-b20a-437b-0b1f-5028b861300d@roeck-us.net>
Date:   Mon, 26 Sep 2022 14:09:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/7] Add HWMON support
Content-Language: en-US
To:     Badal Nilawar <badal.nilawar@intel.com>,
        intel-gfx@lists.freedesktop.org
Cc:     ashutosh.dixit@intel.com, riana.tauro@intel.com,
        anshuman.gupta@intel.com, jon.ewins@intel.com,
        linux-hwmon@vger.kernel.org, dri-devel@lists.freedesktop.org,
        andi.shyti@intel.com, tvrtko.ursulin@intel.com
References: <20220926175211.3473371-1-badal.nilawar@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220926175211.3473371-1-badal.nilawar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/26/22 10:52, Badal Nilawar wrote:
> This series adds the HWMON support for DGFX
> 
> Test-with: 20220919144408.251981-1-riana.tauro@intel.com
> 
> v2:
>    - Reorganized series. Created first patch as infrastructure patch
>      followed by feature patches. (Ashutosh)
>    - Fixed review comments (Jani)
>    - Fixed review comments (Ashutosh)
> 
> v3:
>    - Fixed review comments from Guenter
>    - Exposed energy inferface as standard hwmon interface (Ashutosh)
>    - For power interface added entries for critical power and maintained
>      standard interface for all the entries except
>      power1_max_interval
>    - Extended support for XEHPSDV (Ashutosh)
> 
> v4:
>    - Fixed review comment from Guenter
>    - Cleaned up unused code
> 
> v5:
>    - Fixed review comments (Jani)
> 
> v6:
>    - Fixed review comments (Ashutosh)
>    - Updated date and kernel version in documentation
> 
> v7:
>    - Fixed review comments (Anshuman)
>    - KernelVersion: 6.2, Date: February 2023 in doc (Tvrtko)
> 
> v8: s/hwmon_device_register_with_info/
>        devm_hwmon_device_register_with_info/ (Ashutosh)
> 

Is there some reason for not actually versioning this patch series ?
Just wondering.

Thanks,
Guenter

> Ashutosh Dixit (2):
>    drm/i915/hwmon: Expose card reactive critical power
>    drm/i915/hwmon: Expose power1_max_interval
> 
> Dale B Stimson (4):
>    drm/i915/hwmon: Add HWMON infrastructure
>    drm/i915/hwmon: Power PL1 limit and TDP setting
>    drm/i915/hwmon: Show device level energy usage
>    drm/i915/hwmon: Extend power/energy for XEHPSDV
> 
> Riana Tauro (1):
>    drm/i915/hwmon: Add HWMON current voltage support
> 
>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  75 ++
>   drivers/gpu/drm/i915/Makefile                 |   3 +
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   8 +
>   drivers/gpu/drm/i915/i915_driver.c            |   5 +
>   drivers/gpu/drm/i915/i915_drv.h               |   2 +
>   drivers/gpu/drm/i915/i915_hwmon.c             | 736 ++++++++++++++++++
>   drivers/gpu/drm/i915/i915_hwmon.h             |  20 +
>   drivers/gpu/drm/i915/i915_reg.h               |   6 +
>   drivers/gpu/drm/i915/intel_mchbar_regs.h      |  21 +
>   9 files changed, 876 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>   create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
>   create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h
> 

