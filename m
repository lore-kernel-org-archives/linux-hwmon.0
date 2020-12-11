Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7553EC4167B
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Dec 2020 16:15:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41F052246B
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Dec 2020 16:15:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437926AbgLKP1h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Dec 2020 10:27:37 -0500
Received: from gproxy8-pub.mail.unifiedlayer.com ([67.222.33.93]:58373 "EHLO
        gproxy8-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2437910AbgLKP1W (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Dec 2020 10:27:22 -0500
Received: from cmgw10.unifiedlayer.com (unknown [10.9.0.10])
        by gproxy8.mail.unifiedlayer.com (Postfix) with ESMTP id 2174F1AB081
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Dec 2020 08:26:33 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id nkJUkAEuTDlydnkJUkvnhI; Fri, 11 Dec 2020 08:26:33 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=W/gWqyek c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=zTNgK-yGK50A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=E1dSs-fsCyik6l8zOD0A:9
 a=CjuIK1q_8ugA:10:nop_charset_2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=1TCP7LBO1DvE/DSQsUI9qX0PtRT+JNVDP/6B90QfDwg=; b=1gK7nfrlah0DMOnSPqhUnA8EY9
        wjtdO8kR061L+T1hnhkRD/Sgd9c8yYFdlrq9Txf+1CW2AjPQ+Eh4wsa9ZPHcvydfRIGjnJyCPE44x
        WkGFxvNNoyRqUGyG72ZTLF6O1H+lrNsOPtTTpS4/Rb5qm1147n9LzGdg1ihkM21UpZOBDVTaYADBG
        zus1YMIvU6b6zQIduieFUx7SIvqzdLWgyUSVVC4ZPH/gnUt9vG11zCUAQvlthXmQeZwyi5YQRNr8T
        WAidfISiWEzKq8KNSkaoJukEw4akuoqXADDzNNmJh9rSGXZfrukL0+CBdr5f3es4UMoazY00ITBfn
        QVY5Uvxg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:41674 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1knkJU-003W3z-6B; Fri, 11 Dec 2020 15:26:32 +0000
Date:   Fri, 11 Dec 2020 07:26:31 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (xgene) Drop bogus __refdata annotation
Message-ID: <20201211152631.GA39805@roeck-us.net>
References: <20201211133531.2970027-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211133531.2970027-1-geert+renesas@glider.be>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1knkJU-003W3z-6B
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:41674
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Dec 11, 2020 at 02:35:31PM +0100, Geert Uytterhoeven wrote:
> As the X-Gene hardware monitoring driver does not have any code or data
> located in initmem, there is no need to annotate the xgene_hwmon_driver
> structure with __refdata.  Drop the annotation, to avoid suppressing
> future section warnings.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/xgene-hwmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
> index f2a5af239c9569b2..1489e83cb0c44011 100644
> --- a/drivers/hwmon/xgene-hwmon.c
> +++ b/drivers/hwmon/xgene-hwmon.c
> @@ -784,7 +784,7 @@ static const struct of_device_id xgene_hwmon_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, xgene_hwmon_of_match);
>  
> -static struct platform_driver xgene_hwmon_driver __refdata = {
> +static struct platform_driver xgene_hwmon_driver = {
>  	.probe = xgene_hwmon_probe,
>  	.remove = xgene_hwmon_remove,
>  	.driver = {
