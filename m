Return-Path: <SRS0=izHe=U7=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FAKE_REPLY_C,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C12C06510
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Jul 2019 13:39:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7228C21479
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Jul 2019 13:39:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vCqUmFwN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbfGBNjR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 2 Jul 2019 09:39:17 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34384 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbfGBNjR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Jul 2019 09:39:17 -0400
Received: by mail-pl1-f193.google.com with SMTP id i2so415773plt.1
        for <linux-hwmon@vger.kernel.org>; Tue, 02 Jul 2019 06:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=jxNpTKtSeGLY70X30CL6/LIK+4fE4t4Yq8f7ujLLocM=;
        b=vCqUmFwNDD2TeFYt6sZTs5Vv0tNb0vjJXJOlZCZwz1W8ys2Frc2Db4LfCLdDGx1O+O
         G7/V/vau1inOI86AaG5nSZ/TAn3Q7ZpGCTPLl/CT7vKhDwC4Yf3Hc9hKzC/MVcuLYO35
         icoCrULIU6kv1BPxcCZ9AZU4vBVBsFizeoOTHVDdnn8FnFB3RX1Kakx8OsiJ4jYPH0fZ
         vJycTLZs6BWR1CX10fkYyL9EYctg5wP8CTRtvR1aROx6BB8rw3OVga3dxdUJnOSz4CQS
         eAYthQL/fJZ5rw2ceEsEnOp3dVKnT/cggGvlnBZN+5prVYPuUreGNkTpSkwjWkRR0Sw+
         9eMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=jxNpTKtSeGLY70X30CL6/LIK+4fE4t4Yq8f7ujLLocM=;
        b=WvUdChAO9czDKI3cuSae3b9VsJ1iwwoyRUE5o7Mv6d6z/hwThuFO6/K/53t1QloaHl
         uIzII7OoZJsYrPgFUZ1Iy+gggPbnV8cvBYfkf95BdxTL2T9lkgF+/Fef3JTnvTS/1rZq
         aEc3NuI2XquPyKjr4mWeMWFG/JsANT8+7AiVYO9yJtDeTNCRHb+5VniepO5hR/r/uKg8
         OwfCwyoxG8H8zmAyIVhQtrYUHfQuXrpMIMRdP4vcddsuBzN4PYJnbuzUXN0CVjBUZLLV
         0qIj42A7XN5sh2sYVgt4kzBvUSn2gzXc+tVOHMt5YyB4/3TcFgRtxeL21zw23nsUCCu4
         booA==
X-Gm-Message-State: APjAAAWt1CO/PydBioWTs5vRKd0t2laSTph+3uFq3kUkimyEcE1VUQlW
        bZwtBtaBazgtaq+XU1j8IkuLnR7L
X-Google-Smtp-Source: APXvYqw8zunKCCIw/qg4pWWMskvLL6rwPv+/Wla/cpKjPquVuAyxhXRY4oSh6GG9Sv1i863vyEvezg==
X-Received: by 2002:a17:902:2a29:: with SMTP id i38mr35662439plb.46.1562074757190;
        Tue, 02 Jul 2019 06:39:17 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k6sm14298628pfi.12.2019.07.02.06.39.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 06:39:16 -0700 (PDT)
Date:   Tue, 2 Jul 2019 06:39:15 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     cschneider@radiodata.biz
Cc:     linux-hwmon@vger.kernel.org, christian@ch-sc.de
Subject: Re: [PATCH 2/2] hwmon: gpio-fan: fix sysfs notifications and udev
 events for gpio-fan alarms
Message-ID: <20190702133915.GA4079@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jul 02, 2019 at 03:23:38PM +0200, cschneider@radiodata.biz wrote:
> From: Christian Schneider <cschneider@radiodata.biz>
> 
> sysfs_notify() and kobject_uevent() are passed the wrong device.
> fan_data->hwmon_dev needs to be passed, so that sysfs notification
> goes to right place and generated uevent has the right information
> 
> Signed-off-by: Christian Schneider <cschneider@radiodata.biz>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/gpio-fan.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> index a962a9ee7225..36bca2d75e0f 100644
> --- a/drivers/hwmon/gpio-fan.c
> +++ b/drivers/hwmon/gpio-fan.c
> @@ -54,8 +54,8 @@ static void fan_alarm_notify(struct work_struct *ws)
>  	struct gpio_fan_data *fan_data =
>  		container_of(ws, struct gpio_fan_data, alarm_work);
>  
> -	sysfs_notify(&fan_data->dev->kobj, NULL, "fan1_alarm");
> -	kobject_uevent(&fan_data->dev->kobj, KOBJ_CHANGE);
> +	sysfs_notify(&fan_data->hwmon_dev->kobj, NULL, "fan1_alarm");
> +	kobject_uevent(&fan_data->hwmon_dev->kobj, KOBJ_CHANGE);
>  }
>  
>  static irqreturn_t fan_alarm_irq_handler(int irq, void *dev_id)
> -- 
> 2.22.0
> 
