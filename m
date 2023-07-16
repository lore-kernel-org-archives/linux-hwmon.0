Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA756EB64DD
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Jul 2023 16:33:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbjGPQdv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Jul 2023 12:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjGPQdu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Jul 2023 12:33:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 249F0B6;
        Sun, 16 Jul 2023 09:33:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B79D360D58;
        Sun, 16 Jul 2023 16:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD6CC433C8;
        Sun, 16 Jul 2023 16:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689525229;
        bh=4Gox1Cty+tRtXRaQMTcnJs4feQzfT8FuOPGXfIJCq+Y=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=kW4DtNwOLUoxLej/hp5IYPdUSKhkNWKHYxzVjbr1+j9IHRuaKcowUDrIf+bkY6k6D
         aXiuqArdsLgCojzNPJGPRYlCt5aAHTAGAWK6mLCXZcISSRNCwM2LVVHVdTdRtTXtrS
         F3BSTNXI5ylTg6895I0J30yIqAZ5QNs71yFlaX/2i3uhLJRjifgETUATqJ/J/xnHCb
         3FsYSKbdt3P5K5ad8XXfGQxeOcih+znV+/2AbsSQu6LvGknrOw/yjb3iH2oRUCV+q+
         904TMYpnM0ATeKCLgBr+Z941HcoSxhdKWUEwCQervAdYWIIxV/3jDGKjP5BJNqKFWK
         bwqVt5zf+rcQA==
Message-ID: <f0c8adfb-bc72-3424-c021-d694e98a8537@kernel.org>
Date:   Sun, 16 Jul 2023 18:33:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add description for new hwmon
 driver hs3001
Content-Language: en-US
To:     Andre Werner <werneazc@gmail.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Andre Werner <andre.werner@systec-electronic.com>
References: <20230716150556.26155-1-andre.werner@systec-electronic.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230716150556.26155-1-andre.werner@systec-electronic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 16/07/2023 17:05, Andre Werner wrote:
> This is the initial description.
> 
> Signed-off-by: Andre Werner <andre.werner@systec-electronic.com>

Duplicated patch, but my comments stay - you did not CC people I asked for.

> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index ba2bfb547909..5a5de3f6cd37 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -320,6 +320,8 @@ properties:
>              # Rohm DH2228FV
>            - rohm,dh2228fv
>              # S524AD0XF1 (128K/256K-bit Serial EEPROM for Low Power)
> +          - renesas,hs3001
> +            # Renesas HS300[1,2,3,4] Temperature and Relative Humidity Sensors

wrong comment.

>            - samsung,24ad0xd1

Samsung, not Renesas


Best regards,
Krzysztof

