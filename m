Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 746DDC5519F
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Nov 2020 01:38:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03102216C4
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Nov 2020 01:38:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.b="1BxIjr2w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgKMBib (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Nov 2020 20:38:31 -0500
Received: from gproxy2-pub.mail.unifiedlayer.com ([69.89.18.3]:37199 "EHLO
        gproxy2-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725965AbgKMBia (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Nov 2020 20:38:30 -0500
X-Greylist: delayed 1229 seconds by postgrey-1.27 at vger.kernel.org; Thu, 12 Nov 2020 20:38:29 EST
Received: from cmgw14.unifiedlayer.com (unknown [10.9.0.14])
        by gproxy2.mail.unifiedlayer.com (Postfix) with ESMTP id 045251E0A8E
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2020 18:17:59 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id dNiwkLrwYwNNldNiwkaelo; Thu, 12 Nov 2020 18:17:59 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=Mpx8FVSe c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=O-VtBXd9AAAA:8
 a=UyM4BhjcAAAA:8 a=zB1a_UxOHncF7umjrPUA:9 a=CjuIK1q_8ugA:10:nop_charset_2
 a=Np7NcwolvJ1Z-9SFZm_z:22 a=uB82QCMfG9HbZJC9J9IY:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=wrgCwdsGC5L05GQI0Ld/rSMDXoTRLGxKSon8DqiTim4=; b=1BxIjr2wDpHNp0WKkQ+70F5NXv
        EwDPe5zwgYDgdjvjC0NzaFNLsXK/heBaTniEUa2QjBomVNqFhXaozCGgH9pTcpWF0v3+XokZxWg+1
        vDRjCgLhTgu/qMDnBJ4uQgIuyy0lYZufD3EzBxOjzRMEdHZ+EO0kVSLJw5VzSVfYGO+9MB9EM4s1r
        K3gND0ZhJnVNfvYoYAVoyLmwbSn9F4CEs9mpLvmujsAtd+TqA7Q+k7emoUyiLLGtcg6u5QUiSJqnU
        xcZvT2Sqs6f80JVKRpTejt7om178vAbaWZfQsO9Oma6FyxmGz9K/nWx1CqEBQWmOq6BoLJulFKDGk
        iv6qqaKA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:46278 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kdNiw-000lQP-4K; Fri, 13 Nov 2020 01:17:58 +0000
Date:   Thu, 12 Nov 2020 17:17:57 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Brad Campbell <brad@fnarfbargle.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] applesmc: Cleanups on top of re-work comms
Message-ID: <20201113011757.GA208190@roeck-us.net>
References: <4a99004c-e0e8-1b42-cbbd-ad727a238a64@fnarfbargle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a99004c-e0e8-1b42-cbbd-ad727a238a64@fnarfbargle.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kdNiw-000lQP-4K
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:46278
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Nov 13, 2020 at 09:38:07AM +1100, Brad Campbell wrote:
> A couple of small cleanups on top of the comms changes for applesmc.c :
> 
> send_byte() is always called with APPLESMC_CMD_PORT.
> Consolidate writing length with other setup parameters.
> Consolidate read and write error messages to a single statement each.
> 
> Suggested-by: Henrik Rydberg <rydberg@bitmath.org>
> Signed-off-by: Brad Campbell <brad@fnarfbargle.com>

Changes are ok with me. Can I get some Reviewed-by: / Tested-by: tags ?

Thanks,
Guenter

> ---
> Changelog :
> v1 : Initial cleanup
> v2 : Re-work to suit smc-comms rework v6
> 
> Index: linux-stable/drivers/hwmon/applesmc.c
> ===================================================================
> --- linux-stable.orig/drivers/hwmon/applesmc.c
> +++ linux-stable/drivers/hwmon/applesmc.c
> @@ -182,7 +182,7 @@ static int wait_status(u8 val, u8 mask)
>  
>  /* send_byte - Write to SMC data port. Callers must hold applesmc_lock. */
>  
> -static int send_byte(u8 cmd, u16 port)
> +static int send_byte(u8 cmd)
>  {
>  	int status;
>  
> @@ -199,7 +199,7 @@ static int send_byte(u8 cmd, u16 port)
>  	if (status)
>  		return status;
>  
> -	outb(cmd, port);
> +	outb(cmd, APPLESMC_DATA_PORT);
>  	return 0;
>  }
>  
> @@ -240,7 +240,7 @@ static int send_argument(const char *key
>  	int i;
>  
>  	for (i = 0; i < 4; i++)
> -		if (send_byte(key[i], APPLESMC_DATA_PORT))
> +		if (send_byte(key[i]))
>  			return -EIO;
>  	return 0;
>  }
> @@ -255,23 +255,13 @@ static int read_smc(u8 cmd, const char *
>  	if (ret)
>  		return ret;
>  
> -	if (send_command(cmd) || send_argument(key)) {
> -		pr_warn("%.4s: read arg fail\n", key);
> -		return -EIO;
> -	}
> -
> -	/* This has no effect on newer (2012) SMCs */
> -	if (send_byte(len, APPLESMC_DATA_PORT)) {
> -		pr_warn("%.4s: read len fail\n", key);
> -		return -EIO;
> -	}
> +	if (send_command(cmd) || send_argument(key) || send_byte(len))
> +		goto err;
>  
>  	for (i = 0; i < len; i++) {
>  		if (wait_status(SMC_STATUS_AWAITING_DATA | SMC_STATUS_BUSY,
> -				SMC_STATUS_AWAITING_DATA | SMC_STATUS_BUSY)) {
> -			pr_warn("%.4s: read data[%d] fail\n", key, i);
> -			return -EIO;
> -		}
> +				SMC_STATUS_AWAITING_DATA | SMC_STATUS_BUSY))
> +			goto err;
>  		buffer[i] = inb(APPLESMC_DATA_PORT);
>  	}
>  
> @@ -287,6 +277,9 @@ static int read_smc(u8 cmd, const char *
>  		pr_warn("flushed %d bytes, last value is: %d\n", i, data);
>  
>  	return wait_status(0, SMC_STATUS_BUSY);
> +err:
> +	pr_warn("read cmd fail: %x %.4s %d\n", cmd, key, len);
> +	return -EIO;
>  }
>  
>  static int write_smc(u8 cmd, const char *key, const u8 *buffer, u8 len)
> @@ -298,24 +291,17 @@ static int write_smc(u8 cmd, const char
>  	if (ret)
>  		return ret;
>  
> -	if (send_command(cmd) || send_argument(key)) {
> -		pr_warn("%s: write arg fail\n", key);
> -		return -EIO;
> -	}
> -
> -	if (send_byte(len, APPLESMC_DATA_PORT)) {
> -		pr_warn("%.4s: write len fail\n", key);
> -		return -EIO;
> -	}
> +	if (send_command(cmd) || send_argument(key) || send_byte(len))
> +		goto err;
>  
> -	for (i = 0; i < len; i++) {
> -		if (send_byte(buffer[i], APPLESMC_DATA_PORT)) {
> -			pr_warn("%s: write data fail\n", key);
> -			return -EIO;
> -		}
> -	}
> +	for (i = 0; i < len; i++)
> +		if (send_byte(buffer[i]))
> +			goto err;
>  
>  	return wait_status(0, SMC_STATUS_BUSY);
> +err:
> +	pr_warn("write cmd fail: %x %.4s %d\n", cmd, key, len);
> +	return -EIO;
>  }
>  
>  static int read_register_count(unsigned int *count)
