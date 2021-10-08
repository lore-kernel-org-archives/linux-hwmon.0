Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA87C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Oct 2021 13:08:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89C1E61042
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Oct 2021 13:08:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241543AbhJHNKD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 8 Oct 2021 09:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241522AbhJHNKC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 8 Oct 2021 09:10:02 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA2AC061760
        for <linux-hwmon@vger.kernel.org>; Fri,  8 Oct 2021 06:08:06 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id b20so39635928lfv.3
        for <linux-hwmon@vger.kernel.org>; Fri, 08 Oct 2021 06:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LZ0YuII6022XmWR2aBHQEp9O8Cr/uOmN35lBiBjTAw8=;
        b=dK/SCa/aTRq38+aKyRi5kh3z9ROGnCnNdz3PgQDSv3X3O+n1oKs5Jo41UMeWAV9mc8
         iPzUj+kl9S3vz42QCyPJr6+m4uXpmb6ucup4mF1r+gWOGXBLKAFKRA5G17GY9v+ZruSg
         LUQobfv4fZS+YtnY2x7QQEo/IWVSPzlRtrCV084kyJKgCGERCS+arRragIVhGWwHL1Wl
         deZ3PVY3KPqJHygEszy1+svbHa7XRyeDjBCsDXM80aqgfhDGpoYVLC22FrEmx9f9Jfjr
         Qq848LfHXuFr6l4Wt4O5YvojGTkCgpvTObjM/deiRP3HgAfA+6+KegPc0yov7XqmdiDD
         yt3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LZ0YuII6022XmWR2aBHQEp9O8Cr/uOmN35lBiBjTAw8=;
        b=UqjbsMsn4B9poAi4CBAjdbWeECVm66YeGSKYXtjpt0AKgZncXkmpWsx5EBCR6v/rVX
         X3SWP/QNpGrQK+c+DThUmKU6qxrigrh3RC2vPBmwSKfNK6GDZ6Wv+xGXLN+IGxPh5pu0
         +DPMtSlFkZZESpQtV2wtZ06mqHmJcCI7/3jwVU9QOnRSleNZpCP18e3F2s6hWujJoInN
         FIoqXhORt8vSpk+gd1oNelwqWoA0sP+EDc7365Y6z5r1dBvgYvTL91CkT/7+8oxN7QOl
         AsMSPks1eOzGLiUOJeKHvc6Day6XyEBnf1UgOgMyOBbOjHIe3/YKk76yeKJpFwvUQ9HR
         Nocg==
X-Gm-Message-State: AOAM531J9faoVocxkG/PoqL5TkQawmI+59kBQnEOSz6dVaNs4+vYjMVJ
        qMNH6NGSfHC8Dyr5jpNs1cjPsIw6zGnjLT0MzJhAYw==
X-Google-Smtp-Source: ABdhPJx6fOBDOYeFN7nAZx26g7NM5ePjbl3SxlqSp+KL4I60dXzEcNDUaeVHuPI/S3dsvMBTo3Xeaf8EQ47u7op584s=
X-Received: by 2002:a05:651c:1792:: with SMTP id bn18mr3627038ljb.521.1633698483612;
 Fri, 08 Oct 2021 06:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210921004627.2786132-1-osk@google.com> <YUzzjYMwNKwMFGSr@robh.at.kernel.org>
 <CABoTLcRpSuUUu-x-S8yTLUJCiN4RERi2kd8XATP_n3ZTRpAWDg@mail.gmail.com> <CAL_JsqJ+hqKfLDzbMpzPks+wJaNuwU6kodqnqWjkOb8aDf92ZQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJ+hqKfLDzbMpzPks+wJaNuwU6kodqnqWjkOb8aDf92ZQ@mail.gmail.com>
From:   Oskar Senft <osk@google.com>
Date:   Fri, 8 Oct 2021 09:07:47 -0400
Message-ID: <CABoTLcTTphA4Kpi-qbpUkX4f_V4NjhDv3_vVk8UNgvWfnKVOYw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add nct7802 bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Rob

> > > > +            temperature-sensors {
> > > > +                ltd {
> > > > +                  status = "disabled";
> > >
> > > Don't show status in examples.
> > Hmm, ok. I found it useful to make clear that a sensor can be
> > disabled, but maybe that's just always the case?
>
> Yeah, this case is a bit special. The node not being present also disables it.
Oh, I didn't realize that a missing node defaults to "disabled". What
I want to achieve is that if a node is not present, we don't configure
it. The reason behind this is that the HW provides a mechanism to
configure itself at power-up from a connected EEPROM. In that case
we'd still want the list the nct7802 in the DTS, but without
configuration. This effectively is the current behavior.

From what I understand from [1] and follow-ups, having the extra
"temperature-sensors" level is actually not what we want here and I
proposed a different solution in [2].

On that background, I'm wondering how we could have compatibility with
the previous behavior, where the individual sensors were not listed,
and just defaulted to whatever the HW came up with, whether that was
power-on defaults or loaded from an EEPROM.

What the code currently does is to check for the presence of
"temperature-sensors" and only attempt to configure any of them if
that top level node exists. This enables backwards-compatibility.
Going forward, I would have done the same for sensor@X and only
explicitly enable / disable the sensor if the node is present. If it's
not present, I'd use the power-on / EEPROM-provided defaults.

Thanks
Oskar.

[1] https://lore.kernel.org/linux-hwmon/20210924114636.GB2694238@roeck-us.net/
[2] https://lore.kernel.org/linux-hwmon/CABoTLcQYHZbsgzXN7XXKQdDn8S-YsuE+ks9WShAEKcBJojEfcQ@mail.gmail.com/
