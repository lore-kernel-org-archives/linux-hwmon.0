Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3793BC64E7B
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Dec 2020 22:17:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD2092086A
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Dec 2020 22:17:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.b="Dvmg1JRx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgLAWRG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Dec 2020 17:17:06 -0500
Received: from gproxy4-pub.mail.unifiedlayer.com ([69.89.23.142]:37477 "EHLO
        gproxy4-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725987AbgLAWRD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 1 Dec 2020 17:17:03 -0500
Received: from cmgw15.unifiedlayer.com (unknown [10.9.0.15])
        by gproxy4.mail.unifiedlayer.com (Postfix) with ESMTP id 8D9EE175B2E
        for <linux-hwmon@vger.kernel.org>; Tue,  1 Dec 2020 15:16:21 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id kDwbkMaALh41lkDwbkPUxA; Tue, 01 Dec 2020 15:16:21 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=B4iXLtlM c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=zTNgK-yGK50A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=pGLkceISAAAA:8
 a=SvAFbVlB8RZWtcsolqoA:9 a=CjuIK1q_8ugA:10:nop_charset_2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=wK4ByPm96/d3zmxu7dxHKwiZfVwL1GllC2Px26j8jHk=; b=Dvmg1JRxSmTgpb7eGqCmu6TgWk
        Ff7lBoYCdF/sEUV5HpK4n+QnMpMl76+0X8p1Pe+LcThmcCdSYSOn565BJVCv6gmXPG0AQ9UknScNo
        G61bYaF31UMefawcBpA2qRs+10ZlzjhPFfzft85/bKAbxFVY6NBrQiPiGRUJ/ywEc6nrYRXRqg/eg
        Raq9ffcAOB/meZZ/RJAmuQVA4bO5wQKGXmkdt+wfjW0oHUidR6vUFFFrrGopgVAdTXu5oWj5XoTsm
        iXj0YjCIQiTbdEGuTBe5WpIDSPEE3cYci6UX3zvjbG8D9dnqKwaEGn/KKFGgPDFgqu/3KjmuBDNyY
        Uw/UP7+g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33742 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kkDwa-003bEp-NW; Tue, 01 Dec 2020 22:16:20 +0000
Date:   Tue, 1 Dec 2020 14:16:20 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     David Bartley <andareed@gmail.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6683) Support NCT6687D.
Message-ID: <20201201221620.GA13480@roeck-us.net>
References: <20201201190931.72437-1-andareed@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201190931.72437-1-andareed@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kkDwa-003bEp-NW
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:33742
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Dec 01, 2020 at 11:09:31AM -0800, David Bartley wrote:
> This is found on many MSI motherboards.
> 
> Signed-off-by: David Bartley <andareed@gmail.com>
> ---
>  Documentation/hwmon/nct6683.rst | 3 ++-
>  drivers/hwmon/nct6683.c         | 7 +++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
> index efbf7e9703ec..7ceab770ae4e 100644
> --- a/Documentation/hwmon/nct6683.rst
> +++ b/Documentation/hwmon/nct6683.rst
> @@ -3,7 +3,7 @@ Kernel driver nct6683
>  
>  Supported chips:
>  
> -  * Nuvoton NCT6683D
> +  * Nuvoton NCT6683D/NCT6687D
>  
>      Prefix: 'nct6683'
>  
> @@ -61,4 +61,5 @@ Board		Firmware version
>  Intel DH87RL	NCT6683D EC firmware version 1.0 build 04/03/13
>  Intel DH87MC	NCT6683D EC firmware version 1.0 build 04/03/13
>  Intel DB85FL	NCT6683D EC firmware version 1.0 build 04/03/13
> +MSI B550	N/A

		NCT6687D

>  =============== ===============================================
> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
> index 2d299149f4d2..53e8d0cb3231 100644
> --- a/drivers/hwmon/nct6683.c
> +++ b/drivers/hwmon/nct6683.c
> @@ -63,6 +63,7 @@ static const char * const nct6683_chip_names[] = {
>  
>  #define SIO_NCT6681_ID		0xb270	/* for later */
>  #define SIO_NCT6683_ID		0xc730
> +#define SIO_NCT6687_ID		0xd590
>  #define SIO_ID_MASK		0xFFF0
>  
>  static inline void
> @@ -164,6 +165,7 @@ superio_exit(int ioreg)
>  #define NCT6683_REG_CUSTOMER_ID		0x602
>  #define NCT6683_CUSTOMER_ID_INTEL	0x805
>  #define NCT6683_CUSTOMER_ID_MITAC	0xa0e
> +#define NCT6683_CUSTOMER_ID_MSI		0x201
>  
>  #define NCT6683_REG_BUILD_YEAR		0x604
>  #define NCT6683_REG_BUILD_MONTH		0x605
> @@ -1218,6 +1220,8 @@ static int nct6683_probe(struct platform_device *pdev)
>  		break;
>  	case NCT6683_CUSTOMER_ID_MITAC:
>  		break;
> +	case NCT6683_CUSTOMER_ID_MSI:
> +		break;
>  	default:
>  		if (!force)
>  			return -ENODEV;
> @@ -1352,6 +1356,9 @@ static int __init nct6683_find(int sioaddr, struct nct6683_sio_data *sio_data)
>  	case SIO_NCT6683_ID:
>  		sio_data->kind = nct6683;
>  		break;
> +	case SIO_NCT6687_ID:
> +		sio_data->kind = nct6683;
> +		break;

There should be a separate kind (in enum kinds). Also, the description in
the header should be updated to indicate nct6687 and list the number of
supported sensors. nct6683_device_names[] and nct6683_chip_names[] should
also be updated.

>  	default:
>  		if (val != 0xffff)
>  			pr_debug("unsupported chip ID: 0x%04x\n", val);
> -- 
> 2.27.0
> 
