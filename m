Return-Path: <SRS0=2i4F=77=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21045C433E1
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Jun 2020 07:40:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED622206D7
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Jun 2020 07:40:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wHpyRT6g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgFRHkE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Jun 2020 03:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728072AbgFRHkC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Jun 2020 03:40:02 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C2EDC061755
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Jun 2020 00:40:02 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id p5so4902704wrw.9
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Jun 2020 00:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=s/8DkSI65X40wSJ2wJgW7rhkfE2WrLXMAQ1mczpC6zc=;
        b=wHpyRT6g48UW/2VXK4Vlqpp8IdBVoxvfm7hbnHoGqXqCjcWMt6OjnjC0rOX3gwVWts
         CLtUGBGE6vad+ibfxaicPD/sIMOJD68RzNyGnf+1r0JdWkXwXI9ont46uDWDYJAwEceO
         wlqNwz4FlUo1BipYuyqxlumxcHgPp/x2UVL9Rei+ttRe410xPlxd42rDurT/o7l/PtWi
         78hcrsBrTwGr8bON5Uu9RG8gAJXxac8Nasy8ACpAXSOobGFMWW+EqW42O3T0ctfYgGuK
         bOsPXyue9KhNA9HLKghAG1/VXSbLRz0MOxZPd0AllO8Veeup7EVzoYbJ9pJAC4q+mbN5
         ubaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=s/8DkSI65X40wSJ2wJgW7rhkfE2WrLXMAQ1mczpC6zc=;
        b=KHKZdbgk20DoctJiol8Jx2tLp+CwK8V1HQfsslt8tzuYbi4HL1t3EbCRyZGz7QcD8D
         ynrilWxQzF7jDkjRtlc3YLGlyHoaxIjOAyX0CyealPUthpcRDpmlcR/PYnR7+qCJvgT0
         kSb4fgdasASsQ/I0gQutUquH/U6tijbjPqGvluK0wssclIHIqo5O/ubvI7sbTxdDqsyA
         8ECKD98ZFCpaYF3uN3GqLSVrfBCafkLnttkCsNGiT9HcMs0wsPYz3Nj+h5wd1tUIZD2u
         HhJGNMHrD/s+q3Z0aqUTTLRhavfvooMILentYVbzk5DzTv43CzrVxog3YoIJ/faHJH+7
         qGAQ==
X-Gm-Message-State: AOAM531XUW2pndn9lMDyEDFnRhRoMJuuV0QIq0NqrDbo69MzEHAl8RYm
        2hhOpLgnpbPuuGsU03ckSX2pLA==
X-Google-Smtp-Source: ABdhPJxwjDquDAcT4g/jpcs1pS9o3jDdghMMVIQd0ngpDgfkG3HO7xafJGF9xrjnE6lQmQDojILE2g==
X-Received: by 2002:adf:f083:: with SMTP id n3mr446448wro.297.1592466001358;
        Thu, 18 Jun 2020 00:40:01 -0700 (PDT)
Received: from dell ([95.149.164.118])
        by smtp.gmail.com with ESMTPSA id w13sm2368365wrr.67.2020.06.18.00.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 00:40:00 -0700 (PDT)
Date:   Thu, 18 Jun 2020 08:39:59 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Robert Jones <rjones@gateworks.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mfd: gateworks-gsc: add 16bit
 pre-scaled voltage mode
Message-ID: <20200618073959.GX2608702@dell>
References: <1591714640-10332-1-git-send-email-tharvey@gateworks.com>
 <1591714640-10332-2-git-send-email-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1591714640-10332-2-git-send-email-tharvey@gateworks.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 09 Jun 2020, Tim Harvey wrote:

> add a 16-bit pre-scaled voltage mode to adc and clarify that existing
> pre-scaled mode is 24bit.
> 
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> ---
>  Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Fixed the grammar in the subject and commit message.

Patch applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml b/Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml
> index 487a844..ceec33f 100644
> --- a/Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml
> +++ b/Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml
> @@ -79,11 +79,12 @@ properties:
>              description: |
>                conversion mode:
>                  0 - temperature, in C*10
> -                1 - pre-scaled voltage value
> +                1 - pre-scaled 24-bit voltage value
>                  2 - scaled voltage based on an optional resistor divider
>                      and optional offset
> +                3 - pre-scaled 16-bit voltage value
>              $ref: /schemas/types.yaml#/definitions/uint32
> -            enum: [0, 1, 2]
> +            enum: [0, 1, 2, 3]
>  
>            gw,voltage-divider-ohms:
>              description: Values of resistors for divider on raw ADC input

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
