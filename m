Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC68E80AAD
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Sep 2023 14:05:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbjI0OFY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Sep 2023 10:05:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232051AbjI0OFX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Sep 2023 10:05:23 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E875FC
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Sep 2023 07:05:20 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b962c226ceso190158981fa.3
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Sep 2023 07:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695823519; x=1696428319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hHvUR0n4EwEOMV5of1rEk3gEaF0cxdFPl6HtMVDF9g=;
        b=rQsXaI80jmvpHELs2QWa9e93J11gYc1okeYxSekqEWMb5T70OzZL8eDWoGXfdObXOO
         VPtViHGo/dALr5X8eH8XJBRN04UjDdX7Bewfunpk/1Y7z8s5UyhUjv56S7dDz2Tz42r/
         mtDEDISBVSbA7Zu5yjNalYqYEn5GZpnYMpVat8P1yPUqFWfFmntVifiZw6vSkIKWLRET
         bGAvNyNaBVkqu+hi3STPSRGd7XLOfjTpQ0LXfHlAzLQaDUzrGW4LH0NurPXZEe5y4hUK
         Rw4NiPZXO8mQZ01XJEO2BYZgUZNZ+ZDgkgpQQRKVatMMHggEgTbVDoBZ+GBErSYK5PjY
         lsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695823519; x=1696428319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hHvUR0n4EwEOMV5of1rEk3gEaF0cxdFPl6HtMVDF9g=;
        b=rIdo6/pBgXbQg9xbs6IszSzVpOAR9k3zG2wEzvsvwtjXVhSy1XIirWNW+bwM5vyigJ
         chAUGkn/UrIgTAtS9G2ChkldO3AL73IDbGJou0a4lbC78wfo4ge1tRYaibMvEHUeYbOB
         teBEQta6vR8Yn+rRcwcb8tDFjHxdiVacicC4N8gVzP4KL4+WN9WKe1AaxSGzZq3D+nnl
         mugteigzt3sUbqk8uDZ/2HM+fLVs+xvwCK/3gI5VX3TTGHyEsqlForBYwQ+hmrm58Acn
         bDcJH+CJjJ55PbDCAThV5QUy/fhZ9M3S3QxdkcVieOsnEcEbfPDmHFkg2Qa4JnTuKcYs
         vCsQ==
X-Gm-Message-State: AOJu0YxjzgF3Ufc4WWBA9H3YagxST6fagJX9iC6lAT9rhwR+jqIoszA8
        mrmzaGjP5JVcZgftMrJVtrHzfc0w5Jp09zwWze+gzgYj39noSJLaxEQ=
X-Google-Smtp-Source: AGHT+IGyURsd0EeGPjEDXefgtQMh28AzFEh8FtUpw8FRGj6Ug6Jx5dKutZCzHJrNXhhHz7tjAg+oEEVkSLoheF/XMzY=
X-Received: by 2002:a2e:92d7:0:b0:2bc:c4af:36b7 with SMTP id
 k23-20020a2e92d7000000b002bcc4af36b7mr2178440ljh.39.1695823518581; Wed, 27
 Sep 2023 07:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230921-strncpy-drivers-hwmon-acpi_power_meter-c-v3-1-307552c6ec3f@google.com>
 <9837d8dd-d802-4d5d-bca7-6e029658ba76@roeck-us.net>
In-Reply-To: <9837d8dd-d802-4d5d-bca7-6e029658ba76@roeck-us.net>
From:   Justin Stitt <justinstitt@google.com>
Date:   Wed, 27 Sep 2023 23:05:07 +0900
Message-ID: <CAFhGd8rY5uTh+e0U8jG94dga6Acx5R1G+MKWt=LfD5orNNca+Q@mail.gmail.com>
Subject: Re: [PATCH v3] hwmon: refactor deprecated strncpy
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Sep 27, 2023 at 9:49=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On Thu, Sep 21, 2023 at 05:41:46AM +0000, Justin Stitt wrote:
> > `strncpy` is deprecated for use on NUL-terminated destination strings [=
1].
> >
> > Let's refactor this kcalloc() + strncpy() into a kmemdup_nul() which ha=
s
> > more obvious behavior and is less error prone.
> >
> > To avoid truncating the last byte supply `...length + 1` to
> > kmemdup_nul() as `element->string.length` does not account for the
> > trailing null as made obvious from it's definition (and associated
> > comment):
> > |       u32 length;   /* # of bytes in string, excluding trailing null =
*/
> >
> > ... this is precisely what the original kcalloc invocation did as well.
> >
> > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#st=
rncpy-on-nul-terminated-strings [1]
> > Link: https://github.com/KSPP/linux/issues/90
> > Cc: linux-hardening@vger.kernel.org
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
>
> I have multiple patches with the hwmon: prefix but no driver,
> like this one, suggesting the change is in the hwmon core,
> when in reality it is in some hwmon driver.
> I am not going to apply any of those, and I am not even going to
> look into them.

Whoops, I was using some tooling to auto-fetch prefixes and the style
of "xyz: (stuff in paren)" isn't always caught.

I will resend with a fixed subject line matching the appropriate driver.

>
> Guenter

Thanks
Justin
