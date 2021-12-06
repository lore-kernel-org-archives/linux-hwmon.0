Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5DCC433EF
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Dec 2021 01:04:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234313AbhLFBHk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Dec 2021 20:07:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238934AbhLFAuf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Dec 2021 19:50:35 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC66DC061751
        for <linux-hwmon@vger.kernel.org>; Sun,  5 Dec 2021 16:47:07 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id t23so18527971oiw.3
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Dec 2021 16:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Alqp0Ex+vVZsJHSLYg+fQYSCqtWS3CwwxwUws0QTLr4=;
        b=gfjEkLfRdCQ2YRhxQ5xzZFyWUNjW4a8qnQiLydEV8KHeG106tmETWpK5GiXr+48UDI
         TO8MjqCZL3Z73ppTUGCX6/capZC0ivTwijCyijyY3c6z7QzmRp8QSKa/m5BzQqaJakEN
         avgPf1kE4rugv1oXGz6hVWdw2jFtdDRq93M4u3MH79VFYeJy4cPuD7vFNsxV0lJSIoIo
         PUjaN5TjGaAHH2xCbt8l/u7QnBPE1JGiViPpZ5lQS65qvyzyEQWzTMTEbh/hX7gz4aji
         f0mXWweq4ALAamUhggMNYMQjuuS1qbMDrDBdwSWRrpLDIo8ZLfJl54GICAs5vn0tEc6a
         VCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Alqp0Ex+vVZsJHSLYg+fQYSCqtWS3CwwxwUws0QTLr4=;
        b=6YduDMcPrJEm4KIumnw57CVCjuteaIl5+FzwqYIz4fw4I23jivMqP3PEDfqjc+ck0z
         izxfTSTu8eZI7N9r9LQ2A1gbtF8YXbRZeA2CltGT2wn7m0PTEg7j6R56Pgix/CRPBxq3
         jD2Wfgfbb6ZO6bGuV4rNR6vqCAF14oOYsK+IsI4gZmI56tcIhNySA0XnuIi2HDRpKjtw
         7A1CFtCJ8AiHShMAMlmbUPtWOQF41gPGUllnkAYqWn8n4aLoWgZhwUkrmeo++yqcQn78
         IArTByw5MrgXJ+CUZwjKhmnVk1KxuOa8bIlSa+Z+nDM5A1HHnPOqxh9LGb7TmI24Yj2u
         4+ig==
X-Gm-Message-State: AOAM532V1A/AFoKehjVAXfTwXGWuVoBSbCoLiznlhWvdrZAMcLymbKFc
        JBsZXpswo/VtQI7TGX/4iDjaaFDARNd+1ilyhzJZ8cU5Fgo=
X-Google-Smtp-Source: ABdhPJx1dwImggenfqbxO/tZUJiswuQ1Q5W0juhgLX2/fPkZVGLP5NixfaHF+iJ0AWjmj8UMQQWB8PkiwImMMRmkn7s=
X-Received: by 2002:a54:4791:: with SMTP id o17mr21810264oic.114.1638751626997;
 Sun, 05 Dec 2021 16:47:06 -0800 (PST)
MIME-Version: 1.0
References: <20211205235948.4167075-1-linus.walleij@linaro.org> <cd5cf97d-95ea-081c-2763-b4c0676a729f@roeck-us.net>
In-Reply-To: <cd5cf97d-95ea-081c-2763-b4c0676a729f@roeck-us.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Dec 2021 01:46:55 +0100
Message-ID: <CACRpkdbGFPUMTqHnzj9RRnMQKNg5RU7cJ+CrD5=Rq_xuZMZZqA@mail.gmail.com>
Subject: Re: [PATCH 1/3] hwmon: (ntc_thermistor): Inline OF data lookup in probe()
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Chris Lesiak <chris.lesiak@licor.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Dec 6, 2021 at 1:38 AM Guenter Roeck <linux@roeck-us.net> wrote:
> On 12/5/21 3:59 PM, Linus Walleij wrote:
> > There is no need to allocate the state container and look
> > up DT properties in a separate function if OF is all we
> > support. Inline it into probe().
> >
>
> This is POV. Old fashioned as I am, I still prefer smaller
> functions over large ones. Is there a _technical_ reason
> for this change ?

Mainly the *data state container should be allocated in
probe() but I can keep the rest in a separate (renamed,
moved) function, I can certainly respin it like such, just
a minute!

Yours,
Linus Walleij
