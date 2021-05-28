Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7351BC2B9F7
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 19:02:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4744B610FC
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 19:02:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbhE1TEM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 May 2021 15:04:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:33078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229476AbhE1TEI (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 May 2021 15:04:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC44A613E3;
        Fri, 28 May 2021 19:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622228553;
        bh=9YafZBm9ZJHIxmUALhdn99cQbr6EQOI6sKTbnUCmtp8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sTGmNwJVNwZtG5KtT6CdbDWL1LBhnMdqolsBGDw+tOzgYE7sazO10B51JwErFhwnC
         z7NPQ051EXXyJFfNsp5znFc4+btQYY3Js4Ylx35PYG8d7yGd2f0/UZGxlJOfe1YKW/
         3M7EyJKEdZwCfV7fRzg06N21KY+PBp+H92Rm6J574G1j2b2JRBWUZbwbA7ZhuPZToP
         WEKknlv8I0Deffn8GLu1Qu489OlUmxTx76V6BF3+WC4PpkcDWdCfoRYLQEFGtEp/4G
         T2Q8WypvTCg8/pC3pS5sHzotWhsUncfjp/YzFCaiBPU4ySgqfdyUPQJRnyUjy1L1p8
         YYzZLJsyEQ2XQ==
Received: by pali.im (Postfix)
        id A549FB0B; Fri, 28 May 2021 21:02:31 +0200 (CEST)
Date:   Fri, 28 May 2021 21:02:31 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     W_Armin@gmx.de
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 3/6] hwmon: (dell-smm-hwmon) Use
 devm_add_action_or_reset()
Message-ID: <20210528190231.q4vetujk3v3seejl@pali>
References: <20210528173716.10975-1-W_Armin@gmx.de>
 <20210528173716.10975-4-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210528173716.10975-4-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Friday 28 May 2021 19:37:13 W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Use devm_add_action_or_reset() for calling i8k_exit_procfs()
> so the remove() function in dell_smm_driver can be omitted.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Looks good!

Reviewed-by: Pali Rohár <pali@kernel.org>
Tested-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 28 +++++++++-------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index deba8819164d..ed2c42badf1a 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -605,24 +605,22 @@ static const struct proc_ops i8k_proc_ops = {
>  	.proc_ioctl	= i8k_ioctl,
>  };
> 
> -static void __init i8k_init_procfs(void)
> +static void i8k_exit_procfs(void *param)
>  {
> -	/* Register the proc entry */
> -	proc_create("i8k", 0, NULL, &i8k_proc_ops);
> +	remove_proc_entry("i8k", NULL);
>  }
> 
> -static void __exit i8k_exit_procfs(void)
> +static void __init i8k_init_procfs(struct device *dev)
>  {
> -	remove_proc_entry("i8k", NULL);
> +	/* Register the proc entry */
> +	proc_create("i8k", 0, NULL, &i8k_proc_ops);
> +
> +	devm_add_action_or_reset(dev, i8k_exit_procfs, NULL);
>  }
> 
>  #else
> 
> -static inline void __init i8k_init_procfs(void)
> -{
> -}
> -
> -static inline void __exit i8k_exit_procfs(void)
> +static void __init i8k_init_procfs(struct device *dev)
>  {
>  }
> 
> @@ -1287,14 +1285,7 @@ static int __init dell_smm_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
> 
> -	i8k_init_procfs();
> -
> -	return 0;
> -}
> -
> -static int dell_smm_remove(struct platform_device *pdev)
> -{
> -	i8k_exit_procfs();
> +	i8k_init_procfs(&pdev->dev);
> 
>  	return 0;
>  }
> @@ -1303,7 +1294,6 @@ static struct platform_driver dell_smm_driver = {
>  	.driver		= {
>  		.name	= KBUILD_MODNAME,
>  	},
> -	.remove		= dell_smm_remove,
>  };
> 
>  static struct platform_device *dell_smm_device;
> --
> 2.20.1
> 
