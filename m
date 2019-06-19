Return-Path: <SRS0=h1Ez=US=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8790C31E5B
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jun 2019 19:53:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE02220B1F
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jun 2019 19:53:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqkU8i0b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfFSTx6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Jun 2019 15:53:58 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35788 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfFSTx6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Jun 2019 15:53:58 -0400
Received: by mail-pg1-f194.google.com with SMTP id s27so250690pgl.2
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jun 2019 12:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=N4GZys89kdRl1n+TyyAOm5fVE9kYotnMTBhXmZEfJAY=;
        b=MqkU8i0bpUWrtxtE6u08sgW0yDx0YTz05QALhLkzjCA9IFqBBNhF5J7nUg2AMNEgQX
         ZgPeUhbh9PRHFD6248hcvcFg5TzGmmqiGjJUz1Cw1WoKJiVq7KHSHSOAEfX/kziELrfM
         Hl6UyfvzhTQ7fkcT8haH9fJ0FwYGZEPupvLZCeLw7XxIqN7MenKVGoF1iNPmoawyEcSA
         BHU0nY6qIPQDS2WuWLt1h0PbfrOI8/c8USdtau6HJ4YxyC8vdUumoD9K3Q73MjhQ0uZs
         okMsrTvVumKvEoxvYsV9DAYE6K7Ycnx8sd83Fd8gg2IlB46ANfzse2LG4KuN8u9RMZeq
         OY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=N4GZys89kdRl1n+TyyAOm5fVE9kYotnMTBhXmZEfJAY=;
        b=Z37JRQdH7jEw2qRyJyWzhKqVZI3+47ztr+MsTS3bI/12DWx9Ue6KA4bF+pji5QOn9t
         D0aIX6xdO3b7vSRO4NUjCHEi+46yWbpZ88sXlP/P4PfOGHlzo7VNv/Ayjfr79Ht2hp/s
         uqJjrqY4hFLyymzVhSoPXse2Yl+emZiJlfskNun32ZpsG1ghhGejCw+9qMyD87qS8rxp
         YD0MIxH24PzmiJN+MJ95c+rH7GoxWC3yPhSgKhfWLWl24vc9TckUQvc3B8ObmBa10vUR
         Fx6WZzgWpVNLSg4lggRaNHDW+tZaDcovybDtaE31fXUpWG4+hFIkodQR8yBNz8EgUhhK
         GDmQ==
X-Gm-Message-State: APjAAAVTbMqqk+PbDnYfftP/MmUhGg6a6IQj/Ggs4r9RSRqpE8NPHWO9
        ZBUNj5eB/sXtmfvSa4YBsU2euW0f
X-Google-Smtp-Source: APXvYqxMM9e+TgRqoiogOMaudfQJ5V6LS+0626Go/ou/uEpQFEUcI/sJgtlAAgrzZWGt+2vLoLZduA==
X-Received: by 2002:a63:1d4b:: with SMTP id d11mr9391312pgm.348.1560974037194;
        Wed, 19 Jun 2019 12:53:57 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m13sm17296443pgv.89.2019.06.19.12.53.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 12:53:55 -0700 (PDT)
Date:   Wed, 19 Jun 2019 12:53:54 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christian Schneider <cschneider@radiodata.biz>
Cc:     linux-hwmon@vger.kernel.org,
        Christian Schneider <christian@ch-sc.de>
Subject: Re: [PATCH] Fix sysfs_notify and kobject_uevent in fan_alarm_notify
Message-ID: <20190619195354.GA29429@roeck-us.net>
References: <20190617093343.1366-1-cschneider@radiodata.biz>
 <20190617170422.GA13276@roeck-us.net>
 <e64607f6-d2d3-44a9-4e4b-90e5ab2d74ab@radiodata.biz>
 <dfa89854-8784-6d7a-9abe-06914791de32@radiodata.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dfa89854-8784-6d7a-9abe-06914791de32@radiodata.biz>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jun 19, 2019 at 12:00:37PM +0200, Christian Schneider wrote:
