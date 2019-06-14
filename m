Return-Path: <SRS0=etf3=UN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55591C31E4B
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jun 2019 14:52:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A4EC21537
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jun 2019 14:52:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWvzyoOc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728447AbfFNOw7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jun 2019 10:52:59 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39003 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728272AbfFNOw6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jun 2019 10:52:58 -0400
Received: by mail-pf1-f193.google.com with SMTP id j2so1613974pfe.6
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jun 2019 07:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=5O8fURCiQJ9LbO+nnO3c4++q9fBip1IKyCr/tZrXhuM=;
        b=nWvzyoOcCGe/uEl12b3Trpybv5Qxh5BBg4vc0jr+fscjsoA64ia4gtVVhdKnG+Zi/E
         yqgf0jk1sd5b2A5j5LKo1r7ZDrxwh8xbx8Hauok0b9IHR0lQMMH1OS6QSekqyvGRFLUr
         ahL05VAMr0D5ydPwKqoYWZm8q9HUmKOl2oa0A35WsS3pxplBoAD2JZ9KSwppFDMFmbO3
         kt2lszg7xQX3pXAFG4v0HhgxwVU3w5YFeX184k7D1KpX5ekJZWgG1+MSdjuwz9NtqAgE
         gra2q076XeAFotksy1LI+NZrVwk6YbRS1dW7OkCZlHeuNPeSuA3ToX0EYgihSNBd0uEw
         WCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=5O8fURCiQJ9LbO+nnO3c4++q9fBip1IKyCr/tZrXhuM=;
        b=aZJ5PSwDSOnf4FgK1ry4HwOX4GvPJYRu1BoL66vLTjZl/tScEYKzoOpc2vRgo0ATCt
         lFiKnozYq2k8Ml+JDikK8ZUX025gPzsQQtYZmOLqUEnb4pRtfKYILVVdRuRem+JZLcwy
         eHSsFDQvEZzURZzEe0OYehGpfwWI+Ddlb+ZkNi/d+IOLalQKhJldRfqyrTc6FatqxXpR
         LFbRA9QHcYh4O7FzwjdmDKkUIU2A4MNzaH/onF3ejg9j/pRAo7Jj9ujzFG1p4clwZ1Da
         TTP51KukkGNWeWJuQ8vKlOAc9dcZiOqt88pns7AoHQTxZb5JscdTmJNnbX/m57NoiQUJ
         REdA==
X-Gm-Message-State: APjAAAUPsb4BzpK5uVt3OeNr8n4YbKRabNPKvEhCB/DrJ8hV7ZHl0vtU
        YZMMVVGt7G6nauw9XDo3buIBfBn1
X-Google-Smtp-Source: APXvYqwbD/WxLQC/mD9xI7tYH1MYiWofU8OIqThrHTXhcVZTan27lWYA9goLJ/KfscuDzChnI9HyYA==
X-Received: by 2002:a63:5d45:: with SMTP id o5mr36689457pgm.40.1560523978121;
        Fri, 14 Jun 2019 07:52:58 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v23sm11242114pju.3.2019.06.14.07.52.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 07:52:57 -0700 (PDT)
Date:   Fri, 14 Jun 2019 07:52:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christian Schneider <cschneider@radiodata.biz>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon, gpio-fan: fix that sysfs_notify in void
 fan_alarm_notify is not received in userspace
Message-ID: <20190614145256.GA464@roeck-us.net>
References: <e9dbbefb-7714-921b-c5d1-4064d8c43f74@radiodata.biz>
 <2680453b-9631-3cb9-06c4-326d63e93988@roeck-us.net>
 <178c4302-3333-b60f-afbd-ff73fbe943ca@radiodata.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178c4302-3333-b60f-afbd-ff73fbe943ca@radiodata.biz>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jun 14, 2019 at 04:16:55PM +0200, Christian Schneider wrote:
> Am 14.06.2019 um 15:05 schrieb Guenter Roeck:
> >On 6/14/19 6:52 AM, Christian Schneider wrote:
> >>From: Christian Schneider <cschneider@radiodata.biz>
> >>   To: linux-hwmon
> >
> >The above should not be part of the e-mail body.
> >
> >>Alarms on gpio-fan can't be received from sysfs_notify, because the
> >>wrong kobject is passed.
> >>This patch fixes this.
> >
> >Empty line here please.
> >
> >>Signed-off-by: Christian Schneider <cschneider@radiodata.biz>
> >>---
> >>diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> >>index 84753680a4e8..5f3a35db18a1 100644
> >>--- a/drivers/hwmon/gpio-fan.c
> >>+++ b/drivers/hwmon/gpio-fan.c
> >>@@ -54,7 +54,7 @@ static void fan_alarm_notify(struct work_struct *ws)
> >>         struct gpio_fan_data *fan_data =
> >>                 container_of(ws, struct gpio_fan_data, alarm_work);
> >>
> >>-       sysfs_notify(&fan_data->dev->kobj, NULL, "fan1_alarm");
> >>+       sysfs_notify(&fan_data->hwmon_dev->kobj, NULL, "fan1_alarm");
> >>         kobject_uevent(&fan_data->dev->kobj, KOBJ_CHANGE);
> >>  }
> >>
> >You'll want to make the same change for kobject_uevent().
> 
> Actually, uevents are send and can be received as is. I have tried changing
> the kobject for kobject_uevent(), too, and only the content of the uevent
> changes.
> Since I don't know what would be the "right" one, I left it as is.
> If you say, that it would be correct with the hwmon_dev kobject, I'll add
> this to the patch.

The point of uevent notifications is to tell userspace that something changed
in the provided directory. It doesn't help if the uevent does not point there.

Guenter
