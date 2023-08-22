Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A51BEE4993
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Aug 2023 09:02:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234179AbjHVJCx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Aug 2023 05:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234174AbjHVJCq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Aug 2023 05:02:46 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDFE7CC8
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Aug 2023 02:02:42 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bf7423ef3eso13172745ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Aug 2023 02:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1692694962; x=1693299762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jYslESWmMQ4K7vL4A0BMOOm6rNRmZOTpHTitLw9DHqU=;
        b=IZpmDu44ZxrJ28gkaSTau6rtcq4Mn0RS1cPgOg/yZQpFy1RSpxwNPef21oo3JoQHAy
         mktU0yR3mPGt69oSav3EI+zYvaUCJyUxEhIpYZv7LQHGzOkgARKIJ+Hpeeli4uONq5hl
         YFJ8r/mj+TUMAhEvLErkjEm9/qyu2UVplM7aCP6AD+AFhxT0iUjCxxTjd5CE3DHqoYsb
         wD395ozmg2i80QGYoh4P2kuABNKnixmHgct1mEDkzfC3WTVQkQhNLeKA7j5AbbsleA64
         bn1xODYGm/1yLrNSlhUj/tyurEis8l24M5LG5h9EZPpxFywQBvk80TmlHfZPiQtsEB/S
         sEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692694962; x=1693299762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jYslESWmMQ4K7vL4A0BMOOm6rNRmZOTpHTitLw9DHqU=;
        b=YaFPok0fpp0wBoIsJa1XAZH4jpSbEGdo/IuiMw4wfEOTLdaq+Sg9bnDrMdD04m1t4K
         JtELSth/UMcYgKsmv2bm2c9HYbbCmub38zKIzK1AEYIab1kRxY5ERcL+rUcpKjEMM4iW
         aD3QjCzg4OAZartc07dfBD0KofD+rxjsDs9Zf8659e9g4dbGPIIrh9YiaIRKqEGRbMlQ
         eup1LZfpCoOjn9F/4f9x5etH7uze3puvXmBm2G2FoIZgw5jegTKdZc83AhcToaiaiXRh
         8t6nnbC2QNLu/CGA6Pbjd4+4GMm6+V7DZfisSfJUqYfbnttq70cBTEaJfsV1FPOaAJib
         24ew==
X-Gm-Message-State: AOJu0Ywy1GMRYKgewDl1kUJFCSM4eU9qnLkgIb6FTjbGDI5uQzXvA934
        JilbbjMVlIqmFouuWLYa9Nwc12oKOkiv54/4K/0YVA==
X-Google-Smtp-Source: AGHT+IFt499tIWzynN4fBJ9ZZ/oKER6cpMYoxuVszPhAfMParzVVg13mb6qLOSJaPIjSOdErxj19rn4mfJHazwpejyI=
X-Received: by 2002:a17:90b:1081:b0:267:717f:2f91 with SMTP id
 gj1-20020a17090b108100b00267717f2f91mr5890871pjb.40.1692694962355; Tue, 22
 Aug 2023 02:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230802193155.2170935-1-Naresh.Solanki@9elements.com>
 <20230808-stand-cheddar-b76b0b7509a0@spud> <eced746a-1181-bd8f-6828-4a4eeb79727c@roeck-us.net>
 <20230808-esquire-epidemic-f9bd74ffde25@spud> <CABqG17jm938MaEeqS03WeryVWSRBS7Bqq2Vwq9SL4QOGqXU43A@mail.gmail.com>
 <b3eebd2b-c73b-fdc7-2b2b-07e97db26d92@linaro.org> <CABqG17hgU44H9KbALy_336Sb+YOiEOzbnAihiox1OEuVnNiayQ@mail.gmail.com>
 <5cde8986-1b12-a85e-b2fe-e1aa1087b429@linaro.org>
In-Reply-To: <5cde8986-1b12-a85e-b2fe-e1aa1087b429@linaro.org>
From:   Naresh Solanki <naresh.solanki@9elements.com>
Date:   Tue, 22 Aug 2023 14:32:31 +0530
Message-ID: <CABqG17gL7XL0nKZ0QEYkF672AvfJQXapExw3p1iGm88U9idq=w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: Add Infineon TDA38640
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Conor Dooley <conor@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        krzysztof.kozlowski+dt@linaro.org,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi

