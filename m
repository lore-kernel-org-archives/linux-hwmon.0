Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D853C07E99
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Jul 2021 17:27:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07936611CD
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Jul 2021 17:27:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234224AbhGLR3t (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 12 Jul 2021 13:29:49 -0400
Received: from mail-il1-f178.google.com ([209.85.166.178]:35516 "EHLO
        mail-il1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233887AbhGLR3t (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 12 Jul 2021 13:29:49 -0400
Received: by mail-il1-f178.google.com with SMTP id a11so20392382ilf.2;
        Mon, 12 Jul 2021 10:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=VfOYpwxhf0ti/nwFVIOy18ejT3SfYDrjNhqjrWUzw00=;
        b=E0m3zVy0RVfaUmT/g3YK1FGrJY0ykxsk/zG6/TZxg7uAus1AdYhOgiCu7BL7pfaZpJ
         2WVTXUCTuV/IdqVG5TTnt5o0ilTkGWPls1HgmzpFZQr00FtuPWOvI9B3V98AbwqjU/Dl
         xgfbc/vIBNrDT/w6cFREmOrWUTSbEcfahMu3S9bWQCIG2EC6vRJXHQXuSjVCkDTPEOi3
         6/3fb2+04yEddfgsR/2GRmPqgBADuJZKKIT3QrXSgvtRUqdBe3cPfHC/XIOSkjippoQ5
         HJPfMaQT3VsRQSkgan409CrkhQG68b4SSZOtEj8CQwKtrU+ovnUrX9xFwtun2ZHgxV5k
         cZ4A==
X-Gm-Message-State: AOAM532Dmua+1+9raJYMXzHbjVB+B3VyisTe8B2k2NOJBBWlYE0Vh4f5
        KT8LQIPnvOUCBvnphTIwcw==
X-Google-Smtp-Source: ABdhPJzE3lFHy77qGJqwlxNQbYCKJJV3idh48XWblqxtJJ9y/JpEQqsp8o/dJmwyIapkL0UyAkfekw==
X-Received: by 2002:a92:6605:: with SMTP id a5mr41089838ilc.15.1626110819832;
        Mon, 12 Jul 2021 10:26:59 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b9sm6162756ioh.30.2021.07.12.10.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 10:26:59 -0700 (PDT)
Received: (nullmailer pid 2150118 invoked by uid 1000);
        Mon, 12 Jul 2021 17:26:56 -0000
Date:   Mon, 12 Jul 2021 11:26:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [RFC PATCH 3/6] dt-bindings: axi-fan-control: add tacho
 properties
Message-ID: <20210712172656.GA2142233@robh.at.kernel.org>
References: <20210708120111.519444-1-nuno.sa@analog.com>
 <20210708120111.519444-4-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210708120111.519444-4-nuno.sa@analog.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jul 08, 2021 at 02:01:08PM +0200, Nuno Sá wrote:
> Add the bindings for the tacho signal evaluation parameters which depend
> on the FAN being used.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> ---
>  .../bindings/hwmon/adi,axi-fan-control.yaml          | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml b/Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml
> index 6747b870f297..0481eb34d9f1 100644
> --- a/Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml
> @@ -37,6 +37,18 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [1, 2, 4]
>  
> +  adi,tacho-25-us:
> +    description: Expected tacho signal when the PWM is at 25%.
> +
> +  adi,tacho-50-us:
> +    description: Expected tacho signal when the PWM is at 50%.
> +
> +  adi,tacho-75-us:
> +    description: Expected tacho signal when the PWM is at 75%.
> +
> +  adi,tacho-100-us:
> +    description: Expected tacho signal when the PWM is at 100%.

This looks like it should be common. But having PWM percents in the 
property names doesn't scale. This is also a property of the fan, not 
the fan controller.

There's only so many ways a fan can be controlled and I'm going to keep 
telling folks to make a common fan binding. There's some start to it, 
but it needs some work.

Rob
