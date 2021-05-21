Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B37C433B4
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 May 2021 13:21:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C15360FDC
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 May 2021 13:21:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233581AbhEUNXD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 May 2021 09:23:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233797AbhEUNWp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 May 2021 09:22:45 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1258C0613ED
        for <linux-hwmon@vger.kernel.org>; Fri, 21 May 2021 06:21:17 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id h15so15395573ilr.2
        for <linux-hwmon@vger.kernel.org>; Fri, 21 May 2021 06:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xbVslEDCXZqr9GQsPgesZninZAO5fJ8cP+O7eR+D2ow=;
        b=WXHL18usQi6/X1DY0P70c46qL5S/W0CO4eAaoTcpGTnbT5adPqyBw9vIAENH2Q090m
         2sWijX15tu2g5GCoRwDDMioK+ZndWOGpyIhffX+SG9wieUqydJufYiPiq0UQr7/UXQVd
         VN6q6iHizBjg56hrlAqExOTzUdMbT1T8+T5O+1G9dapo9RzYr6fPCTUeIEx1iLiitNt0
         Xjzc4bmq/BbEiwDym1y+pvyt0FsoqE1hCYAu/MRnE/H5tHxyrXUVwGskWJ+uD1gZ+gv/
         2L8Xb2tO0Fsvep+3LTZBYZnuqz5JRL33oHvlZiNNhVP8Zg4cHALC4U9zTMN01mdcLV9L
         wHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xbVslEDCXZqr9GQsPgesZninZAO5fJ8cP+O7eR+D2ow=;
        b=Q5Rx/7+TSEl7B2f2BRScEOw7ujzWZhthODuuD2EZfxUn4Y+9aiAjeE8veXEIm60tG4
         gnSnbXac02LwQxchmsGiTBGBb9K5bIKuPtbwwpGom18QOtL5Z3XiNAz/ACMnlM19IYq9
         /Zxqxi+2Ud3QzQwB4FhkXeeSEu+Cj62Zvdzircdi1u7uCUr/9ykp7exM2doD5xSFCUnG
         Xw4crLFYOoGUF0afC1on5am/GHoFTwETnsluOdhoCqMD/Y+pVmpHQQPAZWWAC7cxvNAT
         fU7BQNIaD//5n5Eb9tjGtUg/qUrM3l6lss1KMuk2BJ8pAkuDORhKjGa8aYz18uyQt0/l
         nkbg==
X-Gm-Message-State: AOAM5316z7wWGxf5IJqX+RPKATIgl1sRFpym2IN8dT/Iz7f+02crcKu9
        S8RlT/7eww5ChB/+ZO5RmMJKJqTK7aUXQManL4iyOA==
X-Google-Smtp-Source: ABdhPJyYDXBEABM+ZMXi1dpuXIBZ6wsLpvjkTRRh4YyhYrRftimgUINWny+L2YfAziSbR/6/cYnnkFB4d9ujQ/51so4=
X-Received: by 2002:a05:6e02:671:: with SMTP id l17mr11894813ilt.267.1621603276872;
 Fri, 21 May 2021 06:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210430123511.116057-1-robert.marko@sartura.hr>
 <20210430123511.116057-3-robert.marko@sartura.hr> <10b67a4dce693f013eccfd6f46ecb4c4@walle.cc>
In-Reply-To: <10b67a4dce693f013eccfd6f46ecb4c4@walle.cc>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Fri, 21 May 2021 15:21:06 +0200
Message-ID: <CA+HBbNHikM_8sCrc9FM-z7nUXVLwjpZ=Lg7fKWGbgWGBrfciOg@mail.gmail.com>
Subject: Re: [PATCH 3/6] gpio: Add Delta TN48M CPLD GPIO driver
To:     Michael Walle <michael@walle.cc>
Cc:     Lee Jones <lee.jones@linaro.org>, robh+dt@kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com, jdelvare@suse.com,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Luka Perkov <luka.perkov@sartura.hr>,
        jmp@epiphyte.org, Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, May 6, 2021 at 6:38 PM Michael Walle <michael@walle.cc> wrote:
>
> Am 2021-04-30 14:35, schrieb Robert Marko:
> > Delta TN48M CPLD is used as a GPIO expander for the SFP GPIOs.
> >
> > It is a mix of input only and output only pins.
> >
> > Since there is no logical GPIO numbering arbitrary one is used
> > along dt-bindings to make it humanly readable.
>
> Can gpio/gpio-regmap.c be used here? See gpio/gpio-sl28cpld.c
> for an example.

I suppose it can be used, I need to look into it more to see how could
translation to register and mask be done with it.

I have adapted the driver to work with simple I2C MFD so far.

It still leaves me with a finding the logical way to number the GPIO-s.

Robert
>
> -michael



--
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
