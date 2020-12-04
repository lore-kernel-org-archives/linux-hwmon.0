Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F56C4361B
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Dec 2020 15:23:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B0E022B47
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Dec 2020 15:23:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729598AbgLDPXK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Dec 2020 10:23:10 -0500
Received: from gproxy3-pub.mail.unifiedlayer.com ([69.89.30.42]:54917 "EHLO
        gproxy3-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730556AbgLDPXK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 4 Dec 2020 10:23:10 -0500
Received: from cmgw11.unifiedlayer.com (unknown [10.9.0.11])
        by gproxy3.mail.unifiedlayer.com (Postfix) with ESMTP id CB93540092
        for <linux-hwmon@vger.kernel.org>; Fri,  4 Dec 2020 08:22:28 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id lCuikAS58dCH5lCuikEJay; Fri, 04 Dec 2020 08:22:28 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=FcYZOq26 c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=zTNgK-yGK50A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=gAnH3GRIAAAA:8
 a=gEfo2CItAAAA:8 a=ANbo8Dlv8gLl3pwesY4A:9 a=CjuIK1q_8ugA:10:nop_charset_2
 a=oVHKYsEdi7-vN-J5QA_j:22 a=sptkURWiP4Gy88Gu7hUp:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=hHBoM8SHwdBEaWX2iAGcaH4kBm1sUEH4S2Rc86Zg3WE=; b=CNL5T8mAtKFCRlkTXwzfz7p/Ef
        +gEISxL/rQdU6xkQQPdEwa9auJGzJQLwjant+txLeAu48HsYRgt4wefI0nNpYtSUB57mRmh0Tp6oJ
        CO4F5tL40Ijn8PT/riFUYaX1j6GcljekODBX8AfWxj0/PRWXXGDtnpmLLAXcSjjxLXwwG2CxUZswM
        GXtCzsMPt0JQrDRDNWeNNcp341GSTNmT2s4ZaoP9cNavTj+GaFjKdJDIAMSBWyUTtRUC4mUAD82xB
        7t/8rNC/TVUJl4dv0JRue5WiJbCS4DZsEmdYyh4X/zxkW6tstKIhdcFaLujKnM3d672MCu3ZWpAI8
        ZyetWoQw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:46528 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1klCuh-001kRd-Nt; Fri, 04 Dec 2020 15:22:27 +0000
Date:   Fri, 4 Dec 2020 07:22:26 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     alexandru.tachici@analog.com
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Weston.Sapia@analog.com,
        Brad.Lovell@analog.com, Sal.Afzal@analog.com, robh+dt@kernel.org
Subject: Re: [PATCH v3 3/3] dt-binding: hwmon: Add documentation for ltc2992
Message-ID: <20201204152226.GC135107@roeck-us.net>
References: <20201203071155.68859-1-alexandru.tachici@analog.com>
 <20201203071155.68859-4-alexandru.tachici@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203071155.68859-4-alexandru.tachici@analog.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1klCuh-001kRd-Nt
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:46528
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 23
X-Org:  HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Dec 03, 2020 at 09:11:55AM +0200, alexandru.tachici@analog.com wrote:
> From: Alexandru Tachici <alexandru.tachici@analog.com>
> 
> Add documentation for ltc2992.
> 
> Signed-off-by: Alexandru Tachici <alexandru.tachici@analog.com>

Side note: You are supposed to keep previous Reviewed-by: tags unless
there was a change.

Applied, with Rob's Reviewed-by: tag added back.

Guenter

> ---
>  .../bindings/hwmon/adi,ltc2992.yaml           | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc2992.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc2992.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc2992.yaml
> new file mode 100644
> index 000000000000..64a8fcb7bc46
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adi,ltc2992.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/adi,ltc2992.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Linear Technology 2992 Power Monitor
> +
> +maintainers:
> +  - Alexandru Tachici <alexandru.tachici@analog.com>
> +
> +description: |
> +  Linear Technology 2992 Dual Wide Range Power Monitor
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/ltc2992.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ltc2992
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  avcc-supply: true
> +
> +patternProperties:
> +  "^channel@([0-1])$":
> +    type: object
> +    description: |
> +      Represents the two supplies to be monitored.
> +
> +    properties:
> +      reg:
> +        description: |
> +          The channel number. LTC2992 can monitor two supplies.
> +        items:
> +          minimum: 0
> +          maximum: 1
> +
> +      shunt-resistor-micro-ohms:
> +        description:
> +          The value of curent sense resistor in microohms.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c1 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ltc2992@6F {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                compatible = "adi,ltc2992";
> +                reg = <0x6F>;
> +
> +                channel@0 {
> +                        reg = <0x0>;
> +                        shunt-resistor-micro-ohms = <10000>;
> +                };
> +
> +                channel@1 {
> +                        reg = <0x1>;
> +                        shunt-resistor-micro-ohms = <10000>;
> +                };
> +        };
> +    };
> +...
> -- 
> 2.20.1
> 
