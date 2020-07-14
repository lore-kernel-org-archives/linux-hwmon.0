Return-Path: <SRS0=kNNy=AZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3973AC433E2
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jul 2020 17:43:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1932622582
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jul 2020 17:43:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPqPOwj/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728963AbgGNRnw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jul 2020 13:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbgGNRnw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jul 2020 13:43:52 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0184EC061755;
        Tue, 14 Jul 2020 10:43:51 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id z24so24273817ljn.8;
        Tue, 14 Jul 2020 10:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6G6oty2jdvk2dXKXExViDuJ9Z/G2ugUeLn0KusV5A0I=;
        b=NPqPOwj/IhjmAwUC0u1DoCSwF6QyG80wWR5i/0/v5F1vqCpdcLnvoyufqTfqus/DuI
         PfPxtOSCBntO3IFa4wwQrBYRrP1NB94Rzz4LRxw19lhi/SCCTKdiIJEWGZg9Z3JLKsWo
         O9rRnR/8RxuTSC7xv8i4T5t766hLjhZILrUWnuAzsjg56TQVoyvwb71azbEJKWcpgVD2
         opr2lvmnVQ1WPEMNEk1ogOissAtNnOJbIChXyAoTznoG2HKKs6JT1MSj/yGhWf0DYib5
         RqWrzyJZdGF7x/J0Cv4ylQppnJq9mA8EBXKOChO1hYfJ+imYxSsD7lMdlD/a27hT6FhB
         4glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6G6oty2jdvk2dXKXExViDuJ9Z/G2ugUeLn0KusV5A0I=;
        b=kALhjfzIHSG9G2zvX7fAzc/crvhcTIsmkrqAuPN/ZhMB8spq2A6WPmOJXPWg4Dm1Ad
         cYJq/XO9OJXCZmKaBSr50vZuliNHbZ5Nc2x1zWMrQqHFtP7xEfNdKszmdrdo50fBuc0z
         n+u0916OM72jwFQaWoXPfLEc+mJStkVSixhnlhis0eRNkRVgPzCcH4Qn4S5QQFmHFcB5
         4eySyB/XXaKdWKuapwGn8M6IJoNSaw1X/sKW2bv2Au1d6tlXwoI3OAgeEZAL79B2o4mp
         bGqEizLgG1k834kSFAeoyfGZewUx+CJONiCscli+LNur7cI0s97xyqxgi135rLQNh1qR
         wRpQ==
X-Gm-Message-State: AOAM5315htO5S+/bXNDCEyL0vFsvRewTuR0giOKvBg0EhTTu02Aqb/8i
        0Tf2B/dVr+CW3eAEdu/OJQd9va9t9iTnXQXHCcs=
X-Google-Smtp-Source: ABdhPJy1+hnFrCAddNRfd7ZICQG+fdX2hIQOAL1PecxwWO9MCOtpexX16EXt5tXYy2gxJ6c76AvWOsmdKbb6cUMrpLA=
X-Received: by 2002:a2e:541b:: with SMTP id i27mr2609254ljb.118.1594748630147;
 Tue, 14 Jul 2020 10:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200713193227.189751-1-jaap.aarts1@gmail.com>
 <2647223e-74c2-8fd6-f649-9e051a7d9d6b@roeck-us.net> <CACtzdJ1+1FUaq0TMrUk1tkenOFfxE2Xrsrx1DOnd1P+vZwnSTA@mail.gmail.com>
 <bad1784c-d484-b772-6a08-f460802e2aa2@roeck-us.net>
In-Reply-To: <bad1784c-d484-b772-6a08-f460802e2aa2@roeck-us.net>
From:   jaap aarts <jaap.aarts1@gmail.com>
Date:   Tue, 14 Jul 2020 19:43:39 +0200
Message-ID: <CACtzdJ188X9wQurbci5qw_MJstSVxnaWZ0jXNZH92B4U83Aipw@mail.gmail.com>
Subject: Re: [PATCH 1/6] skeleton for asetek gen 6 driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-usb@vger.kernel.org, Jaap Aarts <jaap.aarts1@example.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 14 Jul 2020 at 19:31, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/14/20 3:03 AM, jaap aarts wrote:
> > On Tue, 14 Jul 2020 at 06:59, Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On 7/13/20 12:32 PM, jaap aarts wrote:
> >>> Signed-off-by: Jaap Aarts <jaap.aarts1@example.com>
> >>
> >> I am not going to review code which is later changed in the
> >> same patch series. Please combine all patches into one.
> >>
> >> Guenter
> >
> > Thanks for the feedback, most guides state you should
> > split up your changes into smaller patches if they get very big.
>
> Yes, but not if the later patches change the initial ones. this
> is not the case here. Your first patch doesn't even register a
> hwmon device. The last two patches change previous patches, meaning
> I would just waste my time reviewing patches 1..4. Worse, all those
> style issues fixed in the last patch would create so much noise that
> I might miss real issues.

Ok thanks, for future patches I will keep this in mind. If this driver gets in
I will be adding other features. I will keep this in mind when submitting
those.
I send it as one patch,  it's quite big, I will split my patches more
appropriately next time.

> A split would have been fine if the first patch introduced working
> code, then subsequent patches built on it without replacing previously
> introduced code.
>
> Guenter
>
> > Maybe I misunderstood the intent of that?
> > Anyways I combined all patches, fixed my signoff line, added
> > a changelog and fixed my subject line.
> >
> > Thanks,
> >
> > Jaap Aarts
> >
>
