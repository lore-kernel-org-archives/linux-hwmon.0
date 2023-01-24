Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD5FC25B4E
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Jan 2023 13:57:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233676AbjAXN5b (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Jan 2023 08:57:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233279AbjAXN50 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Jan 2023 08:57:26 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5255B47424;
        Tue, 24 Jan 2023 05:56:55 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id v17so13319929oie.5;
        Tue, 24 Jan 2023 05:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VTtN/eGhLiyVHFsqGbuLo4J/N1AundXf592SuBieBAY=;
        b=V2i98o56Jegzfl4Yx41CbDMdCa95rrl3tAq/659IAmL83SuIzC+5W6IZau4ayybp01
         AhIMq+IyvPDaD2twTfJmWvwjo3IbWDhA9J6gAC96Bc4EhZew78nX4kdQLU3mGRrt3o8d
         v8zUXfuruktj0Owt3gsEkv7C/fXeYshUwyUaCxL2tOWCXlWnQeU+j+qhzvNnKcyIZ1GB
         akKQgeKUI2luXTPI8S9WwHtjHAKchdKMURk1urfzg9KrNkBcuHJDFQSKHXAkL4spTHYM
         N/SETvaPPnla82jM4pXfqctEoxlbc+wZus5atKFwnOAtprjWL7PJ2TUN0tv06yt1pl/0
         z/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTtN/eGhLiyVHFsqGbuLo4J/N1AundXf592SuBieBAY=;
        b=oMSrHqGZqwHaRx5Uu1OTtYlmyAuLoN4RO6rlCsX5Kzd6Xq/cXeNrz91j4nz978qsQe
         RE8fe0NaPbeCjzDdUuvifUGy2fDvvQj/PqGo95TQBCehmQREkq6rxVoxYwpTiO4gVybO
         BXcyefzH9GoGLW8Uk4zB8mjFAkIKNXIhhHDmuCNfhfH2aLJ6sCffh9dRP2JgR/ZesBi8
         OJfB4+RXZkAhD4nCv2G44H1p9lRtzxpdsU2BpeWDr/Et/KQ77KiQOFz0UEwbfvXHv1TD
         ZEWvCkQCUlN8hB1oAH3+dW4+nDpaTelGzJxcPoWtmiYOBs51wdA3JO3qBahp70I+E9yh
         qKYA==
X-Gm-Message-State: AFqh2kqnzV595DfiI9U5LqPjxCDqVQtj1o/QRX7n/94maZQruurKgf5v
        9QuKIWoIlo36lsWSdWKFv34=
X-Google-Smtp-Source: AMrXdXuZOnQaZYNSvu98h1TfUdb9IXEjrdTC6Cq2MR7xvzisow0ZIOS69xFshDNUbepqa/5H68gI6g==
X-Received: by 2002:a05:6808:4cf:b0:36d:f199:6e50 with SMTP id a15-20020a05680804cf00b0036df1996e50mr9113987oie.57.1674568579622;
        Tue, 24 Jan 2023 05:56:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 16-20020a544190000000b00363760f96dcsm1003787oiy.42.2023.01.24.05.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 05:56:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 24 Jan 2023 05:56:18 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mario Kicherer <dev@kicherer.org>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: add nxp,mc34vr500
Message-ID: <20230124135618.GA37158@roeck-us.net>
References: <20230118123019.3041303-1-dev@kicherer.org>
 <20230118123019.3041303-2-dev@kicherer.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118123019.3041303-2-dev@kicherer.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jan 18, 2023 at 01:30:17PM +0100, Mario Kicherer wrote:
> Add dt-bindings for the NXP MC34VR500 PMIC.
> 
> Signed-off-by: Mario Kicherer <dev@kicherer.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied th hwmon-next.

Thanks,
Guenter

> ---
>  .../bindings/hwmon/nxp,mc34vr500.yaml         | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nxp,mc34vr500.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/nxp,mc34vr500.yaml b/Documentation/devicetree/bindings/hwmon/nxp,mc34vr500.yaml
> new file mode 100644
> index 000000000000..306f67315835
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/nxp,mc34vr500.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/nxp,mc34vr500.yaml#
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
> +      pmic@8 {
> +        compatible = "nxp,mc34vr500";
> +        reg = <0x08>;
> +      };
> +    };
