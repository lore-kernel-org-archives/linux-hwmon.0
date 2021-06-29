Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58400C11F65
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Jun 2021 01:29:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AC5C61C23
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Jun 2021 01:29:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232043AbhF2Bb1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 28 Jun 2021 21:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbhF2Bb1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Jun 2021 21:31:27 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8DD5C061574;
        Mon, 28 Jun 2021 18:28:59 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id y76so13992119iof.6;
        Mon, 28 Jun 2021 18:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eGSrkYjz6KZvm/9Y2KAlsXPb86aTA3QM0VjXbjVlWOs=;
        b=KKrF0Oo9RmG5dHpXaMz3ILVTJJVQvlG6Wy37Kwv1VwBWTCgh6/IEBGSYjGKHXIxtK+
         P0OpWh613vL19bsqGWEw4G634hFrvfp+Bo6xTLQ2KsZCOGRLBw8gC1NWVviYsdcG0PeU
         bh8XDStrboNS3Ux0LbAWc9l++LiJjVfxrz9VnVfpNM2HYafEAqShf6ICRzdAt+Fvk/tP
         bF1FrqhpNk+YvNjrwQKpwPbYb3hdoESrBqeLkhm+GVwaG+QzChKq3rRgDM2UBJApZxg8
         HaFHzCZx7H4qDbKNKND6/+jFCMZBLrZnG4bldIQ4i69jNNgfO1T3Vo0Rrp0/palWjb2s
         HhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eGSrkYjz6KZvm/9Y2KAlsXPb86aTA3QM0VjXbjVlWOs=;
        b=rcGajlyiHOJvYCZScXw4czTw3Xpgl/oM5hto75d4+2cYjYhWWeerMx0NmjLKcHn5S3
         KVoMBmt5aNho9VGYDYO8CZH3ebykqi25eoC86gnhYCDTC1tWFg6OCkIXuEUFa3PDf9zw
         FdzNvneebSL3uudAwPEnEL+ZFPnPdh21z63jhHnaDjhzbl5eK/ZkctH34uNV2rP8e7lx
         4a0TpWs3MeUhCT+mSZpTrvQK8+96P8Z7/MmeA02pTlWBaKPOUifYH+t5FE4S/N2jGdgn
         98WdrItRE7rzlGFkczZmgXla6GA8VuXklr2IqwyLzaFlbK0qutSkQkpXVLy9YvVHt6J0
         Gmvw==
X-Gm-Message-State: AOAM532rVKBpoecJPl3AN16C+GmF49erSxH8SSbKD5mvCohmwaZydkEE
        IyNVGazokVp1cUVB1z31ZgrKH/ILiUXy02MR/lE=
X-Google-Smtp-Source: ABdhPJzZ6E4GMLzkDcaHGz3RWFifYEL2VZUcbmH8PkV0a8wyzDRF3iGdIe97B/ZTTU5E6B7uXNHiI21Bz1a7+OW9ZsY=
X-Received: by 2002:a5d:914f:: with SMTP id y15mr1860029ioq.196.1624930139375;
 Mon, 28 Jun 2021 18:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210623005426.15731-1-ainux.wang@gmail.com> <20210624131752.GA2788536@roeck-us.net>
 <08c6376e-2825-52db-9033-6e590fcb9b1a@roeck-us.net>
In-Reply-To: <08c6376e-2825-52db-9033-6e590fcb9b1a@roeck-us.net>
From:   Ainux Wang <ainux.wang@gmail.com>
Date:   Tue, 29 Jun 2021 09:28:24 +0800
Message-ID: <CAPWE4_wmQtjYfPUQzpTrH-cJuexOfE5uStdrSxZkNkwgfHOSsg@mail.gmail.com>
Subject: Re: [PATCH v5] hwmon: (pmbus) Add support for MPS MP2949A
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     jdelvare@suse.com, Jonathan Corbet <corbet@lwn.net>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        teng sterling <sterlingteng@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, 28 Jun 2021 at 21:38, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 6/24/21 6:17 AM, Guenter Roeck wrote:
> > On Wed, Jun 23, 2021 at 08:54:26AM +0800, ainux.wang@gmail.com wrote:
> >> From: "Ainux.Wang" <ainux.wang@gmail.com>
> >>
> >> Add support for MP2949A device from Monolithic Power Systems, Inc. (MPS).
> >> This is a triple-loop, digital, multi-phase controller.
> >> This device:
> >> - Supports up to three power rail.
> >> - Provides 6 pulse-width modulations (PWMs), and can be configured up
> >>    to 6-phase operation for Rail A , up to 2-phase operation for Rail B
> >>    and up to 1-phase operation for Rail C.
> >> - The PMBus registers are distributed into three pages: Page 0, Page 1,
> >>    Page 2. Page 0 contains the registers for Rail A and most of the common
> >>    settings for all of the rails. Page 1 contains register information for
> >>    Rail B. Page 2 contains register information for Rail C.
> >> - The MP2949A supports both 5mV VID step and 10mv VID step for IMVP8 and
> >>    IMVP9.
> >>
> >> Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
> >> ---
> >> v5:
> >> - Moved change log to right here.
> >> v4:
> >> - Removed mp2949a_read_byte_data().
> >
> > Your other question left me confused. I had previously asked to provide
> > a rationale for filtering out the PMBUS_VOUT_MODE command, and I had
> > stated that "the chip does not support it" is not a valid reason. However,
> > "the chip does not support it but does not report an error when reading
> > it" _is_ a valid reason. So what happens when the PMBus core reads
> > PMBUS_VOUT_MODE ? Does the chip return an error, or some random data ?
> >
>
> Still waiting for a reply.
>
> Guenter
>
Hi, Guenter

Sorry to have kept you waiting.

Best regards,
Ainux Wang.
