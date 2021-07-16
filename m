Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE186C636CD
	for <linux-hwmon@archiver.kernel.org>; Fri, 16 Jul 2021 10:21:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96440613F7
	for <linux-hwmon@archiver.kernel.org>; Fri, 16 Jul 2021 10:21:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238392AbhGPKXy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 16 Jul 2021 06:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238560AbhGPKXx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 16 Jul 2021 06:23:53 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1526C06175F
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Jul 2021 03:20:58 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id h4so12125974ljo.6
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Jul 2021 03:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QCPElWuEa8w9XYuBr8O3jsy3/amnNkihPKbRSdW0wgs=;
        b=cHMMiBAJmp6/cyeiYGTgxmR3wcUCQ+tFsAvAHnOB2o9PoESScJHJaYcPS7nMmYYRMq
         aQVd4P7f4uO4kwKcWaFC5YlPa/D/rtoxF48Db25jhD1zqvzeNVsO2A4fZL9n03mCr8rD
         WGKIPSmSpUsw31X1eVNVQc3I7w3W1ykafZtPkzVqXSCmYtUAHvyE6Qtf43qbCeP9YzMm
         MbgqupbxXcPjOPp9bHl9FC84SAhvsa/mwwVcRgP5yikXTBJrOxAKqeC4zmIcPlXz9F1Y
         ySTL2BRMqsBc+lCLPOULUpDGRTT0OxeMHLdQic117MdmaybrvNqD1wz78xYBBsnbOebg
         4MoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QCPElWuEa8w9XYuBr8O3jsy3/amnNkihPKbRSdW0wgs=;
        b=R95P+cJbGDjkAuXzCbM/4D6vYw0aHyWNa+jNyBkCZ0IoHxSrbEWSWowFrA69JdrTqk
         nCsAAjjAH975ChniejpzenGSYpSLqx87tpkIEYbIuHbpQ24jIwSfL/6zKumzj/froOcf
         xyVj8TBDGCig0/nIASZYsudEB3fXW7NweRXFO3Gk+vV8d8eVZV6IyRV8IiMYlwtAlXo7
         4W549bzbqbkmFHAyNEkvaW65gfWyoOtgB7FWrOUO7sclnnCXx2RZ3DWLkyZ3+VPFDAVz
         QUhLN1n1P7gAjDt45+TW5LZM+hMO8OzlrVgUwbN8GBZNzSHNduTrIjH6lKhEBUNKsA1r
         5ekQ==
X-Gm-Message-State: AOAM533rj3XqNpIqej3bWGkD8uioXB75DYOheK954rswsE/lu/O5gLz+
        /yo0GN2LDFaF2laU72bPmJxIgkP9m/z4Ohi24XA8Yj08fF0=
X-Google-Smtp-Source: ABdhPJx89XzzQN7X+eh312K00RYM03ZzDBNYbs41wT6kl55jytpR6zW5S7cLnaVDCj/WE59ockOo8Fl8sE1bSvDbbi4=
X-Received: by 2002:a05:651c:2103:: with SMTP id a3mr8299888ljq.192.1626430857143;
 Fri, 16 Jul 2021 03:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <202107080039.1680d7Eo018443@systol.god.lan> <CAMFK4TPNYJeEJdfu5Wti7G34m+-tcZvA2wv0N87aPsGq2eygvw@mail.gmail.com>
 <CAMFK4TM0MCEGWs=zCJZLsdnUJKqvM+-0fxZTDhJd864SAG8=ng@mail.gmail.com>
 <545ad722-d2de-21bb-21c5-7104097c76c4@roeck-us.net> <CAMFK4TMKt3myPKrLYU_vvC=PxxbdohyePZA9Qy0ygdtTmAZU6w@mail.gmail.com>
 <497f1c35-6334-7bf3-d72c-6f0db16bad4e@roeck-us.net>
In-Reply-To: <497f1c35-6334-7bf3-d72c-6f0db16bad4e@roeck-us.net>
From:   Henk <henk.vergonet@gmail.com>
Date:   Fri, 16 Jul 2021 12:20:46 +0200
Message-ID: <CAMFK4TM0gxEx=s0fRy2EaCsWqGLsRRt-bdYzSdjrfmK8vZBPCQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon: nct6775: Add missing voltage reading NCT6796D
To:     Guenter Roeck <linux@roeck-us.net>, info@linuxfoundation.org
Cc:     linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Op wo 14 jul. 2021 om 17:26 schreef Guenter Roeck <linux@roeck-us.net>:
>
> On 7/14/21 7:28 AM, Henk wrote:
> > Can you be more specific?
> >
>
> Not a single one of your patch submissions followed the guidelines in
> Documentation/process/submitting-patches.rst. Most common violations are:
>
> - No or insufficient patch description
>    See 'Describe your changes'
> - Patch sent as attachment
>    See 'No MIME, no links, no compression, no attachments.  Just plain text'
> - Instead of sending a patch, sent pointer to github location
>
> You could just set up git send-email and use it to send your patches,
> as suggested in submitting-patches.rst. Not doing that has cost both
> of us a lot of time, for no good reason. I don't know about your time,
> but I am not getting paid for my work as Linux kernel maintainer,
> and my time is limited.
>
> You for sure have accomplished one thing: A new formletter.
>
> <Formletter>
> Please follow the guidelines in
>      Documentation/hwmon/submitting-patches.rst
>      Documentation/process/submitting-patches.rst
> when submitting patches into the hardware monitoring subsystem.
> Patches not following those guidelines will be ignored.
> </Formletter>
>
> Guenter
>
Hi Guenter,

I am in similar position as you, my Linux work is unpaid and voluntary
and not subsidized as some of the other contributions are.

I am extremely grateful of the work that maintainers do and apologize
for the inconvenience that I may have caused.
Also I wish to thank you for the new form letter. I would have send a
pointer to my github location at first impulse however:

I forked torvalds/linux from github in the understanding that it would
allow me to create a proper documented pull request that could be
routed trough the proper channels.
However then i discovered after patching the file that I was not
allowed to create a pull request, which is quite annoying.
So I am looping in the Linuxfoundation in this mail in order to ask
them to please reconsider their current policy and allow the creation
of pull requests on gitgub/torvalds/linux . This would greatly reduce
the amount of overhead.
I would also argue that the github commenting system, the automated
build system, and the review system are quite good, and we have
definitely made some progress in that area since the invention of the
mailing-list.

I understand the master repositories should reside on kernel.org but
bringing in some of the feedback to the kernel via github could be
quite beneficial!

(Just occurred to me I can send a pointer to my own commit :
https://github.com/hvegh/linux/commit/00b3427269f731becbc10e9fe92046a6ad91eee8
 )


Kind regards,
Henk Vergonet
