Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3C5ECAAD8
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Sep 2022 23:47:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiIVXrp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Sep 2022 19:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiIVXro (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Sep 2022 19:47:44 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EDACED5FC
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 16:47:42 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id w28so15797516edi.7
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 16:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=jLtPkCSXpaN3mp1awsfDGr5SKBMgkxFQWI9RRCG1Two=;
        b=mVd4nz1PZPtw+Xc6tCaDkvEPMgEJgq3zZvfC2TZEescZzRItQ21cf5YGyuje2/a8fW
         Ivc0t+/PX1qNCuh8WJAY/4/5B/FWKK1QaImukGUjfeOSWKHsfnlD7N9fLOsewcQtVT5Q
         IUu/kHNXm3sT0nA792C8ygpDIQfhh8tpfu3hFRshQ54gQHgc3KnbVWddKp5NPIOW2c+P
         zLtWuO2BqnCkGiNuuujef6Z3uccoWyp3LaRtSQI7goXgCy+IsWSFPvH9+xmkgUb+ZLXb
         d8y8hAKI7KpMZrZ1ml/KCIh36QmAuQc2t+5uMwV/lbb3Z6jyNzqstVf57zEHk9oDjjO9
         wipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=jLtPkCSXpaN3mp1awsfDGr5SKBMgkxFQWI9RRCG1Two=;
        b=JXSvCBk8e2ZEQcJLeNr8MJnF7NEZnDHkbA9j+s3XEveiiS6pRqpkOcq3QdwnlSxn+o
         uQEOVoXi7h/4lbrhaBAPjg78xMoizN925sOMezOc9VtMNMV7C2wRfsbgcrT2+yP07JO3
         lQO3vPkP0itB5SpK2HXqxmcIFVF4HTmpmr9GxJ6yCh+057lBEkLYVwW18mviOTPvlAnC
         zdWvif3ofiXxCyDEGruoLxg4Vsal7Ay0fC6RT75kJtN+UZIfQvNKPOZf1GI2YHsYM6zv
         8mbja5aAz2jWXye5PYMus7FoAIiTT+SOwOop34J7LO2KhgfUQHJ0syz2zu/Eq0QX6Yxn
         Kuwg==
X-Gm-Message-State: ACrzQf1PcRpbAHcAbWz32DIOASaiKWRdP/T7WN2yVm8pCsIjcRG4ORpC
        FXGOpSDQUPcv1JYZBss88ccfbiqHlNbYge26B4PcC6EVyds=
X-Google-Smtp-Source: AMsMyM6Y+cXa+DkcRwIp7x39+KOLpMzvWKC0raMcKftQJXi3vJrW3DOXSe8CWtXLLYuhl4jpyKMM/I6nVZg4+RD5XxM=
X-Received: by 2002:aa7:c0c5:0:b0:453:9a23:a0cd with SMTP id
 j5-20020aa7c0c5000000b004539a23a0cdmr5625773edp.286.1663890461016; Thu, 22
 Sep 2022 16:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220922233356.1712262-1-floridsleeves@gmail.com> <a18fef57-7f12-da67-4334-fd89f80696d6@roeck-us.net>
In-Reply-To: <a18fef57-7f12-da67-4334-fd89f80696d6@roeck-us.net>
From:   Li Zhong <floridsleeves@gmail.com>
Date:   Thu, 22 Sep 2022 16:47:31 -0700
Message-ID: <CAMEuxRpssVmP2CXQWEH8SmKMsHnF=37zn6MxNG89tWrpY_ZKoA@mail.gmail.com>
Subject: Re: [PATCH v1] drivers/hwmon/adm9240: fix data race in adm9240_fan_read
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 22, 2022 at 4:45 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 9/22/22 16:33, Li Zhong wrote:
> > In
> > adm9240_read()
> >    adm9240_fan_read()
> >      adm9240_write_fan_div(),
> >
> > it assumes that the caller of adm9240_write_fan_div() must hold
> > data->update_lock. Otherwise, it may cause data races when data is
> > updated by other threads.
> >
> > Signed-off-by: Li Zhong <floridsleeves@gmail.com>
> > ---
> >   drivers/hwmon/adm9240.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
> > index 483cd757abd3..d93ae3147994 100644
> > --- a/drivers/hwmon/adm9240.c
> > +++ b/drivers/hwmon/adm9240.c
> > @@ -501,6 +501,7 @@ static int adm9240_fan_read(struct device *dev, u32 attr, int channel, long *val
> >
> >       switch (attr) {
> >       case hwmon_fan_input:
> > +             mutex_lock(&data->update_lock);
> >               err = regmap_read(data->regmap, ADM9240_REG_FAN(channel), &regval);
> >               if (err < 0)
> >                       return err;
>
> The mutex needs to be released here.
>
> > @@ -511,6 +512,7 @@ static int adm9240_fan_read(struct device *dev, u32 attr, int channel, long *val
> >                       if (err)
> >                               return err;
> >               }
> > +             mutex_unlock(&data->update_lock);
> >               *val = FAN_FROM_REG(regval, BIT(data->fan_div[channel]));
> >               break;
> >       case hwmon_fan_div:
>

Thanks. Fixed in v2 patch.
