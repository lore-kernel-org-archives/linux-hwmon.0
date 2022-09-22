Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C036FC54EE9
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Sep 2022 23:45:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiIVXpt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Sep 2022 19:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiIVXpt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Sep 2022 19:45:49 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37CBA98D18
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 16:45:47 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id l65so10773764pfl.8
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 16:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=9xA7SwihlVCgcjAshYWIgv5LXjlbc3RdDFJqMUp/bkE=;
        b=ooOYsB7INeA6XTuIsGpiwj05nzmO4Rg0a8iijj7JSa+idF5jlMQ53M73qehs9MxL18
         +IrGYKdM5ti5H1NctNFnpyl6hrty84N4CYv9jy5XgSdlXX5aI+QJDyqFGoVf07kbHVDb
         UI6TJQzHdTqN4c1XqjgpJxGhLLOIDOTkLx1m3QQQRYyTCQWYmz7QUVlwOCvGzlXMaOvz
         W+9q7KShv9c8hlysGn2Zs4w6w1OYvUvpKmh7/3f7tjEd9Zx06xlr3xuEP1sVLgdZl3f7
         F4iZTXSTpUIX731gk7PKQzY0jaNJn3FDAKsNOyVcDYG5V6YNg34UzmCA1YZPo+Mq9XlO
         +jjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=9xA7SwihlVCgcjAshYWIgv5LXjlbc3RdDFJqMUp/bkE=;
        b=v6PPbvO5RSs+kmaN9lIT445WqHFkWGi79hHyxy3Wzgo3SCmb6JnYiKgpz2QI2VUy+V
         TBvp0E9qVWzVD0ldlpIANJ67d8a08cgIiKXHeYPvGhiAI9yulbJSRVcD0W8Gq2W9bfeg
         7YwGdR89LE77vrgPQ6gjmw+ZkbKox+UCewuP1UZ0vpI6/FDjnnaMdY+dXA7Bjqsq69cL
         YNBQxJ/xhsRct5sRu94DQ4Ux2PA0GBglbL65aGPWLcuWL86o5a/b9M0Mq5LEeenfmOfB
         FCaejkqtDdawGpxengpmET9iIEtD6/SBc/m/BMhW3iktnf591MuZAfmh1aSbYA60R+Jm
         HdTg==
X-Gm-Message-State: ACrzQf3wRrCzb0kZcxB6iMh85QIbKkf/vV5aDkDjTqhYk/Nvzm1VW70Y
        sV/zZMRFdgvKZuDUynqtRng=
X-Google-Smtp-Source: AMsMyM5BW8IawxAbxzPsamRX3VhkKsZTJoO7BRLLtuQ0sxv75MJqSZCwV8ds/Cw3mAd38VuIoPEBVg==
X-Received: by 2002:a05:6a00:acc:b0:530:e79e:fc27 with SMTP id c12-20020a056a000acc00b00530e79efc27mr6160105pfl.61.1663890346624;
        Thu, 22 Sep 2022 16:45:46 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s13-20020a170902ea0d00b0016d72804664sm4620001plg.205.2022.09.22.16.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 16:45:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a18fef57-7f12-da67-4334-fd89f80696d6@roeck-us.net>
Date:   Thu, 22 Sep 2022 16:45:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1] drivers/hwmon/adm9240: fix data race in
 adm9240_fan_read
Content-Language: en-US
To:     Li Zhong <floridsleeves@gmail.com>, linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com
References: <20220922233356.1712262-1-floridsleeves@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220922233356.1712262-1-floridsleeves@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/22/22 16:33, Li Zhong wrote:
> In
> adm9240_read()
>    adm9240_fan_read()
>      adm9240_write_fan_div(),
> 
> it assumes that the caller of adm9240_write_fan_div() must hold
> data->update_lock. Otherwise, it may cause data races when data is
> updated by other threads.
> 
> Signed-off-by: Li Zhong <floridsleeves@gmail.com>
> ---
>   drivers/hwmon/adm9240.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
> index 483cd757abd3..d93ae3147994 100644
> --- a/drivers/hwmon/adm9240.c
> +++ b/drivers/hwmon/adm9240.c
> @@ -501,6 +501,7 @@ static int adm9240_fan_read(struct device *dev, u32 attr, int channel, long *val
>   
>   	switch (attr) {
>   	case hwmon_fan_input:
> +		mutex_lock(&data->update_lock);
>   		err = regmap_read(data->regmap, ADM9240_REG_FAN(channel), &regval);
>   		if (err < 0)
>   			return err;

The mutex needs to be released here.

> @@ -511,6 +512,7 @@ static int adm9240_fan_read(struct device *dev, u32 attr, int channel, long *val
>   			if (err)
>   				return err;
>   		}
> +		mutex_unlock(&data->update_lock);
>   		*val = FAN_FROM_REG(regval, BIT(data->fan_div[channel]));
>   		break;
>   	case hwmon_fan_div:

