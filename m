Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CEEC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Feb 2022 04:40:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbiBKEkM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Feb 2022 23:40:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiBKEkL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Feb 2022 23:40:11 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 393FCB2E;
        Thu, 10 Feb 2022 20:40:11 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id d18-20020a9d51d2000000b005a09728a8c2so5283535oth.3;
        Thu, 10 Feb 2022 20:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0xiYW0s/95zZR6BWP75yEnFfA5OGn7B7YXTr4q+M2xI=;
        b=BrioTzrvFxhCJ8rmLA1xBs8/MZM1h3CHxEicanvH4UzDYIjKdkK2R5KZKoBRPQqpc+
         GtRA8tm884J0NLTnkDs8mKEFhDpeItZ7FVKBDb4BKisz41Qt9c1Sk4o3jDEa8ZL+K3Tg
         EXS/pRkCQAakmZofWZzVDpdj/SmZzWDxMP0/1kSB3oLjEd8aNBBWDLQQ+/30RlyGntHr
         N3gqZ6c4Z7Unh3iHVPgUUjRxL8HmoWClRNnra+nyO7GPDkTN/f8b4bjofYaKHKOqUM+9
         CHGQtpIztOgjkzxDnruUIf4pKVgT5r+mc6rsuqg5GZwY04QPbZQwu5tw6vQdQNSuTg3j
         K62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0xiYW0s/95zZR6BWP75yEnFfA5OGn7B7YXTr4q+M2xI=;
        b=PL9efJzrtH5osgM5C1Goug4vpTCvzOdh5AcoNhfwHQKL1T6d7zYCs3zBBm4VNPxW6C
         0iw7R56RAHwiOYh7gow2VxtB3E0S45kusSNKXVSzWugCUib/u7lImMJT3qqI6AyJs4Q2
         cGSVD76yWIISeQHTDRs4yqnkgJUmvCiJLDOVYQIyB9m6JwUCKmBYzPmkX9HWXrdw8zFl
         tZeh5uvksmj4G0e1UO62wBNhSTsS7Jsq6KNvmZaTxlw7YnPruJ0VLrL1bcOl73qSMbq4
         1CY4F252dd58RDu0tsp7MK4TCj8AfOybdCUxtUHAcfo40XTI9iTzV03Wi4+7ijBCemCL
         5zqg==
X-Gm-Message-State: AOAM5330yPwgGcsSLjDDFi2fEW7U5KBQCeLZZxOJAN/QNJhByJw6rrlJ
        6qgTt6EmBVG+V3o6fI/w8GbhmjvknlAP2Q==
X-Google-Smtp-Source: ABdhPJw6eRnXbs4dq/dxrN9r2q8bCviTlUB++QdbMP11bLMqEARuKanKM+KE08dnrIOukDdGl0SAeg==
X-Received: by 2002:a9d:7518:: with SMTP id r24mr1321otk.97.1644554410517;
        Thu, 10 Feb 2022 20:40:10 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 4sm9190597oon.21.2022.02.10.20.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 20:40:09 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d717be26-b44b-90e7-8424-6959b7e6a17d@roeck-us.net>
Date:   Thu, 10 Feb 2022 20:40:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) deduce sensor signess from its
 type
Content-Language: en-US
To:     Eugene Shalygin <eugene.shalygin@gmail.com>
Cc:     Oleksandr Natalenko <oleksandr@natalenko.name>,
        Denis Pauk <pauk.denis@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220211003641.73111-1-eugene.shalygin@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220211003641.73111-1-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/10/22 16:36, Eugene Shalygin wrote:
> Reading DSDT code for ASUS X470-based boards (the ones served by the
> asus_wmi_Sensors driver), where ASUS put hardware monitoring functions
> into the WMI code, reveals that fan and current sensors data is
> unsigned. For the current sensor that was cofirmed by a user who showed
> high enough current value for overflow.
> 
> Thus let's assume that the signess of the sensors is determined by its

signedness

> type and that only temperature ones provide signed numbers.
> 
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
> ---
>   drivers/hwmon/asus-ec-sensors.c | 38 +++++++++++++++++++++++++--------
>   1 file changed, 29 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
> index bfac08a5dc57..a1b13fe149ac 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -266,6 +266,13 @@ static u8 register_index(u16 reg)
>   	return reg & 0x00ff;
>   }
>   
> +static bool is_sensor_data_signed(const struct ec_sensor_info *si)
> +{
> +	// guessed from WMI functions in DSDT code for boards
> +	// of the X470 generation

/*
  * Please lets stick with standard multi-line comments
  */

> +	return si->type == hwmon_temp;
> +}
> +
>   static const struct ec_sensor_info *
>   get_sensor_info(const struct ec_sensors_data *state, int index)
>   {
> @@ -420,15 +427,28 @@ static int asus_ec_block_read(const struct device *dev,
>   
>   static inline s32 get_sensor_value(const struct ec_sensor_info *si, u8 *data)
>   {
> -	switch (si->addr.components.size) {
> -	case 1:
> -		return (s8)*data;
> -	case 2:
> -		return (s16)get_unaligned_be16(data);
> -	case 4:
> -		return (s32)get_unaligned_be32(data);
> -	default:
> -		return 0;
> +	if (is_sensor_data_signed(si)) {
> +		switch (si->addr.components.size) {
> +		case 1:
> +			return (s8)*data;
> +		case 2:
> +			return (s16)get_unaligned_be16(data);
> +		case 4:
> +			return (s32)get_unaligned_be32(data);
> +		default:
> +			return 0;
> +		}
> +	} else {
> +		switch (si->addr.components.size) {
> +		case 1:
> +			return *data;
> +		case 2:
> +			return get_unaligned_be16(data);
> +		case 4:
> +			return get_unaligned_be32(data);
> +		default:
> +			return 0;
> +		}
>   	}
>   }
>   

