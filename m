Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DD8C2B9F4
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jun 2021 23:56:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1A4B60FE9
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jun 2021 23:56:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbhFQX6z (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jun 2021 19:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbhFQX6z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jun 2021 19:58:55 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE8EC061574
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jun 2021 16:56:42 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id q23so976803ljh.0
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jun 2021 16:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LvafCC3aYPst1es0njYYswI6uPl6kxA3ILc303wYYAw=;
        b=KDhJs3yyXivtC78moZicu1mpEciwE/AN9Y4a2cS8CPq8ceUHyehsoKEwJ2mWS/pHt5
         jOpDva55khshGhTLipdQMRNzyIJdPo5ZIXRvlFBqRe4WFtKqhdCEw6DjlPDyarw3KtZC
         py+9VtygZ+RgLjF98QvyLb/e9N/sXDWKm21TTQwSA0k2jVfH4y2Wh/Yx5LwfSYjUgEGB
         c/fH6ra9tgwsEbrvtv3nDwkk4119Sz4fQaa2/M8IqC6QaB05df9AQLxAroYrH8gE9FWA
         Y7eGEpJbQT6lQD1Pk76WwD49Gf7Y0TeNDN8xYkA6ecMIL87E8sp57tiX4fAkMhLplTSy
         P7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LvafCC3aYPst1es0njYYswI6uPl6kxA3ILc303wYYAw=;
        b=TP4wyk68A9D9FxKAB8a+jikuGlReyFpB/ukaXHSyGbZYPffwkBJ0Oga/5AnYCV1glf
         RmpgFK5lGHuMQXzi7azuzDyrjxRXNhTnE/x14gAF/17t+/SYqkIg63iVSVWJ58z3ivU5
         UBlWQ0x58c7NzcOjti8euQ8WNWOJEb6NGBtRovAb7sSo1xI7YpuKqbv+1h+Q7bL2O3ge
         aoqmfVBz3cNh2Zur4WN8WwTSYDBhyqge00z+yu2EHOyw9d54jdQVo+Lp795L+3q40EJ/
         IEQnLLigJChRdw3AM37F+dHsJgbuAZJ+/4169virn1Gcrqc39TtTX/i0dEnzSnePb86D
         2J/Q==
X-Gm-Message-State: AOAM53125GgVmNAqL7Zdq6QhOupY08WDM3Pg1kr4USzQxvDc4wfNonA4
        mnePZeK2xSjy5s7k67qSuAXxiYm7xriXmtyd55d+vVvOM5gZa+Fq
X-Google-Smtp-Source: ABdhPJyf4/+23/bLdQZnRCguUxRDCjJw5MKWv+F2u0JgFif5JLBlPoMVVaNtCPDcoEVLuuAL6HujVsNxd/N0bDjnVOA=
X-Received: by 2002:a2e:2a43:: with SMTP id q64mr6795805ljq.375.1623974200304;
 Thu, 17 Jun 2021 16:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <CADnvcf+LhxZoZk9eRUahSWZ3xVJLkxcAt3+4dS-JCjV8gZE_0A@mail.gmail.com>
 <2199169.9u6qy3EJ5v@marius> <CADnvcfK1EzyXY83wd7CJYpZ=S9+KnT0ftF9CiYhJScBGXKmm5A@mail.gmail.com>
 <20210617131402.GB59767@roeck-us.net>
In-Reply-To: <20210617131402.GB59767@roeck-us.net>
From:   Aleksandr Mezin <mezin.alexander@gmail.com>
Date:   Fri, 18 Jun 2021 05:56:29 +0600
Message-ID: <CADnvcf+W0fLJ8Yh-=dktVR63TXECNKtk5BvUfCBxazkLTw1N6g@mail.gmail.com>
Subject: Re: corsair-cpro and hidraw
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Marius Zachmann <mail@mariuszachmann.de>,
        linux-hwmon@vger.kernel.org,
        Wilken Gottwalt <wilken.gottwalt@posteo.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

I've looked through corsair-psu sources, and I think filtering in
raw_event won't be enough.

For example, in corsairpsu_request, there are 2 commands, and they
should be executed consecutively:
1) corsairpsu_usb_cmd(priv, 2, PSU_CMD_SELECT_RAIL, rail, NULL);
2) corsairpsu_usb_cmd(priv, 3, cmd, 0, data);

If the userspace will squeeze another PSU_CMD_SELECT_RAIL between (1)
and (2), the driver will get data for a wrong rail (and with the
current code won't even notice it).

So unless there is a way to "lock" hidraw (and it seems that there
isn't - looking at the code, hidraw calls the low-level hid driver
directly, as far as I understand), it won't work correctly.

And if a driver can't work correctly with hidraw enabled - maybe it
shouldn't enable hidraw? So that the user can 1) notice that something
is wrong 2) blacklist or unbind the driver (or userspace tools that
use hidraw can unbind automatically). Otherwise everything seems to be
silently broken.

On the other hand, maybe races between the kernel driver and userspace
tools are unlikely, because the driver doesn't talk to the device
continuously - only when sysfs reads happen.

Added corsair-psu maintainer to Cc:

On Thu, Jun 17, 2021 at 7:14 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Thu, Jun 17, 2021 at 01:11:38PM +0600, Aleksandr Mezin wrote:
> > On Thu, Jun 17, 2021 at 12:27 PM Marius Zachmann <mail@mariuszachmann.de> wrote:
> > ...
> > > I do not know, what your device is doing
> >
> > Actually, NZXT devices (at least grid/"smart device" and "smart device
> > v2"/rgb&fan controller) don't have such issues - they use report ids,
> > and don't even expect request-reply communication pattern. I've just
> > noticed that something seems to be wrong with corsair-cpro (but
> > somehow didn't notice the comment) and decided to ask.
> >
> > > This device uses an echo of the command
> > > in the answer and if they don't match it returns an error. This could
> > > maybe lead to a false error when the replies are switched, but is
> > > probably preferable.
> >
> > Hm... If the response includes the id of the request, it should be
> > possible to filter reports in raw_event, i. e. don't signal completion
> > if the report doesn't match, and wait more. Yes, there is a corner
> > case, "if a command is not supported, the length value in the reply is
> > okay, but the command value is set to 0". But timing out (250 ms) in
> > this case should probably be fine... Actually I have a compatible
> > Corsair PSU so maybe I'll send a patch.
>
> Patches to improve the situation are welcome. My understanding is
> that with the current driver users should disable the kernel driver
> if they plan to use userspace tools to access the device.
>
> Guenter
