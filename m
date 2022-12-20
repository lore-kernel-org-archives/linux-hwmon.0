Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3061FC10F1E
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Dec 2022 14:36:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234032AbiLTOgH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 20 Dec 2022 09:36:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234079AbiLTOfx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Dec 2022 09:35:53 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1411F19C2A
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Dec 2022 06:35:52 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id 128so11894080vsz.12
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Dec 2022 06:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sh188zIkxDCONEPP/MD0Q17USU6PjQm9Z+QknoEQD/M=;
        b=pqxLxpMAIUffofkgMntG+ivSHBiAfFtQi5aRiGEHSkR2ysa4EurdfwulgsFuvoEu2e
         H8GTVdHWWURaZ04bEwsW/8RGJZZVvpdhu7LBJb1qIps40XDzYFzLXpLM55FdaXh3FPlf
         KDkwac3qH7+1NYGie+8jBHyrTFChA+0xlvDgK8MjFtQ2tnofmAgJmUHin5O3JtNOGq62
         GD9ASAgY0ozi+cHQT8LO6dFB5l/5HvgcpkH6FzAw/9qF/VR13Hg7TBuTVKASfnCxIhVd
         DrLGxN8XoKX4clmvR/M7sKx3ZSU0btUjKP7zdOVyvRi4yJn45KDmIc7qa8o84mLAeDQZ
         CWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sh188zIkxDCONEPP/MD0Q17USU6PjQm9Z+QknoEQD/M=;
        b=Hiv+X37SiA6M8629HeD4MqklTPrr3T6kB2IDCudWxnJsLr/lGAHu/F3TIXDlmK1zRT
         x8M04vOHewIuj1birL7Ft9pOM90dKCHygbYET1kzxwvMjVJwjytLHhWzwk1hSIS2eK4D
         IXnn8C1ZIog9Kc7QanTswOB077I2+ew17LYiAaO9LdukWTenqSSCL+8BKe2MjKSb+mFA
         qrizh6h4sRHAWGAwx1/U1nmjgIQxJevnxxeSws3csP4mIrdkEYQZT5vGnQCfOX6g8vkf
         BCI7GHu7MB3//FQzQDsiSiCjmdWr1uhJkxo6pbtSnn1bVDicpkaotAaV/WMt8moqcEMh
         TuaA==
X-Gm-Message-State: ANoB5pl0V6IWKIQKO+pl9sPUIV8kCZKKLv/OSqGmae3CuKzwsq/We9q6
        krFyzTyGgsGwcFTTC7hKLmegXyQpJ6N5xMq3ubbJRA==
X-Google-Smtp-Source: AA0mqf75cqBZcEjy82uWbF4vRFhb+atqyA1ifC+lCAod41qxdNHTjS2Cc5YXJ8nBnmOOR5Vc5ZHRUIUW35RQN/++csQ=
X-Received: by 2002:a05:6102:3f45:b0:3aa:2ae2:70ea with SMTP id
 l5-20020a0561023f4500b003aa2ae270eamr49155450vsv.5.1671546951135; Tue, 20 Dec
 2022 06:35:51 -0800 (PST)
MIME-Version: 1.0
References: <20221214220727.1350784-1-jcormier@criticallink.com>
 <20221220000457.1163446-1-jcormier@criticallink.com> <20221220000457.1163446-2-jcormier@criticallink.com>
 <e0f620b4-5780-fbea-4446-fd68f281281a@linaro.org>
In-Reply-To: <e0f620b4-5780-fbea-4446-fd68f281281a@linaro.org>
From:   Jon Cormier <jcormier@criticallink.com>
Date:   Tue, 20 Dec 2022 09:35:38 -0500
Message-ID: <CADL8D3YUzgk+H70wEG1Qfq-kcn_csUdJyRg2rWfraVb3JsEa_g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: hwmon: adi,ltc2945: Add binding
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bob Duke <bduke@criticallink.com>,
        John Pruitt <jpruitt@criticallink.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Dec 20, 2022 at 5:15 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 20/12/2022 01:04, Cormier, Jonathan wrote:
> > Create initial binding for the LTC2945 I2C power monitor.
> > Also adds shunt-resistor-micro-ohms parameter
>
> The last sentence does not make sense. I propose to skip it.
Ok
>
> >
> > Signed-off-by: "Cormier, Jonathan" <jcormier@criticallink.com>
> > ---
> >  .../bindings/hwmon/adi,ltc2945.yaml           | 50 +++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc2945.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc2945.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc2945.yaml
> > new file mode 100644
> > index 000000000000..f90d40919ee6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/adi,ltc2945.yaml
> > @@ -0,0 +1,50 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/adi,ltc2945.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices LTC2945 wide range i2c power monitor
> > +
> > +maintainers:
> > +  - Guenter Roeck <linux@roeck-us.net>
>
> Maintainer of binding is person interested in the device, e.g. having
> the hardware or datasheet. Not the subsystem maintainer. Unless by
> coincidence this is the same person here?
What do you do with a basic kernel driver which hasn't been touched
since it was introduced except for various refactors? He seems to be
the one who introduced it and most consistently made changes to it.
>
>
> > +
> > +description: |
> > +  Analog Devices LTC2945 wide range i2c power monitor over I2C.
> > +
> > +  https://www.analog.com/media/en/technical-documentation/data-sheets/LTC2945.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - adi,ltc2945
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  shunt-resistor-micro-ohms:
> > +    description:
> > +      Shunt resistor value in micro-Ohms
> > +    default: 1000
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +
> This is a friendly reminder during the review process.
>
> It seems my previous comments were not fully addressed. Maybe my
> feedback got lost between the quotes, maybe you just forgot to apply it.
> Please go back to the previous discussion and either implement all
> requested changes or keep discussing them.
My bad,
>
> Thank you.
>
> > +additionalProperties: false
> > +
>
> Best regards,
> Krzysztof
>


-- 
Jonathan Cormier
Software Engineer

Voice:  315.425.4045 x222



http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211
