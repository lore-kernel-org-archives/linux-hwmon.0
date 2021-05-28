Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD7EC2B9F7
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 18:56:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB061610FC
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 18:56:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbhE1S6R (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 May 2021 14:58:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:60492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229500AbhE1S6Q (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 May 2021 14:58:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96BFE6102A;
        Fri, 28 May 2021 18:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622228201;
        bh=d8iRAc0RQ+kq4HNjMz/Kg6DTT46vjktnAwi+2hEfMVg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cBSpJKBB2FDso5TZGXwIYPdP/6um6D3vJV6BlaMrdnraPn7+YItwRW7nrZhu2Ar6C
         LaX5rttLRpBUbxN+9DRPkdr0EM7Zmm+gRih6RHPUOyOd7hBNmgIvfea2Bn+S4OYIPd
         rW/OtEfrebOFjIPVuLPmw+KUpYohk4KOVXkhoAz8ObpUw1ut8howzfpo5Og8s/gv5Y
         ADkS+LKOSA6ZxaB+Hk/Urt/ItVuWiZ43Mc3JmmiXzavr9mi2L4gr04wn+mtqAqAMML
         OJq/9riExeTrV/XxkshK1b/+aUuhoey+zVKPECUWx5CeI96W4gybk5bANDAhTvtumo
         4sfYfjS0OAa5A==
Received: by pali.im (Postfix)
        id BCB45B0B; Fri, 28 May 2021 20:56:37 +0200 (CEST)
Date:   Fri, 28 May 2021 20:56:37 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     W_Armin@gmx.de
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 2/6] hwmon: (dell-smm-hwmon) Mark functions as __init
Message-ID: <20210528185637.ll6kj4fhbnigkzva@pali>
References: <20210528173716.10975-1-W_Armin@gmx.de>
 <20210528173716.10975-3-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210528173716.10975-3-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Friday 28 May 2021 19:37:12 W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> i8k_get_dmi_data() and i8k_get_dell_signature() are
> only called during module init and probe, which both
> are marked as __init.
> Also mark these function as __init to lower the runtime
> memory footprint.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Looks good!

Reviewed-by: Pali Rohár <pali@kernel.org>
Tested-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 2038f2a50e11..deba8819164d 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -128,7 +128,7 @@ struct smm_regs {
>  	unsigned int edi __packed;
>  };
> 
> -static inline const char *i8k_get_dmi_data(int field)
> +static inline const char __init *i8k_get_dmi_data(int field)
>  {
>  	const char *dmi_data = dmi_get_system_info(field);
> 
> @@ -384,7 +384,7 @@ static int i8k_get_temp(int sensor)
>  	return temp;
>  }
> 
> -static int i8k_get_dell_signature(int req_fn)
> +static int __init i8k_get_dell_signature(int req_fn)
>  {
>  	struct smm_regs regs = { .eax = req_fn, };
>  	int rc;
> --
> 2.20.1
> 
