Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384A0C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Mar 2022 17:44:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349249AbiCHRpg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Mar 2022 12:45:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349234AbiCHRpa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Mar 2022 12:45:30 -0500
X-Greylist: delayed 1439 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Mar 2022 09:44:33 PST
Received: from gateway34.websitewelcome.com (gateway34.websitewelcome.com [192.185.149.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D27555752
        for <linux-hwmon@vger.kernel.org>; Tue,  8 Mar 2022 09:44:33 -0800 (PST)
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway34.websitewelcome.com (Postfix) with ESMTP id 399B837CB0E
        for <linux-hwmon@vger.kernel.org>; Tue,  8 Mar 2022 11:20:31 -0600 (CST)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id RdVfnPBQ3dx86RdVfnWDI3; Tue, 08 Mar 2022 11:20:31 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=i+PQD/1xVrXdA5Lyn1C7iv6AEJ2jxVwj5+zkvZRHpXc=; b=bPCjc9cu2rzJHfL9vhIeLvad9E
        yVq3E11db0uhGUNv3Xfntbz9pPpOSBugiwGA0Khs6yQ54bcopOs21NVeXzOMWglj5Y7ng+8JhCB+n
        DjsaH37SedZZ9n63HK/hOaR2KxQR9Y9K8rPWzZQgNgv4+ldLpSvHRH7ZkwmBExj9Z3lSzsLn9McX0
        wC9XDmpky12QI8ZEuRVYIyXLecjfzYbPoFY68wmTjhUKBPyexFamdEANBmnCYoDOxRv25NIhxVTXL
        /w+CUFtP9p1TNUVJeyPHJs0GUhyJNocPJm/9SxjZP4U2fLc13NuWyydh9QNW+e9usL935cgwkY/3x
        2kHW9t0g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:58902 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@roeck-us.net>)
        id 1nRdVe-004ONu-P8; Tue, 08 Mar 2022 17:20:30 +0000
Date:   Tue, 8 Mar 2022 09:20:29 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: axi-fan-control: use hwmon_notify_event
Message-ID: <20220308172029.GA2696756@roeck-us.net>
References: <20220308135408.440744-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220308135408.440744-1-nuno.sa@analog.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nRdVe-004ONu-P8
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:58902
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 12
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Mar 08, 2022 at 02:54:08PM +0100, Nuno Sá wrote:
> Instead of directly accessing kobj directly from the driver, use the
> hwmon notify API.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/axi-fan-control.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-control.c
> index d2092c17d993..96c4a5c45291 100644
> --- a/drivers/hwmon/axi-fan-control.c
> +++ b/drivers/hwmon/axi-fan-control.c
> @@ -339,7 +339,8 @@ static irqreturn_t axi_fan_control_irq_handler(int irq, void *data)
>  			ctl->update_tacho_params = true;
>  		} else {
>  			ctl->hw_pwm_req = false;
> -			sysfs_notify(&ctl->hdev->kobj, NULL, "pwm1");
> +			hwmon_notify_event(ctl->hdev, hwmon_pwm,
> +					   hwmon_pwm_input, 0);
>  		}
>  	}
>  
