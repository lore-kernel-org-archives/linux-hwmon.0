Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CDFFC433F5
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Feb 2022 21:05:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354918AbiBEVFY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Feb 2022 16:05:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236132AbiBEVFX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Feb 2022 16:05:23 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57240C061353
        for <linux-hwmon@vger.kernel.org>; Sat,  5 Feb 2022 13:05:21 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id j23so20920968edp.5
        for <linux-hwmon@vger.kernel.org>; Sat, 05 Feb 2022 13:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=osQxiiA0R2MqWQXGJlO/x06Co5FIWjCUMTFVjL80WpI=;
        b=Zw5wd+whcsKym7igI+EFaNdVgyCK7HB7MyI32VrA1eCY3x0AseJ21HNpp96FRic+n1
         GXgnGbkAL/98uj0VIHFHrjzYD+hDGbwr52R4hiXSZHFsa5u0zMvgHyG644B/oCWdF51g
         oinwZkmn8UkY69Y+NOKYIqpPzVNwOHdWc/7YGJkaO+nYyoZ3tc2x0t0hiZXtiYcPGnPH
         kjVgDVguCTRP+CVihydhzbQNDx+rG/+U+lstvMulWwqW+XKLJIqn9YU7spdfy5NP2kCX
         END6bLyRE96DiUn7u1cLOfG+iVYKXpjTK8cke0Nmc3dbmrqImziqycNXUf1YgxdaUc9k
         CSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=osQxiiA0R2MqWQXGJlO/x06Co5FIWjCUMTFVjL80WpI=;
        b=UCO+LaV9piAG+Iyku/1AbYMxsclnxBNLSStB2iQO4PwLBfo25HDxcRLFG9itVRAzVt
         Jnz7nu5mhyYhypzXhebnjJsCPozq7wZ/XjS7qKhhhXC7T4JtmuXEnJCcVU2Oz5HQVXIK
         UcX9YMFkfyZvHph1fjgruMugrd8CbrWQgYA2MnoQSNhAwRrXVo7KQfF6TKFOeeSYL5AR
         jQIN7emELzN2vp+ejxdgdXtBLjuPPlm/HcmaExK9yzq7A5jLqfq474Ioi9sGzS5KJgcy
         Y7SBP8uWBz2GNYYSZAmXz259Zh+XtQTU8NCM+fWaa6bL+/z9ndsJSVEu6MisfIlgJnBs
         0W7w==
X-Gm-Message-State: AOAM531ymOGZ6ZCwLnB8CVN6+TjccobVHkq9jtjI/9b5Oib9qUZgu7sF
        CrQYeHdLpEWCl1ffd7TeLQs=
X-Google-Smtp-Source: ABdhPJypcVwpEzqQytONh6PdJB+fCYk7BO9TvjuOYF4Qn25vyKuLuXL5cO5Ips/LzyMk+T9tt3yLqg==
X-Received: by 2002:a05:6402:2789:: with SMTP id b9mr6108089ede.308.1644095119695;
        Sat, 05 Feb 2022 13:05:19 -0800 (PST)
Received: from debian64.daheim (p5b0d706d.dip0.t-ipconnect.de. [91.13.112.109])
        by smtp.gmail.com with ESMTPSA id dn22sm2764567edb.80.2022.02.05.13.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Feb 2022 13:05:19 -0800 (PST)
Received: from localhost.daheim ([127.0.0.1])
        by debian64.daheim with esmtp (Exim 4.95)
        (envelope-from <chunkeey@gmail.com>)
        id 1nGRIT-003UPS-Gc;
        Sat, 05 Feb 2022 22:05:18 +0100
Message-ID: <5d5f6937-b09e-b5e3-d0bb-33713f39832c@gmail.com>
Date:   Sat, 5 Feb 2022 22:05:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v1] hwmon: (tc654) Add thermal_cooling device support
Content-Language: de-DE
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
References: <20220203212853.238739-1-chunkeey@gmail.com>
 <20220205182302.GA3079303@roeck-us.net>
From:   Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <20220205182302.GA3079303@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 05/02/2022 19:23, Guenter Roeck wrote:
> On Thu, Feb 03, 2022 at 10:28:53PM +0100, Christian Lamparter wrote:
>> Adds thermal_cooling device support to the tc654/tc655
>> driver. This make it possible to integrate it into a
>> device-tree supported thermal-zone node as a
>> cooling device.
>>
>> I have been using this patch as part of the Netgear WNDR4700
>> Centria NAS Router support within OpenWrt since 2016.
>>
>> Note: Driver uses imply THERMAL. The driver previously worked fine with
>> just the hwmon interface. Now, if CONFIG_THERMAL is not selected, the
>> devm_thermal_of_cooling_device_register() will be a
>> "return ERR_PTR(-ENODEV)" stub.
> 
> What good does this do ? THERMAL is bool, so it is either there
> or it isn't, and the IS_ENABLED() in the code handles that.
> 
> According to Kconfig language, "imply THERMAL" means that
> THERMAL could be n, m, or y if SENSORS_TC654=y. THERMAL=m would,
> if it were supported, be clearly wrong in that case.
> 
> Prior to commit 554b3529fe018 ("thermal/drivers/core: Remove the
> module Kconfig's option"), THERMAL was tristate, and you would have
> needed something like "depends on THERMAL || THERMAL=n". This
> is, however, no longer needed.
> 
> Given this, I really don't understand what the imply is expected
> to do. The above text does not explain that. Please either drop
> the imply or provide a better explanation why it is needed.

Oh, okay. Yes, you are right. A lot happend since 2016, I have to admit,
I was updating the driver code, but haven't kept track with the THERMAL
change.

So, I'm planning to address your comments in the following way:
	- Drop imply THERMAL (no replacement)
	- add __maybe_unused to the new functions+struct
	  In the !THERMAL case, compilers will spot the static declarations.
	  If you prefer, I could instead add a #ifdef CONFIG_THERMAL [...] #endif
	  around the new cooling functions and the tc654_fan_cool_ops struct.

	- Changed in tc654_probe() that IS_ENABLED(CONFIG_THERMAL) to
					IS_BUILTIN(CONFIG_THERMAL)

Thanks again for the pointer :).

Cheers,
Christian
