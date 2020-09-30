Return-Path: <SRS0=ye16=DH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF52AC4727C
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Sep 2020 20:40:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E14A20759
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Sep 2020 20:40:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbbhgAEl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728721AbgI3UkG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Sep 2020 16:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI3UkG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Sep 2020 16:40:06 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20420C061755;
        Wed, 30 Sep 2020 13:40:06 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id c2so3180274otp.7;
        Wed, 30 Sep 2020 13:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5R4Mq0u607bEuDV/8t+U2BjsfHRmnX7fotbXqtuqZGE=;
        b=hbbhgAElpq8u0rNm5SFVDZ3HNgaVdLXQdFMy78t7bJg71TViXs9tV+rIttwaJyzX1+
         Bi7nJkA9H7/C1QFGTAHErcCdQBeN8HxGyX+KF0XyrqTjxAifOD+TrusNn+i3OnzUclnn
         x0ABsYGAWLfeXKDD53J+wq/h5C/YlvWHrDqjWN2FI8sbZYGjCpYYfmC4gBKmTs7eOB+V
         SlaH1K3JRq4ErnW9qC78w6yLBy9hz1TyWsyrAYjc5KDFm7881XKLLzY2HDeHSm94SbkE
         nJTc7jAK356Arfpsf1DUHJahlQOtDsZ8A0H9G8caZfGfFsjnxY5hXTcPH8SjPTjVvO9K
         4GRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=5R4Mq0u607bEuDV/8t+U2BjsfHRmnX7fotbXqtuqZGE=;
        b=BqY7yIKNOqsAV7hg9PkEyWJBsLTPUNG5BSng/I1zk8hqmzcn+/JUDirnBiXoMFqZp1
         y3oGB9i168PAElWZuv269LFpBTEGnbShpz2+FvNXCty9vowOk7do99r4Pm/WVnc5L6b2
         nmIEcI3bI6OxbYuoMKXsLFNryMZEk+5kofBaKNv4XzVlCzsWw2JwyBzm1IMxrKETokeY
         pZ6Nssp+KvQKkrjtNx4tHHBuWC+xQafjaZd2HgcD7n5fX79Q0C5l3pDB/902ttAORVmr
         eHl1GIYF3j88K+mctj/DsoFQ70OJ0yadJpzNrZFNBsBwFscdyKrePp7OKOb+qtTfZoN4
         xoJw==
X-Gm-Message-State: AOAM533P2mnWN3+0Qs9/OvqtfiPRz2sSYofAvDMbP5CzG4NuiaQakNIA
        nemlAZNeveh6J1e7dPW38eY=
X-Google-Smtp-Source: ABdhPJzfDNGCDBaqE4DcONgRsYO4u3S34xVrY93cvXCUgCvdLI0J2UJOHUtIOlm1FTYk86lRhX0zoQ==
X-Received: by 2002:a05:6830:1603:: with SMTP id g3mr2725618otr.328.1601498405554;
        Wed, 30 Sep 2020 13:40:05 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x15sm690641oor.33.2020.09.30.13.40.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 13:40:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 30 Sep 2020 13:40:04 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     robh+dt@kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH hwmon-next v4 2/2] dt-bindings: Add MP2975 voltage
 regulator device
Message-ID: <20200930204004.GA241772@roeck-us.net>
References: <20200926204957.10268-1-vadimp@nvidia.com>
 <20200926204957.10268-3-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200926204957.10268-3-vadimp@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Sep 26, 2020 at 11:49:57PM +0300, Vadim Pasternak wrote:
> Monolithic Power Systems, Inc. (MPS) dual-loop, digital, multi-phase
> controller.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied.

Thanks,
Guenter

> ---
> v2->v3
>  - Fix after 'make dt_binding_check'.
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 4ace8039840a..b2e994bc00af 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -80,6 +80,8 @@ properties:
>            - fsl,mpl3115
>              # MPR121: Proximity Capacitive Touch Sensor Controller
>            - fsl,mpr121
> +            # Monolithic Power Systems Inc. multi-phase controller mp2975
> +          - mps,mp2975
>              # G751: Digital Temperature Sensor and Thermal Watchdog with Two-Wire Interface
>            - gmt,g751
>              # Infineon IR38064 Voltage Regulator
