Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B685ECAAA1
	for <linux-hwmon@archiver.kernel.org>; Sun, 23 Oct 2022 05:53:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbiJWFx4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 23 Oct 2022 01:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbiJWFxz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 Oct 2022 01:53:55 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AAFF6A486
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Oct 2022 22:53:54 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id m16so20157259edc.4
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Oct 2022 22:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=My7nuE1BYCE2MBazvCjecOzY7KXfxj02Yl/o6hpzQHQ=;
        b=C2nTtrIiTK16s3ooQ9vBQioJHuUXFAVzLkYsLXB1TkfTj3IC+bMNdpZSBOftL9Lm5D
         zDdlLoNEOOLmMk4d8TAl58ZD91gWHTxX8yX32vExEn2zKagm44cdeVYnTgSEja0bjoTS
         8FSidrhX809LGi/j28fP75kf5meUrcB3b4DlhQo5mpb+8TpeMNqKwzqj27shGbo/HRyY
         RhnUcMtTi2cq25xqESYO6+6fOEo6oCjiUBwuMCnloF3fBTB4+r0TY90EzF0ZLzBJfKJH
         +dl+2N8/SGVlb6YjQKD1ej9kseyqjSVZrRXgR6HdEUQH28qz8vLECdStbOuiMVHqzNkL
         57tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=My7nuE1BYCE2MBazvCjecOzY7KXfxj02Yl/o6hpzQHQ=;
        b=g0+yqdpjT5yfL1Ytb2GRaIsw2mBmDpJMO+ogGcGBq+E4eJNDXp/1HcFJCImO78RXKc
         moUFsPU7HsfTsdxPkIs78vhpXutwYNcAc4ND9ZaMiREEwmgb5MbsJ8h9r7NfRBlLAEFL
         FxA70m4+q3sefCRlHyi6HuXdRRTKc78nwZvNSGIaEvaezrgo771J6sJ6vi2DrhSchEP1
         UZG9DTbVDA1ld0l9/F8nAGnfrgAH5GBr6JjoR/vJfW8XU5I608DdnXnhNFXnu7ShomCi
         LCKciXK1lVzvzFV82S0whaKuZCCXg9eJkimJlCPYSuefuEDpxOSblSkypSCfM0vo2MB8
         iLHQ==
X-Gm-Message-State: ACrzQf0rmVTpvtlk1ZpksJ+QfZAa1R2eRH0z1LnjhJ9WyUGzN0RUWQHW
        cSRJGYoCUq+EY2C17BeeC56hGsabxezcF3NMiDSWYA==
X-Google-Smtp-Source: AMsMyM71Mirfx+iLpJmgp5w4ZBRQtkFF2/qgKz0rQTgI1pdyQfDr4yXrJKBxMUU67lb00LeaEE0GjI9LtttFDFxxGBg=
X-Received: by 2002:a05:6402:90c:b0:457:b5ce:5f18 with SMTP id
 g12-20020a056402090c00b00457b5ce5f18mr25418729edz.309.1666504432720; Sat, 22
 Oct 2022 22:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221013094838.1529153-1-Naresh.Solanki@9elements.com>
In-Reply-To: <20221013094838.1529153-1-Naresh.Solanki@9elements.com>
From:   Naresh Solanki <naresh.solanki@9elements.com>
Date:   Sun, 23 Oct 2022 11:23:42 +0530
Message-ID: <CABqG17gYexJkzLou1HVP7n4CGyXq70oq68E+nCOwvf=OMFhqTA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add devicetree support for max6639
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

In this latest patch series V4 , I've addressed the comments of V3.
Since this is merely an upgrade of driver from platform driver to dt
support, can we get this in.

Thanks,
Naresh

Regards,
Naresh Solanki



9elements GmbH, Kortumstra=C3=9Fe 19-21, 44787 Bochum, Germany
Email:  naresh.solanki@9elements.com
Mobile:  +91 9538631477

Sitz der Gesellschaft: Bochum
Handelsregister: Amtsgericht Bochum, HRB 17519
Gesch=C3=A4ftsf=C3=BChrung: Sebastian Deutsch, Eray Basar

Datenschutzhinweise nach Art. 13 DSGVO


On Thu, 13 Oct 2022 at 15:18, Naresh Solanki
<naresh.solanki@9elements.com> wrote:
>
> These patches adds devicetree support for MAX6639.
>
> Changes V4:
> - Fix dt error
> - update comment
> Changes V3:
> - correct fan dt property name
> - remove unrelevent changes
> Changes V2:
> - Fix dt schema error.
> Changes:
> - Add fan-common dt schema.
> - add dt-binding support for max6639
> - add max6639 specific property
>
> Marcello Sylvester Bauer (1):
>   dt-bindings: hwmon: Add binding for max6639
>
> Naresh Solanki (2):
>   dt-bindings: hwmon: fan: Add fan binding to schema
>   hwmon: (max6639) Change from pdata to dt configuration
>
>  .../devicetree/bindings/hwmon/fan-common.yaml |  48 ++++
>  .../bindings/hwmon/maxim,max6639.yaml         |  86 ++++++++
>  drivers/hwmon/max6639.c                       | 206 +++++++++++++-----
>  3 files changed, 287 insertions(+), 53 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.ya=
ml
>  create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639=
.yaml
>
>
> base-commit: 0cf46a653bdae56683fece68dc50340f7520e6c4
> --
> 2.37.3
>
