Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E273C433E0
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Mar 2021 19:11:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FB4264F6B
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Mar 2021 19:11:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232631AbhCRTLM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Mar 2021 15:11:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232705AbhCRTKu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Mar 2021 15:10:50 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A820C06174A
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Mar 2021 12:10:50 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id n140so2095397oig.9
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Mar 2021 12:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qS7uy17CNnacIzw8WkSi9EFZV+pz8X1w4f3ZfA/TT6o=;
        b=vcLuoHAHVy7AFGDiyCAq8TXoIsa5bQ6PYtP2xMcgIqVDJGwIc2csROqskpZHLo2UPi
         wh2uHpBXfdVD2JEvAgMNSj+kX0Fogz8NbRUJn9h+EH67dXTjzh5Q2o47YH5/Cf4P2I7K
         RciAQX7qFBHAe7z4g+ohVADhVKL8DmNdq1/BczNF3BD1JxeUmXf3/noWPEnKv2C/uzFM
         pfcXRjV6VaOMLOph7MxCad9w0nVb1nsf97D9Za/SlaCQiP+B8rgZHiSoqLS/NenQzbuD
         NxeMiy+i7x2MbCagRK9F0GMKFm8Xn/77Kk8PTRzRHmNH0W7TveVI5Fd2NLd6trvDbziP
         PqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=qS7uy17CNnacIzw8WkSi9EFZV+pz8X1w4f3ZfA/TT6o=;
        b=PghvAMrubkibIhyLS4hFoSwoF954SsYbaF7jY8R8t43DySyDD1hfQtlzdmR7HdWeyy
         8zIrpNnOp/AFOVfMAmBqs3pT0QEeN/dnGrViUgtEEfbfm13o2qsFGncV5UZMFREohJFk
         EzEh9gbcy11uQSysooBW5jlV0m/+8QhuwKIuFpYkJKyFrFNNA51T81xt9f+qaMWqEdRA
         v51+8yzSSG2qhRUarciiFaQ75Jhq37W+vPf0klZqryo4JHwCzH1aILcrBpx1MI1Zy8dx
         SU9UdcksTyaxFt9W1HsYPdAeRj9fgeUqetQ4GEUlef5qi1nvEV47hrtTkZPyU8CpKWhH
         UZJg==
X-Gm-Message-State: AOAM531cr6wNhzEXkz+jkkTkAHjF0I/hrpcH4e6K+1hxp3ataTEmYwIA
        gnDE0qMSd9brulFMcOnu+Jy3Iz7Qptc=
X-Google-Smtp-Source: ABdhPJykJGKw89HbU235hbkVvhTcSESK3DrSehx3wE8hhela9RmR0QZ7Wh2wUuFUoEbdG9gnYYq9jw==
X-Received: by 2002:aca:100e:: with SMTP id 14mr4109435oiq.22.1616094649710;
        Thu, 18 Mar 2021 12:10:49 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a6sm712888oiw.44.2021.03.18.12.10.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Mar 2021 12:10:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 18 Mar 2021 12:10:47 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jay Fang <f.fangjian@huawei.com>
Cc:     linux-hwmon@vger.kernel.org, tangzihao1@hisilicon.com,
        huangdaode@huawei.com
Subject: Re: [PATCH V2] hwmon: (ina2xx) Convert sysfs sprintf/snprintf family
 to sysfs_emit
Message-ID: <20210318191047.GA214727@roeck-us.net>
References: <1615892457-35501-1-git-send-email-f.fangjian@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615892457-35501-1-git-send-email-f.fangjian@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Mar 16, 2021 at 07:00:57PM +0800, Jay Fang wrote:
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

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/ina2xx.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index ca97f9e..8acb2db 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
> @@ -310,8 +310,7 @@ static ssize_t ina2xx_value_show(struct device *dev,
>  	if (err < 0)
>  		return err;
>  
> -	return snprintf(buf, PAGE_SIZE, "%d\n",
> -			ina2xx_get_value(data, attr->index, regval));
> +	return sysfs_emit(buf, "%d\n", ina2xx_get_value(data, attr->index, regval));
>  }
>  
>  static int ina226_reg_to_alert(struct ina2xx_data *data, u8 bit, u16 regval)
> @@ -450,7 +449,7 @@ static ssize_t ina226_alarm_show(struct device *dev,
>  
>  	alarm = (regval & BIT(attr->index)) &&
>  		(regval & INA226_ALERT_FUNCTION_FLAG);
> -	return snprintf(buf, PAGE_SIZE, "%d\n", alarm);
> +	return sysfs_emit(buf, "%d\n", alarm);
>  }
>  
>  /*
> @@ -481,7 +480,7 @@ static ssize_t ina2xx_shunt_show(struct device *dev,
>  {
>  	struct ina2xx_data *data = dev_get_drvdata(dev);
>  
> -	return snprintf(buf, PAGE_SIZE, "%li\n", data->rshunt);
> +	return sysfs_emit(buf, "%li\n", data->rshunt);
>  }
>  
>  static ssize_t ina2xx_shunt_store(struct device *dev,
> @@ -537,7 +536,7 @@ static ssize_t ina226_interval_show(struct device *dev,
>  	if (status)
>  		return status;
>  
> -	return snprintf(buf, PAGE_SIZE, "%d\n", ina226_reg_to_interval(regval));
> +	return sysfs_emit(buf, "%d\n", ina226_reg_to_interval(regval));
>  }
>  
>  /* shunt voltage */
