Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08347CE7B06
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Sep 2023 18:35:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232142AbjI1Sf2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 28 Sep 2023 14:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232152AbjI1Sf1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 Sep 2023 14:35:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15BDF1A1;
        Thu, 28 Sep 2023 11:35:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D123C433C7;
        Thu, 28 Sep 2023 18:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695926125;
        bh=kRFAwJeerof4Xj/Rqpb/7KVVGbGiS82bsy23rOFcCBM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jpHtj4087rKeHQLPj+FQ8XNBIAQHRNj9h2vBN0A+kuPX6ON0t7JWcysR3NLYGpZpv
         IBSLmR3gfLm7qEyFGPKJBNJvzD5UGjGQfjlg4Gnt84ilSfD5eUn+EDHRBQdMCAlHsA
         GXHd4DRtERaQTIcE67G43tJ2Y3Uieob25sVWjssfuzkTiveSg1PzwJXTLuUg6Phqgb
         TbkAtOFuJirbyLjpjtp4MqqkDFnPaPt+CGscmTFGdjY49s8IgQbjleHs14m8dnW+sv
         LCHJ+ALNL+ClD2l795B95g0WFkvcF8PXlSxvN2I9NQUB+JQGdiryvEsUqHdErq5V26
         lpeBOSQN7WZtg==
Received: (nullmailer pid 1034755 invoked by uid 1000);
        Thu, 28 Sep 2023 18:35:22 -0000
Date:   Thu, 28 Sep 2023 13:35:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tomer Maimon <tmaimon77@gmail.com>
Cc:     tali.perry1@gmail.com, venture@google.com, joel@jms.id.au,
        devicetree@vger.kernel.org, avifishman70@gmail.com,
        linux-kernel@vger.kernel.org, j.neuschaefer@gmx.net,
        linux@roeck-us.net, benjaminfair@google.com,
        openbmc@lists.ozlabs.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, yuenn@google.com, jdelvare@suse.com,
        andrew@codeconstruct.com.au, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: hwmon: npcm: Add npcm845 compatible
 string
Message-ID: <169592612186.1034699.3436968254453890969.robh@kernel.org>
References: <20230927173850.103435-1-tmaimon77@gmail.com>
 <20230927173850.103435-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927173850.103435-2-tmaimon77@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On Wed, 27 Sep 2023 20:38:49 +0300, Tomer Maimon wrote:
> Add a compatible string for Nuvoton BMC NPCM845 Pulse Width Modulation (PWM)
> and Fan tach controller.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

