Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8BBC6377D
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Jul 2021 09:20:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54DF96109F
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Jul 2021 09:20:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbhGVIkU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Jul 2021 04:40:20 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3446 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231280AbhGVIkU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Jul 2021 04:40:20 -0400
Received: from fraeml712-chm.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4GVmq36qH6z6H7jw;
        Thu, 22 Jul 2021 17:09:19 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml712-chm.china.huawei.com (10.206.15.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 11:20:53 +0200
Received: from localhost (10.47.4.50) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 22 Jul
 2021 10:20:52 +0100
Date:   Thu, 22 Jul 2021 10:20:27 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Maxime Ripard <maxime@cerno.tech>
CC:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-sunxi@googlegroups.com>, Guenter Roeck <linux@roeck-us.net>,
        "Jean Delvare" <jdelvare@suse.com>,
        Jonathan Cameron <jic23@kernel.org>,
        <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 14/54] dt-bindings: hwmon: Add IIO HWMON binding
Message-ID: <20210722102027.000035a5@Huawei.com>
In-Reply-To: <20210721140424.725744-15-maxime@cerno.tech>
References: <20210721140424.725744-1-maxime@cerno.tech>
        <20210721140424.725744-15-maxime@cerno.tech>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.4.50]
X-ClientProxiedBy: lhreml727-chm.china.huawei.com (10.201.108.78) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 21 Jul 2021 16:03:44 +0200
Maxime Ripard <maxime@cerno.tech> wrote:

> Even though we had the iio-hwmon driver for some time and a number of
> boards using it already, we never had a binding for it. Let's add it
> based on what the driver expects and the boards are providing.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../devicetree/bindings/hwmon/iio-hwmon.yaml  | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/iio-hwmon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/iio-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/iio-hwmon.yaml
> new file mode 100644
> index 000000000000..49dd40f663a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/iio-hwmon.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/hwmon/iio-hwmon.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: ADC-attached Hardware Sensor Device Tree Bindings
> +
> +maintainers:
> +  - Jonathan Cameron <jic23@kernel.org>

I'd like to share the blame for this one.  Binding was originally added
by Guenter.

https://lore.kernel.org/linux-iio/1359668588-13678-4-git-send-email-linux@roeck-us.net/
https://lore.kernel.org/linux-iio/1359668588-13678-11-git-send-email-linux@roeck-us.net/
:)

As bindings go this one has always been controversial because
it's mapping between linux subsystems rather than really describing
hardware.  We've had various discussions over the years on how to do
this differently, but perhaps just documenting the current state is the
way to go.  That doesn't stop us moving to something better in the
future.

> +
> +description: >
> +  Bindings for hardware monitoring devices connected to ADC controllers
> +  supporting the Industrial I/O bindings.
> +
> +properties:
> +  compatible:
> +    const: iio-hwmon
> +
> +  io-channels:
> +    minItems: 1
> +    maxItems: 1024

Why 1024?

> +    description: >
> +      List of phandles to ADC channels to read the monitoring values
> +
> +required:
> +  - compatible
> +  - io-channels
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +      iio-hwmon {
> +          compatible = "iio-hwmon";
> +          io-channels = <&adc 1>, <&adc 2>;
> +      };

