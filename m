Return-Path: <SRS0=etf3=UN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F8EC31E4B
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jun 2019 14:05:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C7DC920851
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jun 2019 14:05:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1sXlL2s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbfFNOFV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jun 2019 10:05:21 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42048 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728201AbfFNOFV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jun 2019 10:05:21 -0400
Received: by mail-pg1-f195.google.com with SMTP id l19so1605855pgh.9
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jun 2019 07:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zscsF84YOv3R5/qnpoNizajk2LYP57sz7a9CNPUihmM=;
        b=P1sXlL2swewJW9EeiA4UAz+89nZaU1MObEQxOwGfSioHO9eyYVbwt38XkwutoYebhw
         VVi9jkWafzxzKmZjC4kuuzXVTZxD3DffrT+JFhuFPQgy5o6vwf2Z9TFSarGll/QVAyuW
         KQ2Dul99/1imaO5clL7Mru7NypFXUAY6GC6Gvtcz0FIRoXN8Uag20ujTQQA4PaoWys2y
         2/tsKzFFYDzQ9ju+g2UbJexUjX6vgfdnNIklNuUDLbz2g8Tt+6EAcXM1DISNNYBDTRz6
         1zSEPnJBDr6ckjjNRYWt08sl4c/nBJCIJ3fbHJjbkwR8QANNEwnBeS5P+CNaEeeTAjHz
         Aopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zscsF84YOv3R5/qnpoNizajk2LYP57sz7a9CNPUihmM=;
        b=E9RW6hEhyuz3OLGzNyQmZfMi/+fTCHq1nfzROEe0ViV4o5OKqwVpaWHZiNBmJWu6T0
         wJl/XY9a5TrlY83YpdBR4Xi2U6rv506tiZYsUSrtPVS8D5GEz+LBoC1iiqpe409E47lR
         Cm9qobIf6ukGwgXLpm4s8aCL0LmyZACvu++uCnfBxBzs0I/7YvIp8o95bb+l6jrYLJnr
         l5glCumsU/0pSSBKy6Ye9rU2dhQq6U3rxXxLUCgbSC61JkJ5mOdYCA1i1hbDjPDKQgci
         tWPtRMrxi1lIT+2SEU3aDIsTqETsO+9GUhzesqfHEYpwvuHDJfjvQYqrSxK3J9fRy9j1
         jDqw==
X-Gm-Message-State: APjAAAWnJrYaV2OsKYprZVKyu7orujydW9Act1+Ek+pewoIrakC4Zk8W
        fHF3vKQ1xuVstYYbCKJuMuqRyJ9j
X-Google-Smtp-Source: APXvYqxfYvuM0C6Lj57YzB0Dl2nHpubLMNahYAyF9MO1pERLLzXGlms3j8QenK6WpTwwfyIWxTQ7eA==
X-Received: by 2002:a17:90a:372a:: with SMTP id u39mr11488678pjb.2.1560521120450;
        Fri, 14 Jun 2019 07:05:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c6sm3170765pfm.163.2019.06.14.07.05.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 07:05:19 -0700 (PDT)
Subject: Re: [PATCH] hwmon, gpio-fan: fix that sysfs_notify in void
 fan_alarm_notify is not received in userspace
To:     Christian Schneider <cschneider@radiodata.biz>,
        linux-hwmon@vger.kernel.org
References: <e9dbbefb-7714-921b-c5d1-4064d8c43f74@radiodata.biz>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <2680453b-9631-3cb9-06c4-326d63e93988@roeck-us.net>
Date:   Fri, 14 Jun 2019 07:05:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e9dbbefb-7714-921b-c5d1-4064d8c43f74@radiodata.biz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/14/19 6:52 AM, Christian Schneider wrote:
> From: Christian Schneider <cschneider@radiodata.biz>
>    To: linux-hwmon

The above should not be part of the e-mail body.

> Alarms on gpio-fan can't be received from sysfs_notify, because the wrong kobject is passed.
> This patch fixes this.

Empty line here please.

> Signed-off-by: Christian Schneider <cschneider@radiodata.biz>
> ---
> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> index 84753680a4e8..5f3a35db18a1 100644
> --- a/drivers/hwmon/gpio-fan.c
> +++ b/drivers/hwmon/gpio-fan.c
> @@ -54,7 +54,7 @@ static void fan_alarm_notify(struct work_struct *ws)
>          struct gpio_fan_data *fan_data =
>                  container_of(ws, struct gpio_fan_data, alarm_work);
> 
> -       sysfs_notify(&fan_data->dev->kobj, NULL, "fan1_alarm");
> +       sysfs_notify(&fan_data->hwmon_dev->kobj, NULL, "fan1_alarm");
>          kobject_uevent(&fan_data->dev->kobj, KOBJ_CHANGE);
>   }
> 
You'll want to make the same change for kobject_uevent().

Thanks,
Guenter
