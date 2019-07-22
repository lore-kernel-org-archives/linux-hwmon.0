Return-Path: <SRS0=+gze=VT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042A0C76194
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 18:27:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D070C21901
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 18:27:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxLaT6aP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbfGVS1D (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Jul 2019 14:27:03 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33264 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728124AbfGVS1D (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Jul 2019 14:27:03 -0400
Received: by mail-pf1-f193.google.com with SMTP id g2so17783634pfq.0
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2019 11:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OKyrGR/48NclGphzur64O35l8RpI17zdxK4Zai8VDbc=;
        b=NxLaT6aPMGpEFwNbmHbBTD3KrYqhAu/1UYRgO+uXtkUOo8BXOXTIjzfr+Ul0Ajh/+Q
         nWGwmh/Y4fLiXW78PZBxsEdhXaINlq5YVtTjMRXcAHn4zbO0szWG5WMNxKVrppYAMuM/
         3nHt4PPQPkwupjDJrY2YknrRNMBdUu9eQ/bh/XXnJIYBlliNEcd72h/u3Qf4UHQTKnBz
         xIdLXkFbk/mFco5hdRym8lNcc6SxfGi78ZQfmGccfWVV+sK7Kjq88v4pin1eJ6BdO1Zu
         p4KiJZR7hwTo4fP7tUoMg1MNl9dfQ2t4Qqe5QgCDDZ8rDr43P2y//TBv/1EKO794b4hQ
         WlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=OKyrGR/48NclGphzur64O35l8RpI17zdxK4Zai8VDbc=;
        b=t5yrZmtHgkC3iFlGxlULHmnNl1kSO3SoACxjoRHhntQHqWcWBtOTHsRd7/esUtWcjt
         l2W1mBE5/CBCytr+uXAU4p4CgEhkHVLHyPfWSDFMx9unXVpd0PK3rHXtYvXR6cBm/nS0
         AzIs5kSaCHClB0EfKiEpbFUqlEbAKSrpotJ02isWbkED9D76qv7FPvzFdf3orH3sSZJ9
         QEfrDSuTqYcKlSS4ufHL5IFf5HYrkittIli6kUEDf+Tg396ZG4C/J19SsEqI44FRPB6E
         d31wmNXvt8Pa2zernpO/HeSWWD/xQ4PRfKYlhZglvSxHUXU3brEf47ZS/UiiQD7Y7r/f
         YJOQ==
X-Gm-Message-State: APjAAAWYkzezDvCbFlGa8nfKi5qd1S/2kwaYu5EAYa2+zAz+uMHdvM0M
        JWZVjUIyin9Py0wuUTlNVvMH8oNL
X-Google-Smtp-Source: APXvYqyX+Dlg0lzQiJqdB0RHndhyan7AluhmMrwoAB/npvi80Tfivqum/m3OPZ9rxejtC3A8/NgcjQ==
X-Received: by 2002:a62:874d:: with SMTP id i74mr1507043pfe.94.1563820022489;
        Mon, 22 Jul 2019 11:27:02 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 6sm25698198pfn.87.2019.07.22.11.27.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 11:27:01 -0700 (PDT)
Date:   Mon, 22 Jul 2019 11:27:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Shenran Wang <shenran268@gmail.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] drivers/hwmon/acpi_power_meter.c: Change log level
Message-ID: <20190722182700.GA15294@roeck-us.net>
References: <CAGfeh__oPvTo4dskOoW8kmhhgM3_vDjoP7eXdYPbmA7e==cZzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGfeh__oPvTo4dskOoW8kmhhgM3_vDjoP7eXdYPbmA7e==cZzg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 22, 2019 at 05:50:34PM +0300, Shenran Wang wrote:
> From ce991220c17873821bd1e2bd011686201b3daaff Mon Sep 17 00:00:00 2001
> From: Wang Shenran <shenran268@gmail.com>
> Date: Mon, 22 Jul 2019 14:38:10 +0300
> Subject: [PATCH] drivers/hwmon/acpi_power_meter.c: Change log level
> 
> At boot time, the acpi_power_meter driver logs the following error level
> message: "Ignoring unsafe software power cap". Having read about it from
> a few sources, it seems that the error message can be quite misleading.
> 
> While the message can imply that Linux is ignoring the fact that the
> system is operating in potentially dangerous conditions, the truth is
> the driver found an ACPI_PMC object that supports software power
> capping. The driver simply decides not to use it, perhaps because it
> doesn't support the object.
> 
> The best solution is probably changing the log level from error to warning.
> All sources I have found, regarding the error, have downplayed its
> significance. There is not much of a reason for it to be on error level,
> while causing potential confusions or misinterpretations.
> 
> Signed-off-by: Wang Shenran <shenran268@gmail.com>
> ---
>  drivers/hwmon/acpi_power_meter.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
> index 6ba1a08253f0..ee0363e5be43 100644
> --- a/drivers/hwmon/acpi_power_meter.c
> +++ b/drivers/hwmon/acpi_power_meter.c
> @@ -681,7 +681,7 @@ static int setup_attrs(struct
> acpi_power_meter_resource *resource)
> 

This patch is corrupted. Split line above, tabs replaced with spaces below.

Guenter

>         if (resource->caps.flags & POWER_METER_CAN_CAP) {
>                 if (!can_cap_in_hardware()) {
> -                       dev_err(&resource->acpi_dev->dev,
> +                       dev_warn(&resource->acpi_dev->dev,
>                                 "Ignoring unsafe software power cap!\n");
>                         goto skip_unsafe_cap;
>                 }
> -- 
> 2.20.1
