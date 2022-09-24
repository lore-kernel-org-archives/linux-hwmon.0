Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB8BC07E9D
	for <linux-hwmon@archiver.kernel.org>; Sat, 24 Sep 2022 00:20:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233088AbiIXAU3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 23 Sep 2022 20:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233287AbiIXATm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 23 Sep 2022 20:19:42 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC69B13B024
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Sep 2022 17:19:10 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id nb11so3751514ejc.5
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Sep 2022 17:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7iVjKnBm4ihEUPNMd67gs7ATDznXmjm80xqccgKEpHI=;
        b=Pv3DzxhVBptLau4MiqzLqqzQk25sko6qHEK4+5z9i69UhSO8WNnp1G4tdZLSeUHGna
         IftJF/O0O8eZ/kVB51nrDBLKcJ6Qf8IHP1+jTakXUvDpiE1YbVM4wR/Lqnu6PiY1sXiu
         bXD0ytVw1VfinNSIgnjOlGSroT+MLhUDoGVhUFbEMNEJr2YwyfrjLMhzu3kFBBhpvl71
         06oe7iagNNvOxdD+8rfPBc4wIVXxRrybRb5DW2gUnuH619honrSGiKBffNy/9JaMaXcO
         w4UIrWJ8tlUKRREew/0mIYsxDqt8uvbtsnqqpGsveE3UpAg8fb0QdwgfyGjqLdDoHb/+
         0YSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7iVjKnBm4ihEUPNMd67gs7ATDznXmjm80xqccgKEpHI=;
        b=WInrT3UztOzG5z9jCAveGEgAw5bktdmBUYK7nMY+0RkrrkwuvffBH/R5CI2R0HhBHo
         GlBClwlpNKwZGoFbrBlAjUxOCi1XuWeIAiaqN/Blq5H88UaJOpetluzy/0BfksGa2r+A
         bJHckamAetkFJkXKBzfrP3RNgpJgi1kkefRCVZ7CzSid3kxJPvLiiQoVdAi5fTxLiyA2
         vWYy32BBB8Y4YLmpKWMjltfMFW1kjtCjIbLZH3UPlrvNhIDTgsdr4yju63g0uvSYYkfF
         ASsW3C6Z170SFMdVQ969bmoUoSCBDaIPg+nap68a3LdOYR9hKJ/4esmwlq52jurNcynm
         1sfg==
X-Gm-Message-State: ACrzQf1x7CoHl1vLDJcsCipArhtyeSN0KRajaJBwHzWKEnqJD2ypBFCE
        ipfv/hHD7diR0xlSsSJWRNlDrN6JwsqGZVEDPE0LFVvaJCE=
X-Google-Smtp-Source: AMsMyM5TOEPxA2HfNFyDBB7fffPKCy0Y/h8Q7bo4wTSJvnoT5Ve1oJAyhGgftf6t92jX4ZLS3F3Bv3u03NCdgBTA4fI=
X-Received: by 2002:a17:907:a088:b0:780:da07:9df3 with SMTP id
 hu8-20020a170907a08800b00780da079df3mr9260551ejc.252.1663978748944; Fri, 23
 Sep 2022 17:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220922234348.1714344-1-floridsleeves@gmail.com> <33a4f1d9-d74c-5309-cc64-bb95a64d60e2@roeck-us.net>
In-Reply-To: <33a4f1d9-d74c-5309-cc64-bb95a64d60e2@roeck-us.net>
From:   Li Zhong <floridsleeves@gmail.com>
Date:   Fri, 23 Sep 2022 17:18:58 -0700
Message-ID: <CAMEuxRpHENYTRYvJizY_zBfBSkLO7fpywp6TyzLt4cF_dwbn5Q@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/hwmon/adm9240: fix data race in adm9240_fan_read
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 22, 2022 at 4:50 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 9/22/22 16:43, Li Zhong wrote:
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
> > v2: add mutex_unlock() in error handling
> >
> >   drivers/hwmon/adm9240.c | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
> > index 483cd757abd3..d58999e186dc 100644
> > --- a/drivers/hwmon/adm9240.c
> > +++ b/drivers/hwmon/adm9240.c
> > @@ -501,16 +501,22 @@ static int adm9240_fan_read(struct device *dev, u32 attr, int channel, long *val
> >
> >       switch (attr) {
> >       case hwmon_fan_input:
> > +             mutex_lock(&data->update_lock);
> >               err = regmap_read(data->regmap, ADM9240_REG_FAN(channel), &regval);
> > -             if (err < 0)
> > +             if (err < 0) {
> > +                     mutex_unlock(&data->update_lock);
> >                       return err;
> > +             }
> >               if (regval == 255 && data->fan_div[channel] < 3) {
> >                       /* adjust fan clock divider on overflow */
> >                       err = adm9240_write_fan_div(data, channel,
> >                                                   ++data->fan_div[channel]);
> > -                     if (err)
> > +                     if (err) {
> > +                             mutex_unlock(&data->update_lock);
> >                               return err;
> > +                     }
> >               }
> > +             mutex_unlock(&data->update_lock);
> >               *val = FAN_FROM_REG(regval, BIT(data->fan_div[channel]));
>
> Unfortunately, this is still racy. All accesses to data->fan_div[channel]
> need to be included in the lock.
>
> Thanks,
> Guenter
>
> >               break;
> >       case hwmon_fan_div:
>

Updated in v3 patch. Sorry for the carelessness. Thanks for your suggestions.
