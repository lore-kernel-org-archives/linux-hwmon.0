Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD78C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 22:03:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF46E60F9E
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 22:03:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235857AbhIUWFK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Sep 2021 18:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235729AbhIUWFK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Sep 2021 18:05:10 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31652C061575
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Sep 2021 15:03:41 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id t10so3321954lfd.8
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Sep 2021 15:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3XNrN73gADSI7mOjilUcf947Qv8Mlwuoxr5Ui0NoXJc=;
        b=OWj8Af0YyfiYyi4VGX9bDEuWcnZdEPeX/Lp0Kh2oOfcn8g9ZdwAB02qmDtQtls57ie
         Ib0/aXpeju7/xyh4yywzQnMIER4uWSkXG40GU57rtJBfqQnUkYEJuS0aqfbpuHVcHjGc
         iHh1CguSnrHaHh12VU87N+HuLXp/0KYimWc3CQwDS7CCZv/Tur0KqLbS6hmwikJuIJDP
         BuSnY35/1cbMIlBW4iaujWcP18o9bMurkvqjRJSdhNVqL/qw+gx+XnWqDCao60Ol5+x6
         eAUdmKrnzL+rn2TPYWs8ve3HjLJ5LfW6Sa+2tbX71rYy9gDKc1lHzi6gH8oMOyEZY8i3
         WZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3XNrN73gADSI7mOjilUcf947Qv8Mlwuoxr5Ui0NoXJc=;
        b=WiKa0FVzRBRTG8PM/jiDJEJ8gACaE/Qd0ZiJN0HE83uA6pOFgdVVUrYjIyoggpMH5h
         vOmolS/YDfddVi+5lBK6zp9u9gjIWxOodNydJ7AEXIl5JnYtriiJB/qdHoQxzavuIuUV
         xYPeH6GriKDv6mUR/Kj2qWWADvB5XcIalIAqIVwE8fCqxdTvTXMbheG0veWlh7KTiaX9
         4KXLHEH6+CtJByoIVMYoz145SrX63AxgIoVvbopwEsaaz35z0gOvADFr6iX6vob+7YWB
         zvYqKxYyd8bQNYZKewQki5Y2uggguZgL1CSHk+SxvnCnQrVwFkFlCpk4bjCEDntot5M4
         EQkg==
X-Gm-Message-State: AOAM531LTIA35l709+9vupUjRyWHwO79y3HmyZCECExSPH1JHbqYXTw/
        uMGTOW9QPZdQIyo0NZkZVi3+rpCDIPrckwXg649asw==
X-Google-Smtp-Source: ABdhPJy6FZaPttUotreE8q28PJYOwpbn07MmoEuf53wHMliLPSolvex9NmYzfcV/65CxXhI74w99CkkQVf26N+Llc/M=
X-Received: by 2002:a2e:9c43:: with SMTP id t3mr19429726ljj.198.1632261819095;
 Tue, 21 Sep 2021 15:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <12984255aac11a3edfc0e6278e1a1cac70ce97ec.1631021349.git.krzysztof.adamski@nokia.com>
 <YUkKCe7845uCqoy5@robh.at.kernel.org> <20210921125831.GB1864238@roeck-us.net>
 <CAL_JsqLo=inkKVKSU8N=_h90RfpDk6NNWPKdKyTXh-VvqXDCag@mail.gmail.com> <20210921205247.GA2363535@roeck-us.net>
In-Reply-To: <20210921205247.GA2363535@roeck-us.net>
From:   Oskar Senft <osk@google.com>
Date:   Tue, 21 Sep 2021 18:03:22 -0400
Message-ID: <CABoTLcQfOByG5VmhTKQ3ZCZ5NtPfFU49abtE-Zr7BDCNphThSg@mail.gmail.com>
Subject: Re: [PATCH 8/8] dt-bindings: hwmon: allow specifying channels for tmp421
To:     Guenter Roeck <linux@roeck-us.net>, robh@kernel.org
Cc:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Resend to Rob's correct email address. I'm sorry.

> > > + temperature-sensors {
> > > + ltd {
> > > + status = "disabled";
> > > + };
> > > +
> > > + rtd1 {
> > > + status = "okay";
> > > + type = <4> /* thermistor */;
> >
> > 'type' is a bit generic. We don't want the same property name to
> > possibly have multiple definitions.
> >
> How about sensor-type ?

In the datasheet this is called "mode". I called it "type" since it's
tempX_type in sysfs and I wanted to stay in sync with that.

> > If it is how you address an instance of something which seems to be
> > the case here, then 'reg' should be used.
> >

The reason I didn't do that is because you'd effectively have to
duplicate the ID in both the name (e.g. sensor@1) and the reg property
(e.g. reg = <1>). But maybe that's just what is is in device tree, I
can live with that.

However, we'd also have to find out whether the "local" sensor ("LTD")
would simply be #4, as it is in sysfs today. I'd also be ok with that
as it would keep sysfs and device tree "in sync" wrt. naming.

Thanks
Oskar.
