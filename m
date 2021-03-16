Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4A9C433E6
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Mar 2021 09:13:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCBAA65006
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Mar 2021 09:13:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231793AbhCPJNX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 16 Mar 2021 05:13:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbhCPJNQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 16 Mar 2021 05:13:16 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC20C061765
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Mar 2021 02:12:12 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id w195so30781964oif.11
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Mar 2021 02:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JH+lbG8oPCxZVhv8GIM/ayOG0POPDJObqtLRyTUNEYo=;
        b=RFe1bfvYyOYO8XvwPKedirLogimPWGJuCJdgZPCgJvz4vB7+2kbDil11xGUKEMhJyE
         tLSRVa9Piv5UQ/1wXHJE+ELejYqnwLOj5kqTSYs9kLDkjp9NcDINKqw1RlUMTszKdmAv
         6Zw7dDi5RbNYekE6GAbsw1dNWhXtaagZSGALuT8NpfgjuZbREX1dRbKURwKOxno1r2HK
         o6462fefT4zw7ZB6wNqCbl1N0SMmq6yw2tekv2aGYwtLfrYUnBf1mhn+Z6pY9aXKImIe
         qnVhZbW9OYh21JeqiPxiJhI4TlT6re1qpyxlWoKhNPA8wRh+m1dXAB5+Fuh34W+e+ow5
         UX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=JH+lbG8oPCxZVhv8GIM/ayOG0POPDJObqtLRyTUNEYo=;
        b=iT6blXO7gLu7dBoC3BtXkFQTeVxHzQ0ZPg6dzykLyC24rf3f5sJ2xKUxDRBjbyu1sg
         0JhzVS7sR33TuQgWWxC/S24jLEDeXA7b+NfTHD8PMhmo6PIT0oewmdUNyDkpifaDJskv
         szi1qh+uemIeq5LQIcKzb/tb+1K33wC0U4POCN1rp+VNMzb+tH8cAbKOAY+CJneMSZQG
         e1nN3DPmfzywolANBSTIJkw4JBpThJoDQhlELlDyOcDflPw19DTIOQTHZs2OtI7KfgOK
         TaMacg8mLoxHGms2cXM6cXeykvDSXQCm8CTAKqdPvX9ezjcP83OBR40koHjUOYQLSHU/
         xloA==
X-Gm-Message-State: AOAM530o15XVohJ2D9NeMmzWh9TLDEWL0AREpOLOkHV8H4XGvl2Y0va9
        kcuEIl9/hTXWEB4ns9VHHPdHmsjRrbI=
X-Google-Smtp-Source: ABdhPJxikCUgdGIZQY0c/vl9ecapG/SP4FMawM/cJt0/K2qKfAqWbeGXXuUfRVygIRUMr9QUPmyJrA==
X-Received: by 2002:a05:6808:b09:: with SMTP id s9mr2720494oij.36.1615885931083;
        Tue, 16 Mar 2021 02:12:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s193sm7067336oih.52.2021.03.16.02.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 02:12:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] hwmon: (ina2xx) Convert sysfs sprintf/snprintf family to
 sysfs_emit
To:     Jay Fang <f.fangjian@huawei.com>, linux-hwmon@vger.kernel.org
Cc:     huangdaode@huawei.com
References: <1615882262-39367-1-git-send-email-f.fangjian@huawei.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <917706c8-7f96-7098-f2de-e1e2dd791a4a@roeck-us.net>
Date:   Tue, 16 Mar 2021 02:12:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1615882262-39367-1-git-send-email-f.fangjian@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/16/21 1:11 AM, Jay Fang wrote:
> From: Zihao Tang <tangzihao1@hisilicon.com>
> 
> Fix the following coccicheck warning:
> 
> drivers/hwmon/ina2xx.c:313:8-16: WARNING: use scnprintf or sprintf
> drivers/hwmon/ina2xx.c:453:8-16: WARNING: use scnprintf or sprintf
> drivers/hwmon/ina2xx.c:484:8-16: WARNING: use scnprintf or sprintf
> drivers/hwmon/ina2xx.c:540:8-16: WARNING: use scnprintf or sprintf
> 
> Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>
> Signed-off-by: Jay Fang <f.fangjian@huawei.com>
> ---
>  drivers/hwmon/ina2xx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index ca97f9e..2c12395 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
> @@ -310,7 +310,7 @@ static ssize_t ina2xx_value_show(struct device *dev,
>  	if (err < 0)
>  		return err;
>  
> -	return snprintf(buf, PAGE_SIZE, "%d\n",
> +	return sysfs_emit(buf, "%d\n",
>  			ina2xx_get_value(data, attr->index, regval));

Line length limit is now 100 columns. If you want to keep the line split
anyway, please fix the alignment.

Thanks,
Guenter

>  }
>  
> @@ -450,7 +450,7 @@ static ssize_t ina226_alarm_show(struct device *dev,
>  
>  	alarm = (regval & BIT(attr->index)) &&
>  		(regval & INA226_ALERT_FUNCTION_FLAG);
> -	return snprintf(buf, PAGE_SIZE, "%d\n", alarm);
> +	return sysfs_emit(buf, "%d\n", alarm);
>  }
>  
>  /*
> @@ -481,7 +481,7 @@ static ssize_t ina2xx_shunt_show(struct device *dev,
>  {
>  	struct ina2xx_data *data = dev_get_drvdata(dev);
>  
> -	return snprintf(buf, PAGE_SIZE, "%li\n", data->rshunt);
> +	return sysfs_emit(buf, "%li\n", data->rshunt);
>  }
>  
>  static ssize_t ina2xx_shunt_store(struct device *dev,
> @@ -537,7 +537,7 @@ static ssize_t ina226_interval_show(struct device *dev,
>  	if (status)
>  		return status;
>  
> -	return snprintf(buf, PAGE_SIZE, "%d\n", ina226_reg_to_interval(regval));
> +	return sysfs_emit(buf, "%d\n", ina226_reg_to_interval(regval));
>  }
>  
>  /* shunt voltage */
> 

