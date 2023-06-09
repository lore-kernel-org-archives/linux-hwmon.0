Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83990C7EE2F
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Jun 2023 06:45:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbjFIGpN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238705AbjFIGpI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Jun 2023 02:45:08 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AE159E;
        Thu,  8 Jun 2023 23:45:06 -0700 (PDT)
Received: from localhost (mdns.lwn.net [45.79.72.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 95BC0218;
        Fri,  9 Jun 2023 06:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 95BC0218
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1686293104; bh=3rg0WjJw4hPJ60vNtrNt09H4yyqqTmW+xSH4eaVGQ4E=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=fWfK+2HjxgovIqkglzIVgkIQkgiDxV2Bc5hYjkaChsm+Lx4UzF6+Krg18reMCcd4F
         XoC6Jj10WSF2u76SET8xVN4id6QXQ7vtN1vjR6TjFuD35FrkD62PWscd77BIyIf/wg
         d4/I/JN2uANqHBpJJRQ9B8x6RaHg6YKK1sAdoF0ZcQ9Or1R6Vp9AAu9rXhGCSgw93m
         8S7Rba0hEdak1iAFTHVaqDP3bKcx9ePGuEbFcSNhX6GrMhKlmXOcJCl0hsNuxLPQ+I
         VMJzQHgMFbKU7JrEe7wr34CZa2VHtJ5z+3h0NK1VdTjKM9nbLkWPHtgRZRQFuM6Mho
         8Xy4nRAwKyoJg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     YYang <iyysheng@gmail.com>, jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, YYang <iyysheng@gmai.com>
Subject: Re: [PATCH] Documentation/hwmon: Fix description of
 devm_hwmon_device_unregister
In-Reply-To: <20230608224231.1156-1-iyysheng@gmail.com>
References: <20230608224231.1156-1-iyysheng@gmail.com>
Date:   Fri, 09 Jun 2023 00:45:00 -0600
Message-ID: <871qilqglv.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

YYang <iyysheng@gmail.com> writes:

> From: YYang <iyysheng@gmai.com>
>
> Use devm_hwmon_device_register_with_info to replace
> hwmon_device_register_with_info in description of
> devm_hwmon_device_unregister.
>
> Signed-off-by: YYang <iyysheng@gmai.com>
> ---
>  Documentation/hwmon/hwmon-kernel-api.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/hwmon/hwmon-kernel-api.rst b/Documentation/hwmon/hwmon-kernel-api.rst
> index c2d1e0299d8d..6cacf7daf25c 100644
> --- a/Documentation/hwmon/hwmon-kernel-api.rst
> +++ b/Documentation/hwmon/hwmon-kernel-api.rst
> @@ -66,7 +66,7 @@ hwmon_device_register_with_info.
>  
>  devm_hwmon_device_unregister does not normally have to be called. It is only
>  needed for error handling, and only needed if the driver probe fails after
> -the call to hwmon_device_register_with_info and if the automatic (device
> +the call to devm_hwmon_device_register_with_info and if the automatic (device
>  managed) removal would be too late.

If, while you're at it, you add the trailing parentheses() to the
function name, then the docs build will automatically make a cross-link
to the documentation.

Thanks,

jon
