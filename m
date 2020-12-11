Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB182C433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Dec 2020 16:15:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77D872246B
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Dec 2020 16:15:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437929AbgLKP1j (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Dec 2020 10:27:39 -0500
Received: from gproxy10-pub.mail.unifiedlayer.com ([69.89.20.226]:50471 "EHLO
        gproxy10-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2437921AbgLKP1c (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Dec 2020 10:27:32 -0500
Received: from cmgw14.unifiedlayer.com (unknown [10.9.0.14])
        by gproxy10.mail.unifiedlayer.com (Postfix) with ESMTP id DDC24140484
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Dec 2020 08:26:47 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id nkJjks6NjwNNlnkJjk2jXH; Fri, 11 Dec 2020 08:26:47 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=f49m+t6M c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=zTNgK-yGK50A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=RQaXqXe8MhkW5YeBRGoA:9
 a=CjuIK1q_8ugA:10:nop_charset_2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=01PhC2q+jlB/js2aczNBJqVgU/vdIoCNeZuEMcfKJHw=; b=swCvbnUCwIcGJuzvKxZnsg73jq
        bdjBroMQ3dAmMaL02C8xWwu1HqWVN+2FVAXDeOIpRGsMVNyArpF4zwD5ZW96+aZWvn34HOGRlzHYr
        eLSodUtypBEoUDNNdg/JwClZXnZ30DmyLmljyF9V8dH6pKjUjGEgel32t2s/ryo799pe4b4qnX0tJ
        0ek0W+GZafqKPWEQgJUjs+beRumbGvr9sXt3lyQpbIrYqgypLlmdBVrKlGRr1hiF+OS2FGXVwdi0S
        VDj5ORKdpprig34RLx53xkhcju8oAH76lc+ej/7q4Ul/fXp4GP86qqABUx1VpfgnuGYCBG/HBkzrv
        bRYBSD4w==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:41678 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1knkJi-003W8f-Vt; Fri, 11 Dec 2020 15:26:47 +0000
Date:   Fri, 11 Dec 2020 07:26:46 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (iio_hwmon) Drop bogus __refdata annotation
Message-ID: <20201211152646.GA39888@roeck-us.net>
References: <20201211133512.2969952-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211133512.2969952-1-geert+renesas@glider.be>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1knkJi-003W8f-Vt
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:41678
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Dec 11, 2020 at 02:35:12PM +0100, Geert Uytterhoeven wrote:
> As the IIO hardware monitoring driver does not have any code or data
> located in initmem, there is no need to annotate the iio_hwmon_driver
> structure with __refdata.  Drop the annotation, to avoid suppressing
> future section warnings.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/iio_hwmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/iio_hwmon.c b/drivers/hwmon/iio_hwmon.c
> index b85a125dd86f46a2..580a7d125b88667b 100644
> --- a/drivers/hwmon/iio_hwmon.c
> +++ b/drivers/hwmon/iio_hwmon.c
> @@ -169,7 +169,7 @@ static const struct of_device_id iio_hwmon_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, iio_hwmon_of_match);
>  
> -static struct platform_driver __refdata iio_hwmon_driver = {
> +static struct platform_driver iio_hwmon_driver = {
>  	.driver = {
>  		.name = "iio_hwmon",
>  		.of_match_table = iio_hwmon_of_match,
