Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1FCC433EF
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Dec 2021 00:34:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhLFAhc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Dec 2021 19:37:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhLFAhc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Dec 2021 19:37:32 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1932C0613F8
        for <linux-hwmon@vger.kernel.org>; Sun,  5 Dec 2021 16:34:04 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id n104-20020a9d2071000000b005799790cf0bso11567366ota.5
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Dec 2021 16:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XONx88F1vof5Ivv3AFiw4orcpR2NGtaO1sOrmAuxGqI=;
        b=oezVON77eKu7Hy/U2MV8oOKvbRFR7FscmCG/QDHP5IAE9i8T1+7q+TsB0AzpE8MwKn
         sgd0qOdVLaQ/QMHN7Nw3ncGaZg6D6zt1RVlJkdYgoEk5XLe7tn+5SXCWL0uyxleY17Yc
         mUtFBknzU+K/DXTj5HlDpeLCfkn9G3xImT/eV+tHBb4VN6PBdKH+jpLnT70BVxECFbP4
         0hmxv06rNWTqFTV5jOOP+BB8a9q5kjjfu62A2l9nHdaa45fAk4l/dE4zAaNhuqYgQM3C
         PpNzo3uIx+rACouAu13oqMLsyFC21pkyS/oXfKEJsbejOplH/6H8Y5faPuvt0+6gnsXs
         Rekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XONx88F1vof5Ivv3AFiw4orcpR2NGtaO1sOrmAuxGqI=;
        b=kMFM2/3snH/vj8rq5EMRaAeZnhUHHAtqn3smWj7QTGgCDBnHwq0gVOhzMTKQnkuc5Y
         W3V0Wnfm577qTMk+QVm7Q/+MUt17oR6vMmygIC2zYV2sdAliqHAfbI0/X19HXTROAAIi
         KjCN1hNadErVNS2mgNk7HwP3M3tj3Myr6wLHo1Nz1XhViWMjP+TcCaOLp7sQQvJv7buL
         EbrVTCftgJx44cJrNcR7oCg7R7CxchC3VNpq+ODZbcOoOgUp5TrdwpkEkWy0NkeGl0BV
         1xLgYIxxiRiAH6N8IrsIGP/fIhLjONrmnTaSFaX8GK/M6NUs0+kNuZ3hKpIXN9J+Oeid
         NslA==
X-Gm-Message-State: AOAM533T8y8ZVqngDFpKqrLyHH1POMA0whsJopkskDB6Jy5agarxkwwl
        77sjTdGwyvr1sCaJoZ1D7YcQ4sS5cNOaKwG9MBBS7w==
X-Google-Smtp-Source: ABdhPJwzlJLsVx7wddOQzUlmqtRgn02Xzyxx+QMMluQX0hDNfyYE9Ic1hw5t0hrTVeWbIcFaE05Gl3kiiTQO8i1LNpg=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr25842381otl.237.1638750844149;
 Sun, 05 Dec 2021 16:34:04 -0800 (PST)
MIME-Version: 1.0
References: <20211122234141.3356340-1-linus.walleij@linaro.org>
 <20211122234141.3356340-2-linus.walleij@linaro.org> <20211203205319.aag27knjeapn5d2v@earth.universe>
In-Reply-To: <20211203205319.aag27knjeapn5d2v@earth.universe>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Dec 2021 01:33:52 +0100
Message-ID: <CACRpkdbwTRriophYCztyh_f2RXaftgv1pLPuWYJ+g6EDoHp4eg@mail.gmail.com>
Subject: Re: [PATCH 1/2] power: supply: ab8500: Standardize NTC battery temp
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Marcus Cooper <codekipper@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-pm@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Dec 3, 2021 at 9:53 PM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:

> This LGTM, but let's wait a bit to synchronize with the work
> happening in the AXP driver.

My thinking as encouraged by Guenther is to try to reuse the hwmon
NTC driver for this so I just sent some patches making it possible
to use the hwmon NTC driver in a pretty stand-alone and compact
manner using software firmware nodes for configuration.

Yours,
Linus Walleij
