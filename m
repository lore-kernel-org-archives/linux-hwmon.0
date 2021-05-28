Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19568C47087
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 17:53:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB12B6124B
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 17:53:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbhE1Ryt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 May 2021 13:54:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:49662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229450AbhE1Rys (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 May 2021 13:54:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 72CFF61175;
        Fri, 28 May 2021 17:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622224393;
        bh=I+oLG+8LqpfeUOFJBNF0ue5VI2MheBtX9QQTwmkqmUw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lN9aWd1TCQWoKXsjzy/xztQjpXBAMS7PklhsA5JwnCeXjZGm7yZdJxe36mr0NYqqo
         8anZVL/WqDbwXrHZqRiGMnjjUXwZ29VL4YzbMkmLKRPBnmfBl2hCUqQEnK9cv41KT1
         IVZLP8W1gDAw7P/5xXHykYCHXh0fDvPJEWiXkcLNU8sggyHVuuIg2NHC47eWkXDQVF
         wfYM1Pc6KXU8UeaDC/Tijh6bhYnxDfVG0u02yRYJ8bma4v1nYpaY6PeyQ3WrHYuSPo
         DWVmMZFlm7aas/Uixth8v559ISoHLp500kB/9zXjW3PIXPNS3b01G7vIOXoq/DvR1J
         wGZPYYzZ0AGeg==
Received: by pali.im (Postfix)
        id C70F3B0B; Fri, 28 May 2021 19:53:10 +0200 (CEST)
Date:   Fri, 28 May 2021 19:53:10 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     W_Armin@gmx.de
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 6/6] hwmon: (dell-smm-hwmon) Update docs
Message-ID: <20210528175310.53ey6xq5ttpfkod6@pali>
References: <20210528173716.10975-1-W_Armin@gmx.de>
 <20210528173716.10975-7-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528173716.10975-7-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Friday 28 May 2021 19:37:16 W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> pwm1_enable is now readable too.

Hello! pwm1_enable cannot be readable. It is write-only node. See also:
https://lore.kernel.org/linux-hwmon/201605221717.26604@pali/

> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  Documentation/hwmon/dell-smm-hwmon.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/dell-smm-hwmon.rst b/Documentation/hwmon/dell-smm-hwmon.rst
> index 3bf77a5df995..d6fe9b8a2c40 100644
> --- a/Documentation/hwmon/dell-smm-hwmon.rst
> +++ b/Documentation/hwmon/dell-smm-hwmon.rst
> @@ -35,7 +35,7 @@ Name				Perm	Description
>  fan[1-3]_input                  RO      Fan speed in RPM.
>  fan[1-3]_label                  RO      Fan label.
>  pwm[1-3]                        RW      Control the fan PWM duty-cycle.
> -pwm1_enable                     WO      Enable or disable automatic BIOS fan
> +pwm1_enable                     RW      Enable or disable automatic BIOS fan
>                                          control (not supported on all laptops,
>                                          see below for details).
>  temp[1-10]_input                RO      Temperature reading in milli-degrees
> --
> 2.20.1
> 
