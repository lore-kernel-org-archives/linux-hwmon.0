Return-Path: <SRS0=DGF3=UO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30710C31E50
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jun 2019 13:18:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DFBE421473
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jun 2019 13:18:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXWcqFOR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbfFONSA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Jun 2019 09:18:00 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35195 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbfFONSA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jun 2019 09:18:00 -0400
Received: by mail-pf1-f195.google.com with SMTP id d126so3078417pfd.2
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jun 2019 06:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XxqhUqaHvmNW7rnB19iGYyhw83q51jU0oVxVoIgOpeA=;
        b=GXWcqFORQzZndsVMVJOrObk2WdJ+2C3PxDnHGXviOyKOr3EXcXk2AQh5+epLX7shsL
         nRNCL1lcMcX/k4k67u+XiW0NJdEgRkJ+3qbiZIL6ePomjk2Wru9guJxYQiTN1EdHwUTz
         2sk1tGhme5+jAjP9qC2rMgu49Hbyt9GpPJdpWcc4gs7V2/reUSo22I4W0kCZbdXXJfXO
         6W8+A6J1GQJZ+4FGNqYv/MgZWxGg5pL8t5kADvGeXH5H3bIh+HwOZ4zWhGXTYwZ0fDC0
         Zih10gWSHSh7wm1gkPja0hMdiJqKyLDHKk7y4OaeoYYpTyK597BuOOcvbQSiKJycHUH8
         Qqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XxqhUqaHvmNW7rnB19iGYyhw83q51jU0oVxVoIgOpeA=;
        b=WScaAj2pTWwOp14R/yZQugeYM7gaunTd7UUn4oiDsjAXjTMtepSJW397WtOab0G/1P
         jh8GdZ2RoClevQHRB0p6lqqiY5JUi/jO7OMeZTfpPLb25FasL8wCZwnrTdPLldcCGolw
         Nr5gHTzyIFcZ0zarjhgTxZmU8U/KJ4f7f8PhBsx4q8g4tE4aeZniBnSryVWj+21AfPi1
         iZzcS9gsy1ULDrJbqNOxoQzr/HjQwgM7Dm7aAB5LETBx0RV0mkgyg/l6UWZhr1Uo3a97
         qKPXRfJkhEqLQxDadI9wZUzZrp1OqWmdp4+Fvaqlk79W6govTd0R9WuK8rVzjw4Tin+4
         cVGQ==
X-Gm-Message-State: APjAAAUjG7BEbJYi57ANsoFUFTK+4L5USA00N2Ch43CW0TMv7kLVhCVI
        1hY+vZMAvfKtCe/WRPBjWVdhrZ5c
X-Google-Smtp-Source: APXvYqzkQMNKaVnFSull6aytxRw9reSh+SHbho+FfAyrdw33NGob35lbnzahpoWBnE2vIxcTM6r4vg==
X-Received: by 2002:a17:90a:8c18:: with SMTP id a24mr15830412pjo.111.1560604678848;
        Sat, 15 Jun 2019 06:17:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d132sm7037421pfd.61.2019.06.15.06.17.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Jun 2019 06:17:57 -0700 (PDT)
Subject: Re: [PATCHv2] hwmon, gpio-fan: fix that sysfs_notify in void
 fan_alarm_notify is not received in userspace
To:     Christian Schneider <cschneider@radiodata.biz>
Cc:     linux-hwmon@vger.kernel.org
References: <e9dbbefb-7714-921b-c5d1-4064d8c43f74@radiodata.biz>
 <2680453b-9631-3cb9-06c4-326d63e93988@roeck-us.net>
 <178c4302-3333-b60f-afbd-ff73fbe943ca@radiodata.biz>
 <20190614145256.GA464@roeck-us.net>
 <e5390907-9112-4aca-e2e8-acf4097bf941@radiodata.biz>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <aedff3d4-1cb7-0228-121e-9e49341f19ea@roeck-us.net>
Date:   Sat, 15 Jun 2019 06:17:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e5390907-9112-4aca-e2e8-acf4097bf941@radiodata.biz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/14/19 8:35 AM, Christian Schneider wrote:
> Alarms on gpio-fan can't be received from sysfs_notify, because the wrong kobject is passed.
> This patch fixes this.
> 
> Signed-off-by: Christian Schneider <cschneider@radiodata.biz>
> ---
> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> index 84753680a4e8..76377791ff0e 100644
> --- a/drivers/hwmon/gpio-fan.c
> +++ b/drivers/hwmon/gpio-fan.c
> @@ -54,8 +54,8 @@ static void fan_alarm_notify(struct work_struct *ws)
>          struct gpio_fan_data *fan_data =
>                  container_of(ws, struct gpio_fan_data, alarm_work);
> 
> -       sysfs_notify(&fan_data->dev->kobj, NULL, "fan1_alarm");
> -       kobject_uevent(&fan_data->dev->kobj, KOBJ_CHANGE);
> +       sysfs_notify(&fan_data->hwmon_dev->kobj, NULL, "fan1_alarm");
> +       kobject_uevent(&fan_data->hwmon_dev->kobj, KOBJ_CHANGE);
>   }
> 
>   static irqreturn_t fan_alarm_irq_handler(int irq, void *dev_id)
> 
The patch is whitespace damaged (cut-and-paste, maybe ?) and does not apply.
Can you send it with git send-email, possibly ?

Thanks,
Guenter
