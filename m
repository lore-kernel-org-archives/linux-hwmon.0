Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FEBDC433EF
	for <linux-hwmon@archiver.kernel.org>; Sun,  3 Apr 2022 21:35:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376494AbiDCVhQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 3 Apr 2022 17:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349905AbiDCVhQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 3 Apr 2022 17:37:16 -0400
Received: from gateway22.websitewelcome.com (gateway22.websitewelcome.com [192.185.46.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23BC838BD4
        for <linux-hwmon@vger.kernel.org>; Sun,  3 Apr 2022 14:35:18 -0700 (PDT)
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway22.websitewelcome.com (Postfix) with ESMTP id 901B0936D
        for <linux-hwmon@vger.kernel.org>; Sun,  3 Apr 2022 16:35:17 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id b7sTncOJy9AGSb7sTnGtZD; Sun, 03 Apr 2022 16:35:17 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=mrfAVusgNljC7go+LgJhBC9KR1rdWz3utgxOj7TJEb4=; b=CGYJlkTwXFz1rZoXr5S3OraBeA
        +ZTD8YnQdL7CLE/srFgXNiJbSNu0kXhU5CEs5RdNiziwCeaivav9rh4oeSzmdXbFqIeIRahtAs5LO
        TP0Ct6eAJnv2iD5tMRtQDlKg0/0WQFDfp45r9/XyOTuhNOKjQBh6XBiopwL/FGA9znUdfuxLWdOQK
        F3CakO6IySn7R2RHr5YIZ2gmI2/Pj5q+JNSoYENasCbKtiXoIAISWoOg8oMQ8+JTarHApVFQCKqIL
        YZ9/UiRgo5tQ9iKMB6t+lbOQoISLqotxvIClVNL3wjy97YuMvPf6Ap+tX8OdLZ09Sn3+pt7mrp1F2
        jwYstNmw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:57826 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@roeck-us.net>)
        id 1nb7sT-00393S-5V; Sun, 03 Apr 2022 21:35:17 +0000
Date:   Sun, 3 Apr 2022 14:35:16 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Eduardo Valentin <eduval@amazon.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Eduardo Valentin <evalenti@kernel.org>
Subject: Re: [PATCH 1/1] drivers: hwmon: jc42: add HWMON_C_TZ_REGISTER
Message-ID: <20220403213516.GA2952922@roeck-us.net>
References: <20220318233011.13980-1-eduval@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318233011.13980-1-eduval@amazon.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nb7sT-00393S-5V
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:57826
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 8
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Mar 18, 2022 at 04:30:11PM -0700, Eduardo Valentin wrote:
> Add a thermal zone interface to the devices added
> under jc42 driver. This way, thermal zones described
> in device tree can make use of the of nodes of these
> devices.

Applied to hwmon-next.

Thanks,
Guenter

> 
> Cc: Guenter Roeck <linux@roeck-us.net> (maintainer:JC42.4 TEMPERATURE SENSOR DRIVER)
> Cc: Jean Delvare <jdelvare@suse.com> (maintainer:HARDWARE MONITORING)
> Cc: linux-hwmon@vger.kernel.org (open list:JC42.4 TEMPERATURE SENSOR DRIVER)
> Cc: linux-kernel@vger.kernel.org (open list)
> 
> Signed-off-by: Eduardo Valentin <eduval@amazon.com>
> Signed-off-by: Eduardo Valentin <evalenti@kernel.org>
> ---
>  drivers/hwmon/jc42.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
> index cb347a6bd8d9..f40df2f29d41 100644
> --- a/drivers/hwmon/jc42.c
> +++ b/drivers/hwmon/jc42.c
> @@ -443,6 +443,8 @@ static int jc42_detect(struct i2c_client *client, struct i2c_board_info *info)
>  }
>  
>  static const struct hwmon_channel_info *jc42_info[] = {
> +	HWMON_CHANNEL_INFO(chip,
> +			   HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
>  	HWMON_CHANNEL_INFO(temp,
>  			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
>  			   HWMON_T_CRIT | HWMON_T_MAX_HYST |
