Return-Path: <SRS0=COWf=VV=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D83C7618B
	for <linux-hwmon@archiver.kernel.org>; Wed, 24 Jul 2019 14:07:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A4BA21BF6
	for <linux-hwmon@archiver.kernel.org>; Wed, 24 Jul 2019 14:07:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6uux8CJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbfGXOHe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 24 Jul 2019 10:07:34 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38610 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbfGXOHd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 Jul 2019 10:07:33 -0400
Received: by mail-pl1-f193.google.com with SMTP id az7so22044300plb.5
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Jul 2019 07:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CKwrtM9oRwlbPPNqEmR/KE9KU0ZwZOE6qVsWjiJcEi8=;
        b=O6uux8CJ3HXODhdYLDhI2hARyJP7l9P5GzdrmcVplVb9NQSDb+9t24okmaWJzPvxwo
         w3r4g3znZKzTia18L8CstU4oO2NKKUkuWVWjXlbHINaDvZi12I5vaRt/Vk0fXmmrRIOP
         xMDwm5yRC4aXzThiuuOYfFNKtj73cyHSApgEiq85mX3dMf8369NR6rFg2krjOocNoL8x
         b7cN7tmzieQ3wAn51gcClU4lvFyMCHuaaa6yTLmcPQK2PMwrXnsoe60nkGbvhcIks0N+
         /m9jlK3jEXMNuFiNiypqiBjW7l24kucMHBHrbWYRCsjoN7y/5kWWSusY3+O/i+L2Lsjp
         g89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=CKwrtM9oRwlbPPNqEmR/KE9KU0ZwZOE6qVsWjiJcEi8=;
        b=XtOs56lImICo4wVRqLfph2P+HSR73MEUaVFZ1bdIvRYl/pEnJM33L2ntX21I22ToWd
         59kUEVMy4+Spv0+V+JNwj0rzthbAwQ9Kg4pxEwKibgXcotQQiNyB3NC7hclHTGq0GpQ8
         MaGPLBVJiNsPsqpHSdDpAwSfeILTcqV0AnRJE2snQ/KXzTc7MaRI3cudq0QOD5j6Gquv
         XNG2S8e93tETjB5UV5FXulXcCdP5O1lvvTqJmdeNQf5bggdUKAnOKX/KG5SYzus2CnWb
         YaF3gXJusKknEq6XG5QN9C+GVo8SMCocNoZL8B1oSUqwfw/U6FIwLV4+YcxaVnyUeDQ+
         aQdg==
X-Gm-Message-State: APjAAAUMJbjLqWPCqozod+SxmmK86bn5mXEP7BoTSSYjmNS9y3w9wCW4
        jYsTCHONK1tOdSRYYmtWl5U=
X-Google-Smtp-Source: APXvYqx3hqKC8YYu0oyIwDnvOBX4bKI5TCc/8OK0WNrC7lYFDpSyip/zVGir9XVbo3wdlpf6mJ18Lw==
X-Received: by 2002:a17:902:788e:: with SMTP id q14mr86788809pll.234.1563977253230;
        Wed, 24 Jul 2019 07:07:33 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l189sm57181750pfl.7.2019.07.24.07.07.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 07:07:31 -0700 (PDT)
Date:   Wed, 24 Jul 2019 07:07:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wang Shenran <shenran268@gmail.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drivers/hwmon/acpi_power_meter.c: Change log level
Message-ID: <20190724140730.GA27362@roeck-us.net>
References: <6b6af74c-2a2b-1704-173b-bb1b466b2197@roeck-us.net>
 <20190724080110.6952-1-shenran268@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190724080110.6952-1-shenran268@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jul 24, 2019 at 11:01:10AM +0300, Wang Shenran wrote:
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

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/acpi_power_meter.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
> index 6ba1a08253f0..4cf25458f0b9 100644
> --- a/drivers/hwmon/acpi_power_meter.c
> +++ b/drivers/hwmon/acpi_power_meter.c
> @@ -681,8 +681,8 @@ static int setup_attrs(struct acpi_power_meter_resource *resource)
>  
>  	if (resource->caps.flags & POWER_METER_CAN_CAP) {
>  		if (!can_cap_in_hardware()) {
> -			dev_err(&resource->acpi_dev->dev,
> -				"Ignoring unsafe software power cap!\n");
> +			dev_warn(&resource->acpi_dev->dev,
> +				 "Ignoring unsafe software power cap!\n");
>  			goto skip_unsafe_cap;
>  		}
>  
