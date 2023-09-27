Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C261E80AAD
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Sep 2023 14:07:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbjI0OHF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Sep 2023 10:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232033AbjI0OHF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Sep 2023 10:07:05 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE0312A
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Sep 2023 07:07:03 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5046bf37ec1so8727057e87.1
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Sep 2023 07:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695823622; x=1696428422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PxIurClC31dJCUYmGw9WZVx191Ab8aKe7tsScLLtFLQ=;
        b=el1dcfJH4bZL+04ffjF9IXBrlyKk6WiVCjvvZjIe7g/IUYxILmnN9AhJUpzQovqakj
         0wQ0Lo2awiapze8GFiFPzDxYvuhl4miC1HifdhfP88Fs1lMwsgz7EIfxWRqAPLhPL0jj
         0e0eFTqLgwZfmScBNbDzjl9hnXeKCNyDEKbvdWgsvtfgFhOZgx+3696YK5u1oYGLWWJX
         T/irl0ZhNfTNfpaHitxRi+yYfbfpU4IWQ6D4Bqdw+uojWyJwxTzCzYoyfo0bvNn6zv01
         j7F8ERCT0XJ0BgV/d9U1znbtTEKFWj/ZunCuEAyzgNU+OJvoWP0ZBMzy8bSLYll1Wm82
         sw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695823622; x=1696428422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxIurClC31dJCUYmGw9WZVx191Ab8aKe7tsScLLtFLQ=;
        b=hD+ZmAVRcSyGKpzTkvicSyW382y/SGCg6msjTj18IH/AMjUyF5Eh24RSupcjzrAG+N
         J0L9SpqiWZl2CxCXbahKHvUYnzRX4yQ7nQteCv/DLHZmABph9PYQhgK/VnehTmLncpTq
         zsFLTaX+6JgcoRHsQLaVGzbAzadhKxfExWXLKefSNo9m+zclKAMbjTDRxyJmRfUGjWl5
         JdX+wfDddyM9ItZcD4zPAmUfVtIrejhTw9vMN4RbDUYMJurSxvh4qY+igJEZ+OK4OHyP
         QUf3vTFtIMjMheV9VIBYzf/vfxKhI06EFt19hDh1fGBi5Kxm9t7RbUWCT+wvb65Hcnre
         5tUA==
X-Gm-Message-State: AOJu0Ywp/pjoNVMo1w/iw/YWAhfN30xVaknRYmYQHJ1lXyXoxXMteTXo
        lo6ugXutJZJkfdbBuQeR2Mu0Ya64ykZfcB9L8af1dw==
X-Google-Smtp-Source: AGHT+IED+ggK1hsHs8LtpMRs/O+b9QkJMT3WVY71shk1T13cnA6p8SXWujCQ9gCs5OsrcSkNfrgFvf/okbot1nijUQ4=
X-Received: by 2002:a19:ee0c:0:b0:500:ac71:f26a with SMTP id
 g12-20020a19ee0c000000b00500ac71f26amr1825911lfb.57.1695823621877; Wed, 27
 Sep 2023 07:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230921-strncpy-drivers-hwmon-acpi_power_meter-c-v3-1-307552c6ec3f@google.com>
 <9837d8dd-d802-4d5d-bca7-6e029658ba76@roeck-us.net> <CAFhGd8rY5uTh+e0U8jG94dga6Acx5R1G+MKWt=LfD5orNNca+Q@mail.gmail.com>
In-Reply-To: <CAFhGd8rY5uTh+e0U8jG94dga6Acx5R1G+MKWt=LfD5orNNca+Q@mail.gmail.com>
From:   Justin Stitt <justinstitt@google.com>
Date:   Wed, 27 Sep 2023 23:06:51 +0900
Message-ID: <CAFhGd8om4HrsSFKXYecpLxWoYc3WiVBO8jfKP-9x4ToiCYEU_g@mail.gmail.com>
Subject: Re: [PATCH v3] hwmon: refactor deprecated strncpy
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Sep 27, 2023 at 11:05=E2=80=AFPM Justin Stitt <justinstitt@google.c=
om> wrote:
>
> On Wed, Sep 27, 2023 at 9:49=E2=80=AFPM Guenter Roeck <linux@roeck-us.net=
> wrote:
> >
> > On Thu, Sep 21, 2023 at 05:41:46AM +0000, Justin Stitt wrote:
> > > `strncpy` is deprecated for use on NUL-terminated destination strings=
 [1].
> > >
> > > Let's refactor this kcalloc() + strncpy() into a kmemdup_nul() which =
has
> > > more obvious behavior and is less error prone.
> > >
> > > To avoid truncating the last byte supply `...length + 1` to
> > > kmemdup_nul() as `element->string.length` does not account for the
> > > trailing null as made obvious from it's definition (and associated
> > > comment):
> > > |       u32 length;   /* # of bytes in string, excluding trailing nul=
l */
> > >
> > > ... this is precisely what the original kcalloc invocation did as wel=
l.
> > >
> > > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#=
strncpy-on-nul-terminated-strings [1]
> > > Link: https://github.com/KSPP/linux/issues/90
> > > Cc: linux-hardening@vger.kernel.org
> > > Signed-off-by: Justin Stitt <justinstitt@google.com>
> >
> > I have multiple patches with the hwmon: prefix but no driver,
> > like this one, suggesting the change is in the hwmon core,
> > when in reality it is in some hwmon driver.
> > I am not going to apply any of those, and I am not even going to
> > look into them.
>
> Whoops, I was using some tooling to auto-fetch prefixes and the style
> of "xyz: (stuff in paren)" isn't always caught.
>
> I will resend with a fixed subject line matching the appropriate driver.

Erhm, In this case I seem to have caught the mistake over in [v5].
>
> >
> > Guenter
>
> Thanks
> Justin

[v5]: https://lore.kernel.org/all/20230926-strncpy-drivers-hwmon-acpi_power=
_meter-c-v5-1-3fc31a9daf99@google.com/
