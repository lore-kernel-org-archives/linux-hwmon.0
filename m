Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66AAEE49B1
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Aug 2023 17:39:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjHVRjF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Aug 2023 13:39:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbjHVRjE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Aug 2023 13:39:04 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD91F3C34
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Aug 2023 10:39:00 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-56c2e840e70so1571972a12.3
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Aug 2023 10:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1692725940; x=1693330740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oLE8hKDrlGfTtUcqMTSUAVt71dMNQpyW2/v2HxOoLaI=;
        b=KZdz3G8RjOjbT8Gokba9folZsK073DVY7JW8POvKZ9umSSLd1aXcIe15EjXcKaqFlL
         WG5/Kt05oPegp01PZg0iydQJjdTvIjD4AnIGgTvSUyLygjYZfTKeW6zEmnr2gppOs5zP
         AY8JBTAMpul6h9n1BOl1Xzh75NBJAIY7ZCCXUwZ/Eu0K5rEXDK3avf7kccZNghPwokGt
         Dflo1t07yGirZh1BEnT4zWpiHg8pDsqZweUiLRAp0xZILnlk0x+L6jtkyKeMj4+E5Vpr
         kZOiQ3ERq87IyKU2pyT2epXdwuSS1mF9a71NUFKy6gzp5TlhVASf6JPzTnBa76EaGTVP
         7qNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692725940; x=1693330740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLE8hKDrlGfTtUcqMTSUAVt71dMNQpyW2/v2HxOoLaI=;
        b=NCZ/6qFQtYBwSGbFfcvQr01aTi1xB+hlJX4Ox4igXrh6SVjKiCBMDpsm5qxBUysyS8
         9DsHkEZy1sUJwuRzuGB6uUd4vYZWyEWK/FmHzsprgU3iiCbLJIiUBHfXc6ERVCnmAuCH
         FxRYJjceLMh54wp9NJwp4a1C74Tzpuqz5SZJWq0lUAdZxXxpQOO5cdUhugIndl4yFGFx
         /mtQx6zW1lnaX42xW+fLGJIPL7LcLMNTMAakZpaCJAFjDx65bHoI8VcEKQJorT36j6y0
         BydcTkxggyKo8+iaD7PMZuIiTuIBVQfisa0JOb7JUMmv3iIwYE9B2Srzm56eqxuqAJ1W
         0M2A==
X-Gm-Message-State: AOJu0Yy5WpzzAQq82V+lXfoiQ0QYcd9MfAMbUe+svyR7ZXnuo1TNqVuY
        ajfVaPBkIp6VN6Pr3KuAGZ64RHSAnqlXbroaOc1nNg==
X-Google-Smtp-Source: AGHT+IFVpmTBrNPNp3X2fKD9eCmmA0X1KdLhu0/hZWSb7UpXZMst5v1gvhV3C9W9kJjqTq6LPwjzjJ6rdEiGMa8xflQ=
X-Received: by 2002:a17:90a:eb09:b0:262:f06d:c0fc with SMTP id
 j9-20020a17090aeb0900b00262f06dc0fcmr9300490pjz.7.1692725940035; Tue, 22 Aug
 2023 10:39:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230808-stand-cheddar-b76b0b7509a0@spud> <eced746a-1181-bd8f-6828-4a4eeb79727c@roeck-us.net>
 <20230808-esquire-epidemic-f9bd74ffde25@spud> <CABqG17jm938MaEeqS03WeryVWSRBS7Bqq2Vwq9SL4QOGqXU43A@mail.gmail.com>
 <b3eebd2b-c73b-fdc7-2b2b-07e97db26d92@linaro.org> <CABqG17hgU44H9KbALy_336Sb+YOiEOzbnAihiox1OEuVnNiayQ@mail.gmail.com>
 <5cde8986-1b12-a85e-b2fe-e1aa1087b429@linaro.org> <CABqG17gL7XL0nKZ0QEYkF672AvfJQXapExw3p1iGm88U9idq=w@mail.gmail.com>
 <05ec3dc2-3ed5-4b04-8062-c10777e0a181@roeck-us.net> <CABqG17hKcCwH7=AQq0-JtdeY0tmf=s_nWCoE3F-vh=ZPUBjObg@mail.gmail.com>
 <c6ab0452-f976-469c-be85-9b065db46361@roeck-us.net>
