Return-Path: <SRS0=LV6A=Q4=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FE9C43381
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Feb 2019 18:16:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F3B22083B
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Feb 2019 18:16:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2bLj22x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbfBUSQq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Feb 2019 13:16:46 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:46808 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725831AbfBUSQp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Feb 2019 13:16:45 -0500
Received: by mail-io1-f68.google.com with SMTP id k21so2815850ior.13
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Feb 2019 10:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1o4/Y3LaKxDzZ5jWxKeXfXLbWMZAGYcBNgQtccjcEsE=;
        b=U2bLj22xU2inPEn1cLD74FTkJHYtxc1MhJ0AjpBOGHfDxcb9asLs/SmflLosIvLpaj
         v9P8x4YfRibVz0yaN9nN0BxjKgbascedy71xQ/+K9eY8a6Ol6xD1uBC0kCO5MpWfuwAf
         L/QUBEbDhc/YzW1RDu3BWKB3xW/5bddr5YJb4HWf+92rSs1KTadw99XSzRDYQwJu9UBg
         TUKixCagcEMQK5tD57Fiq4W1n0QTZfQFi1DGMGyyGVmdlTRUZa2ObU18KwzCEzcEX/dp
         NSxsxTOeC0b4xjz3mgG0uiFEN+8xKunq6DyU2muALDAx657yr9zHxJwrZ/jjdiEIxuE8
         la6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1o4/Y3LaKxDzZ5jWxKeXfXLbWMZAGYcBNgQtccjcEsE=;
        b=egZ/neLG6CzJcD10Kk/XC1fPK68Eq93r5PF5sRr0P63yKjbtkQSR94R1kNlLxPR+Xk
         nPrD24jRD142llNV2zPuTIs0Cm2Yift9GI4VkSibHp2crTbZUZzUJz2ZF3PnN1SbAmA9
         h67tyBxBsADxJ5LC9f6NwHsfCvRMMe6doUHS6UVZxJtTltflCob3AoU5cGxnuddM/1Mq
         8uViIss1MgQ//9kk+7nW1XAJnoXGdShi9oPhwQtdpWmL+YjSNVohqi/VxAeIXvK/+RO+
         8qAFyXGZlDwD1tEuk7tLxzIQpB+22wgLr08AO4+H+KYDT0SWJYfxJzWlaoWJMbPujzta
         1wSw==
X-Gm-Message-State: AHQUAuZsSZMDBAOB9A68zDS66cZ+GO1gQk+3olsCKUJyuaYWTxXh5Y00
        3e1CxcV8+IVq65RrklrIDjF8VsvTJ3/+JNIf0nA=
X-Google-Smtp-Source: AHgI3IbfL/xtYoXNlHvMkDs7G4yw4/hRCswJRPJ/TvwPWUQxA9N3pvVyiFBdSvwFr/rqUaP7IbWAYHD/od2+6LKGkME=
X-Received: by 2002:a24:298b:: with SMTP id p133mr11270864itp.43.1550773003722;
 Thu, 21 Feb 2019 10:16:43 -0800 (PST)
MIME-Version: 1.0
References: <CAGWqDJ48N5Q6OsHq_f217za-34zQMDY8qNL6XEDLREPY3JP3MA@mail.gmail.com>
 <20190221175511.GA22715@roeck-us.net>
In-Reply-To: <20190221175511.GA22715@roeck-us.net>
From:   Vinay Simha B N <simhavcs@gmail.com>
Date:   Thu, 21 Feb 2019 23:46:32 +0530
Message-ID: <CAGWqDJ4pvVeTsqepodC-9g2UDjVq6NT-n3FaudXN456uwLQ00w@mail.gmail.com>
Subject: Re: tmp102 hwmon accessing temp1_input, max, max_hyst
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

guenter,

i want to use these three  tmp102 temp1_input, max and max_hys in
dsi2hdmi(adv7533) driver to enable or disabled based on temperature
range.

https://github.com/vinaysimha/kernel-msm/commit/8ee2b9104fa56765320d4846086d91b8271f5609

dsi2hdmi operating temperature range is -10 to 85 deg C, we will
enable dsi2hdmi only when temperate in operating range otherwise will
disable the chip.


On Thu, Feb 21, 2019 at 11:25 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Thu, Feb 21, 2019 at 08:21:09PM +0530, Vinay Simha B N wrote:
> > hi,
> >
> > could you please suggest, how to export_symbol the tmp102 temp1_input, max
> > and max_hyst values to another kernel driver?
> >
> > We can acess the values
> > from filp_open("/sys/class/hwmon/hwmon1/temp1_input", O_RDONLY, 0); in
> > kernel space, but is there better apporach to access the values in the
> > kernel space.
> >
> There is no in-kernel API to do that, and I do not immediately see
> the purpose. Either case, accessing the sysfs attribute directly is
> as wrong as it can get, if for nothing else since there is no guarantee
> that this will always be the hwmon1 device.
>
> Can you explain what you are trying to do ?
>
> Thanks,
> Guenter



--
regards,
vinaysimha
