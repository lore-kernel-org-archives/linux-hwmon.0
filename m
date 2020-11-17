Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20065C2D0E4
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 Nov 2020 09:59:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93B6922240
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 Nov 2020 09:59:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=fnarfbargle.com header.i=@fnarfbargle.com header.b="jjnD3Vq4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbgKQJ7E (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 Nov 2020 04:59:04 -0500
Received: from ns3.fnarfbargle.com ([103.4.19.87]:44734 "EHLO
        ns3.fnarfbargle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbgKQJ7E (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 Nov 2020 04:59:04 -0500
Received: from srv.home ([10.8.0.1] ident=heh19901)
        by ns3.fnarfbargle.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.84_2)
        (envelope-from <brad@fnarfbargle.com>)
        id 1kexlJ-0007sq-Uk; Tue, 17 Nov 2020 17:58:58 +0800
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fnarfbargle.com; s=mail;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=kbnP2Oz0LNoKAUJgfkcLtzlsdkRXYoh+1VCg9zxbw8k=;
        b=jjnD3Vq4VfwZScIA3qsnVOtRfo2MHWToMEZh+HS/WtcMr4unIuEVta5pYk84AhrQCGE7pxmMQpRjEJj4DdGtYWlgHkasnNJ9t6Rij3Kot0jqHXgPxWtSgQNgFuWsjUB5eqsu5A16KuLyjlegjBuSE5iFgNRLzl3vGFjYY9Qhn/k=;
Subject: Re: [PATCH] hwmon: (applesmc) Fix smc_sane() function
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Henrik Rydberg <rydberg@bitmath.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20201117072401.GE1111239@mwanda>
From:   Brad Campbell <brad@fnarfbargle.com>
Message-ID: <5000a18a-1aa1-e9b0-c51a-80f65654c65b@fnarfbargle.com>
Date:   Tue, 17 Nov 2020 20:58:47 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20201117072401.GE1111239@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 17/11/20 6:24 pm, Dan Carpenter wrote:
> This test is reversed so the function will return without sending
> the APPLESMC_READ_CMD or completing the rest of the function.

That is as designed. The routine looks at the busy line and if it's already in the right state then it simply ends. If not then it tries to "re-align" the state machine by sending a new command.

> Fixes: 4d64bb4ba5ec ("hwmon: (applesmc) Re-work SMC comms")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/hwmon/applesmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
> index 79b498f816fe..289b39537683 100644
> --- a/drivers/hwmon/applesmc.c
> +++ b/drivers/hwmon/applesmc.c
> @@ -227,7 +227,7 @@ static int smc_sane(void)
>  	int ret;
>  
>  	ret = wait_status(0, SMC_STATUS_BUSY);
> -	if (!ret)
> +	if (ret)
>  		return ret;
>  	ret = send_command(APPLESMC_READ_CMD);
>  	if (ret)
> 

