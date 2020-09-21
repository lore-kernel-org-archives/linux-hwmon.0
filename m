Return-Path: <SRS0=2DcV=C6=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2D4C4346E
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Sep 2020 17:29:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A06AE20B1F
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Sep 2020 17:29:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="CY8YZCrS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgIUR3G (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Sep 2020 13:29:06 -0400
Received: from mx.treblig.org ([46.43.15.161]:50148 "EHLO mx.treblig.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726419AbgIUR3G (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Sep 2020 13:29:06 -0400
X-Greylist: delayed 2432 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Sep 2020 13:29:05 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
        ; s=bytemarkmx; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
        :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
        :List-Post:List-Owner:List-Archive;
        bh=HeBqoQgk26sYj7RJEMovUHgkiEJR1lX2CXMJ7423is0=; b=CY8YZCrSiv+u1nB9vf7fXzFh9Y
        Bp3sfv00CePrSfzHkeJB+i7jKnvPuBczZUla/aJ+wW7OVKBzC1GXYd1qGUPDFLpAc7uWnMR4dfRkw
        f0yrgOaREk6bYo3r2B8IKSJ9BYcRb5JRVblYqkVOB9SCFkXq2PfR6Xs8BLcSMYS4PKCpXUfcrlB2T
        gD9Y9f81MjQQ2PCTH5TsEJmTiqpUxSwsc1Kl5Uhy87Tx7NwXQ79OmPIY2tEWW1ML34ykaov4v89E7
        hRF1PZV4HhuQcemIEjGDjE0TCt9TnmMeX02DznADIKuLbbev+pdCVRjahR0/AeKYnLviFG6QEEU23
        zd1LrXOg==;
Received: from dg by mx.treblig.org with local (Exim 4.92)
        (envelope-from <dg@treblig.org>)
        id 1kKOzA-0006zy-BC; Mon, 21 Sep 2020 17:48:16 +0100
Date:   Mon, 21 Sep 2020 17:48:16 +0100
From:   "Dr. David Alan Gilbert" <linux@treblig.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hwmon: (w83627ehf) Fix a resource leak in probe
Message-ID: <20200921164816.GA15497@gallifrey>
References: <20200921125212.GA1128194@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921125212.GA1128194@mwanda>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/4.19.0-5-amd64 (x86_64)
X-Uptime: 17:47:32 up 386 days, 17:08,  2 users,  load average: 0.10, 0.15,
 0.12
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

* Dan Carpenter (dan.carpenter@oracle.com) wrote:
> Smatch has a new check for resource leaks which found a bug in probe:
> 
>     drivers/hwmon/w83627ehf.c:2417 w83627ehf_probe()
>     warn: 'res->start' not released on lines: 2412.
> 
> We need to clean up if devm_hwmon_device_register_with_info() fails.
> 
> Fixes: 266cd5835947 ("hwmon: (w83627ehf) convert to with_info interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Yeh that looks right to me; thanks!

Reviewed-by: Dr. David Alan Gilbert <linux@treblig.org>

> ---
>  drivers/hwmon/w83627ehf.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
> index 5a5120121e50..3964ceab2817 100644
> --- a/drivers/hwmon/w83627ehf.c
> +++ b/drivers/hwmon/w83627ehf.c
> @@ -1951,8 +1951,12 @@ static int w83627ehf_probe(struct platform_device *pdev)
>  							 data,
>  							 &w83627ehf_chip_info,
>  							 w83627ehf_groups);
> +	if (IS_ERR(hwmon_dev)) {
> +		err = PTR_ERR(hwmon_dev);
> +		goto exit_release;
> +	}
>  
> -	return PTR_ERR_OR_ZERO(hwmon_dev);
> +	return 0;
>  
>  exit_release:
>  	release_region(res->start, IOREGION_LENGTH);
> -- 
> 2.28.0
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
