Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E1FC19F2D
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Aug 2022 22:40:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbiHIWkD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Aug 2022 18:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiHIWkD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Aug 2022 18:40:03 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF3062AE20
        for <linux-hwmon@vger.kernel.org>; Tue,  9 Aug 2022 15:40:01 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id h28so12053010pfq.11
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Aug 2022 15:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yZnR6fK6RhP0TMT3Q1yn4ybsSW3ccjcibBB3cDk3pEk=;
        b=n+FqxKsBKcaMGHBTGROfdPo5QPh2yc4XD0tQkAJ14iXQANXY6lXPjhlgctmz+M4GJO
         YpHKUL/XUPVNsHB3WMTM2YrNGjK2RnJVGSGlNK7Ewv3dxQd771FOldTLKIy5Aoa62D3Z
         LNI1Er2MH4LAyJqgCisbgPrajQ0vv0lWlTtKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yZnR6fK6RhP0TMT3Q1yn4ybsSW3ccjcibBB3cDk3pEk=;
        b=LzLh9msb1DNvBpC9CoIpetpGDuMeoJM999UvUrWtmVtXNRnt9VYS/bA95D9JnoN4oo
         /CnZG0Y83uza9hZFl/1ucWkrv7+RyEuHZllqBtLFzc4bPDt54+Kt7YVFWCU2F9gzbIFD
         xBXrFLQH7XIRSiZBqNgX6I8tHwlKN03KgG8zf1+p/8i+pgqWC6In8m9r1rcVYaPMxuO9
         KyhV+rXf6OaJvIrI4GSu2bIGhMQMPXm/QIR+ROm8M0Hd/FxzWZEVsJL+r1hRIjzo1duo
         iGR7bStrgZGpeALh8aNc/K4F9Bltv+wTDv8ttBlyEJMLlqml8awQ4cIhqQHyzZnytsZH
         oCdw==
X-Gm-Message-State: ACgBeo1diG0e8BAPjYAULM2avilJ9ei7HhqswUSkpB6bMNnvAMizoWg0
        L0etvjY1XCUu/uFsF1+Vd+zo5Q==
X-Google-Smtp-Source: AA6agR6doZdpPZgwvjGdTqqhPT6slqfauix47nBvjGNA9aOgkasaqNf5rA0UZ8brZJpcFLsqBB4AMQ==
X-Received: by 2002:a63:5148:0:b0:41d:6628:80a3 with SMTP id r8-20020a635148000000b0041d662880a3mr10634094pgl.359.1660084801432;
        Tue, 09 Aug 2022 15:40:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y20-20020a170902e19400b0016edd557412sm11185903pla.201.2022.08.09.15.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 15:40:00 -0700 (PDT)
Date:   Tue, 9 Aug 2022 15:39:59 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Ingo Molnar <mingo@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] hwmon: (lm90) Fix error return value from detect function
Message-ID: <202208091537.BE8C15A@keescook>
References: <20220808101504.1933123-1-linux@roeck-us.net>
 <202208091519.254D27B08E@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202208091519.254D27B08E@keescook>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Aug 09, 2022 at 03:24:04PM -0700, Kees Cook wrote:
> On Mon, Aug 08, 2022 at 03:15:04AM -0700, Guenter Roeck wrote:
> > lm90_detect_nuvoton() is supposed to return NULL if it can not detect
> > a chip, or a pointer to the chip name if it does. Under some circumstances
> > it returns an error pointer instead. Some versions of gcc interpret an
> > ERR_PTR as region of size 0 and generate an error message.
> > 
> >   In function ‘__fortify_strlen’,
> >       inlined from ‘strlcpy’ at ./include/linux/fortify-string.h:159:10,
> >       inlined from ‘lm90_detect’ at drivers/hwmon/lm90.c:2550:2:
> >   ./include/linux/fortify-string.h:50:33: error:
> >       ‘__builtin_strlen’ reading 1 or more bytes from a region of size 0
> >      50 | #define __underlying_strlen     __builtin_strlen
> >         |                                 ^
> >   ./include/linux/fortify-string.h:141:24: note:
> >       in expansion of macro ‘__underlying_strlen’
> >     141 |                 return __underlying_strlen(p);
> >         |                        ^~~~~~~~~~~~~~~~~~~
> > 
> > Returning NULL instead of ERR_PTR() fixes the problem.
> > 
> > Fixes: c7cebce984a2 ("hwmon: (lm90) Rework detect function")
> > Reported-by: Ingo Molnar <mingo@kernel.org>
> > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > Cc: Kees Cook <keescook@chromium.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> > It is interesting that some versions of gcc interpret an ERR_PTR this way.
> > It did find a real bug, though the error message is quite confusing.
> > Would it be possible to enhance the fortify functions to detect a constant
> > ERR_PTR at compile time ? I think that might be quite useful.
> 
> Yeah, that should be possible. I suspect something like this might work:
> 
> 	BUILD_BUG_ON(__builtin_constant_p(src) && IS_ERR_VALUE(src));
> 	BUILD_BUG_ON(__builtin_constant_p(dst) && IS_ERR_VALUE(dst));
> 
> Though I'm not sure how it'd play with GCC value range checker.

Yeah, looks like this doesn't work. These are all only able to check for
a single value. The GCC diagnostics depend on its internal value range
checking. This tripped because of the (sometimes buggy) "void * cast of
a literal value is always a NULL pointer dereference, so its size must
always be zero" which we've had to repeatedly work around. In this case,
it was a real error, though. :P

I'm hoping we can teach future GCC "treat literal casts in range
$foo-$bar to be NULL derefs", and we can hand it the ERR_PTR range.

-Kees

-- 
Kees Cook
