Return-Path: <SRS0=ITnn=WY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179AFC3A5A1
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Aug 2019 08:57:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFF1D23777
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Aug 2019 08:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566982648;
	bh=/Bf0Zy+Qaa+eHgdxE3GzvH5JYjYkpXI4095O93WH0mQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=UUtieqHXyF+TZX4H0/RbrzC0vifwK+FQk0iEF40qJACL2VR7IR4a8Ww5k0n+jY+p7
	 LaMQT8gZ8mzwcp7cL7zY9QTp3aaqwTfJquAGIXjBk4CYih70R8IXdKJtv3YJ4Tm0Az
	 E2WTpaxDIc/asps9aA9NpVxJ5g0ysVwW6MUu+0kw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfH1I52 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Aug 2019 04:57:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:59102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726259AbfH1I52 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Aug 2019 04:57:28 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D64F023697;
        Wed, 28 Aug 2019 08:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566982647;
        bh=/Bf0Zy+Qaa+eHgdxE3GzvH5JYjYkpXI4095O93WH0mQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ajGDOja+xlAXGh5cCNT54C60GVrgWCe/Z9yMOd39uk5oZW26xvQ+Q08ahzOtf10js
         FP5UjgqEXkL/ZaPiwaDkSXrjXEnxFUZKQxvIF69SSwMg1t0ZFcnZbFfOBQcSbXTZKK
         lwz3+hHvRXPJByTCcYW2kTtz8TsNYmyrKLK/Z91g=
Date:   Wed, 28 Aug 2019 10:57:24 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] driver core: platform: Introduce
 platform_get_irq_optional()
Message-ID: <20190828085724.GA31055@kroah.com>
References: <20190828083411.2496-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828083411.2496-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Aug 28, 2019 at 10:34:10AM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> In some cases the interrupt line of a device is optional. Introduce a
> new platform_get_irq_optional() that works much like platform_get_irq()
> but does not output an error on failure to find the interrupt.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/base/platform.c         | 22 ++++++++++++++++++++++
>  include/linux/platform_device.h |  1 +
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 8ad701068c11..0dda6ade50fd 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -192,6 +192,28 @@ int platform_get_irq(struct platform_device *dev, unsigned int num)
>  }
>  EXPORT_SYMBOL_GPL(platform_get_irq);
>  
> +/**
> + * platform_get_irq_optional - get an optional IRQ for a device
> + * @dev: platform device
> + * @num: IRQ number index
> + *
> + * Gets an IRQ for a platform device. Device drivers should check the return
> + * value for errors so as to not pass a negative integer value to the
> + * request_irq() APIs. This is the same as platform_get_irq(), except that it
> + * does not print an error message if an IRQ can not be obtained.

Kind of funny that the work people did to put error messages in a
central place needs to be worked around at times :)

Anyway, I have no objection to this, but it looks like it has to go in
through my tree.  I can take the hwmon patch as well through my tree if
the hwmon maintainer(s) say it is ok to do so.

thanks,

greg k-h
