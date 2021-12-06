Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF3C3C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Dec 2021 00:37:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241732AbhLFAlD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Dec 2021 19:41:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241666AbhLFAlD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Dec 2021 19:41:03 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67953C061751
        for <linux-hwmon@vger.kernel.org>; Sun,  5 Dec 2021 16:37:35 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id i5-20020a05683033e500b0057a369ac614so11538703otu.10
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Dec 2021 16:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=np4s1nuaKyUdMl2ToIjJIup0qete1o/mPorocqdoQT4=;
        b=jwpLMf1cJoIr3h7a89wTxen9q945XDMCaI0Tsieb//TNvNAzFKNlg5LY82Ss+05Ugh
         EY1ha+XXvglTAyoHnCLCnLo48kUI388MNPGFL2OJlVrn9kYg/qkd1NH2bKRJAH8OtRzy
         aG4roM2YoEnCoinvJ1oD06kclhC78AUxxkCPxtQYv7bKUL8KTYoK7wP2TJmPNMVWIhM/
         AbLZ/Z7whK3lMTbU8UrQQrzd7qww58RNGlM63hg7DZ1qamU9Qr8L9iohIKsIrcXwQMF5
         6BxpjjpnqlQNtf+7u4T/0/weuBOoq5HJlMQYM58v6Nkm/UUm/gFnStFezQ5l3rXAehw8
         FDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=np4s1nuaKyUdMl2ToIjJIup0qete1o/mPorocqdoQT4=;
        b=v+1avGQSMW35u1eNt9SiwrSPLbLrAgrzCbrgMiTgLw2B4TOWdBJRBVuxoD5DHAknEY
         eBa9Wr+cIlnZoN5SC9t1bUh20OcUKi2qeEHQ5z15WvUJVRWVo6wjr8NatnPezJWB9+LC
         Xu9RsE1dVMPTgRuV7xzQQI0VDiAYocc3SuBzLNKafGJMljmR8W4T1LfmgFeCR/JTnrHX
         1DuAMA0eQFGjv6Ru9PM3fQnM79dcF18hHRhGQu5Jyq2MYVcZyfLmwY9xNLTxPvFhaYnE
         GFD2+LJIsnitF3NrwroQQ2ZPPq5VitgK60ecItwBZw0RaXYsQ6a/+5ZSIHmm+jSrbKyj
         eQlQ==
X-Gm-Message-State: AOAM530oWPr3WX/o3J0ibrdlGFHKryGqRAsfySCbkRZvhjy6jDgBeHDC
        snswrRPRP68C682To0pNupOrjhh8jjxQZ6KgtiEoerlaO61wrQ==
X-Google-Smtp-Source: ABdhPJx0bSOeeWhesBs4XfhMT0LHYZ7nSO1feORKIU9x6ejSMPCX1HcTnhB6EhOYLdvowIFCs+Z9j3kCa8RsCx66LO0=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr25852146otl.237.1638751054757;
 Sun, 05 Dec 2021 16:37:34 -0800 (PST)
MIME-Version: 1.0
References: <20211122234141.3356340-1-linus.walleij@linaro.org>
 <20211122234141.3356340-3-linus.walleij@linaro.org> <20211203210206.6b5cxb4i63j5jpv7@earth.universe>
In-Reply-To: <20211203210206.6b5cxb4i63j5jpv7@earth.universe>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Dec 2021 01:37:23 +0100
Message-ID: <CACRpkdZVK+Vsd8e-gFmiSapuxGKxOPkX+1yVj9VrU5ah5ARH2g@mail.gmail.com>
Subject: Re: [PATCH 2/2] power: supply: ab8500: Standardize maintenance charging
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Marcus Cooper <codekipper@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-pm@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Dec 3, 2021 at 10:02 PM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:

> I wonder if this will ever be used by any other driver. Having
> multiple maintanence states seems to be very specific to the
> ab8500 driver stack.

It's actually coming from Samsung and their way of dealing
with their Li-Ion batteries. They even have further charging
states... Like starting the charge with slightly higher current
etc.

> But the code itself looks ok and considering
> this does not expose any (potentially unfixable) userspace ABI
> and improves the AB8500 mess I'm fine with it.

I will rebase this patch before the NTC things and send
it separately so it can be applied. It will better to first merge
the pointer passing change I iterated though, so I'll wait a
bit so we can agree to merge that.
https://lore.kernel.org/linux-pm/20211206000651.4168035-1-linus.walleij@linaro.org/

Yours,
Linus Walleij
