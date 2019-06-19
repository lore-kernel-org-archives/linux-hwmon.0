Return-Path: <SRS0=h1Ez=US=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22303C31E5D
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jun 2019 19:55:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EAC8F21721
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jun 2019 19:55:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4JUMQT9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfFSTzg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Jun 2019 15:55:36 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44779 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbfFSTzg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Jun 2019 15:55:36 -0400
Received: by mail-pg1-f196.google.com with SMTP id n2so225737pgp.11
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jun 2019 12:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=shZ+wz91dt8OlCFWOZ0bblzOcc48hU95JMNH9fLFYKQ=;
        b=h4JUMQT9fUeuVyO2B6CW6Ht2PoYNJJIep6ro8i/YLdzDnnx152xFnueVc3oCluLCBF
         c0i4pM/F/K3Y4/73hQYtdDNl0hxVcv/bNvQlNHLR+lL3rrmY9AmGTqAfAadqw2f6ueE+
         6Ir2aUrg5wlE5nPAVWpKYpJXMhOGtL1q+1FjpKvtcX6Qs4KEFlxSsKetkk/aivG8KZcF
         KNYe7rNCJGJGmi8PW/mbKhCi0DXpvfQ+tqTlFWbDdX0KURV4gERXZt7oAh34ljY0u4nj
         6pNxBxa/hAXNpqQVNUtZvaUAGn7RpNKD8z4aK9Rv737ZQNwdbTdSgxiao/sajfFmYgqR
         UY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=shZ+wz91dt8OlCFWOZ0bblzOcc48hU95JMNH9fLFYKQ=;
        b=feJB49UNuusw1OUyxUdChALSSPwGdZKV7b+11DYIAd1oEskp06zL6xGciz23AaOIdN
         c0HTwHNwOvQ8Ut2ClMa7D7tnnw5VMD5ECPA6vLgTtJEfQt/pddkLbnraaTrNuasNplMl
         Q0yhYDSS45j+7nnTVWEtiT/LpPubYDUcYdeo71SYmDICVdqdbCQ20db5XgqSewBasJgc
         W23O3z3Q/Kn2kXUolfR5ROGbzhdy74LfMTO/2a+HNM4496qN6myHETZXZojkK8F9tUMW
         pcYlJjtVGvV4ayHraBPsL6TICdw1BvOpbNq6QoersOYPHbdKEJ+T9GdVb5MFdAbmvEVf
         J2MA==
X-Gm-Message-State: APjAAAW4z21STBzQq+64liCaMU/xDFhOYqo14B5ri5AjIxNZSXDemT1Y
        4XFkXAxrMguAJ0cnlky6r5E=
X-Google-Smtp-Source: APXvYqyoWgB7o4glmsCvmzDPaIjvkgGgAtu2DRAhmroJwq3ALqVhDp9aRjmOHUEIc2Jm0mL218N2RQ==
X-Received: by 2002:a17:90b:d8f:: with SMTP id bg15mr9702696pjb.65.1560974134943;
        Wed, 19 Jun 2019 12:55:34 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v23sm19924546pff.185.2019.06.19.12.55.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 12:55:34 -0700 (PDT)
Date:   Wed, 19 Jun 2019 12:55:33 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christian Schneider <cschneider@radiodata.biz>
Cc:     linux-hwmon@vger.kernel.org,
        Christian Schneider <christian@ch-sc.de>
Subject: Re: [PATCH] Fix sysfs_notify and kobject_uevent in fan_alarm_notify
Message-ID: <20190619195533.GB29429@roeck-us.net>
References: <20190617093343.1366-1-cschneider@radiodata.biz>
 <20190617170422.GA13276@roeck-us.net>
 <e64607f6-d2d3-44a9-4e4b-90e5ab2d74ab@radiodata.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e64607f6-d2d3-44a9-4e4b-90e5ab2d74ab@radiodata.biz>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jun 19, 2019 at 10:47:34AM +0200, Christian Schneider wrote:
> Hi,
> unfrotunately I found a problem with my patch. It didn't appear on the
> devices, where I tested, only when distributing the patch to more devices,
> it occurs sometimes.
> 
> There is a possible race condition. In gpio_fan_probe, the IRQ handler for
> the fan alarm is registered before the hwmon_dev is initialised.
> So it is possible, that the handler executes, while fandata->hwmon_dev is
> still unitialised and the handler runs in an invalid pointer dereference.
> 
> The obvious fix, moving the
> /* Configure alarm GPIO if available. */
> if (fan_data->alarm_gpio) {
> 	err = fan_alarm_init(fan_data);
> 	if (err)
> 		return err;
> }
> block after
> 
> /* Make this driver part of hwmon class. */
> fan_data->hwmon_dev =
> 	devm_hwmon_device_register_with_groups(dev,
> 					       "gpio_fan", fan_data,
> 					       gpio_fan_groups);
> 
> doesn't work. Sysfs doesn't have a fan1_alarm attribute anymore then.
> 
> It is not yet clear to me, why creation of the attribute fails in this case.
> I need to investigate further.
> In the meanwhile, please revert my patch.
> 
> I'm sorry for the disturbance I created....
> 
No worries. Thanks for noticing and for reporting the problem. I dropped
the patch from the queue for now.

Guenter

> BR, Christian
> 
> 
> Am 17.06.2019 um 18:04 schrieb Guenter Roeck:
> >On Mon, Jun 17, 2019 at 11:33:43AM +0200, cschneider@radiodata.biz wrote:
> >>From: Christian Schneider <christian@ch-sc.de>
> >>
> >>sysfs_notify and kobject_uevent are passed the wrong kobject.
> >>that why notifications can't be received and uevents have the wrong path.
> >>this patch fixes this.
> >>
> >>Signed-off-by: Christian Schneider <cschneider@radiodata.biz>
> >
> >Applied.
> >
> >In the future, please version your patches, add a change log,
> >and reflect the subsystem and driver in the subject line.
> >
> >Thanks,
> >Guenter
> >
> >>---
> >>  drivers/hwmon/gpio-fan.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >>diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> >>index 84753680a4e8..76377791ff0e 100644
> >>--- a/drivers/hwmon/gpio-fan.c
> >>+++ b/drivers/hwmon/gpio-fan.c
> >>@@ -54,8 +54,8 @@ static void fan_alarm_notify(struct work_struct *ws)
> >>  	struct gpio_fan_data *fan_data =
> >>  		container_of(ws, struct gpio_fan_data, alarm_work);
> >>-	sysfs_notify(&fan_data->dev->kobj, NULL, "fan1_alarm");
> >>-	kobject_uevent(&fan_data->dev->kobj, KOBJ_CHANGE);
> >>+	sysfs_notify(&fan_data->hwmon_dev->kobj, NULL, "fan1_alarm");
> >>+	kobject_uevent(&fan_data->hwmon_dev->kobj, KOBJ_CHANGE);
> >>  }
> >>  static irqreturn_t fan_alarm_irq_handler(int irq, void *dev_id)
