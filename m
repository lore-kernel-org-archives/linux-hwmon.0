Return-Path: <SRS0=hNyA=AH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E22FC433E0
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 Jun 2020 11:45:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66AED208C9
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 Jun 2020 11:45:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXvGo/ri"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgFZLpe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 26 Jun 2020 07:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbgFZLpe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 26 Jun 2020 07:45:34 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E40C08C5C1
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Jun 2020 04:45:34 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id t8so8179370ilm.7
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Jun 2020 04:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cDPCfFTsxvKnR/+F21NZjnsuRbWHUKOa2XJzmaLzDSc=;
        b=ZXvGo/rivUXyDLkRJWXFTC9BKgs71cBRMALh5TYgW3W9LYdOVsgmN9gn1iU0ArAhfT
         +PKNqYdKJ9crJWHzYEaaf7dN0Dx1Bitm7j7ZfrLOTTmAMsUpPBJzEXvJOQkXpgCvlk7m
         uDLQfj9yTVUv/4letiJWmxBGObRbAxMbIOaLgK0v6M/LmgGm39FNPx5+rc58z+FOflzG
         OXWtm1/zM+ll92hA5nEiSMzES2YyKC4Q7MtFyTWiAC3FFAHUF5T+/NMcWR+RCeL2Vl/q
         TigXkpkcaeVAH7OeNYJfS376SemO3pmMUcnA+1onW4cqPsCxjGJ1NyTlSIjxhKBzteT1
         i0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cDPCfFTsxvKnR/+F21NZjnsuRbWHUKOa2XJzmaLzDSc=;
        b=OkdT3a8AvxLj/3voQWWoPuT4+BxIZA3al4wlzUAhktKIykpGGK6XOFzgHNqICKNhdm
         kAxn6xEaMySWkKMTWMyacA7luGMe9sVXktnhf8SPh4lTBwNn59wn4l5XRzxx7KisNuGn
         RJR8xsvtpNFrOIW4gWrj6O04EHvWUlfenc+5VijyQcCbyD9XRONwoMXmXVoT/g6JhRiM
         GapFVBdwYY6EO5nEqf+ElfTFm04I+0nCp30Qruxs/t7fqIGXxYceailbKMHL8+zeJRO6
         q0OgOYLQERFWjnMKjfX/CzWU0NMO8Y2D17i5np0GWyyXn+Qz424q7Y0gHXeBdm9b6nLf
         cjtg==
X-Gm-Message-State: AOAM530kvXVM/xg1JUiNbr7vBbY5LppbjxJVs1XyFLj971oCN+vE7GXf
        +7gWo+k5Y2a3SsuaUnf3GyJgI2N9st4M74mMk8gYsmMb
X-Google-Smtp-Source: ABdhPJwWtJYbEhocMKfXSVbIEDfB4IrEnYmXBIvFHzLUTeUqam7jbRqRk6Q76x5aPV5lWqDEsfOBsRJsuiHqolbTYuk=
X-Received: by 2002:a92:cd45:: with SMTP id v5mr2537446ilq.184.1593171933832;
 Fri, 26 Jun 2020 04:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAMFK4TOcpoLPxmbEJxhPHQOQ8B+mQ5EWge-jqKXBRhFcXMCR1w@mail.gmail.com>
 <382827a7-4b49-3323-d0e4-f7eabb3898e9@roeck-us.net>
In-Reply-To: <382827a7-4b49-3323-d0e4-f7eabb3898e9@roeck-us.net>
From:   Henk <henk.vergonet@gmail.com>
Date:   Fri, 26 Jun 2020 13:45:22 +0200
Message-ID: <CAMFK4TP=92+hRRS-41EBRa4F6s7XCqsiJJsskEiGocU_3dpU3g@mail.gmail.com>
Subject: Re: [PATCH] hwmon: nct6775: Add missing voltage input on NCT6796D
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dear Gunter,

I hope I did not bend the rules too much, but this is all i have time
for right now.
People wanting to follow up, please feel free to use the patch, in any
way you like.

Kind regards,
Henk Vergonet



Op do 25 jun. 2020 om 18:22 schreef Guenter Roeck <linux@roeck-us.net>:
>
> On 6/25/20 9:10 AM, Henk wrote:
> > Add missing voltage input on NCT6796D
> >
> >>From the datasheet: the NCT6796D has 16 voltage readings.
> > Source: NCT6796D_Datasheet_V0_6.pdf page 59-60
> >
> > This patch adds support for in15 on the NCT6796D.
> >
> > Signed-off-by: Henk Vergonet <henk.vergonet@gmail.com>
> >
> > Patch:
> > https://github.com/torvalds/linux/commit/8ebb8a5d1d02d60a098cdf0bb576f810f307d9df
> >
>
> Please read and follow Documentation/process/submitting-patches.rst.
>
> Thanks,
> Guenter
