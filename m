Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2F9FA3742
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Oct 2022 11:46:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbiJaLq1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 31 Oct 2022 07:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231207AbiJaLqC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 Oct 2022 07:46:02 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 436C7F00B;
        Mon, 31 Oct 2022 04:45:47 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id z192so13413937yba.0;
        Mon, 31 Oct 2022 04:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSLIi/DN8vLaFa7kFWWB3sJRC2ihIsIpffXiaAfT4nE=;
        b=hdy5TVFEJ43D6GDWp9IgDFvJkttVVAq6n++DWvBrsOUFlEXDC9TtHXubmGbYl9w/OX
         w8GTyBHsefoVJKNHgp2Jd07HF3vsF1xRNHrDUlQA0lUvrOjGIVv/c6zVEjd86/S3nwXq
         0KGBGRzxyyT/r3V/NnyFK7j/2yQFcRG+Eo4mUmYQdgO1EVNfHnX/F1F1QtmxN57RU1Kg
         VWqhMQ7seZONlv8smFS8wdtKNPXTokGyP2L7f6easpC2t4vGZIciIvmr7EOJ3GB7R538
         omlFRIo7l4uPAv9xrXhazrMP6LrjK2jIvwdE2FXryeXe/080fbDPyQtaCiKfm4H3vmjt
         ceyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSLIi/DN8vLaFa7kFWWB3sJRC2ihIsIpffXiaAfT4nE=;
        b=BqQExVPmcUOdeRpk93FuVVFnHH3xxRH1lHFo7kEkMkg9ePRc9krut31hF7W5JcQKVS
         fR/GbiMtdcY2HQK2hKYdefiBEBYVsQ4p1cEmt6k/SrwrCF/3hF8+JXk+/DrgNxPVNDHS
         oVb5+dkjx00VWtlwViade9XHONmymq9gEkZ8US/+ohvxUaS05LvGtQ/jQTqJseMbRAyo
         RHf5S3t9wBcttGApB8Hh0eXj+IDr8bD5/i9DkcyL6EcqY/zoW8xma7JPMFCrfWSH5bhE
         raMILgcgs1nTV17AhZJV4olpg2SVcqLkhVctaYRC4q3okaups0z02BceAYh84Fd0Kzh1
         ti+A==
X-Gm-Message-State: ACrzQf1DJBf2s/gZHn2R9Am1dfnnoq/pqkkZEWHNAEejg3J1fAPWwEGv
        pQ2wnTWwRTyrBzAxYr6KEYmByg7fcxSNOk3JIio=
X-Google-Smtp-Source: AMsMyM7hlu5Jqzbt5KIHU38pm5ltgtJSll6em5d43eo+8W5QpGZxnEevrXoBJIZleUYF0hzWy79chujykdL/2mpsuWc=
X-Received: by 2002:a05:6902:70f:b0:6ca:7254:c2ea with SMTP id
 k15-20020a056902070f00b006ca7254c2eamr13379125ybt.476.1667216746485; Mon, 31
 Oct 2022 04:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221029225051.1171795-1-samsagax@gmail.com> <506a6e7f-4566-2dcf-37f3-0f41f4ce983b@roeck-us.net>
 <CABgtM3jk4wuEMA1NL+WTySowokRD3XqzdSAUbkQCuLreSrvaJg@mail.gmail.com> <c6c16bc6-d86b-84ca-e49a-0788f9c80006@roeck-us.net>
In-Reply-To: <c6c16bc6-d86b-84ca-e49a-0788f9c80006@roeck-us.net>
From:   Joaquin Aramendia <samsagax@gmail.com>
Date:   Mon, 31 Oct 2022 08:45:35 -0300
Message-ID: <CABgtM3g9_-hpDfdb=kDqOerQAj+kn3pEbOcvmG_Lve3ETAXFfA@mail.gmail.com>
Subject: Re: [PATCH] Add OneXPlayer mini AMD board driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     hdegoede@redhat.com, markgross@kernel.org, jdelvare@suse.com,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello again and thanks for the review. I submitted the patch again and
needs some polish before it can be accepted. I had one question left:

El dom, 30 oct 2022 a la(s) 00:24, Guenter Roeck (linux@roeck-us.net) escri=
bi=C3=B3:
>
> >>> +/* Callbacks for hwmon interface */
> >>> +static umode_t oxp_ec_hwmon_is_visible(const void *drvdata,
> >>> +                                     enum hwmon_sensor_types type, u=
32 attr, int channel)
> >>> +{
> >>> +     switch (type) {
> >>> +             case hwmon_fan:
> >>> +                     return S_IRUGO;
> >>> +             case hwmon_pwm:
> >>> +                     return S_IRUGO | S_IWUSR;
> >>
> >> Please use 0444 and 0644 directly. Checkpatch will tell.
> >
> > Oh. I did as the documentation suggested. I must confess I didn't run
> > checkpatch, will don in the next submission.
> >
>
> That is long ago. Octal values are and have been preferred for
> several years.

I've read this form here[1]. Should I send a patch to the
Documentation to reflect the preference?

[1]https://www.kernel.org/doc/html/latest/hwmon/hwmon-kernel-api.html#drive=
r-callback-functions
