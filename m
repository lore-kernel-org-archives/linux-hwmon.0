Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0423C433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 May 2022 14:35:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243304AbiEVOfU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 22 May 2022 10:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234015AbiEVOfT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 22 May 2022 10:35:19 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED99836E39;
        Sun, 22 May 2022 07:35:17 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id e189so15174031oia.8;
        Sun, 22 May 2022 07:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RjBoRtJ9rZ9SbhlMIrKNDfXCMj6QJFpi/1uxRxKT1L4=;
        b=LFb/2bSwFk3msFQ+ogdHWsYHKKSoWvo50E8hISdryt0WB93qAs4QD7Ta8h/0lNiliu
         34JUG7iAKd0jTg5vxovpAvstRGRkyioP5kwlfqdY4Wxp1uLx4ENBa1YRhMAd3CzuRb/r
         UJNqplFufD9JahRcuJFp3tmRRYJxiy7CJ2YpIQcdLLK+OgCsSIoRqqN90eJ65W4irjfG
         f2ZtcNOdntZk9r+iyF5MYCFOgItmUQy9O2cXTCDWvQFDUdO24j6FzJGVhnaldzAJHUbO
         s3VXivECykXvwbuX1rFMtkFEen8Y2oj8g0ajfN71d0XLZD4xiNewE+jvlhmLIdXn+S1E
         nkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=RjBoRtJ9rZ9SbhlMIrKNDfXCMj6QJFpi/1uxRxKT1L4=;
        b=lmdQipZrYmmCe3yRHmUeb2UASyb1P+gsiqUiE8uzHr0MvNvMNIcROyRdC+G7bqfXWo
         KQ5EI6OUaXOkaDpoByDVhOoueUrwiveYtTML/TWZuZBFz2bGiEL0rQ9d2qCwN08P4v0O
         OvWoqOyXBNCu9LDRpt2tUmH80GqkPWeFcd4jf4tEkFkuKSet7chIUfc9zMkpIY8J6KFq
         lB7JgPd+HdH2HrLiMhQLKBdyWboAgZeXor1jCGiAoVd6bWXU4hNF0q6L3ibYpa4fuJje
         zkHE4uIV+H+ai3/DgLaK08qzaDNgkF4ZKdtgChrv1vmVS5AjU+QNlzi6cC5GmNLwpi12
         BdEQ==
X-Gm-Message-State: AOAM531eQgf1VY9a3R6zjJSNlXE6moodyBQXkszpCE3tBKJGaZRqvrA/
        Ynd7wT85+ueK+I5S/twc7B8=
X-Google-Smtp-Source: ABdhPJxX/OicGiJYvv+5ye8kHB9PVw6GLAdI9PMjrzinXZSKcqHN1/Os8HeWuA0IvT6iEUg/nk7OYg==
X-Received: by 2002:a05:6808:1287:b0:326:d23f:f251 with SMTP id a7-20020a056808128700b00326d23ff251mr9636155oiw.155.1653230117198;
        Sun, 22 May 2022 07:35:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q196-20020a4a33cd000000b0035eb4e5a6d2sm3332387ooq.40.2022.05.22.07.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 07:35:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 22 May 2022 07:35:14 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     dan.carpenter@oracle.com, Aleksa Savic <savicaleksa83@gmail.com>,
        Jack Doan <me@jackdoan.com>, Jean Delvare <jdelvare@suse.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (aquacomputer_d5next) Fix an error handling path
 in aqc_probe()
Message-ID: <20220522143514.GA242830@roeck-us.net>
References: <be6b955d50de140fcc96bd116150b435021bf567.1653225250.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be6b955d50de140fcc96bd116150b435021bf567.1653225250.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, May 22, 2022 at 03:14:23PM +0200, Christophe JAILLET wrote:
> If no memory can be allocated, some resources still need to be released as
> already done in the other error handling paths.
> 
> Fixes: 752b927951ea ("hwmon: (aquacomputer_d5next) Add support for Aquacomputer Octo")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/aquacomputer_d5next.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
> index 7d2e7279abfb..a0e69f7ece36 100644
> --- a/drivers/hwmon/aquacomputer_d5next.c
> +++ b/drivers/hwmon/aquacomputer_d5next.c
> @@ -783,8 +783,10 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	priv->name = aqc_device_names[priv->kind];
>  
>  	priv->buffer = devm_kzalloc(&hdev->dev, priv->buffer_size, GFP_KERNEL);
> -	if (!priv->buffer)
> -		return -ENOMEM;
> +	if (!priv->buffer) {
> +		ret = -ENOMEM;
> +		goto fail_and_close;
> +	}
>  
>  	mutex_init(&priv->mutex);
>  
