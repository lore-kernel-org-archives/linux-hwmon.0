Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7855EC6FA8F
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Aug 2023 20:20:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbjH3UU6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Aug 2023 16:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236857AbjH3UAB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Aug 2023 16:00:01 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E736C76EE9
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2023 12:34:09 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-79d8edd6d99so76209241.3
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2023 12:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1693423983; x=1694028783; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J6hWfbIynnUP5BUpdi9sNEghPSzuJ8hcWhPiubhMdyQ=;
        b=hEtKAyrtHGM+lgyOOPnFBn6wQ4+6ikkIr72KvPBnaju0TkcE1+q9+Vae/3KeYySZ0k
         vLSMRxhGs6Q3St+bAKZKb0HP70ZgUbXSRtrT38BJk5HOStWTPcQZ65u2lwYE3l3AvUQs
         MKA7Up8/dAx2jQfsY7boydIbZoL4iDOds6APPS7wcILsLOkYqyGSZ6icaqwpBBL5r9Ht
         +WXcpdwnkJ859ojz8XLzul3I/QHkxnY0MpTcGLXPWxgmLFpYEsGu6v9nCCFeXwCKsmA9
         yMe2INb0Nb6Wgh7V3Iq8EXAf86DoVrm5EqCU2xlmFLkB5mGAwxcOuhpim6hUrybs3NiR
         kCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693423983; x=1694028783;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6hWfbIynnUP5BUpdi9sNEghPSzuJ8hcWhPiubhMdyQ=;
        b=TvRQY8lOeL+I4X/8NRnpmTu2zIudcQaZsrDQ9MplPJeddXTx90Do+sJyVBvkLXVX47
         VlYrF2jb7ooKGetYVWNrc7U1rIDkCXxReS6JQCTdwHk+D1tE9cth6bESzbPvAR3wh8YX
         zFCxUhEPaRL6i7nciYYycr4X7WSp8clNFzmAs7lJ17wp1Yon3AdsrDlL7dJlyN+FYaa3
         4tJ1d4dSwkYwyY5SUa4b3TvobgOCHejbMXZGoB9X+u53UK+Kt74xf3BIzv78sJreB11T
         98RabrTg2rcQL1PHQm+xw1BfXZqjV6D7qQsCHsnJfxeQjX+ZxR0sxLJS6+32cBrRx6XE
         qfTA==
X-Gm-Message-State: AOJu0YyA6cWGZvJqcH8r7GQaMC37o2Giy1EKHhqoS7M1NBX7Xj/SmuHA
        8zvJa2SJlYNmfhsozW1imLtSodJG7Q2CpGpTVw0LJQxptDCrzV8qdew=
X-Google-Smtp-Source: AGHT+IFJ1DxDSDn+rxq1FvriBdkBpWWLRYcjePAYy/X7OVYKimW7wLrpeqNTC6UptcyifchQtbuSRLu3srnYZpvyNiE=
X-Received: by 2002:a17:90b:38c3:b0:26d:49c8:78aa with SMTP id
 nn3-20020a17090b38c300b0026d49c878aamr3089232pjb.32.1693423182647; Wed, 30
 Aug 2023 12:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230830103620.3611761-1-Naresh.Solanki@9elements.com> <20230830-waving-stinky-d510fefbbf82@spud>
In-Reply-To: <20230830-waving-stinky-d510fefbbf82@spud>
From:   Naresh Solanki <naresh.solanki@9elements.com>
Date:   Thu, 31 Aug 2023 00:49:32 +0530
Message-ID: <CABqG17hvSYbsnYYGOQxVsiXsqLXFnovXvkhgc=pYR9osgF0-1g@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: Add Infineon TDA38640
To:     Conor Dooley <conor@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
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

On Wed, 30 Aug 2023 at 21:02, Conor Dooley <conor@kernel.org> wrote:
>
> Hey,
>
> On Wed, Aug 30, 2023 at 12:36:16PM +0200, Naresh Solanki wrote:
> > From: Patrick Rudolph <patrick.rudolph@9elements.com>
> >
> > Add the DT property 'infineon,en-pin-fixed-level' to
> > indicated that the chip ENABLE pin is at fixed level
> > or left unconnected(has internal pull-down).
> >
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> > ----
> > Changes in V4:
> > - Update property name & description.
> > - Update commit message.
> > ---
> >  .../hwmon/pmbus/infineon,tda38640.yaml        | 50 +++++++++++++++++++
> >  .../devicetree/bindings/trivial-devices.yaml  |  2 -
> >  2 files changed, 50 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml
> > new file mode 100644
> > index 000000000000..1df40ee7454a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38640.yaml
> > @@ -0,0 +1,50 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,tda38640.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Infineon TDA38640 Synchronous Buck Regulator with SVID and I2C
> > +
> > +maintainers:
> > +  - Naresh Solanki <naresh.solanki@9elements.com>
> > +
> > +description: |
> > +  The Infineon TDA38640 is a 40A Single-voltage Synchronous Buck
> > +  Regulator with SVID and I2C designed for Industrial use.
> > +
> > +  Datasheet: https://www.infineon.com/dgdl/Infineon-TDA38640-0000-DataSheet-v02_04-EN.pdf?fileId=8ac78c8c80027ecd018042f2337f00c9
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - infineon,tda38640
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  infineon,en-pin-fixed-level:
> > +    description: |
>
> The | isn't needed when there is no formatting requiring preservation.
Sure will remove.
>
> > +      Indicates that the chip ENABLE pin is at fixed level or left
> > +      unconnected(has internal pull-down).
>
> Maybe you've already been over this, but if the pin is called "enable"
> why not use the same wording in the property?
EN & ENABLE is used interchangeably in the datasheet.
Just to keep property name short I use EN.
>
> > +    type: boolean
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        tda38640@40 {
>
> Use a generic node name please.
>
> Thanks,
> Conor.
>
> > +            compatible = "infineon,tda38640";
> > +            reg = <0x40>;
> > +        };
> > +    };
> > +
> > diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> > index 40bc475ee7e1..86c7d34f63bf 100644
> > --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> > +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> > @@ -151,8 +151,6 @@ properties:
> >            - infineon,slb9645tt
> >              # Infineon SLB9673 I2C TPM 2.0
> >            - infineon,slb9673
> > -            # Infineon TDA38640 Voltage Regulator
> > -          - infineon,tda38640
> >              # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
> >            - infineon,tlv493d-a1b6
> >              # Infineon Multi-phase Digital VR Controller xdpe11280
> >
> > base-commit: 919a83d020a8dfa1411c1dc1cff23a833f0f5268
> > --
> > 2.41.0
> >
