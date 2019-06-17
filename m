Return-Path: <SRS0=iUk6=UQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED82AC31E5B
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 Jun 2019 17:04:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1DE720652
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 Jun 2019 17:04:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWfxbcQK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbfFQREZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 17 Jun 2019 13:04:25 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46180 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725863AbfFQREZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Jun 2019 13:04:25 -0400
Received: by mail-pg1-f196.google.com with SMTP id v9so6135681pgr.13
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Jun 2019 10:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2/6t6RQMcfxN8ERz/VFSJQyHf7ozrJTKUk2r99LP3Zw=;
        b=IWfxbcQKNkLCWRLR9ME/qClH9GPE9mkwpO8nBlhvyE0TO0NV34QHqq4iV65ljMwu2p
         osGGfzfyb2yn/0oDKEbvMQAOAuISCBocdvugK0artZj/s7F7ptsbKbsTSWR3HCsgLkJO
         QLfv3JCBxolPgAfI8n7VfS/lHVcybDeafevUKxkJCjmUcaEeoI4U7IdAh8hPnRn4JBEB
         fqJZ/uemZOjxIGym+fLqG7gZwz9oSJC+5pYsOLjGgbz0Yyr1XY1h/cPKCiZMPIvxZyNA
         V6mZ9Wuf+qqKbRaROtiuYbdFV7IBf6W8dP/vUgs+ih6KD+94pRLnBXhowLF7Yu7GdDLK
         JgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=2/6t6RQMcfxN8ERz/VFSJQyHf7ozrJTKUk2r99LP3Zw=;
        b=Dr0eaPgYRJEcJvrCCZx/k9zLH9iH5BEITDbRs6JXEFkyL1tuT5ZjIeKgTyFdr48HrE
         KrBGKoFW+XJoTInjxQ/q+Z1Ljib2vEXdwqLToFRZQPY32mVRqFJmw4JPuqgQNZfLoX6/
         fDcT/TBWc2P7mJ58cPzCdJHXjY45Kc7fcygHP+67fGVWjlSyamLiP8Ozsju+OYfW2f11
         IaAxWjv4p5dsvf6OqoZ2w9QlMXqjnBLdeWJ+4WbmMwtxhD85TaWNkp4zgnrZ3R19jaUV
         tlC4cwQ4z91zO5QIu4sOD9sOgFK5ddNIWuy/mA3+8+95Vfc5NVl2rIogr0mmbpkFngDD
         kb6A==
X-Gm-Message-State: APjAAAVBxp++8u87ussttm9hWoyQxnYLdfLxQ1fou4qyScna2Y2nWIoG
        4somvMbXeV8HSh8cidG9Acw=
X-Google-Smtp-Source: APXvYqyXj8tBgvxxxbnAbn7LpO6ojia8QvkqGr4husZp8r8PymWZ43YPE0bgN1p0kCHxOzri2EezNQ==
X-Received: by 2002:a62:ed1a:: with SMTP id u26mr89309000pfh.229.1560791063879;
        Mon, 17 Jun 2019 10:04:23 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c26sm11650979pfr.71.2019.06.17.10.04.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 10:04:23 -0700 (PDT)
Date:   Mon, 17 Jun 2019 10:04:22 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     cschneider@radiodata.biz
Cc:     linux-hwmon@vger.kernel.org,
        Christian Schneider <christian@ch-sc.de>
Subject: Re: [PATCH] Fix sysfs_notify and kobject_uevent in fan_alarm_notify
Message-ID: <20190617170422.GA13276@roeck-us.net>
References: <20190617093343.1366-1-cschneider@radiodata.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617093343.1366-1-cschneider@radiodata.biz>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jun 17, 2019 at 11:33:43AM +0200, cschneider@radiodata.biz wrote:
> From: Christian Schneider <christian@ch-sc.de>
> 
> sysfs_notify and kobject_uevent are passed the wrong kobject.
> that why notifications can't be received and uevents have the wrong path.
> this patch fixes this.
> 
> Signed-off-by: Christian Schneider <cschneider@radiodata.biz>

Applied.

In the future, please version your patches, add a change log,
and reflect the subsystem and driver in the subject line.

Thanks,
Guenter

> ---
>  drivers/hwmon/gpio-fan.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> index 84753680a4e8..76377791ff0e 100644
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
