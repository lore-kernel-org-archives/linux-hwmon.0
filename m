Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E55C0015E
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Aug 2023 18:46:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbjHASqp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Aug 2023 14:46:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232027AbjHASqi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 Aug 2023 14:46:38 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D3A2682
        for <linux-hwmon@vger.kernel.org>; Tue,  1 Aug 2023 11:46:16 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-686f94328a4so88487b3a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Aug 2023 11:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1690915575; x=1691520375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kvbZ9yYuWoTSFKJEhKENxSCBKtYpxpK0EzXBfLVY1p0=;
        b=IRoyV4Ead+c/d0ks99Zg14YSdO0tXd9vDFI5zWCjNpslgPTEqbT/ERBlexp7Q/JUUA
         jqDuqlMcyQ/nTpjEo/dQrnCBIwPk8V5i5hq3sMJxHatN1C99Z1yggSsvw7u+RwJLoIFO
         BUp5lZMfwE7b4BXasRkBB5pG83fbHRP8c13xQJEsMDQOlZ8D4GrW/wB4yixSGwfFQeBH
         Hy6JMROsMrIzoKN8QS9Z6/zQAOZTfLZPigos5R1dJFfb+DLxLT3cJHesifEklP3RzZAW
         n4b4fQJeBkaVEyNA7qedDXw1aOR4HZEV7UljyvTmgEGhHhbsLi8d+A/+rBY4ETcDyFBk
         BZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690915575; x=1691520375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvbZ9yYuWoTSFKJEhKENxSCBKtYpxpK0EzXBfLVY1p0=;
        b=VKDm7l4GNLO0SVQ5VikeE1ZgID8Zm9j7sMYRSWAllpK0RrkNu4HefjIU0YAFRSHq9T
         Kuxor98/v59VPd9BJS6szEiOcebodGEekQAqaInAJXsIgnmyD/kal1b/1ERE/aUahsVy
         YTa13vHFc1BWYy7eFl22xcQ1VBLKI9SWFT7xREA4+7nZ5VfLsNpQKs7La98yoh8z5rEo
         /tO25uyFFq4JGG4P9zQWIDatCJTZHsKV3DulQ+SSuGpXLAttAlPxyO6mRFe1HuepAI21
         X5EC4D7gxJVf9SzDkr/IehwTNckbBafJ7QdyN+iq87iCVgoDf2y2aZH8yuEldiR892YI
         UHWw==
X-Gm-Message-State: ABy/qLaSeOxTFOMTCNbaN4goStg6vaRp0CtxGzNRPhyiQUecKMKVAcZW
        om9GfKJydLDnR94vEphA3sU4Te0rNggwTnhwSPqj/fD/Trtc7RSkoxDZ0Q==
X-Google-Smtp-Source: APBJJlGn2yOBxuyGstntxTVsDJptbHmBTnZxJFLFSa58BxRZujPCSMKq7eDJRr06xgq825y3alknqiVR75AV0LTwJZ4=
X-Received: by 2002:a17:90b:23ce:b0:262:e589:678f with SMTP id
 md14-20020a17090b23ce00b00262e589678fmr17592816pjb.10.1690915574722; Tue, 01
 Aug 2023 11:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230727091358.3274620-1-Naresh.Solanki@9elements.com>
 <20230727091358.3274620-2-Naresh.Solanki@9elements.com> <41a8ae4b-0f96-9f26-f25b-b1554b2695d6@roeck-us.net>
 <CABqG17jKoJ8FJdA-vpX8uda9yi_ir3f2FxFAiE7GTaVM7Mb2aA@mail.gmail.com> <b4097ed6-95d6-b11b-9c9e-edd6e8c51d00@roeck-us.net>
In-Reply-To: <b4097ed6-95d6-b11b-9c9e-edd6e8c51d00@roeck-us.net>
From:   Naresh Solanki <naresh.solanki@9elements.com>
Date:   Wed, 2 Aug 2023 00:16:04 +0530
Message-ID: <CABqG17iAsx2nysBSX10PTCK=fTpvaz2456a-s6CBwQjuJduWQw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/tda38640) Add workaround for bug in
 SVID mode
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>,
        krzysztof.kozlowski+dt@linaro.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

>
> On 8/1/23 05:34, Naresh Solanki wrote:
>
> [ ... ]
>
> >>> +     if (IS_ENABLED(CONFIG_SENSORS_TDA38640_REGULATOR) || svid) {
> >>
> >> If you hide this behind IS_ENABLED(CONFIG_SENSORS_TDA38640_REGULATOR), reading
> >> svid outside the if() statement has no value.
> > svid mode check is needed only when regulator is enabled for on/off
> > control later.
> > Will align the code such that if svid_mode check is done only when
> > REGULATOR config is enabled
> > & if it is in svid mode then apply the WA.
> >
> >>
> >>> +             /*
> >>> +              * Apply ON_OFF_CONFIG workaround as enabling the regulator using the
> >>> +              * OPERATION register doesn't work in SVID mode.
> >>> +              *
> >>> +              * One should configure PMBUS_ON_OFF_CONFIG here, but
> >>> +              * PB_ON_OFF_CONFIG_POWERUP_CONTROL and PB_ON_OFF_CONFIG_EN_PIN_REQ
> >>> +              * are ignored by the device.
> >>> +              * Only PB_ON_OFF_CONFIG_POLARITY_HIGH has an effect.
> >>
> >> Hmm, maybe I start to understand. This is really weird, since it changes
> >> the polarity of the EN input pin, effectively reverting its value.
> >> In other words, what really happens is that it is not possible to disable
> >> the chip with PMBUS_ON_OFF_CONFIG in SVID mode, and that reverting
> >> the EN pin polarity effectively simulates turning the chip on or off by
> >> software. Maybe software enable is disabled on purpose in VID mode.
> >> Is that really a bug or is it a feature, and is it really a good idea to
> >> override it ?
> > By design, SVID mode only has HW control enabled.
> > This was with the assumption that PGOOD will be used for controlling
> > Enable of another rail in Hardware.
> >
> > Since my use case needs the complete PMBUS based control,
> > EN pin polarity flipping can be used for controlling output.
> >
>
> So, effectively, this is not really a bug. It is working around chip functionality.
>
> That means we can not just enable this unconditionally in SVID mode after all.
> Sorry, but it has to be configurable after all, with appropriate explanation.
By 'configurable' you mean add a dt-property like 'en-svid-control' to have this
enabled ?

Regards,
Naresh
>
> Guenter
>
> >>
> >> AN_2203_PL12_2204_184108 might really help here.
> >>
> >> Guenter
> >>
> >>> +              */
> >>> +             data->info.read_byte_data = tda38640_read_byte_data;
> >>> +             data->info.write_byte_data = tda38640_write_byte_data;
> >>> +     }
> >>> +     return pmbus_do_probe(client, &data->info);
> >>>    }
> >>>
> >>>    static const struct i2c_device_id tda38640_id[] = {
> >>
>
