Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09095C4332F
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Oct 2021 12:56:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E50E760E95
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Oct 2021 12:56:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242155AbhJHM6A (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 8 Oct 2021 08:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241537AbhJHM57 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 8 Oct 2021 08:57:59 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB2AC061570
        for <linux-hwmon@vger.kernel.org>; Fri,  8 Oct 2021 05:56:04 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id r19so37084032lfe.10
        for <linux-hwmon@vger.kernel.org>; Fri, 08 Oct 2021 05:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SxcONP4zerIk6DCHmdX7lnhsoemICqZWD19R4vNHLps=;
        b=UEYzs6P1v2evhYYtpcW7MzRTaa3q89FiXx0thtHS9FTnuHVxIC0cXx1fmTurIta5tn
         aIWVGHR9wqZt2g/0u+Fec8/iGJAodJ5im71oqR7kHabQ0srtJnUpkj9CFkfnXfsqdZ8/
         bM9aPqw9U8Lg51PmqCfdDcRaO0HDe3pbpmwBHCH0N6Glw4mwox0INYSvvatcgwojlozf
         QMkQovKh1NSr3aX+dCv4aYAZZfEmWuJIuEHF07f4okrZ7A8Zeb7rJMztKfh9at/Q9Lc8
         KmtOdAjj5p0Ziz+CNNd3Xh9kyTo+/aAeBZpW712RvajjhtXnJjCDrKUK9ux+0QpaS1BJ
         p+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SxcONP4zerIk6DCHmdX7lnhsoemICqZWD19R4vNHLps=;
        b=xBUnCS1E+IWsZD+nmzmADEWVGkzUjHln0akiPFo/S1ihxpkFpfcvjZ+E6bzz5yzC26
         C8mRPOpAzlcolf2LUiGMOu8iWsTmgNeRUgieKWmwdXUW2L/UGU+b06/rtChigabQBbNS
         pNj4hIv6ECjXTT4cMLvyx+Q6dJXro0BOZyYLrup9k7m6EqIU7MssDOWOlUuLJayuBemI
         BuQzJSKR/9DIhAkWgHdSol2zdVF6dG/C78zMXUSXU18idOYKmV/9DvaGZWULjScx3+2y
         Ypmw1oiA5CSWdcgGDp8MYXIq6nxvGK1S+XZJYyJXIvbHAiaXaG/kfPmvUIXpvh8V18YQ
         ISfA==
X-Gm-Message-State: AOAM532uM5gx0XhzUtMVv9RVmGi64XxRublDzAVW38cnngMGm6UHDHot
        ZwbIOSfTFAksMd1KB/afoHDWszTEiRPUFRpfrMlTKA==
X-Google-Smtp-Source: ABdhPJz8exzMlBq2sC2QvF9flm6Pf+q5TB7ewUEISX8lXZx6bpyOvZDKfO2lLjVC/2EVpA9JxRxqcUlKk9QBF2oGF5U=
X-Received: by 2002:a05:6512:3e1e:: with SMTP id i30mr10142610lfv.273.1633697760433;
 Fri, 08 Oct 2021 05:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <12984255aac11a3edfc0e6278e1a1cac70ce97ec.1631021349.git.krzysztof.adamski@nokia.com>
 <YUkKCe7845uCqoy5@robh.at.kernel.org> <20210921125831.GB1864238@roeck-us.net>
 <CAL_JsqLo=inkKVKSU8N=_h90RfpDk6NNWPKdKyTXh-VvqXDCag@mail.gmail.com>
 <20210921205247.GA2363535@roeck-us.net> <CAL_Jsq+NXuF+F7OE3vyEbTUj6sxyMHVWHXbCuPPoFaKjpyZREQ@mail.gmail.com>
 <20210924002951.GA3027924@roeck-us.net> <YU2D7L7QMgCJZUeb@localhost.localdomain>
 <20210924114636.GB2694238@roeck-us.net> <CABoTLcQYHZbsgzXN7XXKQdDn8S-YsuE+ks9WShAEKcBJojEfcQ@mail.gmail.com>
 <20210925132631.GB1240690@roeck-us.net>
In-Reply-To: <20210925132631.GB1240690@roeck-us.net>
From:   Oskar Senft <osk@google.com>
Date:   Fri, 8 Oct 2021 08:55:44 -0400
Message-ID: <CABoTLcTKAn5TVs3wadZQiheeKA5kUGBtMRbFWprRWoqRJV=J9Q@mail.gmail.com>
Subject: Re: [PATCH 8/8] dt-bindings: hwmon: allow specifying channels for tmp421
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Rob Herring <robh@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter

> Numbering in sysfs is not relevant here; the index should always start with 0.
Ok, in that case, I'll encode LTD as @0 and RTD1..3 as @1..@3.

> > In this example, RTD1, RTD2 and LTD would be temperature sensors and
> > RTD3 would be a voltage sensor.
> >
> > Would that make more sense? Is the use of strings acceptable?
> >
> I don't think so. I am quite sure that rtd3 is still a temperature,
> and I am not sure if other sensor types on that chip may need dt
> configuration.
Reading the existing nct7802_in_is_visible() and
nct7802_temp_is_visible() [1] in I read that RTD3 could either be
voltage or temperature.

I'll go ahead and propose another patch version on [3] for that.

[1] https://github.com/torvalds/linux/blob/master/drivers/hwmon/nct7802.c#L778
[2] https://github.com/torvalds/linux/blob/master/drivers/hwmon/nct7802.c#L679
[3] https://lore.kernel.org/all/20210921004627.2786132-1-osk@google.com/
