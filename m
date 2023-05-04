Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D61C77B78
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 May 2023 15:30:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbjEDPaB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 May 2023 11:30:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbjEDPaA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 May 2023 11:30:00 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F4CB1BF6;
        Thu,  4 May 2023 08:29:59 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1aaec6f189cso4242955ad.3;
        Thu, 04 May 2023 08:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683214199; x=1685806199;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=oVmgbsTTYAE2SuVdpLUJpCznPOcGAHHuXu5H5Lu16ck=;
        b=FRo6MVK4pbbaummo1xXtvLlSdNifl2sLcDFkIyPqaYEWofH7TQ7irGQq8N7WTPD0U9
         Aa80lrKNWnjMrmi/4Dr2BZK3gPxPnrC4U5FSy89DjaKShSBAvvEVAVpavo7w6kQdz3kW
         vTLcdjseD5sjMU1IqV3LXyB6PLedXXI7xs2jW1yRCRWJTcgLpxIjQgSwayh3AB9lABsu
         Q5N2EzLEiVXwtQ+mNJtqSxVysuyfetGFuTolFVWkTM5xt1RaAa+4E17NiqFmiIp60jaq
         Xv+eKgUr++Vqa1b95SCAldDu/NNbRv19vfSxBvN264hU0vy3EGPmZr8Ur9zGeSrw3Ne4
         l4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683214199; x=1685806199;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oVmgbsTTYAE2SuVdpLUJpCznPOcGAHHuXu5H5Lu16ck=;
        b=EbcH4xEWTbB36q6AbDM4DxGO3p60YiXnl/MFe6dqoDh1sUFZYLkfdgXVZcGdywyuw/
         rSkjT5kpvGlxdn09Hw7Vd3ZBEhJAw+lzznbsXNSlGpp6+378uGRC5y+LdOTjjKkVCccu
         +dU5tMUQZTkXuLcDtIl3pK4iXo86u56nxr3oc6wUJXwYuWdoA/SXLvgHyzNyqum97zgw
         zaYZgzRby5Pg1MHanm7/UkSua9IcXLPNFybTp7uH3o8mSZj/2mBmhr/SyZ36evy9DTCU
         2VQTLEl6Lb60WNq5tUyBhzTV/jZ/LA+/UQMWUJPXwzALZKBi6FiUBvlf8de52STR6PVp
         87hg==
X-Gm-Message-State: AC+VfDzo4dihVFgONKabIYMSGj5NmDtuRkOO26TdGX5CqK712GuB6//G
        nzlyvA7W1Zohy07SICs6aXTq7aCenLA=
X-Google-Smtp-Source: ACHHUZ6n5MkRwSCzzuP1xCmJLx1k8vOdQqG2TUwaL5nKLLYevh7i8q8IV41iqHdH69Dop0nuOOGr4A==
X-Received: by 2002:a17:902:7048:b0:1a5:a1b:bbd8 with SMTP id h8-20020a170902704800b001a50a1bbbd8mr3480874plt.45.1683214198998;
        Thu, 04 May 2023 08:29:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b3-20020a170902bd4300b001aaf83873dbsm7431099plx.162.2023.05.04.08.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 08:29:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ff6efe53-2173-1372-a1ca-c0928cf8a160@roeck-us.net>
Date:   Thu, 4 May 2023 08:29:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC 02/11] hwmon: (core) Rename last parameter of
 devm_hwmon_register_with_info()
Content-Language: en-US
To:     James Seo <james@equiv.tech>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230504075752.1320967-1-james@equiv.tech>
 <20230504075752.1320967-3-james@equiv.tech>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230504075752.1320967-3-james@equiv.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/4/23 00:57, James Seo wrote:
> Change the name of the groups parameter of
> devm_hwmon_device_register_with_info() to extra_groups to
> match the name given by the hwmon API reference and in
> hwmon_device_register_with_info().
> 
> Signed-off-by: James Seo <james@equiv.tech>
> ---
>   drivers/hwmon/hwmon.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 573b83b6c08c..5f205686065e 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -1029,7 +1029,7 @@ EXPORT_SYMBOL_GPL(devm_hwmon_device_register_with_groups);
>    * @name:	hwmon name attribute
>    * @drvdata:	driver data to attach to created device
>    * @chip:	pointer to hwmon chip information
> - * @groups:	pointer to list of driver specific attribute groups
> + * @extra_groups: pointer to list of driver specific attribute groups
>    *
>    * Returns the pointer to the new device. The new device is automatically
>    * unregistered with the parent device.
> @@ -1038,7 +1038,7 @@ struct device *
>   devm_hwmon_device_register_with_info(struct device *dev, const char *name,
>   				     void *drvdata,
>   				     const struct hwmon_chip_info *chip,
> -				     const struct attribute_group **groups)
> +				     const struct attribute_group **extra_groups)

Please please please no such changes. I don't want to have to deal with
patch wars just because people believe variables should have other names.

Such changes add zero value unless one counts wasted review time as a "value".

Guenter

>   {
>   	struct device **ptr, *hwdev;
>   
> @@ -1050,7 +1050,7 @@ devm_hwmon_device_register_with_info(struct device *dev, const char *name,
>   		return ERR_PTR(-ENOMEM);
>   
>   	hwdev = hwmon_device_register_with_info(dev, name, drvdata, chip,
> -						groups);
> +						extra_groups);
>   	if (IS_ERR(hwdev))
>   		goto error;
>   

