Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A3FC54E76
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 Jan 2023 18:37:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233110AbjAQSgt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 Jan 2023 13:36:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232607AbjAQSbz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 Jan 2023 13:31:55 -0500
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA995399F;
        Tue, 17 Jan 2023 10:03:46 -0800 (PST)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-15bb8ec196aso21054749fac.3;
        Tue, 17 Jan 2023 10:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsnU4SEnhYMX4K6JN06vg4T6uBL8G+Stssq81fySd1M=;
        b=MNSI0nRjGgE6dC+a89cNENxUY0/vVd4JUd5AartSuHqzV5ypUrXyWoNO5nXE1xq0JK
         6PbFmJ6sch3YXVDyjyxpjt9Vq7+oWZBkOk5ejMlO3LflLuVbF7y9Do9QA+YGEMFsNZUJ
         FZCJywJihMTnaZb+Ezz9TVL50uH5dzFEPjiybwXoSlP/HDn/hpt2yqXiO2IL2SKqnRT+
         P7muoVYPyzCaTRCodZFLpNwEybXm0xbNnKA1uQmj5sWveIosTE2Re40YM7wZ7S/WvDe7
         AQH+h7yMmVvY4TiLEdFztBZdOUaYDqSjg9N3ZfTH0DoEbkRRu45HfQJ7P0smLd/3Os07
         93xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XsnU4SEnhYMX4K6JN06vg4T6uBL8G+Stssq81fySd1M=;
        b=Mb/hxlaWhDOYOZ1NXsS9BenZ+vjS17SVEEpuYFMkheLlwj1JzB5qsyu6v4C9m4dXyq
         g478A629OEWeLTPc5GU2bUXZFAOdjNKh44ttQvfTUrx2F2KITXQT9dWiWYLpbPBemcZL
         C93l+X0YJFsJr34QY/RkMfPF1x/S9Uxz1AJt/9mRzhVF6rVY7Yu+pvkZXlmIXGttose1
         s+f4bBgcnWBzh/ia8vnogX2V2XIyek67MMMDHfiTfxYG1nJWU17lypiFYlcwfwRLxoCE
         W1G6uJbx2uD/hy+y7k/Pt7hP4k2PxRka1zK4E9b9woTwZcEfzn3xcBNmh5qBS1VWdmZ1
         u7Ng==
X-Gm-Message-State: AFqh2krfJNi6Hb+K2VtlX70bKgEHfFCG20h1nS5e4TlklQ2U3+zZAi2V
        OhPe90S/liWSV/u2sn3nrzo=
X-Google-Smtp-Source: AMrXdXtV2I3oYBqihq1mYMRhNeJS77cAyaL3KZH5Wxo0rFba8xRBNJ4jqYpVvhKgTj6+dBkQbK1E1A==
X-Received: by 2002:a05:6870:fd91:b0:15f:140a:6e72 with SMTP id ma17-20020a056870fd9100b0015f140a6e72mr2468270oab.1.1673978623953;
        Tue, 17 Jan 2023 10:03:43 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v12-20020a056870b50c00b0014fc049fc0asm17034675oap.57.2023.01.17.10.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 10:03:43 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 17 Jan 2023 10:03:42 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mario Kicherer <dev@kicherer.org>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: hwmon: add nxp,mc34vr500
Message-ID: <20230117180342.GD2335664@roeck-us.net>
References: <20230117161340.1310936-1-dev@kicherer.org>
 <20230117161340.1310936-3-dev@kicherer.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117161340.1310936-3-dev@kicherer.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jan 17, 2023 at 05:13:39PM +0100, Mario Kicherer wrote:
> This patch adds dt-bindings for the NXP MC34VR500 PMIC.

As with the other patches, use imperative mood.

Guenter

> 
> Signed-off-by: Mario Kicherer <dev@kicherer.org>
> ---
>  .../bindings/hwmon/nxp,mc34vr500.yaml         | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nxp,mc34vr500.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/nxp,mc34vr500.yaml b/Documentation/devicetree/bindings/hwmon/nxp,mc34vr500.yaml
> new file mode 100644
> index 000000000000..dfbd6125e84a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/nxp,mc34vr500.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/mc34vr500.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP MC34VR500 hwmon sensor
> +
> +maintainers:
> +  - Mario Kicherer <dev@kicherer.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,mc34vr500
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      mc34vr500@8 {
> +        compatible = "nxp,mc34vr500";
> +        reg = <0x08>;
> +      };
> +    };
> -- 
> 2.34.1
> 
