Return-Path: <SRS0=HSB5=QZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568CCC43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Feb 2019 22:23:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 250F12176F
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Feb 2019 22:23:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgR+kf9C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731715AbfBRWXx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Feb 2019 17:23:53 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34089 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729819AbfBRWXx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Feb 2019 17:23:53 -0500
Received: by mail-pl1-f193.google.com with SMTP id d15so2231271plr.1
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Feb 2019 14:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=a8WrB265E+8q9JY5bjFinJLX66oY1eO6XYNBRvoF6Nw=;
        b=AgR+kf9ClHVOw7qQRR2vLhEMz7CAC7a5To31YiTMRlpTNBGqAdcAnF6oAEyiZMfQ2S
         qAOCgHZ3C1F9O7MlhqLHEuqcsEEXZkG+asyMCzhvT0w0Sip7ztgYJDLyD85TLvVfbOsh
         6WejyIhvDv4PxeBGi2U+4xVNjYZqteEYoJeN85GjKo0OnuWnlrOgmzh5H+WrM1wvPt6H
         fOJgLCKZ1elpk7F6xT5vmvdGVVaNqKmQCF3jQSqVpWSlBYWOEzDBIwHTIgXal0l5ZMwF
         LZMf08IShAbnUmkSlkFp+/fymAbUJm7689Odujei8Xoq5nMzxYwusofySYPFhplBdIPp
         0Jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=a8WrB265E+8q9JY5bjFinJLX66oY1eO6XYNBRvoF6Nw=;
        b=bxR9LajXnZk5kNAl6hCdJEa5OZRFs8CvBakXXDE3Eb80t0IwaSAB+z5zQUdD2w5XXL
         W0i9woTQTTRoT4UY55VHwZL/EBrp904FEskKmAJHZqqern7CWXmVcW/ue4/8QlJqUMlg
         t5Hb2TwcYXlXwU2NTs+BXVzd0GrurBduFeXPOg/K4xlKQcUvYuggQm4GKUbV4Wtf5dMo
         +fsG9Pn+xDTj0hrrYiAvoT1kCqlE79yFkOcpHP5VjRmMndBraOYsM1aiynKM/GELSE0R
         zw/hPotFUN1g+eTLwOvjwYJd1zoyEM4zP3RHBoKTik29gADVybo2vd3m4W6lGUszcjeU
         lAvA==
X-Gm-Message-State: AHQUAuZdmsVh7tviYCrXTfOXOI4yjiVw0IxM2/0skuS94hZ84JIXO7nj
        GQ2xkendRnMb+9AjqilezUm7r1ji
X-Google-Smtp-Source: AHgI3IZAyVPlKjeFs9z3HbcX+dqx9wUF6F1z592qfZj+h3sPhon0q6lkACmst/EsQMaLL+vJFCnCGw==
X-Received: by 2002:a17:902:2c83:: with SMTP id n3mr27787648plb.104.1550528632318;
        Mon, 18 Feb 2019 14:23:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s1sm10612621pgv.30.2019.02.18.14.23.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Feb 2019 14:23:50 -0800 (PST)
Subject: Re: [PATCH v2 hwmon] hwmon: (pmbus) Fix driver info initialization in
 probe routine
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20190218195440.19680-1-vadimp@mellanox.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <fc191f85-818f-fbff-bd17-4ea60f9b7092@roeck-us.net>
Date:   Mon, 18 Feb 2019 14:23:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190218195440.19680-1-vadimp@mellanox.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/18/19 11:54 AM, Vadim Pasternak wrote:
> Fix tps53679_probe() by using dynamically allocated "pmbus_driver_info"
> structure instead of static. Usage of static structures causes
> overwritten of the field "vrm_version", in case the system is equipped
> with several tps53679 devices with the different "vrm_version".
> In such case the last probed device overwrites this field for all
> others.
> 
> Fixes: 610526527a13 ("hwmon: (pmbus) Add support for Texas Instruments tps53679 device")
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>

Applied.

Thanks,
Guenter

> ---
> v1->v2:
>   Comments pointed out by Guenter:
>   - Use devm_kmemdup().
> ---
>   drivers/hwmon/pmbus/tps53679.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
> index 85b515cd9df0..2bc352c5357f 100644
> --- a/drivers/hwmon/pmbus/tps53679.c
> +++ b/drivers/hwmon/pmbus/tps53679.c
> @@ -80,7 +80,14 @@ static struct pmbus_driver_info tps53679_info = {
>   static int tps53679_probe(struct i2c_client *client,
>   			  const struct i2c_device_id *id)
>   {
> -	return pmbus_do_probe(client, id, &tps53679_info);
> +	struct pmbus_driver_info *info;
> +
> +	info = devm_kmemdup(&client->dev, &tps53679_info, sizeof(*info),
> +			    GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	return pmbus_do_probe(client, id, info);
>   }
>   
>   static const struct i2c_device_id tps53679_id[] = {
> 

