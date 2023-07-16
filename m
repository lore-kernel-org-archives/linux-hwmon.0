Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFF4EB64DD
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Jul 2023 16:33:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbjGPQdH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Jul 2023 12:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbjGPQdG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Jul 2023 12:33:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B23D2E7D;
        Sun, 16 Jul 2023 09:33:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 125F960D42;
        Sun, 16 Jul 2023 16:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73354C433C7;
        Sun, 16 Jul 2023 16:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689525182;
        bh=ozWiJryC9ZEwm6XzxA+1R7ncrFjY7tF2fCt1i3sKgxw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Tebl7JZzDKl34evLbzsOeHw+7tljrmg97imMqftLpNB5nBMY/aTfU+d8PD9GWIy53
         vnMyzDc9A7Qh2PJuIRWWVHWWRB8cM83dZQ1uAMzV7Gt37xq0bVxqKq7Ri8UHPev1Qi
         Y4moweoAFaWQQqTMv30OYh+K7LWIeOQb0lrJEDaxxic2lDoz/RpqVl1T7DfBDs6ZNE
         umywTZr5iYNKnuHjS4xJZBd7j8GJeJz/2+X6/Evao1q6ODe7zypYI3VBzM8SNxqIzf
         eDKVjKpJEY7L4jC4JemHBmiinaCKc5p1G+6zADrsW72pdkhDFKhBqr+JSXd22VDtLN
         lWwiDUjQzw9Xw==
Message-ID: <669d064e-4873-eb0f-6996-214663144a29@kernel.org>
Date:   Sun, 16 Jul 2023 18:32:55 +0200
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
References: <20230714064336.28371-1-andre.werner@systec-electronic.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230714064336.28371-1-andre.werner@systec-electronic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 14/07/2023 08:43, Andre Werner wrote:
> This is the initial description.
> 
> Signed-off-by: Andre Werner <andre.werner@systec-electronic.com>
> ---

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Didn't you get this comment already? If so, why you decided to ignore it?

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

Wrong placement of comment.

Best regards,
Krzysztof

