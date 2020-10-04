Return-Path: <SRS0=wGth=DL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C3DC4363C
	for <linux-hwmon@archiver.kernel.org>; Sun,  4 Oct 2020 08:49:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFAD7206C3
	for <linux-hwmon@archiver.kernel.org>; Sun,  4 Oct 2020 08:49:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="d4bRC88p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725910AbgJDIte (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 4 Oct 2020 04:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDItd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 4 Oct 2020 04:49:33 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0952CC0613CE
        for <linux-hwmon@vger.kernel.org>; Sun,  4 Oct 2020 01:49:33 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id x69so5727721oia.8
        for <linux-hwmon@vger.kernel.org>; Sun, 04 Oct 2020 01:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zUCZaNbBi4lm4nE80KjRPpAscpC0s1wYcAebpRYyojk=;
        b=d4bRC88piAzzt8s7gjC6zeR1NUWAuAHsOIJ7nXCKmpI99amtDT0+t3ddRwOEkqkHTd
         W1cmJ2jPE0b35ubzSpXk7+Nzlks/NFmFhYbmoU67OZ7moT5qljLBWNTjRliGicRJDoS2
         c9KKtyRHyBFsE8I8512Co1iTaNXH2Xbh5HL8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zUCZaNbBi4lm4nE80KjRPpAscpC0s1wYcAebpRYyojk=;
        b=NkXXsEPxtWL64i+ltROsbLIPSmtddLRCD4HR4XSvwS+gU1FO5roW7Z2Qhz3aebLACD
         JM3kWQxSlNIBvmtH9NUQ81OYbjeq/SPdE/LnxPC58nF6f32iaw2LnDwOdKFnSdlbRBAA
         BX2mWbdbRbmaG81U+OlE9w3KgvSl4rCzI5dyaTNER1KJ0KN/Gt01St+ExuNytE2v42pz
         TjfhjdIwTqaXKCZUVUcXXRGOXhs+B4aVW6Gbh7WDFNm4i4bUZjpzXQCxtLdZV1Q8tQk0
         Ml1p4xLn83bQNPKoJfX9WeI7FkORmza3ILx90NgXGy9fRZQ9lp8SNpXtSyMLX7SsR4wf
         JvCQ==
X-Gm-Message-State: AOAM5315ngzmJG8IdfWyDJ6w+3j2SNnLFzS9VCtcL/r10wOKJ7Al14rg
        D6tugFlOLght+126pZQJF8M5CWTaTWzmJcYC3ZPUeA==
X-Google-Smtp-Source: ABdhPJwnUYNM30wWIYzJDLpL2m8+JorffnzNm0N06y8WfxIb9rvRamldD/J6KRjpvfD7BoqIzpomn0xuLy3sbNGomh8=
X-Received: by 2002:aca:5b05:: with SMTP id p5mr4675476oib.6.1601801372181;
 Sun, 04 Oct 2020 01:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200920180943.352526-1-pbarker@konsulko.com> <20200920180943.352526-3-pbarker@konsulko.com>
In-Reply-To: <20200920180943.352526-3-pbarker@konsulko.com>
From:   Paul Barker <pbarker@konsulko.com>
Date:   Sun, 4 Oct 2020 09:49:23 +0100
Message-ID: <CAM9ZRVs=33NJGEn783BMEhZxKwuhSSuaTW1QtX3E7wz0mLGiaw@mail.gmail.com>
Subject: Re: [PATCH 0/2] pwm-fan: Support multiple tach inputs & fix RPM calc
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, 20 Sep 2020 at 19:09, Paul Barker <pbarker@konsulko.com> wrote:
>
> These changes were made to support a custom board where one PWM output
> is routed to two fans, each of which has a tachometer signal routed to a
> GPIO input on the SoC. While debugging on this board it was found that
> the RPM readings were being overestimated due to a bug in the
> calculation code so I've included a fix for that.
>
> As the custom board doesn't currently support the latest mainline kernel
> I've tested these changes on a SanCloud BeagleBone Enhanced using an
> oscilloscope to check the PWM output and a signal generator to simulate
> the fan tachometer signals. I've tested variants of the device tree with
> 0, 1 and 2 fan tachometer inputs configured to ensure the logic in the
> probe function is correct.
>
> The device tree bindings changes have been submitted in a separate
> patch.
>
> These changes can also be pulled from:
>
>   https://gitlab.com/pbarker.dev/staging/linux.git
>   tag: for-hwmon/pwm-fan_2020-09-20
>
> Paul Barker (2):
>   hwmon: pwm-fan: Support multiple tachometer inputs
>   hwmon: pwm-fan: Fix RPM calculation
>
>  drivers/hwmon/pwm-fan.c | 164 ++++++++++++++++++++++++----------------
>  1 file changed, 100 insertions(+), 64 deletions(-)
>
>
> base-commit: 2835d860d3fcc3e4829e96987544e811d35dee48

Ping on these, I've not had any feedback for 2 weeks.

Thanks,

-- 
Paul Barker
Konsulko Group
