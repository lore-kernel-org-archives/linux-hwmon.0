Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426D4C19F2D
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Aug 2022 22:24:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbiHIWYI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Aug 2022 18:24:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiHIWYI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Aug 2022 18:24:08 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF725D0C0
        for <linux-hwmon@vger.kernel.org>; Tue,  9 Aug 2022 15:24:06 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id f28so12060925pfk.1
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Aug 2022 15:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=R8mxJ32ZAlbkS0Y1wysevWnDZ5/o5cvROPexUh1gSwM=;
        b=LWExsbYPFx+b1mW6MqtQE0wg27HLVAyUGLLNH4hrTGAUOrIvRD3mqTFenPD11n5v2s
         Oy3mE/kjhThYhG6TWzU//xBqGknvo6HQlwJZzZXumviZ2LPAOWPwV/UorYLiD2adzPmm
         Kdl2w5J09/3ewxUixwxTdDLk2L44f9DLe5DcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=R8mxJ32ZAlbkS0Y1wysevWnDZ5/o5cvROPexUh1gSwM=;
        b=QAhezqgH6tLJe9kbvHIvwvKBH+h/VuSU/wndBVd0WxIQ4VlNjaB3Qirrd9q7I2ljXz
         kYlVBcTMle06WYRjrRJIKq9PPhRtc/CIKkuulaJoBA/l1XhbmOrfx2gf3lGIcvP6ALHP
         JtEmDI7V3N5x8GLOIdGa20aVH0z2l+qNiNF/G1L8mSDtGRmM9EL8c3EeWsJowU/6iu/i
         mTRj0hA2RtLSpn6bBT4q7a3QMsSu0JJeXhwL5oowGYucZSvbJTGP2hicPEmbF9tA6IVV
         WM4Spdm8QxcsbmevJY+sAE73lvemaunuH9pyOoV8rgZTyWdBovvz35vIy2Ctf6NWs7Y9
         /C/Q==
X-Gm-Message-State: ACgBeo1Xs3DwUh1QOX2M0e0JGdPycC+JvI/F4o2MInGsr/BjC3MnmjyU
        9suqzHO44Grf1SY++P0Ft+mNMw==
X-Google-Smtp-Source: AA6agR7SbevTC5Y48pp8A9xZb6cpqho/B0EqI2yyzNQAtEThNhuUcjF/sYHDrSLIctM83mbgxPMS8A==
X-Received: by 2002:a63:88c8:0:b0:41d:260c:ea29 with SMTP id l191-20020a6388c8000000b0041d260cea29mr15372038pgd.284.1660083846452;
        Tue, 09 Aug 2022 15:24:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a5-20020a62d405000000b0052ab42ea0c5sm393592pfh.147.2022.08.09.15.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 15:24:05 -0700 (PDT)
Date:   Tue, 9 Aug 2022 15:24:04 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Ingo Molnar <mingo@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] hwmon: (lm90) Fix error return value from detect function
Message-ID: <202208091519.254D27B08E@keescook>
References: <20220808101504.1933123-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220808101504.1933123-1-linux@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Aug 08, 2022 at 03:15:04AM -0700, Guenter Roeck wrote:
> lm90_detect_nuvoton() is supposed to return NULL if it can not detect
> a chip, or a pointer to the chip name if it does. Under some circumstances
> it returns an error pointer instead. Some versions of gcc interpret an
> ERR_PTR as region of size 0 and generate an error message.
> 
>   In function ‘__fortify_strlen’,
>       inlined from ‘strlcpy’ at ./include/linux/fortify-string.h:159:10,
>       inlined from ‘lm90_detect’ at drivers/hwmon/lm90.c:2550:2:
>   ./include/linux/fortify-string.h:50:33: error:
>       ‘__builtin_strlen’ reading 1 or more bytes from a region of size 0
>      50 | #define __underlying_strlen     __builtin_strlen
>         |                                 ^
>   ./include/linux/fortify-string.h:141:24: note:
>       in expansion of macro ‘__underlying_strlen’
>     141 |                 return __underlying_strlen(p);
>         |                        ^~~~~~~~~~~~~~~~~~~
> 
> Returning NULL instead of ERR_PTR() fixes the problem.
> 
> Fixes: c7cebce984a2 ("hwmon: (lm90) Rework detect function")
> Reported-by: Ingo Molnar <mingo@kernel.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> It is interesting that some versions of gcc interpret an ERR_PTR this way.
> It did find a real bug, though the error message is quite confusing.
> Would it be possible to enhance the fortify functions to detect a constant
> ERR_PTR at compile time ? I think that might be quite useful.

Yeah, that should be possible. I suspect something like this might work:

	BUILD_BUG_ON(__builtin_constant_p(src) && IS_ERR_VALUE(src));
	BUILD_BUG_ON(__builtin_constant_p(dst) && IS_ERR_VALUE(dst));

Though I'm not sure how it'd play with GCC value range checker.

-- 
Kees Cook
