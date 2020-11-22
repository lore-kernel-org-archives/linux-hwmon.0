Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A289AC5519F
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 Nov 2020 15:26:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4737E20773
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 Nov 2020 15:26:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.b="F5BNp8Na"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727567AbgKVP0h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 22 Nov 2020 10:26:37 -0500
Received: from gproxy10-pub.mail.unifiedlayer.com ([69.89.20.226]:56021 "EHLO
        gproxy10-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727382AbgKVP0g (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 22 Nov 2020 10:26:36 -0500
Received: from cmgw14.unifiedlayer.com (unknown [10.9.0.14])
        by gproxy10.mail.unifiedlayer.com (Postfix) with ESMTP id E205514041D
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2020 08:26:33 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id grG5kVLF5wNNlgrG5kilDy; Sun, 22 Nov 2020 08:26:33 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=BoezP7f5 c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=zd2uoN0lAAAA:8
 a=XX929DfKb1UAYQw6CDYA:9 a=CjuIK1q_8ugA:10:nop_charset_2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ESKsnbjnLsz4GgJLaGf6wy5H3XUU6RmFY4omACb5+h0=; b=F5BNp8NaJm7cHzUvCTTrTzOBo5
        L9cx/1gGwxJWZxSyk/eU1Ha6DfdEvMKRzDpkKgMnHY93dmKCLgGHAAnQPSWzckNCr8Jp8sqZhzYEB
        xMFG1RUk5Bevm9QwEe0S6WRlbXhV0ZjTHTS9bVe9zKEmfYo+iy/veQ4fp7WeivXpfjJ0KC/J09LE+
        snlr8NltNFg1ZPbuLjWSTA31CRCBhKqN+BRcrRSWcpID/bLScthnIBuCM/9eoGIbkn4lE5zzS0Gpv
        tZltDgLgPPKFz/EZNS1bJVx/N3ELKKZ3JGdgLUKNq22W5QUSxoJtTX5qOGdqgWc1Tz4Mh5dJ8/kVw
        N7o+cC9g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:45136 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kgrG5-003RiE-29; Sun, 22 Nov 2020 15:26:33 +0000
Date:   Sun, 22 Nov 2020 07:26:32 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Naveen Krishna Chatradhi <NaveenKrishna.Chatradhi@amd.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (amd_energy) Add AMD family 19h model 01h x86
 match
Message-ID: <20201122152632.GA100862@roeck-us.net>
References: <20201119184246.228322-1-NaveenKrishna.Chatradhi@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119184246.228322-1-NaveenKrishna.Chatradhi@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kgrG5-003RiE-29
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:45136
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Nov 20, 2020 at 12:12:45AM +0530, Naveen Krishna Chatradhi wrote:
> Add X86 CPU match for AMD family 19h model 01h. This is necessary to
> enable support for energy reporting via the amd_energy module.
> 
> Signed-off-by: Naveen Krishna Chatradhi <NaveenKrishna.Chatradhi@amd.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/amd_energy.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> index 3197cda7bcd9..9b306448b7a0 100644
> --- a/drivers/hwmon/amd_energy.c
> +++ b/drivers/hwmon/amd_energy.c
> @@ -331,6 +331,7 @@ static struct platform_device *amd_energy_platdev;
>  
>  static const struct x86_cpu_id cpu_ids[] __initconst = {
>  	X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x17, 0x31, NULL),
> +	X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x19, 0x01, NULL),
>  	{}
>  };
>  MODULE_DEVICE_TABLE(x86cpu, cpu_ids);