In-Reply-To: <c6ab0452-f976-469c-be85-9b065db46361@roeck-us.net>
From:   Naresh Solanki <naresh.solanki@9elements.com>
Date:   Tue, 22 Aug 2023 23:08:49 +0530
Message-ID: <CABqG17iv4SPgfF4LRy5sMzGSU4EPGJ0YPOu3_1XzV-NTcGn+qA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: Add Infineon TDA38640
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor@kernel.org>,
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

Hi.

On Tue, 22 Aug 2023 at 22:20, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Aug 22, 2023 at 09:41:48PM +0530, Naresh Solanki wrote:
> > Hi,
> >
> > On Tue, 22 Aug 2023 at 18:47, Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > On Tue, Aug 22, 2023 at 02:32:31PM +0530, Naresh Solanki wrote:
> > > > Hi
> > > >
> > > > On Fri, 18 Aug 2023 at 14:53, Krzysztof Kozlowski
> > > > <krzysztof.kozlowski@linaro.org> wrote:
> > > > >
> > > > > On 16/08/2023 10:51, Naresh Solanki wrote:
> > > > > > Hi Krzysztof,
> > > > > >
> > > > > > On Tue, 15 Aug 2023 at 01:02, Krzysztof Kozlowski
> > > > > > <krzysztof.kozlowski@linaro.org> wrote:
> > > > > >>
> > > > > >> On 11/08/2023 18:00, Naresh Solanki wrote:
> > > > > >>> Hi,
> > > > > >>>
> > > > > >>> On Tue, 8 Aug 2023 at 19:58, Conor Dooley <conor@kernel.org> wrote:
> > > > > >>>>
> > > > > >>>> On Tue, Aug 08, 2023 at 07:10:08AM -0700, Guenter Roeck wrote:
> > > > > >>>>> On 8/8/23 04:46, Conor Dooley wrote:
> > > > > >>>>>> On Wed, Aug 02, 2023 at 09:31:51PM +0200, Naresh Solanki wrote:
> > > > > >>>>>>> From: Patrick Rudolph <patrick.rudolph@9elements.com>
> > > > > >>>>>>>
> > > > > >>>>>>> The TDA38640 chip has different output control mechanisms depending on
> > > > > >>>>>>> its mode of operation. When the chip is in SVID mode, only
> > > > > >>>>>>> hardware-based output control is supported via ENABLE pin. However, when
> > > > > >>>>>>> it operates in PMBus mode, software control works perfectly.
> > > > > >>>>>>>
> > > > > >>>>>>> To enable software control as a workaround in SVID mode, add the DT
> > > > > >>>>>>> property 'infineon,en-svid-control'. This property will enable the
> > > > > >>>>>>> workaround, which utilizes ENABLE pin polarity flipping for output when
> > > > > >>>>>>> the chip is in SVID mode.
> > > > > >>>>>>
> > > > > >>>>>> Why do you need a custom property for this? How come it is not possible
> > > > > >>>>>> to determine what bus you are on?
> > > > > >>>>>>
> > > > > >>>>>
> > > > > >>>>> That is not the point. Yes, it can be detected if the control method is
> > > > > >>>>> PMBus or SVID. However, in SVID mode, SVID is supposed to control the
> > > > > >>>>> output, not PMBUs. This is bypassed by controlling the polarity of the
> > > > > >>>>> (physical) output enable signal. We do _not_ want this enabled automatically
> > > > > >>>>> in SVID mode. Its side effects on random boards using this chip are unknown.
> > > > > >>>>> Thus, this needs a property which specifically enables this functionality
> > > > > >>>>> for users who _really_ need to use it and (hopefully) know what they are
> > > > > >>>>> doing.
> > > > > >>>>
> > > > > >>>> Hmm, reading this it makes a lot more sense why this is a property - I
> > > > > >>>> guess I just struggled to understand the commit message here,
> > > > > >>>> particularly what the benefit of using the workaround is. I'm still
> > > > > >>>> having difficulty parsing the commit & property text though - its
> > > > > >>>> unclear to me when you would need to use it - so I will stay out
> > > > > >>>> of the way & let Rob or Krzysztof handle things.
> > > > > >>>
> > > > > >>> To provide context, my system employs a unique power sequence
> > > > > >>> strategy utilizing a BMC (Baseboard Management Controller),
> > > > > >>> rendering the reliance on the ENABLE pin unnecessary.
> > > > > >>> In this configuration, the ENABLE pin is grounded in the hardware.
> > > > > >>> While most regulators facilitate PMBus Operation for output control,
> > > > > >>> the TDA38640 chip, when in SVID mode, is constrained by the
> > > > > >>> ENABLE pin to align with Intel specifications.
> > > > > >>> My communication with Infineon confirmed that the recommended
> > > > > >>> approach is to invert the Enable Pin for my use case.
> > > > > >>>
> > > > > >>> Since this is not typically the use case for most setup & hence DT property
> > > > > >>> is must for enabling the special case.
> > > > > >>>
> > > > > >>> For further insight into my setup's power sequence strategy, you can
> > > > > >>> refer to the following link: https://github.com/9elements/pwrseqd
> > > > > >>>
> > > > > >>
> > > > > >> This justifies to me the property, but still you described desired
> > > > > >> driver behavior, not the hardware characteristic. Don't describe what
> > > > > >> you want to control, but describe the entire system.
> > > > > > I guess by entire system you mean how the regulators(including
> > > > > > TDA38640) connected & operated in our setup ?
> > > > >
> > > > > I mean, property name and description should say what is the
> > > > > characteristic of the hardware/firmware/entire system.
> > > > Based on your feedback, will update to below:
> > > > infineon,fixed-level-en-pin:
> > > >     description: |
> > > >       Indicate the ENABLE pin is set at fixed level or left
> > > >       unconnected(has internal pull-up).
> > > >     type: boolean
> > >
> > > Messy, because while it reflects physical connectivity, it doesn't reflect
> > > its use in the system at all. The pin may be at fixed level or left
> > > unconnected, but the system vendor doesn't want to give users the
> > > means to control output power (which would be the normal situation).
> > Maybe this would be better ?
> > infineon,svid-mode-fixed-en-pin
> >   description: |
> >     Indicate the ENABLE pin is set at fixed level or left
> >     unconnected(has internal pull-up) which chip in
> >     SVID mode.
>
> which chip ? Do you mean "with the chip" ?
Yep. sorry for the typo.
>
> I don't think that makes a difference. It still doesn't describe
> your use case (which is something like "the chip is in SVID mode,
> its enable pin is set to fixed level, and we need to manipulate its
> interpretation by the chip so we can control the enable status from
> software). I have no idea how to express that in a way that would be
> acceptable as devicetree property.
In typical use case when chip is in SVID mode ,the ENABLE pin
isn't fixed i.e., either connected power good or FPGA pin.
If this property is explicitly specified then its clear in the hardware that
1. chip is in SVID mode,
2. ENABLE pin is fixed.
3. Intent to use the workaround.

@Krzysztof , Is this acceptable ? Can you please recommend a way
forward please.

Regards,
Naresh
>
> It doesn't seem to me that we are making much progress here.
> I know it isn't supposed to be done, and I don't really like it,
> but could you use a module parameter in your system ? I'd be
> open to accept that to make progress.
>
> Thanks,
> Guenter
