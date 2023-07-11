Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92086EB64DC
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jul 2023 16:28:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjGKQ2T (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jul 2023 12:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbjGKQ2T (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jul 2023 12:28:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C363712E
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jul 2023 09:28:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5B2D86152D
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jul 2023 16:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF32FC433C8;
        Tue, 11 Jul 2023 16:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689092896;
        bh=pNutX6nBnQZ8j1oiShEFgu+az3etaUVHP8v3vxh7zLk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=QZa8aS/ZmdkEHKsmGAEOrO2qF2Ip9LJVfwsss/dmztagfU6SnsilVAtopK6E3S9dz
         ky9YVbcrqw7mKDKBpFhuAELc+bfQ40WneY2hkK0sAK0Kq+mFczUa4IEAdr2R/LOqGS
         VlJGGKVIcoAIHeDNpS3IP23A3yWaLYW3d+MDS9R0rftqvqNI15tzgnM34vr4kg5bU0
         Vafh8mnKhkomq4Chk+3836TWXP0/NYyXWoMh5HT/mI2ZxnQPGjOn24NGywNcinMOgu
         6wz1Rr30XOGkaXvo2I0XLBZlt2EmBq0S5i7ACjBRcTqueKmJqNBmO/0rpmXpcBJbOe
         JQsuRIpH6ybBg==
Message-ID: <f3fedfb2-85a3-2b7b-e474-b082fb60fa3e@kernel.org>
Date:   Tue, 11 Jul 2023 18:28:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] dt-bindings: hwmon: Add description for new hwmon
 driver hs300x
To:     Andre Werner <werneazc@gmail.com>, jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org,
        Andre Werner <andre.werner@systec-electronic.com>
References: <20230711140637.4909-1-andre.werner@systec-electronic.com>
 <20230711140637.4909-2-andre.werner@systec-electronic.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230711140637.4909-2-andre.werner@systec-electronic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/07/2023 16:06, Andre Werner wrote:
> This is the initial description.
> 
> Signed-off-by: Andre Werner <andre.werner@systec-electronic.com>
> ---
>  .../devicetree/bindings/hwmon/hs300x.yaml     | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/hs300x.yaml

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC. It might happen, that command when run on an older
kernel, gives you outdated entries. Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least DT list (maybe more), so this won't be tested by
automated tooling. Performing review on untested code might be a waste
of time, thus I will skip this patch entirely till you follow the
process allowing the patch to be tested.

Please kindly resend and include all necessary To/Cc entries.

> 
> diff --git a/Documentation/devicetree/bindings/hwmon/hs300x.yaml b/Documentation/devicetree/bindings/hwmon/hs300x.yaml
> new file mode 100644
> index 000000000000..7a9b3ee3738b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/hs300x.yaml

Filename like compatible

> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +

Drop

> +$id: http://devicetree.org/schemas/hwmon/hs300x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas HS300x humidity and temperature sensor
> +
> +maintainers:
> +  - Andre Werner (andre.werner@systec-electronic.com)
> +
> +description: |
> +  This driver implements support for the Renesas HS300x chips, a humidity

Bindings are for hardware, not drivers.

> +  and temperature family. Temperature is measured in degrees celsius, relative
> +  humidity is expressed as a percentage. In the sysfs interface, all values are
> +  scaled by 1000, i.e. the value for 31.5 degrees celsius is 31500.

sysfs is not hardware related, drop.

> +
> +  The device communicates with the I2C protocol. Sensors can have the I2C
> +  address 0x44 by default.
> +
> +  The driver does not support the sensor's configuration possibilities.
> +
> +  The driver is able to be read out using lmsensors.
> +
> +  Datasheets:
> +  https://www.renesas.com/us/en/document/dst/hs300x-datasheet?r=417401
> +
> +

Just one blank line.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - hs3001
> +      - hs3002
> +      - hs3003
> +      - hs3004

Eh, so this was not tested... That's not correct compatible, missing
vendor prefix.

> +
> +  reg:
> +    maxItems: 1
> +

Missing several properties.

> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          humidity: hs3002@44 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +              compatible = "hs3002";
> +              reg = <0x44>;
> +          };
> +    };

Best regards,
Krzysztof