> Ok, seems that moving that block, where fan_alarm_init is called down, isn't
> a problem on master.
> I need to use 4.9, cause we have an embedded device that needs patches, and
> they are only available for older kernels.
> 
> In 4.9, fan_alarm_init() does fan_data->alarm = alarm;
> When fan_alarm_init() is called after
> devm_hwmon_device_register_with_groups(), then fan_data->alarm is not yet
> set, so the sysfs attribute is not created.
> 
> when I move the fan_data->alarm = alarm; out of fan_alarm_init() before
> devm_hwmon_device_register_with_groups() and the fan_alarm_init() after,
> then it works, and doesn't have a race condition.
> 
> On master, populating fan_data->alarm_gpio is done in
> gpio_fan_get_of_data(fan_data); as far as I understand, so moving the
> fan_alarm_init() block further down shouldn't be a problem.
> 
> I don't know, how I can test this with master kernel. Unfortunately, the
> device, I'm using doesn't have a recent kernel. And on my normal (desktop)
> pc, I don't have a gpio fan.
> How should I proceed now?
> 

Essentially, we'll need two patches: One to move fan_alarm_init() after
devm_hwmon_device_register_with_groups(), and then the notification patch.
For the backport to v4.9, the first patch will have to be slightly modified:
The first part will a simple
	fan_data->alarm = pdata->alarm;
at the location where fan_alarm_init() is called now, the second part is to move
the call to fan_alarm_init() after devm_hwmon_device_register_with_groups().

It is ok to test the result with your 4.9 based kernel; we'll just have to be
careful when reviewing the mainline patch.

Thanks,
Guenter

> 
> BR, Christian
> 
> Am 19.06.2019 um 09:47 schrieb Christian Schneider:
> >Hi,
> >unfrotunately I found a problem with my patch. It didn't appear on the
> >devices, where I tested, only when distributing the patch to more devices,
> >it occurs sometimes.
> >
> >There is a possible race condition. In gpio_fan_probe, the IRQ handler for
> >the fan alarm is registered before the hwmon_dev is initialised.
> >So it is possible, that the handler executes, while fandata->hwmon_dev is
> >still unitialised and the handler runs in an invalid pointer dereference.
> >
> >The obvious fix, moving the
> >/* Configure alarm GPIO if available. */
> >if (fan_data->alarm_gpio) {
> >     err = fan_alarm_init(fan_data);
> >     if (err)
> >         return err;
> >}
> >block after
> >
> >/* Make this driver part of hwmon class. */
> >fan_data->hwmon_dev =
> >     devm_hwmon_device_register_with_groups(dev,
> >                            "gpio_fan", fan_data,
> >                            gpio_fan_groups);
> >
> >doesn't work. Sysfs doesn't have a fan1_alarm attribute anymore then.
> >
> >It is not yet clear to me, why creation of the attribute fails in this
> >case. I need to investigate further.
> >In the meanwhile, please revert my patch.
> >
> >I'm sorry for the disturbance I created....
> >
> >BR, Christian
> >
> >
> >Am 17.06.2019 um 18:04 schrieb Guenter Roeck:
> >>On Mon, Jun 17, 2019 at 11:33:43AM +0200, cschneider@radiodata.biz wrote:
> >>>From: Christian Schneider <christian@ch-sc.de>
> >>>
> >>>sysfs_notify and kobject_uevent are passed the wrong kobject.
> >>>that why notifications can't be received and uevents have the wrong
> >>>path.
> >>>this patch fixes this.
> >>>
> >>>Signed-off-by: Christian Schneider <cschneider@radiodata.biz>
> >>
> >>Applied.
> >>
> >>In the future, please version your patches, add a change log,
> >>and reflect the subsystem and driver in the subject line.
> >>
> >>Thanks,
> >>Guenter
> >>
> >>>---
> >>>  drivers/hwmon/gpio-fan.c | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>>diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> >>>index 84753680a4e8..76377791ff0e 100644
> >>>--- a/drivers/hwmon/gpio-fan.c
> >>>+++ b/drivers/hwmon/gpio-fan.c
> >>>@@ -54,8 +54,8 @@ static void fan_alarm_notify(struct work_struct *ws)
> >>>      struct gpio_fan_data *fan_data =
> >>>          container_of(ws, struct gpio_fan_data, alarm_work);
> >>>-    sysfs_notify(&fan_data->dev->kobj, NULL, "fan1_alarm");
> >>>-    kobject_uevent(&fan_data->dev->kobj, KOBJ_CHANGE);
> >>>+    sysfs_notify(&fan_data->hwmon_dev->kobj, NULL, "fan1_alarm");
> >>>+    kobject_uevent(&fan_data->hwmon_dev->kobj, KOBJ_CHANGE);
> >>>  }
> >>>  static irqreturn_t fan_alarm_irq_handler(int irq, void *dev_id)
