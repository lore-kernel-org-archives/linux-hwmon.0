Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 401F9C433E0
	for <linux-hwmon@archiver.kernel.org>; Thu, 31 Dec 2020 12:09:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E13FD222BB
	for <linux-hwmon@archiver.kernel.org>; Thu, 31 Dec 2020 12:09:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgLaMJL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 31 Dec 2020 07:09:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbgLaMJL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 31 Dec 2020 07:09:11 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88287C061573
        for <linux-hwmon@vger.kernel.org>; Thu, 31 Dec 2020 04:08:30 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id m12so43659425lfo.7
        for <linux-hwmon@vger.kernel.org>; Thu, 31 Dec 2020 04:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A8YfmrkPt06S2wB4h546eXOdcb3JZ5qR24+QCgl/+1I=;
        b=YadZY7XKpyjdAjy4r379JEqa8l2gmRkg6QgQ5DoEsAhurYd1RORtWO3abMe/uplfa6
         r7iDDeSNrVh+7DOWizn9xPfdYrHXYWY+AG+wGDXFPqmuPInRjwURrJ+Z5sRSeZtNhaqR
         TDVZPGIpvyEF2YUIBmLeT1iAWhRty3KheKrlWcLlJPfZ1m/NF+3G2JGHNP9SS+K3Xv3h
         Jmxo/dV69Nig91vExGu4feFgPWCA8Kp94sW7XWut9i3LgdDa8wy9QB90q2Qa0giQZV+3
         YtLYBh9ctFX8FDTdOQIJYC2mvOo4AxMicQrMJ4RpMEk8Lq8hqLoh+GbwZHIExNjLbDdT
         RSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A8YfmrkPt06S2wB4h546eXOdcb3JZ5qR24+QCgl/+1I=;
        b=S7+oiAeA/e+v1CwSkjmyfFlFKRWN9p4epL+AYwnPsWLEB1mZTC2qjEx1iqp/1UymRZ
         lTCX0ayj7Ahgqc7ST1VUhHF1r1C+zuMdGvTCo6FpFx/++VdFd7Z6inN56Og7ndvz9CC0
         qLjww4uWeWs27OS+KBu/MQlMTBkJfUoMlPsesEGq8JRbXiEDO29o/QxuJ67KC0HpwopY
         nKRr/0a0414fkCqp58ViMOBTKZZPBucSiHdUUNrgLVXSHvWvTDp8ZWjQk5XBY+QvLQ/7
         K+6/LsZ2wD9uvG80JNWktZVxX/KN+u03ngrJxEQ4ByKDtj0Ho8mh5tj8DE9A/JD1I1sY
         HIJw==
X-Gm-Message-State: AOAM5325qIMThj/uy9qhIzJ251md0nHPED7PFKZUpfM3mRtEiBKIqsax
        ZfsHELHrJSuOBkIueAWJQjP99ONkVeS1bmg62z4gPtPeqEg=
X-Google-Smtp-Source: ABdhPJxWH0Sb0w0In3sEfI6fTYks4V/H+/NKqogifvJQmPb7TovtPTVcXEWEp0+uR0GwJTb4aFCc3d8NKukXCUhukTs=
X-Received: by 2002:a2e:85d1:: with SMTP id h17mr26761742ljj.438.1609416508928;
 Thu, 31 Dec 2020 04:08:28 -0800 (PST)
MIME-Version: 1.0
References: <20201223211319.937757-1-linus.walleij@linaro.org> <20201230161249.GA101363@roeck-us.net>
In-Reply-To: <20201230161249.GA101363@roeck-us.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 31 Dec 2020 13:08:18 +0100
Message-ID: <CACRpkdYs-_EdKNSjSaSBK-Uc7-ghHZHBzgwFD08a4WL2jTZxiQ@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (abx500): Decomission abx500 driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Dec 30, 2020 at 5:12 PM Guenter Roeck <linux@roeck-us.net> wrote:

> Looks like my response didn't make it to the list. Sigh.
> Continuously struggling with e-mail servers believing that
> I am a spammer.

Oh I got it anyways.

> Anyway, I applied v1 and fixed everything up there (Makefile,
> Kconfig, and removed documentation). No need to resend.

OK thanks a lot, sorry for all of my screwups.

Yours,
Linus Walleij
