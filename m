Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69415ECAAA1
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Aug 2022 13:31:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbiH3NbM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 30 Aug 2022 09:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbiH3NbI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 Aug 2022 09:31:08 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13626B95B7
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Aug 2022 06:31:03 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id j5so7234965plj.5
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Aug 2022 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc;
        bh=JlD/RIwPzDPVF6XD/58xnX3DDo/tZRXFGZFPw77KV5s=;
        b=bmISoy3RPaKZR45TYBfqSez6cT+d2C1Xm4R9Kb19kvgh1CYMd8PM37LfspOb85Qlkq
         68+nnCq/s78JtfLMhl+kQqLsnXRrkMA5S1VciLdvCyHOoxpbSGnJNIgpbMfwN/0NqU7q
         EpeTXuzAoSKbHukUm3EvjnmXrpTYd+AyEXbxWhg65WCKO+16gUgkcNCOYyOaMfOdGK+P
         qy5hX/ti15wIWOz3YjCdxPenionhUlDeg9VIjlxaHUIGirPosdcdkHJn3XDpsWFpUixU
         7otzt3cPQJwvDcUIPl+zBznq4qN8/fDf2LiKt5jYh4s8iNEJEa8ObvnHqZ+Qa0iGlKSP
         s25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc;
        bh=JlD/RIwPzDPVF6XD/58xnX3DDo/tZRXFGZFPw77KV5s=;
        b=UL48ikEn5ayeooSn+FHmYXdhpccGFPNEHHaMm7SAYNAQUPdx+NzWUsSWtDPE9u0bS4
         Wgpx6WVR3SlVo20rvL99pnM+MkqhhAjUeKWZl4pZTI7FmJzvGuTWwYCbTf6mvz1YnOOA
         eiUNdmsOcxmvcqhPzbpUlA4Usm6hAc+x7Q0a5Iit6HtO74WxVCGOLlTFJmR1svAPTQre
         /1cCF8VwXmWQBtTeED9rO008X6ON7ha/8cLgFknXZRzE9wsHr25P29YX/V07CdcJjnXx
         i6pjHUdFID6aQgYC17L3oNFQjvD5PwzofvU+w/kuaNdWue8hEsGOzoDH9cZPMjvmTLR2
         QM9Q==
X-Gm-Message-State: ACgBeo0XMkAMeXI9N71rwvCK9IIeQ0fXI0uqe6/DGDCS7zC9YCy0byYq
        daVikrIuZ6fe4JMj8CQuO3Z4RHGRWH8plA==
X-Google-Smtp-Source: AA6agR4795Ft3eiLl0IrK3J8dRh9NRyDHbIe9II8HrY73K1yzr65MIO2XyApyntik2n+XKohev7hdA==
X-Received: by 2002:a17:902:d48a:b0:16f:51a:252a with SMTP id c10-20020a170902d48a00b0016f051a252amr20953622plg.71.1661866262390;
        Tue, 30 Aug 2022 06:31:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c197-20020a624ece000000b005363abb6d0bsm9570387pfb.15.2022.08.30.06.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 06:31:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 30 Aug 2022 06:31:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     michaelsh@nvidia.com
Cc:     linux-hwmon@vger.kernel.org, vadimp@nvidia.com
Subject: Re: [PATCH hwmon-next v5 1/3] platform_data/emc2305: define platform
 data for EMC2305 driver
Message-ID: <20220830133100.GA229154@roeck-us.net>
References: <20220810171552.56417-1-michaelsh@nvidia.com>
 <20220810171552.56417-2-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810171552.56417-2-michaelsh@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Aug 10, 2022 at 08:15:50PM +0300, michaelsh@nvidia.com wrote:
> From: Michael Shych <michaelsh@nvidia.com>
> 
> Introduce platform data structure for EM2305 driver to allow configuration
> device PWMs and thermal zones by passing required platform data
> to the driver. If no platform data is provided, the driver is supposed
> to work with default settings.
> 
> Signed-off-by: Michael Shych <michaelsh@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>

Applied to hemon-next.

Thanks,
Guenter

> ---
>  include/linux/platform_data/emc2305.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 include/linux/platform_data/emc2305.h
> 
> diff --git a/include/linux/platform_data/emc2305.h b/include/linux/platform_data/emc2305.h
> new file mode 100644
> index 000000000000..54d672dd6f7d
> --- /dev/null
> +++ b/include/linux/platform_data/emc2305.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __LINUX_PLATFORM_DATA_EMC2305__
> +#define __LINUX_PLATFORM_DATA_EMC2305__
> +
> +#define EMC2305_PWM_MAX	5
> +
> +/**
> + * struct emc2305_platform_data - EMC2305 driver platform data
> + * @max_state: maximum cooling state of the cooling device;
> + * @pwm_num: number of active channels;
> + * @pwm_separate: separate PWM settings for every channel;
> + * @pwm_min: array of minimum PWM per channel;
> + */
> +struct emc2305_platform_data {
> +	u8 max_state;
> +	u8 pwm_num;
> +	bool pwm_separate;
> +	u8 pwm_min[EMC2305_PWM_MAX];
> +};
> +
> +#endif
