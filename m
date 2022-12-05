Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5183BC4332F
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Dec 2022 18:33:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233625AbiLESd3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 5 Dec 2022 13:33:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233397AbiLESdH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Dec 2022 13:33:07 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C78427DC7
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Dec 2022 10:28:11 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id v19-20020a9d5a13000000b0066e82a3872dso5770996oth.5
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Dec 2022 10:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q0tYFcpZ1HKS+EFXzkDYkATCaJDh78ie/cCVCquIp7I=;
        b=qknFpKr0UQX7PE5TPPPNeggoZklrzqTv5xbpHRTPJq0qqOSIfhWPSgioWLd4PE9AvF
         7IiGbPwaIlDj8GuKIL5tgmvBQ+b0EKs9U/Fj1BYhbIGPEaDhq+h8ZM4pUV6VEKbOUTOM
         Zc7Wq9YZ4HCzhcXsaus2z3cpisuRk78yZac9l/QhSTUNHWzuqLiHy4bUS2jx7AoRCSax
         TPYS7O/3Nr84qMbKWK8ENDVmjAbBQ73Wirt2UyLHC1hJinMgjO/mbuvqfAFwqlQhcSsz
         5u17G47/dhNAkjtFcBfgrR3GJubd8LBmlH/uKHu4zXxKxu8LbpxrXdQaqq96ZvXBZX85
         /EsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q0tYFcpZ1HKS+EFXzkDYkATCaJDh78ie/cCVCquIp7I=;
        b=2ISLqjGmLaUyq9/h2xvejWI8c+UkUv9V30YeChKm2SUz1v5sUeoPdxfEWnDkpIcQZA
         TEjkO7ruR6lgY/FAHA/4hJWKrlxdvEg+4P4McRpt1vZPQA3mClzLYt1xAh5+eFLbk+Nu
         lPcXx7Lb+S/mHIE82ngNlzAPNl5EulaJlHJMi4Q0ThXc++9kLRjN3+PBv94e28PkwltK
         6cId/2MskECuVw89DZI6GgaMrbed3LvFZ7qdi9Mg16mPtD8eJMZZxGJqM2wdyUpp0cqo
         E9yIN2T0zfQcP7TOu0CTfImBpsOeqTO1Up1P9K/XzTfZjOlxNJY2Dl6VKwuoqjDso4+a
         j1pA==
X-Gm-Message-State: ANoB5pkZHq9RLOOuQuFGuYi8qDt3tzlvu4YAZdMuwUm4cVuDg+onED0O
        7uYoMBrnna4zlenyJYAaEPioXfA4Xd4=
X-Google-Smtp-Source: AA0mqf7kH1kTer34q2h6XWPhRT47b43kc+51sm0Z42ca+uCdhmAN2xXa+GFXbd+uGLP6S6DJwSVRCA==
X-Received: by 2002:a9d:1b10:0:b0:66e:6964:1f20 with SMTP id l16-20020a9d1b10000000b0066e69641f20mr12470528otl.296.1670264854486;
        Mon, 05 Dec 2022 10:27:34 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c9-20020a9d75c9000000b006618e23df48sm4139847otl.39.2022.12.05.10.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 10:27:34 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <94549af1-738a-c1d5-b90d-e3b1014b1bb7@roeck-us.net>
Date:   Mon, 5 Dec 2022 10:27:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Xingjiang Qiao <nanpuyue@gmail.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org
References: <20221205173611.145571-1-nanpuyue@gmail.com>
 <20221205173611.145571-2-nanpuyue@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/2] hwmon: (emc2305) fix pwm never being able to set
 lower
In-Reply-To: <20221205173611.145571-2-nanpuyue@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/5/22 09:36, Xingjiang Qiao wrote:
> There are fields 'last_hwmon_state' and 'last_thermal_state' in the
> structure 'emc2305_cdev_data', which respectively store the cooling state
> set by the 'hwmon' and 'thermal' subsystem, and the driver author hopes
> that if the state set by 'hwmon' is lower than the value set by 'thermal',
> the driver will just save it without actually setting the pwm. Currently,
> the 'last_thermal_state' also be updated by 'hwmon', which will cause the
> cooling state to never be set to a lower value. This patch fixes that.
> 
> Signed-off-by: Xingjiang Qiao <nanpuyue@gmail.com>
> ---
>   drivers/hwmon/emc2305.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index 4df84065cbfb..f51760f8aa85 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c
> @@ -398,11 +398,9 @@ emc2305_write(struct device *dev, enum hwmon_sensor_types type, u32 attr, int ch
>   				 * Update PWM only in case requested state is not less than the
>   				 * last thermal state.
>   				 */
> -				if (data->cdev_data[cdev_idx].last_hwmon_state >=
> +				if (data->cdev_data[cdev_idx].last_hwmon_state <
>   				    data->cdev_data[cdev_idx].last_thermal_state)
> -					return emc2305_set_cur_state(data->cdev_data[cdev_idx].cdev,
> -							data->cdev_data[cdev_idx].last_hwmon_state);
> -				return 0;
> +					return 0;
>   			}
>   			return emc2305_set_pwm(dev, val, channel);

This would bypass the thermal code, leaving the thermal subsystem unaware
of the current state. I am not entirely sure what the best solution is.
Skipping the entire thermal code in that situation doesn't seem the be
correct. Maybe there needs to be a shim function for the thermal code to
only update last_thermal_state if the request was indeed made by the thermal
subsystem.

Guenter

