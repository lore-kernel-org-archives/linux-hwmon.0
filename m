Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C9BC64E7C
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Dec 2020 03:11:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96151221E2
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Dec 2020 03:11:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbgLBDLK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Dec 2020 22:11:10 -0500
Received: from gproxy2-pub.mail.unifiedlayer.com ([69.89.18.3]:46390 "EHLO
        gproxy2-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727132AbgLBDLK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 1 Dec 2020 22:11:10 -0500
Received: from cmgw10.unifiedlayer.com (unknown [10.9.0.10])
        by gproxy2.mail.unifiedlayer.com (Postfix) with ESMTP id 398181E094E
        for <linux-hwmon@vger.kernel.org>; Tue,  1 Dec 2020 20:10:27 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id kIXCkv5xCDlydkIXDkib4G; Tue, 01 Dec 2020 20:10:27 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=COQEoyjD c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=zTNgK-yGK50A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=pGLkceISAAAA:8
 a=_jlGtV7tAAAA:8 a=wsd9HHru5Eariov4NN4A:9 a=CjuIK1q_8ugA:10:nop_charset_2
 a=nlm17XC03S6CtCLSeiRr:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=EPnT/MGE6FnaG1Vox+lu8mCZgsRuHBjk2NZrGmouLxw=; b=1BR0txmGjinrMYhblRJKqFjb7l
        agcvkG1gHfvDsg97RWeyeH6+6402JeZrpR8FXzh1zO1GOo/fyleghI3HvPsyxo0GYMF5kNz+ONtOb
        muZSwXmMdO2BkYgd/VgDlUc/eS2NZZhTyrfu1RWgy33BHm6XqXNTttOdu0euJjWoYhuFqkf2Ldt78
        qX2UBmQ5LLXZQ9N/Y6chbByIeMRNhss//AJn/okhJgfJ5Zvey30jXDO+afXpSNbHb2PMcsD5uEJRe
        0WLD6h+L+5L3qJw+IWfZBAS9JE0f4Y9sJ/UPBzd6fniFbDB9K8yx/9wwI3EzuXBq4YVr+rvdUi1j/
        CNen0iAA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:34456 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kkIXC-000xSC-BE; Wed, 02 Dec 2020 03:10:26 +0000
Date:   Tue, 1 Dec 2020 19:10:25 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     David Bartley <andareed@gmail.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (nct6683) Support NCT6687D.
Message-ID: <20201202031025.GA19647@roeck-us.net>
References: <CAM9zjRMsu68ZePpLJdSSdobCd8Ax51duqgG+LRKjKpsGrc+_ng@mail.gmail.com>
 <20201202025057.5492-1-andareed@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202025057.5492-1-andareed@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kkIXC-000xSC-BE
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:34456
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Dec 01, 2020 at 06:50:57PM -0800, David Bartley wrote:
> This is found on many MSI motherboards.
> 
> Signed-off-by: David Bartley <andareed@gmail.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  Documentation/hwmon/nct6683.rst |  3 ++-
>  drivers/hwmon/nct6683.c         | 14 ++++++++++++--
>  2 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
> index efbf7e9703ec..8646ad519fcd 100644
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
> +MSI B550	NCT6687D EC firmware version 1.0 build 05/07/20
>  =============== ===============================================
> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
> index 2d299149f4d2..7f7e30f0de7b 100644
> --- a/drivers/hwmon/nct6683.c
> +++ b/drivers/hwmon/nct6683.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * nct6683 - Driver for the hardware monitoring functionality of
> - *	     Nuvoton NCT6683D eSIO
> + *	     Nuvoton NCT6683D/NCT6687D eSIO
>   *
>   * Copyright (C) 2013  Guenter Roeck <linux@roeck-us.net>
>   *
> @@ -12,6 +12,7 @@
>   *
>   * Chip        #vin    #fan    #pwm    #temp  chip ID
>   * nct6683d     21(1)   16      8       32(1) 0xc730
> + * nct6687d     21(1)   16      8       32(1) 0xd590
>   *
>   * Notes:
>   *	(1) Total number of vin and temp inputs is 32.
> @@ -32,7 +33,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  
> -enum kinds { nct6683 };
> +enum kinds { nct6683, nct6687 };
>  
>  static bool force;
>  module_param(force, bool, 0);
> @@ -40,10 +41,12 @@ MODULE_PARM_DESC(force, "Set to one to enable support for unknown vendors");
>  
>  static const char * const nct6683_device_names[] = {
>  	"nct6683",
> +	"nct6687",
>  };
>  
>  static const char * const nct6683_chip_names[] = {
>  	"NCT6683D",
> +	"NCT6687D",
>  };
>  
>  #define DRVNAME "nct6683"
> @@ -63,6 +66,7 @@ static const char * const nct6683_chip_names[] = {
>  
>  #define SIO_NCT6681_ID		0xb270	/* for later */
>  #define SIO_NCT6683_ID		0xc730
> +#define SIO_NCT6687_ID		0xd590
>  #define SIO_ID_MASK		0xFFF0
>  
>  static inline void
> @@ -164,6 +168,7 @@ superio_exit(int ioreg)
>  #define NCT6683_REG_CUSTOMER_ID		0x602
>  #define NCT6683_CUSTOMER_ID_INTEL	0x805
>  #define NCT6683_CUSTOMER_ID_MITAC	0xa0e
> +#define NCT6683_CUSTOMER_ID_MSI		0x201
>  
>  #define NCT6683_REG_BUILD_YEAR		0x604
>  #define NCT6683_REG_BUILD_MONTH		0x605
> @@ -1218,6 +1223,8 @@ static int nct6683_probe(struct platform_device *pdev)
>  		break;
>  	case NCT6683_CUSTOMER_ID_MITAC:
>  		break;
> +	case NCT6683_CUSTOMER_ID_MSI:
> +		break;
>  	default:
>  		if (!force)
>  			return -ENODEV;
> @@ -1352,6 +1359,9 @@ static int __init nct6683_find(int sioaddr, struct nct6683_sio_data *sio_data)
>  	case SIO_NCT6683_ID:
>  		sio_data->kind = nct6683;
>  		break;
> +	case SIO_NCT6687_ID:
> +		sio_data->kind = nct6687;
> +		break;
>  	default:
>  		if (val != 0xffff)
>  			pr_debug("unsupported chip ID: 0x%04x\n", val);
> -- 
> 2.27.0
> 
