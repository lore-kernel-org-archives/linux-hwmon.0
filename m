Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A46C433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 10 Oct 2021 03:27:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6D4A60EE4
	for <linux-hwmon@archiver.kernel.org>; Sun, 10 Oct 2021 03:27:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhJJD3M (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 9 Oct 2021 23:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhJJD3K (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 9 Oct 2021 23:29:10 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C27C061570
        for <linux-hwmon@vger.kernel.org>; Sat,  9 Oct 2021 20:27:11 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id j5so57260923lfg.8
        for <linux-hwmon@vger.kernel.org>; Sat, 09 Oct 2021 20:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/EhOtGkof34MroXZl3kc78gCn2HP9vUs7fx4bJ4VLTE=;
        b=SCoxo7inefadR+lZ3WcKj7jCMSukZG/iwKTAYicGl3dce5yKP0jllTCnngu29QSvn8
         66rOpWOddcosDkLiUoIJF5J9LbK4v7XXHxcsQGbIcm8hClmtGr2G69LU8CVVAE4ZDzZC
         2+vD9aD7E0QKXOjW7yXSYOgO7gjbdDf2mGoS/GWhl6ZBcVIPhzBWUreTbgUZp67OnjfO
         PpxtorD9nysw7ELF0cmvpAdARRtTsxYp/fl/oTgLey/Mll+9cETdVeQFjN74HZHgHbls
         6ZdfUyJF7sda4DFBPoLt8ZBLm8TSJ5snXfaD3sV1nJgoycy3aukWNtxrtaPpHbAkABn0
         ooGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/EhOtGkof34MroXZl3kc78gCn2HP9vUs7fx4bJ4VLTE=;
        b=jX/tQY6av7u+bMZ8TucllVxpMZkx1qqDZIRiSPSaMsJJjnM1qd2gm4EQ0nfOjaQkU9
         s7q3Gln6KcofLDlRVqgJY+wNiIJt+5mHdyN1nonN8t1eC2WrtDaUm7Ev8ULaGHPxF46u
         DBLR0gN3G02U6VSMrLudLp+GOVXc8l0XSPSffol/tfZqkp0NR+xKmxI+LrOfckiYoJGn
         WJqtg0qJCYtUDipiAXFBuXcXGVkmb2D+CjrvajmKz9iCX7Q6lqz7jGZ+ndfcQ6oRN0+3
         6Q0gLc2cswrHKxkcWuW0j0zrYY/rrB0/cKKa59SMnFh/TB7i48MYcW9uURDp9Hi+GvvA
         vwdQ==
X-Gm-Message-State: AOAM533Ed971Su7so8o9Imr2WXiOr1MBrIkhGxDcoRaFfOXlWI3RSPRz
        Lv5PxgI+h57SGPQghMesgsCEPJS+KGlpVnCjkcN6QNEO6vQ=
X-Google-Smtp-Source: ABdhPJzFxzrYlMnOq8h2iuZd8IgdG+WqSZk/RddRGV8MON6EABWDUhL9VXlz4OOOMUSA2DizQEkAYdConh3Yg3Hrd04=
X-Received: by 2002:a05:6512:2253:: with SMTP id i19mr19067459lfu.480.1633836429731;
 Sat, 09 Oct 2021 20:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211009185257.2230013-1-osk@google.com> <20211009185257.2230013-2-osk@google.com>
 <638924f2-4323-16d8-5a8b-2afd2b1872d6@roeck-us.net>
In-Reply-To: <638924f2-4323-16d8-5a8b-2afd2b1872d6@roeck-us.net>
From:   Oskar Senft <osk@google.com>
Date:   Sat, 9 Oct 2021 23:26:53 -0400
Message-ID: <CABoTLcS5NJ50Hykizfh842TjZGcT=d0wxMm2-jO4i6wmoDK9Kg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] hwmon: (nct7802) Make temperature/voltage sensors configurable
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter

Thanks again for the review!

> > +     bool found_channel_config = false;
>
> now unused, as 0-day points out.
Argh, I'm so sorry. I don't understand why building this for OpenBMC
didn't flag that up. I thought building with warnings as errors was
now the default? But obviously not :-/

> > +     /* Enable local temperature sensor by default */
> > +     mode_val |= MODE_LTD_EN;
> > +     mode_mask |= MODE_LTD_EN;
> > +
>
> Either make it = and drop the initialization above, or better
> initialize the variables with MODE_LTD_EN right away.
Oh yeah, makes sense. Will do in V6.

Thanks
Oskar.
