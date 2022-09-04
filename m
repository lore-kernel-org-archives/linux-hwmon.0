Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A415C6FA82
	for <linux-hwmon@archiver.kernel.org>; Sun,  4 Sep 2022 16:08:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234406AbiIDQIx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 4 Sep 2022 12:08:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbiIDQIx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 4 Sep 2022 12:08:53 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2DED37FA7
        for <linux-hwmon@vger.kernel.org>; Sun,  4 Sep 2022 09:08:51 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id q3so6323341pjg.3
        for <linux-hwmon@vger.kernel.org>; Sun, 04 Sep 2022 09:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=82i9BCLrYZf1B3Q3PzUf+U6wO5wNlI1ZwM9MmaGLes8=;
        b=TKy8hZg9m7JoiiIzaGRRaSkbJ+HPiGIQK5uivTKF63CX/nDQEyeK4ML3WJYCLeB+Rs
         mT++yZvtAlXaE7ZG0qSLYLX99vHYO+jHw/f6zJ4Z6XrNt1yYTZjBGi6TexsIMV/TT6Hj
         /0KEMnCG918Pd8L1NS7BZG21Us5ZdyBv2DWh1GLIpzTEQorsUsCsTLWAAsMExL/GGWLr
         kWmmimNZbk4VHu/PRb/KbqtUW1NUbLReJIkJ0PsWBxx9S4Ywnks2quZNx1YsQtqbJLcB
         9e0ShYNkeD/EuTLNmGWpRavkHyRn28lOY31xLQ/nfCa7LzeZvfa5weIY+iH2auAY4l2I
         4YlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=82i9BCLrYZf1B3Q3PzUf+U6wO5wNlI1ZwM9MmaGLes8=;
        b=qHbrIMfgBFrd8RICVog2zKrfNZgi2CC2VDa2zm7o7lcm2a54TjJZYbw8H/ltg8ws+U
         1PVWjc4b2zw0YgDuGq+B8iR07AWslvCBTGp8rvneiY0bJydf1mYF6cSy+XNBsR+2iSJA
         Xl1XAIaBo8o/N9cVWJ8KtSUYILqsciz7huqhuKzerbPN+rRMBk/5p3125UbMta+JPdB/
         5WS3sxwTBe6F4V1Etw3Jh2r5EDqGHdBQT9yfzealU/AYmZuo24uU/dj8wpdaDT6UsO4U
         IlB0IJNHtywJnW0EeGyT9Z0xDzCZzpCV3VUGIbI9uaRLw+EufLtayKcvAcFGEy6/iswJ
         1FGg==
X-Gm-Message-State: ACgBeo1KyM1QScKzYm/zHoG6euWtMVpt5H+B+3j4eLwPnjMUgh4rRzBN
        VFjzzJsmIcdy43L7JAlo1R8=
X-Google-Smtp-Source: AA6agR67zkZEqhM1XI/tlU2WzZFsnQGYe/ftN8UMbm+Da4U8zy+EcmYa9kmUqD8REgRIVe19tj7k4A==
X-Received: by 2002:a17:90b:254a:b0:200:53f:891d with SMTP id nw10-20020a17090b254a00b00200053f891dmr10871162pjb.168.1662307731238;
        Sun, 04 Sep 2022 09:08:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h10-20020a17090acf0a00b0020061f4c907sm377823pju.7.2022.09.04.09.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 09:08:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 4 Sep 2022 09:08:49 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v5 3/4] dt-bindings: hwmon: Add bindings for max31760
Message-ID: <20220904160849.GA3007349@roeck-us.net>
References: <20220901125906.929-1-Ibrahim.Tilki@analog.com>
 <20220901125906.929-4-Ibrahim.Tilki@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901125906.929-4-Ibrahim.Tilki@analog.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 01, 2022 at 03:59:05PM +0300, Ibrahim Tilki wrote:
> Adding bindings for Analog Devices MAX31760 Fan-Speed Controller
> 
> Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>

This patch wil need to be reviewed by a DT maintainer. Please use
scripts/get_maintainer.pl to determine who needs to be copied.

Thanks,
Guenter

> ---
>  .../bindings/hwmon/adi,max31760.yaml          | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adi,max31760.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adi,max31760.yaml b/Documentation/devicetree/bindings/hwmon/adi,max31760.yaml
> new file mode 100644
> index 000000000..003ec1317
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adi,max31760.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/adi,max31760.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices MAX31760 Fan-Speed Controller
> +
> +maintainers:
> +  - Ibrahim Tilki <Ibrahim.Tilki@analog.com>
> +
> +description: |
> +  Analog Devices MAX31760 Fan-Speed Controller
> +  https://datasheets.maximintegrated.com/en/ds/MAX31760.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,max31760
> +
> +  reg:
> +    description: |
> +      I2C address of slave device.
> +    items:
> +      minimum: 0x50
> +      maximum: 0x57
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        max31760@50 {
> +                reg = <0x50>;
> +                compatible = "adi,max31760";
> +        };
> +    };
