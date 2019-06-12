Return-Path: <SRS0=G5pm=UL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B18C31E46
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Jun 2019 12:38:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 15DDB208C2
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Jun 2019 12:38:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LM/LZfJ2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409136AbfFLMiK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 Jun 2019 08:38:10 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43969 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409113AbfFLMiK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Jun 2019 08:38:10 -0400
Received: by mail-pf1-f193.google.com with SMTP id i189so9585256pfg.10
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jun 2019 05:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RmqprIRN5Lv21duelU8PVM2/IaqyAuLug0UDGw4J+vg=;
        b=LM/LZfJ2f34vDwXI8yIpZbmYKHGDhFsxzs5DHXxHqUfuIlBVUy0LCgm8x2AXc9PV5z
         l1r8Rpp6ilddZZMRjxzuBEbjnqhsRVcau05whSiffcBhcs6az/LPaTiYCvowyF2HjHkx
         Qi6OqkGCfXMU0qG9Lt8+JDsQfIBqsaytEvIUbLUZyjLOJeu5z5G+FTA9Z0V23iLOC4CL
         UjADMtgjFfg0GFGq7bHIgrRgTOpoKLFdtQmEO3cOYbhHv9SrJUsKWHNrIMOI1h6Z15vv
         /OTjsFSt7FwiIHiIm3l7CYwT2rHWCwky15Q4NjDDU2+6r24G5wWux9sjMuBeJBEVuXKs
         BC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=RmqprIRN5Lv21duelU8PVM2/IaqyAuLug0UDGw4J+vg=;
        b=s6FRaHSTpg4pPKlZeBPmGUmF/MSYHmre0ETT6+DfnbUA5PXd8qwRn/p50QEEpcUAJM
         oMf35aevyTyAdQizvU9cysPb8MW2LCYvloa5M64MF+VCgA8dTW8oxUmekN3u9buo6cPP
         AFWquzAEPM59imZF99ppAtrfLQiFcTCZ655ca1XbEp7gLYJRucxLDNpSeELvQxEFWn23
         bZIpDRvlVh5BN00+hw4hMkPjpj/26+2tLX+lvJwqeudY0GFJ7zeR5oW9CMTXZX6GKkXD
         iGO0qrukABgUuv4Ac1XzbjARS6C7a4llH7xcbiTcITmj2DGf7nXvfR2dLL1z3wSdNatQ
         /Xcg==
X-Gm-Message-State: APjAAAUfvc0hjwuH+zkWCiV6ZSNUrienw1uiC0Q4IL/R8Om3WL6ECqpT
        vhfs3WaEtUCwTYrfZCsqWAk=
X-Google-Smtp-Source: APXvYqyGJQMMVMtvfFqJ65JH/NZ+A9brKpDv3KmhxoIPbm5hkQbLZptNKY91W9YRekayd0hST50Qaw==
X-Received: by 2002:a63:f95d:: with SMTP id q29mr18874079pgk.368.1560343089407;
        Wed, 12 Jun 2019 05:38:09 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k13sm18589650pgq.45.2019.06.12.05.38.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 05:38:08 -0700 (PDT)
Date:   Wed, 12 Jun 2019 05:38:06 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Luca Tettamanti <kronos.it@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: asus_atk0110: no need to check return value of
 debugfs_create functions
Message-ID: <20190612123806.GA15512@roeck-us.net>
References: <20190611175858.GA10077@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611175858.GA10077@kroah.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jun 11, 2019 at 07:58:58PM +0200, Greg Kroah-Hartman wrote:
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.
> 
> Cc: Luca Tettamanti <kronos.it@gmail.com>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/asus_atk0110.c | 23 +++--------------------
>  1 file changed, 3 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/hwmon/asus_atk0110.c b/drivers/hwmon/asus_atk0110.c
> index 22be78cc5a4c..b5f0abde916b 100644
> --- a/drivers/hwmon/asus_atk0110.c
> +++ b/drivers/hwmon/asus_atk0110.c
> @@ -789,33 +789,16 @@ static const struct file_operations atk_debugfs_ggrp_fops = {
>  static void atk_debugfs_init(struct atk_data *data)
>  {
>  	struct dentry *d;
> -	struct dentry *f;
>  
>  	data->debugfs.id = 0;
>  
>  	d = debugfs_create_dir("asus_atk0110", NULL);
> -	if (!d || IS_ERR(d))
> -		return;
>  
> -	f = debugfs_create_x32("id", 0600, d, &data->debugfs.id);
> -	if (!f || IS_ERR(f))
> -		goto cleanup;
> -
> -	f = debugfs_create_file_unsafe("gitm", 0400, d, data,
> -				       &atk_debugfs_gitm);
> -	if (!f || IS_ERR(f))
> -		goto cleanup;
> -
> -	f = debugfs_create_file("ggrp", 0400, d, data,
> -				&atk_debugfs_ggrp_fops);
> -	if (!f || IS_ERR(f))
> -		goto cleanup;
> +	debugfs_create_x32("id", 0600, d, &data->debugfs.id);
> +	debugfs_create_file_unsafe("gitm", 0400, d, data, &atk_debugfs_gitm);
> +	debugfs_create_file("ggrp", 0400, d, data, &atk_debugfs_ggrp_fops);
>  
>  	data->debugfs.root = d;
> -
> -	return;
> -cleanup:
> -	debugfs_remove_recursive(d);
>  }
>  
>  static void atk_debugfs_cleanup(struct atk_data *data)