On Fri, 18 Aug 2023 at 14:53, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 16/08/2023 10:51, Naresh Solanki wrote:
> > Hi Krzysztof,
> >
> > On Tue, 15 Aug 2023 at 01:02, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 11/08/2023 18:00, Naresh Solanki wrote:
> >>> Hi,
> >>>
> >>> On Tue, 8 Aug 2023 at 19:58, Conor Dooley <conor@kernel.org> wrote:
> >>>>
> >>>> On Tue, Aug 08, 2023 at 07:10:08AM -0700, Guenter Roeck wrote:
> >>>>> On 8/8/23 04:46, Conor Dooley wrote:
> >>>>>> On Wed, Aug 02, 2023 at 09:31:51PM +0200, Naresh Solanki wrote:
> >>>>>>> From: Patrick Rudolph <patrick.rudolph@9elements.com>
> >>>>>>>
> >>>>>>> The TDA38640 chip has different output control mechanisms depending on
> >>>>>>> its mode of operation. When the chip is in SVID mode, only
> >>>>>>> hardware-based output control is supported via ENABLE pin. However, when
> >>>>>>> it operates in PMBus mode, software control works perfectly.
> >>>>>>>
> >>>>>>> To enable software control as a workaround in SVID mode, add the DT
> >>>>>>> property 'infineon,en-svid-control'. This property will enable the
> >>>>>>> workaround, which utilizes ENABLE pin polarity flipping for output when
> >>>>>>> the chip is in SVID mode.
> >>>>>>
> >>>>>> Why do you need a custom property for this? How come it is not possible
> >>>>>> to determine what bus you are on?
> >>>>>>
> >>>>>
> >>>>> That is not the point. Yes, it can be detected if the control method is
> >>>>> PMBus or SVID. However, in SVID mode, SVID is supposed to control the
> >>>>> output, not PMBUs. This is bypassed by controlling the polarity of the
> >>>>> (physical) output enable signal. We do _not_ want this enabled automatically
> >>>>> in SVID mode. Its side effects on random boards using this chip are unknown.
> >>>>> Thus, this needs a property which specifically enables this functionality
> >>>>> for users who _really_ need to use it and (hopefully) know what they are
> >>>>> doing.
> >>>>
> >>>> Hmm, reading this it makes a lot more sense why this is a property - I
> >>>> guess I just struggled to understand the commit message here,
> >>>> particularly what the benefit of using the workaround is. I'm still
> >>>> having difficulty parsing the commit & property text though - its
> >>>> unclear to me when you would need to use it - so I will stay out
> >>>> of the way & let Rob or Krzysztof handle things.
> >>>
> >>> To provide context, my system employs a unique power sequence
> >>> strategy utilizing a BMC (Baseboard Management Controller),
> >>> rendering the reliance on the ENABLE pin unnecessary.
> >>> In this configuration, the ENABLE pin is grounded in the hardware.
> >>> While most regulators facilitate PMBus Operation for output control,
> >>> the TDA38640 chip, when in SVID mode, is constrained by the
> >>> ENABLE pin to align with Intel specifications.
> >>> My communication with Infineon confirmed that the recommended
> >>> approach is to invert the Enable Pin for my use case.
> >>>
> >>> Since this is not typically the use case for most setup & hence DT property
> >>> is must for enabling the special case.
> >>>
> >>> For further insight into my setup's power sequence strategy, you can
> >>> refer to the following link: https://github.com/9elements/pwrseqd
> >>>
> >>
> >> This justifies to me the property, but still you described desired
> >> driver behavior, not the hardware characteristic. Don't describe what
> >> you want to control, but describe the entire system.
> > I guess by entire system you mean how the regulators(including
> > TDA38640) connected & operated in our setup ?
>
> I mean, property name and description should say what is the
> characteristic of the hardware/firmware/entire system.
Based on your feedback, will update to below:
infineon,fixed-level-en-pin:
    description: |
      Indicate the ENABLE pin is set at fixed level or left
      unconnected(has internal pull-up).
    type: boolean
>
>
> Best regards,
> Krzysztof
>
