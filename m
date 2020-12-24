Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53420C433E0
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Dec 2020 00:48:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F39022517
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Dec 2020 00:48:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726288AbgLXAsd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 23 Dec 2020 19:48:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727879AbgLXAsb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Dec 2020 19:48:31 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34637C06179C
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Dec 2020 16:47:51 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id h22so1476200lfu.2
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Dec 2020 16:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WZlCM/s5inoFBHbTeX9ckePSWrLvkhghLazOkiDQ5CU=;
        b=DwvA/04hK5QAZvacRMICfpnh0k7jtuMfOXoMrJbMddb/3hnKk44YJ9ejXlwnLJlRTe
         sDWHO/ctvHYIPewkNbMsdnhz8lyZ54tSXU+Trevd/tczABCgJn4D0eCbu0a7cMrk0O0W
         7AWISEG/QnfeQGVlLf0WV6scNJS/JMPC3r3MhY2fSSBJxTCtjKa6+YyN1LAsDJum+FDZ
         YEJVkS802arqA5gVowPr9XfTgcVrnqeAtZT6Q9CXb+do6H9093nl3/CtQGE8LUru16Ot
         TRGJNLhX6XRH1QgapNOJNgAgVuxHkElfKCV5qeVZresNd36aVajSO/w5vPgI4VOM7xu6
         daUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WZlCM/s5inoFBHbTeX9ckePSWrLvkhghLazOkiDQ5CU=;
        b=bMac+V+0gKzmJv2H3FRf/JEtWgjSdPqP1Vn6kajYjdnxzrEKeaeEwUGVl3xBrSmC+1
         uah9iMMaSJj72YzywMvP8jr/cRtPiq64HVaL9Kz7IjOf4Q2153ZAMZOpYHnuLUCwnjMk
         pmhb60KjCg58Uv1EyHPOeZVw/jFztInanH3m6b6K93WKfrG8ip+Ny4pW7H77Kf/6O7vL
         Bjh3U2HQcUsDGZgFiPMkE2hb7ytR9A5gWhmGgkNC8C0ZZd4Q0PsGS7sqj7BNZ18+LFLn
         /MUgiMDBfufZSixvgu4jSlYjXsuhublrD3i0H9Qs3qvwcslXkzklMQYViuPV4PBAFNV0
         CXIA==
X-Gm-Message-State: AOAM530tDw4S641eqRcuWC86JvhoNuCaGj2JdvC6AM4fWUy2COTRwjfR
        udYVoSKT/S/ti6nX7TzguRRnEf6OX7NmOL5Q0GNsTg==
X-Google-Smtp-Source: ABdhPJynkfaBBPhvDJ29DhdHxZriI3DBy9ij/buMqyGfRKBWSHlt9gDM/HgyikhM8tss7BQ6NJyUwlut6CnzQ/w8JE0=
X-Received: by 2002:a05:6512:3238:: with SMTP id f24mr11574604lfe.29.1608770869693;
 Wed, 23 Dec 2020 16:47:49 -0800 (PST)
MIME-Version: 1.0
References: <20201219224143.686074-1-linus.walleij@linaro.org>
 <6d339a6c-6f8c-4a5e-718b-c90a9fbb8c01@roeck-us.net> <CACRpkdZTVAoDbbJqTJbxv1ZDyAMsB_h9TAdKKbxqBYGp4-b_jg@mail.gmail.com>
 <d990e08f-6f18-836d-89a5-01102a4faa45@roeck-us.net>
In-Reply-To: <d990e08f-6f18-836d-89a5-01102a4faa45@roeck-us.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Dec 2020 01:47:38 +0100
Message-ID: <CACRpkdYJSE_wSf72N=oX+JogdTF-FBSqkeMZghrr1ytmPY8apQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (ntc_thermistor): try reading processed
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>,
        Jonathan Cameron <jic23@cam.ac.uk>,
        linux-iio <linux-iio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Dec 23, 2020 at 10:42 PM Guenter Roeck <linux@roeck-us.net> wrote:

> You don't
> answer the basic question: What should the driver do if the iio
> subsystem only delivers raw values ? I suggested we should just keep
> the current assumption in this case, ie do the fixed conversion,
> and let userspace handle any necessary adjustments. You seem to object.
> With your patch, we get a comment in the driver suggesting that some
> code should be removed. In my opinion, such a comment comment does
> not add any value. Ether we drop the code or we don't, and I dislike
> removing it.
>
> That results in my usual fallback: When in doubt, do nothing.

OK I get it, I'll fix it up along with the confused bug pointed out by
Chris and resend.

Thanks!
Linus Walleij
