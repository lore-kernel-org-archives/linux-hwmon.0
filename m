Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0495AC54EE9
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Sep 2022 23:48:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbiIVXsf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Sep 2022 19:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiIVXse (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Sep 2022 19:48:34 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4BFFED5FC
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 16:48:30 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id g1-20020a17090a708100b00203c1c66ae3so3745465pjk.2
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 16:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=QqJ1HgTnHWfAdAQCDHRfDzlr+Dzv/utllAEhQy8RVew=;
        b=cotYRnefo3q/dyN32ZighpTl9NbXhZndYc23TB8FfvudAW9gTArEvvCZSjilrObI3v
         RWX6DZCATTb5440vZQTzok3KIiWCWahb6UIgYn0c2ftOIbFM/re9Kf+dpFvt8NTQE86o
         ej6QyCfDZpPTxO1VIfq3JASBJ1YAXh4D/1B1IvLSQGqB9ynFrkPPfQ0xYrSqopoO8ipD
         xHByc5i3QHYIIOJeOCAMUVIKKkaZk8WZXamKRAZVucMH62Sj9Hy6IOj/aj13uUlk1Xcz
         5Ag2zn4MyX/pkfacPc18eVQSe8TcR64a7SkZ7SnXvXpyxyKHq1d1QDw9fx7zDLqhOZCh
         VVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=QqJ1HgTnHWfAdAQCDHRfDzlr+Dzv/utllAEhQy8RVew=;
        b=vVVOYaFit2VUAuD0M8W0v0omJNt+zEY1vBGCy8WntX7kxhyl/m+Weq9tm2j+8XJ1T9
         EpU87F8nn5xmhVgJ8V1c0Jbfos2/TcCVkbIsYI600u02pSKwR1HSHeYfs4C5ZWzhJyWW
         nxXkOUx0sdiFuENE2w8xzYxO4H6W90NyCYYv/83t3O8oFbf46VswZNtTvTRcpufVyhpK
         0JNszZlqPwkUkM2IGUQCRziKawGvGOstCQ6ulC/lO9veWTmRRzhG4pXOAXTx7ZKOiAs+
         pnC2u4MgJ2dkQTXaVnFe6cvvaYmEQyzCQvyAd4GS0pv5edvDQHhWiyDHczOPyWgRSXTQ
         Rvig==
X-Gm-Message-State: ACrzQf1VNvvZuJAHjrHetJtg7vdj3rPFFzNVPard7Kqezn4dsDRtSR15
        67aFbLT8R7/nylQ5OrRm/5E=
X-Google-Smtp-Source: AMsMyM4p2Uoan2eDMdgS83hCiI0yaqbngfSXMgwpy52yydyBVBRSnKk9pID8RV2rVLp2wY2EDwurMA==
X-Received: by 2002:a17:903:2c9:b0:172:57d5:d6f0 with SMTP id s9-20020a17090302c900b0017257d5d6f0mr5830461plk.61.1663890510181;
        Thu, 22 Sep 2022 16:48:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q16-20020a63cc50000000b0043be31d490dsm4269358pgi.67.2022.09.22.16.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 16:48:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2424a9f1-c07d-98d7-82fc-e31fe6f92f76@roeck-us.net>
Date:   Thu, 22 Sep 2022 16:48:28 -0700
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
> @@ -511,6 +512,7 @@ static int adm9240_fan_read(struct device *dev, u32 attr, int channel, long *val
>   			if (err)
>   				return err;

The mutex also needs to be released here (in the error handling path).

>   		}
> +		mutex_unlock(&data->update_lock);
>   		*val = FAN_FROM_REG(regval, BIT(data->fan_div[channel]));
>   		break;
>   	case hwmon_fan_div:

