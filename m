Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99375C04A95
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 17:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbiIYRrp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 13:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbiIYRrp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 13:47:45 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6218D23BCF
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 10:47:44 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id v4so4662501pgi.10
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 10:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=qlGEkg21yJRhnJRtWNk8swsIUglxKiU2gBJBwfxa9IM=;
        b=IrGlNb1R6ttqs9SPGPcgXK8IlEVkCKFu7G5rn86eKOqoncoq6CQHmBi5UHhBW7Z03z
         bS9qgZvMgHVxOhf93nghflT2uLbjaQ00IZgYloMRCmnSRI29xut12elgAjQCkwk4Bowx
         Xp46V0Z2TqWNgRzf5TLK41hshUuJ56N4ldfKBtBdPGD6mlzgABjZOkziBtZHLuEp04iI
         R6ornoVPtf1PK36rScV722exoGzPt3N8UvZYiv6GZk9RHIN8aESeLkdWRmpci9PhtewM
         UV9wgaYWW57kCsScir5eJq7VT3SWxaDNF+U8uBFgd1NWuwCdBVWmb7+tljZdTbZqyFAs
         mZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=qlGEkg21yJRhnJRtWNk8swsIUglxKiU2gBJBwfxa9IM=;
        b=BJW5nR6ePq7vRu0Lq9bhg59OreHdo0FGuKFGWftdajCBXxPjPjHMG3f37WtQvgA3HL
         YAHRbVp8sIZdUH7YSFbCEFqcKNLEPcJs3hGttw8oRJLg9w4CMkrxUp2QlPsp+4VokKHI
         SD3XTbBxJPO2SwgPyG0a8JAy1tLH9YeIPO7W1o8JT8zu11dvOIBIbZY7ApgkShLJQTET
         BJWpwxtTTTS7KaKu5DVe3x7uWaSzu7zfr3usZxMuuZMctHZfj5SOXJ0oVkGqDyVlPFg4
         5ltjti1x83bE8GjhAlWrEpUbymmnWiyYNdF+OcO26SniPHXP9vo4oBaG/UTbAOWfL7M7
         Q4OA==
X-Gm-Message-State: ACrzQf3WQZvD5lC2dbfoUBDelM8Lf+ood6dUOEhH4IS10JZbBzcCYyzY
        QCQCDqEMhrfFpSIaM6Gqv3E=
X-Google-Smtp-Source: AMsMyM6uwc24dwcDnZj6+lFgxQFsnV6cYuvgfEd0b35p9DEqZHlgnI/Y0bYhPrhEytDfzRr9gti0yQ==
X-Received: by 2002:a63:3d82:0:b0:43b:d646:1bb5 with SMTP id k124-20020a633d82000000b0043bd6461bb5mr16332161pga.620.1664128063884;
        Sun, 25 Sep 2022 10:47:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s5-20020a170902ea0500b0017829a3df46sm9577366plg.204.2022.09.25.10.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Sep 2022 10:47:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8933ef26-200a-635a-af43-00af8202540a@roeck-us.net>
Date:   Sun, 25 Sep 2022 10:47:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 00/18] hwmon: Move to new PM macros reducing driver
 complexity
Content-Language: en-US
To:     Jonathan Cameron <jic23@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Hans de Goede <hdegoede@redhat.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
        Roland Stigge <stigge@antcom.de>,
        =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>,
        Ninad Malwade <nmalwade@nvidia.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20220925172759.3573439-1-jic23@kernel.org>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220925172759.3573439-1-jic23@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/25/22 10:27, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> Recently a solution was added to avoiding the need to either guard
> pm functions with #ifdef magic, or mark the __maybe_unused.
> https://lore.kernel.org/all/20220107181723.54392-1-paul@crapouillou.net/
> 
> This series switches hwmon over to the new macros that are intended to replace
> SIMPLE_DEV_PM_OPS and similar.
> 
> There are a few drivers in hwmon that might be able fine using
> DEFINE_SIMPLE_PM_OPS() but currently do not define as many of the
> callbacks as that macro does. As such I haven't touched them in this set.
> 
> This is part of general effort to get rid of examples of the older macros
> that might get copied in new drivers.

Series applied to hwmon-next.

Thanks,
Guenter
