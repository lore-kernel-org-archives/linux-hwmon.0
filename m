Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDED6C00140
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Aug 2022 13:20:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231896AbiHJNUk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Aug 2022 09:20:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232526AbiHJNUb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Aug 2022 09:20:31 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21FF3F06
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Aug 2022 06:20:31 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id t22-20020a17090a449600b001f617f2bf3eso3527574pjg.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Aug 2022 06:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc;
        bh=yQoH2xSdhxwpt3z5IOrQzPp1AHQKzsKjMk6TkjBzhzc=;
        b=OxIDs3UXRdp9P5XwqSlm5ypXP/H1lowZoXiWwDmVVIXry1zqS29/zhx14JOSpM0IZa
         NlfV9Wr00gDyTjX5Q8yKUp5WIAe37qOgn3/PQEyehADxZHFhrMnHG1nZNly9uvh5o3kU
         MykMsv51giKjSgO0Lzc2erNzKtmV47KXx72UDlTEH3q8LuZuwKYzOh7TPosuYgARcq9n
         Kpo3zcR9OdDsj1bbPQ6oa3RFSDB/HIL0/VjKBHj8nkMlmggIdWQFew6k+rkABv3e79oP
         dgjjLCpTDxA4V1cI6ecY+2BUfcUN85W5JVZpEkIQ7HN7M0/UvMDRq8kRftoJSdSNjAE2
         vtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc;
        bh=yQoH2xSdhxwpt3z5IOrQzPp1AHQKzsKjMk6TkjBzhzc=;
        b=MCKZkKXRvudlWivbt1xCr/ZqrZtIfho3scAnST/CjzbR4WkX3xNAUksbNeN7dhp9YA
         xUwmO4/LVP6QfqM5tuQqzkx9zZGEJT4mYwdZ3MyNyrupKSAuLQEF1xkooTbgqPykG+Bt
         pggqhfEzUVZwLvWzj8mFj+64eV8UM/yXmJ6vMJn/IEL+LZFK69iqON3ZNH7c5sh/RPCR
         iefWTbfrdv/slivixBnASiXwPFMDg9iAYKCAFm8U96CCuuiOEzMWlooGy6wtkkuBY8vK
         V3Qxb9iY72XpV54gpcQhkH8yU6/Wjj3oSKgRVqnJ7qi3kYzvy0x6YejnbbjAxUDWJO8H
         JdyQ==
X-Gm-Message-State: ACgBeo0PjnH9ud+YvLjvWSj3e2HF7q3S3uY60v5OsCJf9ARGX1YSm/qW
        HvU2OobDEO3LMC9mxzSkVcp7hC94zqY=
X-Google-Smtp-Source: AA6agR67M0hk9ikS14F7H2W8B1qWzLrgyaiNYez5hwmnQJOQCJAL5IloYrx7hIQnuzovrzOy/he9kA==
X-Received: by 2002:a17:90b:3889:b0:1f5:88cd:350d with SMTP id mu9-20020a17090b388900b001f588cd350dmr3776080pjb.9.1660137630666;
        Wed, 10 Aug 2022 06:20:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c11-20020a170903234b00b0016c2cdea409sm12892488plh.280.2022.08.10.06.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 06:20:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 10 Aug 2022 06:20:28 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Kees Cook <keescook@chromium.org>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Ingo Molnar <mingo@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] hwmon: (lm90) Fix error return value from detect function
Message-ID: <20220810132028.GA274220@roeck-us.net>
References: <20220808101504.1933123-1-linux@roeck-us.net>
 <202208091519.254D27B08E@keescook>
 <202208091537.BE8C15A@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202208091537.BE8C15A@keescook>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Aug 09, 2022 at 03:39:59PM -0700, Kees Cook wrote:
> On Tue, Aug 09, 2022 at 03:24:04PM -0700, Kees Cook wrote:
> > On Mon, Aug 08, 2022 at 03:15:04AM -0700, Guenter Roeck wrote:
> > > lm90_detect_nuvoton() is supposed to return NULL if it can not detect
> > > a chip, or a pointer to the chip name if it does. Under some circumstances
> > > it returns an error pointer instead. Some versions of gcc interpret an
> > > ERR_PTR as region of size 0 and generate an error message.
> > > 
> > >   In function ‘__fortify_strlen’,
> > >       inlined from ‘strlcpy’ at ./include/linux/fortify-string.h:159:10,
> > >       inlined from ‘lm90_detect’ at drivers/hwmon/lm90.c:2550:2:
> > >   ./include/linux/fortify-string.h:50:33: error:
> > >       ‘__builtin_strlen’ reading 1 or more bytes from a region of size 0
> > >      50 | #define __underlying_strlen     __builtin_strlen
> > >         |                                 ^
> > >   ./include/linux/fortify-string.h:141:24: note:
> > >       in expansion of macro ‘__underlying_strlen’
> > >     141 |                 return __underlying_strlen(p);
> > >         |                        ^~~~~~~~~~~~~~~~~~~
> > > 
> > > Returning NULL instead of ERR_PTR() fixes the problem.
> > > 
> > > Fixes: c7cebce984a2 ("hwmon: (lm90) Rework detect function")
> > > Reported-by: Ingo Molnar <mingo@kernel.org>
> > > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > > Cc: Kees Cook <keescook@chromium.org>
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> 
> > > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > > ---
> > > It is interesting that some versions of gcc interpret an ERR_PTR this way.
> > > It did find a real bug, though the error message is quite confusing.
> > > Would it be possible to enhance the fortify functions to detect a constant
> > > ERR_PTR at compile time ? I think that might be quite useful.
> > 
> > Yeah, that should be possible. I suspect something like this might work:
> > 
> > 	BUILD_BUG_ON(__builtin_constant_p(src) && IS_ERR_VALUE(src));
> > 	BUILD_BUG_ON(__builtin_constant_p(dst) && IS_ERR_VALUE(dst));
> > 
> > Though I'm not sure how it'd play with GCC value range checker.
> 
> Yeah, looks like this doesn't work. These are all only able to check for
> a single value. The GCC diagnostics depend on its internal value range
> checking. This tripped because of the (sometimes buggy) "void * cast of
> a literal value is always a NULL pointer dereference, so its size must
> always be zero" which we've had to repeatedly work around. In this case,
> it was a real error, though. :P
> 
Guess it would have been too easy. I wonder if it might be able to come up
with a coccinelle script to find such issues. Anyway, thanks for trying and
for the review.

Guenter
