Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F29FC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Oct 2021 22:29:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EBF06115C
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Oct 2021 22:29:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235868AbhJOWb2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 Oct 2021 18:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235677AbhJOWb2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Oct 2021 18:31:28 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E02EC061762;
        Fri, 15 Oct 2021 15:29:21 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so14808347otb.1;
        Fri, 15 Oct 2021 15:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=kuSkiD+Pj6p4qxM8R1gZxeHmf6MlxAeUCzQoIQQYH+Q=;
        b=ZJlgvKMECE06uW3+FjNfccwY5cYFX9Fax6N3UAa3BNQtqUjK5ATwouK/rzfPIQZ3c1
         03HqBacxdXaqZ31yhGyWVCxE6hxU7QZoz63U+6+Eyu2cKw6PVfxl034FihRb+prbeZgc
         7yQUHrEA1O/495LBzPYUcsJ3BwiGZuLneuqWPiWhVVmm4jqZJFkO+8OK138AjYPRhZIB
         6yrxcVeuRfdYcMBe06m3VnFmJ+Bg18HjQXmPUEhGLnzgPPFPxVUDj8uhrdV2vhJsO06Q
         f9mFJ5+l47LeMovbwAKwuBwSRTSsdmn8FGj6OprSBdI6c5x7/yyGueWxFbyRKlTbbXe2
         Wesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=kuSkiD+Pj6p4qxM8R1gZxeHmf6MlxAeUCzQoIQQYH+Q=;
        b=egXy9I5P2hTdlFlKKoWyJMN7tTAUdP5GJyVSFVPc61ePhgD9cTh2QzoQNd6mEpgBhX
         lZbw02dtBDNByFeopWZtvf80vCwgK398IyliApzH0D8PG3NiPML3alB60JlsCVc4BV0+
         z+b7fqNm+ZXVpxxSiY3nZE9Q0qcM8LP+ngljBFGvqd/WCHz8vg3Dk1tk2Q9sl6PznAjh
         4U2TnOcf9gqQDQTZ1z++3PWuQ7LIA/k4ZxpeE0awn8pDIXwSAInS/uLuK0k1glY8qWeu
         uih9BfvSI1s+WqYhrqAD9V1aE05rdgSR8mjjg/Bx3gCFfMLoJ0hjadLk9fwPnIn0Ki40
         RuSQ==
X-Gm-Message-State: AOAM533pCXDO9AqtQ7RzVngGQFd7uqW1jpROzaPoehhR61BQeNnCp5P8
        r9NrLtspeyp8ZbsAD4SgrW+RUS0dcXc=
X-Google-Smtp-Source: ABdhPJxDuu84sFBn0ixwnJXVs2lELhK2LP32tbY0J1Uic/Tv5z5wNHFMM7iCg86EfzTIQ83OWqCbkQ==
X-Received: by 2002:a05:6830:2696:: with SMTP id l22mr3608622otu.153.1634336960665;
        Fri, 15 Oct 2021 15:29:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u2sm1510868otg.51.2021.10.15.15.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:29:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 15 Oct 2021 15:29:18 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/9] dt-bindings: hwmon: add missing tmp421 binding
Message-ID: <20211015222918.GA1482125@roeck-us.net>
References: <cover.1634206677.git.krzysztof.adamski@nokia.com>
 <84ac871e30a406a1613d140a084b4f3390753099.1634206677.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84ac871e30a406a1613d140a084b4f3390753099.1634206677.git.krzysztof.adamski@nokia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 14, 2021 at 03:00:25PM +0200, Krzysztof Adamski wrote:
> Add basic description of the tmp421 driver DT bindings.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied.

Thanks,
Guenter

> ---
>   .../devicetree/bindings/hwmon/ti,tmp421.yaml  | 43 +++++++++++++++++++
>   1 file changed, 43 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
> new file mode 100644
> index 000000000000..47040ace4f73
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/ti,tmp421.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TMP42x/TMP44x temperature sensor
> +
> +maintainers:
> +  - Guenter Roeck <linux@roeck-us.net>
> +
> +description: |
> +  ±1°C Remote and Local temperature sensor
> +  https://www.ti.com/lit/ds/symlink/tmp422.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tmp421
> +      - ti,tmp422
> +      - ti,tmp423
> +      - ti,tmp441
> +      - ti,tmp442
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
> +      sensor@4c {
> +        compatible = "ti,tmp422";
> +        reg = <0x4c>;
> +      };
> +    };
