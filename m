Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F69EC43334
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jun 2022 12:46:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244141AbiFGMqW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Jun 2022 08:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244214AbiFGMqU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Jun 2022 08:46:20 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 049DCF8E4C
        for <linux-hwmon@vger.kernel.org>; Tue,  7 Jun 2022 05:46:17 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id s8so18456125oib.6
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jun 2022 05:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=43D7ndpRJigLwWDfIvtgGls/i5fH1zUAmyzDYX/W9T4=;
        b=FhOyZ8qkS34Pw7QTd/1L9y2BxVtGhwZ3QqHCRtzNJOl4yDjiapR3kvawi6ER8l2l9Q
         FU27qvyAfheoebe1GEBXO4VF34Uf9Fd6RdYGIfeY4q5dkZloUUCOKqjXlqAqD+0zsI+M
         WiU6ucUSqYVzzTxmFzmnU05Eo6t7l8kqfKWxsZacXAV+DuY2aKhjceTLhKoG2nncOonP
         vtBVmO1dG475wedXY1RUscK/Ig7II6/gZKzw75WXm7YBeLVBZ/xQeCEo4y6isvw8gNWz
         kzlk9iM4eGsOqbGFUsK7R7ur48u/9Gg1GK6QmfdFEDrkRHhP5bAF+EaF4m/GfV2zs3Ll
         GhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=43D7ndpRJigLwWDfIvtgGls/i5fH1zUAmyzDYX/W9T4=;
        b=23On25fYYWAPY0om9rrqS3zmmTGVX5WLDO4ziS54oPmBaDl25prTPcYRtKozquUf+2
         4DYFi7UNwgQPLtkhiMMy9WFHLkfx8kFOC+Yw8n0ZkWlvs+yLNRCQ0xVXo8iQXJ7qAGr+
         hcjZLt+A5tVAjxe+pijNkGXhBD3qBuWdEN74UXwtRmNhSnTuyOKN3Rv87pB+xKn0WK4Y
         XVVaC2pqKINAbJvoGCxpHIsM38WY3MtGSSZLa1KnLRL45MooXLlM21CheYB3Qa4Cu4X6
         wtTO7Y4ARsRtgfbtHRI1yDykao8qMslw52/tfmMKnH2T6ypBrKO68wTyc/R7gcA3alaJ
         O2JQ==
X-Gm-Message-State: AOAM533htW00KvI2rXXpZxl3jkUWxdxK772ndA6tYzXOzGPXkfu+mG/e
        9TAbZiP3MzV0jGY5GhtDyDCaidlM0gQ=
X-Google-Smtp-Source: ABdhPJxf6yfCnkwYrZ5ruG6TyR13f0cqFRLUhHeqZEhq5LNPgKDbBIQPEEwK0kFJz6wl9LN8zLOGHw==
X-Received: by 2002:a05:6808:2182:b0:32b:cf65:ee50 with SMTP id be2-20020a056808218200b0032bcf65ee50mr16686999oib.273.1654605976132;
        Tue, 07 Jun 2022 05:46:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j1-20020a056830240100b0060b0c4704fasm9328856ots.4.2022.06.07.05.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 05:46:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 7 Jun 2022 05:46:14 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (occ) Lock mutex in shutdown to prevent race with
 occ_active
Message-ID: <20220607124614.GA1786476@roeck-us.net>
References: <20220606185455.21126-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606185455.21126-1-eajames@linux.ibm.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jun 06, 2022 at 01:54:55PM -0500, Eddie James wrote:
> Unbinding the driver or removing the parent device at the same time
> as using the OCC active sysfs file can cause the driver to unregister
> the hwmon device twice. Prevent this by locking the occ mutex in the
> shutdown function.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/occ/common.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index d78f4bebc718..ea070b91e5b9 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -1228,10 +1228,15 @@ EXPORT_SYMBOL_GPL(occ_setup);
>  
>  void occ_shutdown(struct occ *occ)
>  {
> +	mutex_lock(&occ->lock);
> +
>  	occ_shutdown_sysfs(occ);
>  
>  	if (occ->hwmon)
>  		hwmon_device_unregister(occ->hwmon);
> +	occ->hwmon = NULL;
> +
> +	mutex_unlock(&occ->lock);
>  }
>  EXPORT_SYMBOL_GPL(occ_shutdown);
>  
