Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35652C4361B
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Dec 2020 20:41:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0984A206EC
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Dec 2020 20:41:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbgLHUll (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Dec 2020 15:41:41 -0500
Received: from gproxy5-pub.mail.unifiedlayer.com ([67.222.38.55]:42670 "EHLO
        gproxy5-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728064AbgLHUll (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 8 Dec 2020 15:41:41 -0500
Received: from cmgw14.unifiedlayer.com (unknown [10.9.0.14])
        by gproxy5.mail.unifiedlayer.com (Postfix) with ESMTP id C892B140740
        for <linux-hwmon@vger.kernel.org>; Tue,  8 Dec 2020 13:41:00 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id mjnAkUGNvwNNlmjnAkfItr; Tue, 08 Dec 2020 13:41:00 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=TZu4SyYh c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=zTNgK-yGK50A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=pGLkceISAAAA:8
 a=GJmBqMToJxGr3pr13JEA:9 a=CjuIK1q_8ugA:10:nop_charset_2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=hv0KwyWFwEiIR8ThFGLyOpvYU8k87HVbCYCc3AZwPDc=; b=QnNKWv/0362GuafrsGOoc2gFjX
        /gOawtVPeRmML6vEYQeov1aHS4pq8wSFyUxB8jlRpg2u7Eo0+HfypFKuNc3rZfikM1cIbVQHQZW+T
        vEDROIkBUsJ4bI4HemuNsNfETWiwzbTsVp8Yf10xQP+jYJGOuE+YdLcG8X+fQDt6J5/Tdp/MnpwFq
        XHBsnRJFfnPKH/dChMOpNrFbDzl6OWiDjptEzHh4a9+cY1NVYIR68ScgVZf5GzM3AzqRchkCFIo5V
        tSPjLBMwmnmesnNlsc4kh81HGl31L0hu7TsNzBWq65foZDpVaLz7evQnAefDtBmCMpf/iLiKBCRQq
        7XhrIL0w==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:41426 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kmjn9-002Omg-Va; Tue, 08 Dec 2020 20:41:00 +0000
Date:   Tue, 8 Dec 2020 12:40:59 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sandeep Raghuraman <sandy.8925@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, nchatrad@amd.com
Subject: Re: [PATCH] Add support for Zen 2 CPUs to amd_energy driver
Message-ID: <20201208204059.GA73427@roeck-us.net>
References: <a14b8be6-e8b4-c658-2cd6-a2f280be0f99@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a14b8be6-e8b4-c658-2cd6-a2f280be0f99@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kmjn9-002Omg-Va
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:41426
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Dec 09, 2020 at 01:51:48AM +0530, Sandeep Raghuraman wrote:
> This patch adds support for Zen 2 desktop CPUs to the amd_energy driver.
> 
> Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>

This patch will require an Ack from Naveen; support for this model was
previously removed due to inconsistent results; see commit f28e360f2903
("hwmon: (amd_energy) match for supported models"),

Guenter

> ---
>  drivers/hwmon/amd_energy.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> --
> 
> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> index 0dee535e6c85..21341c8e1d6e 100644
> --- a/drivers/hwmon/amd_energy.c
> +++ b/drivers/hwmon/amd_energy.c
> @@ -363,6 +363,7 @@ static struct platform_device *amd_energy_platdev;
>  
>  static const struct x86_cpu_id cpu_ids[] __initconst = {
>         X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x17, 0x31, NULL),
> +       X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x17, 0x71, NULL),
>         {}
>  };
>  MODULE_DEVICE_TABLE(x86cpu, cpu_ids);
