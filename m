Return-Path: <SRS0=gPXQ=AF=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F704C433DF
	for <linux-hwmon@archiver.kernel.org>; Wed, 24 Jun 2020 10:57:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED67C2088E
	for <linux-hwmon@archiver.kernel.org>; Wed, 24 Jun 2020 10:57:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jsrHEYsj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390493AbgFXK5O (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 24 Jun 2020 06:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728791AbgFXK5N (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 Jun 2020 06:57:13 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8022C0613ED
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Jun 2020 03:57:12 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id r5so1111894vso.11
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Jun 2020 03:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vn4droilz5xGM4KfZXgTLDdDZ7pkVwg0FkXdJSTh6us=;
        b=jsrHEYsjYaln2VseebXDq9KSHpUlVCIp31IbwlZNiLEWvQQUW3jOQYJyYJ7ilWsi8t
         N4yIdR3YaRGUPVNKe7i4mRT46gYHqXTnBpAYFx6g326/StBM1zMIZgqE/Il1qOv3STOn
         fxiahpFUpRclnlN6ofiAe89/gsyxluoR8eawmKIV9o+dvNVy1/F0Jl2dJ7hK2dxOREOc
         YXbt1vQ34xDe+W0KAHfmGph3WghyiCvx0EDecfobr2KxmbamtlyrwfbCgjpWvdza+gsD
         BGzm8TnsM3OhMG8PgIzFCF995Q9nxS7OXOXKBdJQhWQ7HGO4f0RZSlTPw1OZeUPe4Fex
         JV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vn4droilz5xGM4KfZXgTLDdDZ7pkVwg0FkXdJSTh6us=;
        b=ArTM8G71jrhP7Rs1Z4LenLgkjbo3oKZA8L804aZNblKYv36pn3SknmfW0cehD0dIPU
         KY6v20jHdDOD0a3ieVcin4rbRi1UxyCZP4gnnHsnGdVtCG9JcJswEAKdl3tV/UkOftkc
         KyJgSbwwfmeBAgXISRDEy87ly07CcH0Ps4CMcTn7bTBmF5ijeJ7H4m7zVc4QAjC6p4bf
         ksyrBkw0l/bQC12zwyOUXp5y9BVBWxPbpKLnCWAhjbBfvVhOMPiSIdzyHJBW/7x2rB2w
         pjFv68LuuOVuIRBLu2iMZsMzM+QaNNb1oxS04UasBSlmVgsuqiyv2o4ThVxA8J6wiLxs
         VHTg==
X-Gm-Message-State: AOAM533frS0oV/s1jT/A6eWcOy3nGzOzxJROFECLF/43ELkwkH1gRW/t
        Pywc0/WSitIZmiDy7lLrKpuRqqt2p+I8nghhIcF3tA==
X-Google-Smtp-Source: ABdhPJwsxJpI/X+t50qo0pfoptqsNIIaJYL0e6gqFMktW+4P7dgIwXfmwMKeXKnC5Tvh/SK00ZCwC18Bi+FEfhZtYJ4=
X-Received: by 2002:a67:e10d:: with SMTP id d13mr23383320vsl.27.1592996231712;
 Wed, 24 Jun 2020 03:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <cbd70c2f0f5ddae0d8e418fcb1e03101e408f6c2.1585753313.git.amit.kucheria@linaro.org>
 <20200414164357.GA11178@bogus>
In-Reply-To: <20200414164357.GA11178@bogus>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Wed, 24 Jun 2020 16:27:00 +0530
Message-ID: <CAHLCerM7hwKS=jNtMLnoCXr6z9ckOo1879e-MR-BnOC0JO=adA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: thermal: Get rid of thermal.txt and replace references
To:     Rob Herring <robh@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Talel Shenhar <talel@amazon.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM STB AVS TMON DRIVER" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mans Rullgard <mans@mansr.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        lakml <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        linux-hwmon@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Apr 14, 2020 at 10:14 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed,  1 Apr 2020 20:35:50 +0530, Amit Kucheria wrote:
> > Now that we have yaml bindings for the thermal subsystem, get rid of the
> > old bindings (thermal.txt).
> >
> > Replace all references to thermal.txt in the Documentation with a link
> > to the appropriate YAML bindings using the following search and replace
> > pattern:
> >  - If the reference is specific to the thermal-sensor-cells property,
> >  replace with a pointer to thermal-sensor.yaml
> >  - If the reference is to the cooling-cells property, replace with a
> >  pointer to thermal-cooling-devices.yaml
> >  - If the reference is generic thermal bindings, replace with a
> >  reference to thermal*.yaml.
> >
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  .../devicetree/bindings/arm/arm,scmi.txt      |   2 +-
> >  .../devicetree/bindings/arm/arm,scpi.txt      |   2 +-
> >  .../arm/marvell/ap80x-system-controller.txt   |   2 +-
> >  .../arm/marvell/cp110-system-controller.txt   |   2 +-
> >  .../bindings/cpufreq/cpufreq-dt.txt           |   3 +-
> >  .../bindings/cpufreq/cpufreq-mediatek.txt     |   4 +-
> >  .../devicetree/bindings/hwmon/gpio-fan.txt    |   3 +-
> >  .../devicetree/bindings/hwmon/lm90.txt        |   4 +-
> >  .../thermal/allwinner,sun8i-a83t-ths.yaml     |   2 +-
> >  .../bindings/thermal/amazon,al-thermal.txt    |   2 +-
> >  .../bindings/thermal/brcm,avs-ro-thermal.yaml |   2 +-
> >  .../bindings/thermal/brcm,bcm2835-thermal.txt |   2 +-
> >  .../bindings/thermal/hisilicon-thermal.txt    |   2 +-
> >  .../bindings/thermal/max77620_thermal.txt     |   6 +-
> >  .../bindings/thermal/mediatek-thermal.txt     |   2 +-
> >  .../thermal/nvidia,tegra124-soctherm.txt      |  10 +-
> >  .../thermal/nvidia,tegra186-bpmp-thermal.txt  |   2 +-
> >  .../bindings/thermal/qcom-spmi-temp-alarm.txt |   2 +-
> >  .../bindings/thermal/rockchip-thermal.txt     |   2 +-
> >  .../bindings/thermal/tango-thermal.txt        |   2 +-
> >  .../bindings/thermal/thermal-generic-adc.txt  |   2 +-
> >  .../devicetree/bindings/thermal/thermal.txt   | 586 ------------------
> >  .../bindings/thermal/uniphier-thermal.txt     |   2 +-
> >  23 files changed, 33 insertions(+), 615 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/thermal/thermal.txt
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Daniel, Rob,

This seems to have been missed in the 5.8 merge window. I suspect this
should go in through the thermal tree.

Regards,
Amit
