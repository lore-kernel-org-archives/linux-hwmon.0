Return-Path: <SRS0=wGth=DL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456BBC4363C
	for <linux-hwmon@archiver.kernel.org>; Sun,  4 Oct 2020 22:13:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7D9820678
	for <linux-hwmon@archiver.kernel.org>; Sun,  4 Oct 2020 22:13:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="S2UxSd4x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgJDWNe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 4 Oct 2020 18:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726398AbgJDWNe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 4 Oct 2020 18:13:34 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E06DC0613CE
        for <linux-hwmon@vger.kernel.org>; Sun,  4 Oct 2020 15:13:32 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id f37so3324135otf.12
        for <linux-hwmon@vger.kernel.org>; Sun, 04 Oct 2020 15:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=21SgcPSilU2WmFlJ1YV1atmbImUIvncr5hL7C2NduDg=;
        b=S2UxSd4x6J9MIexk/blPExcr2WqOG29rXNMaf2VRNEmDtofZJUn2CnITV5Dbueo9Rr
         dv3ygJZNQYZWQeOqzAAjZmg93vwSfG+uod95h+10ahp5xs62R27UJk8JBIrpum8LhX61
         hqlbM+7Xyvsqo79NvGETPUp8b9B8IihlYPPZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=21SgcPSilU2WmFlJ1YV1atmbImUIvncr5hL7C2NduDg=;
        b=DFfum5oqpm3UaF/1ctTSJ33wZa8Tncy/fc/C0Cy7WH24dM2dMX1WPWwx0zGADyogfQ
         hqnBNIZRxpEDEZ5FXc6tBNFUQSYQmf93D7k95GheAivWeTfbpEO9SYLTztQMu1sVvVt/
         9zgNxqPw1DIt/4MTJQKxqb0LuVbrn86zmYvfSecqaAyw795SedCxp41EEXKteMMEoXYS
         FUvnZ7p2QahvPVzlHbYKn98Dexoxw4PjHxhKD23qROrY+1CmOhWu3hX+v5OO+r1I6s4a
         OHkXwnFzGG8U4gbRkOmyiX6I+SuPoW276VIiBwvXhvvJ2QUYjb1lUTPIcl9WnPmv6FAX
         z3zA==
X-Gm-Message-State: AOAM5305IgT2NuQ/GT6fd71jn4E6pImkCNCz8EI5ny1vUHKOrgVB0m3G
        4b7D3KVvLiP+mwXgKlsbsMc4pg1p7HXs+pi4Sb9X3Q==
X-Google-Smtp-Source: ABdhPJxW/u/YPTxpno8lsMW1uMazZR3s04f7/LZaBoYdWn0BMWkdlRFJsK5WHxaNlHH/LG41YajBPjZwLIxfZQmU6ts=
X-Received: by 2002:a05:6830:1d8a:: with SMTP id y10mr9549130oti.92.1601849611704;
 Sun, 04 Oct 2020 15:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200920180943.352526-1-pbarker@konsulko.com> <20200920180943.352526-3-pbarker@konsulko.com>
 <CAM9ZRVs=33NJGEn783BMEhZxKwuhSSuaTW1QtX3E7wz0mLGiaw@mail.gmail.com> <c972365d-25c6-add8-bcd6-93dc76c59fa4@roeck-us.net>
In-Reply-To: <c972365d-25c6-add8-bcd6-93dc76c59fa4@roeck-us.net>
From:   Paul Barker <pbarker@konsulko.com>
Date:   Sun, 4 Oct 2020 23:13:21 +0100
Message-ID: <CAM9ZRVu=mopJHsV-ntBY7L+W7qmEX5bQyPZbP-CjjSXVm680Tw@mail.gmail.com>
Subject: Re: [PATCH 0/2] pwm-fan: Support multiple tach inputs & fix RPM calc
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, 4 Oct 2020 at 16:38, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/4/20 1:49 AM, Paul Barker wrote:
> > On Sun, 20 Sep 2020 at 19:09, Paul Barker <pbarker@konsulko.com> wrote:
> >>
> >> These changes were made to support a custom board where one PWM output
> >> is routed to two fans, each of which has a tachometer signal routed to a
> >> GPIO input on the SoC. While debugging on this board it was found that
> >> the RPM readings were being overestimated due to a bug in the
> >> calculation code so I've included a fix for that.
> >>
> >> As the custom board doesn't currently support the latest mainline kernel
> >> I've tested these changes on a SanCloud BeagleBone Enhanced using an
> >> oscilloscope to check the PWM output and a signal generator to simulate
> >> the fan tachometer signals. I've tested variants of the device tree with
> >> 0, 1 and 2 fan tachometer inputs configured to ensure the logic in the
> >> probe function is correct.
> >>
> >> The device tree bindings changes have been submitted in a separate
> >> patch.
> >>
> >> These changes can also be pulled from:
> >>
> >>   https://gitlab.com/pbarker.dev/staging/linux.git
> >>   tag: for-hwmon/pwm-fan_2020-09-20
> >>
> >> Paul Barker (2):
> >>   hwmon: pwm-fan: Support multiple tachometer inputs
> >>   hwmon: pwm-fan: Fix RPM calculation
> >>
> >>  drivers/hwmon/pwm-fan.c | 164 ++++++++++++++++++++++++----------------
> >>  1 file changed, 100 insertions(+), 64 deletions(-)
> >>
> >>
> >> base-commit: 2835d860d3fcc3e4829e96987544e811d35dee48
> >
> > Ping on these, I've not had any feedback for 2 weeks.
> >
>
> Unfortunately the patches are a bit difficult to understand,
> and I did not have the time to fully analyze them. One thing I can say
> is that the order should be reversed - the bug fix should come first.
> Also, patch 2 adds a potential divide by 0 problem, if 'delta'
> happens to be 0.
>
> There are little details, such as replacing 'int pulses' with
> 'unsigned int pulses', which make things more difficult to review.
> atomic_t is int. Assigning it to an unsigned int _should_ not matter
> here, but again such little changes make it more difficult to review
> a patch because they require extra scrutiny.

Thanks for the feedback, I'll do some rework and re-submit. Probably
just the calculation fix first and then the support for multiple fan
tachometer inputs as a follow-up.

-- 
Paul Barker
Konsulko Group
