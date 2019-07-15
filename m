Return-Path: <SRS0=yb4f=VM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7683AC7618F
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Jul 2019 17:46:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4BFC8205C9
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Jul 2019 17:46:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="syLvrZQd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731278AbfGORq0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Jul 2019 13:46:26 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38503 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730235AbfGORq0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Jul 2019 13:46:26 -0400
Received: by mail-pf1-f194.google.com with SMTP id y15so7761908pfn.5
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Jul 2019 10:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=3vk+Dkf1vYab00uLyMsZNuLYw0h+lc/ul4CiN6xpD0Q=;
        b=syLvrZQd6g64Z6G2TtC3CY+z144oNfVu2HhLgyIiOIw7VBI79SIeTCDfkO0HiyFk8I
         IQi6sLTRvjmgO2Hx9ubnSfcs9/3q07Vuu8LNHAEEMMRWVsYkV4XLxp2H47rdkAN9j6CU
         qNfF1k8ExC8ePi5B4EZoWVMj2No1LkZCfg3ZLytzJCYlPjX9W4rI2mlZg0B4L9JpfZp1
         XOIaZAyjAfS+4IbU/uemt1HfVPNoCBrglSN22l/V8a1f6tH5+GKtCKRkZqkVfKHl2fx6
         yuaZVzCUnoC2LvXKDHalizzJw5nS1+SwB7kfGqHeQh8w+cTYYQLfjNfs6zDcckPh6gP5
         H0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=3vk+Dkf1vYab00uLyMsZNuLYw0h+lc/ul4CiN6xpD0Q=;
        b=ih3B0Gh3vdIC0z4B1DgK7dJDYAP2lSUwvf1jiMSDzYq0pNHQoLWC3VUIqXsM7V11tf
         d9RloutoID9nQ8YzwqzxIu5CbbRq66y6ri16dSTXZj11Y9BPFMdqoSLBOuKFIjjdxmoq
         0w4YASfMZfoWr4wcV7s2/bdhWM+U26R3W1VOggpJOSgoKSr+uza5d+fCYe/sJyH6+nvA
         rEelwPu3qM6rOJnWx3geCIMISEYaaDmTf2GbBFWRxdZwoW0hBKPY+IUN5zyCAo9AYQw0
         kqGTgpLuGueNB+vEdYEwPyPpxL+w9X2jAl96WjXc+JY4JF1unurRKS0KWAiNCv17xXLx
         GlQg==
X-Gm-Message-State: APjAAAWjgiXqwOrGnO+iNe+t9ZKSkDQBrdJuAqIRVW3hgklDMJdUShFo
        WLV3x/FKzA96N9rHmneDVK+0RxkY
X-Google-Smtp-Source: APXvYqyBgm+qqg7Ch+INACvctcgWy5elrGKt1tlo4Np8juQoCrLf3IVAaQQT7cBzFo2twzqAmWF5Ig==
X-Received: by 2002:a63:ee04:: with SMTP id e4mr4037999pgi.53.1563212785367;
        Mon, 15 Jul 2019 10:46:25 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v27sm21225105pgn.76.2019.07.15.10.46.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 10:46:23 -0700 (PDT)
Date:   Mon, 15 Jul 2019 10:46:22 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?Bj=F6rn?= Gerhart <gerhart@posteo.de>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (nct6775) Fix register address and added missed
 tolerance for nct6106
Message-ID: <20190715174622.GA21635@roeck-us.net>
References: <C4783F82-7655-4997-AE0E-496683FE1C8B@posteo.de>
 <872AC4B8-6930-47CF-AE4B-32F449135507@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <872AC4B8-6930-47CF-AE4B-32F449135507@posteo.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 15, 2019 at 06:33:55PM +0200, Björn Gerhart wrote:
> Hi Guenter,
> 
> the patch was created against kernel 5.1.15. Is the corresponding „baseline“ 5.1 then?
> 
The patch doesn't apply against v5.1.15 either. Do you have other
local changes to the same file in your branch ?

Thanks,
Guenter

> - Fixed address of third NCT6106_REG_WEIGHT_DUTY_STEP
> - added missed NCT6106_REG_TOLERANCE_H
> 
> Signed-off-by: Bjoern Gerhart <gerhart@posteo.de>
> —
> Index: nct6775.c
> ===================================================================
> --- nct6775.c	(revision 16326)
> +++ nct6775.c	(working copy)
> @@ -866,7 +866,7 @@
>  static const u16 NCT6106_REG_WEIGHT_TEMP_SEL[] = { 0x168, 0x178, 0x188 };
>  static const u16 NCT6106_REG_WEIGHT_TEMP_STEP[] = { 0x169, 0x179, 0x189 };
>  static const u16 NCT6106_REG_WEIGHT_TEMP_STEP_TOL[] = { 0x16a, 0x17a, 0x18a };
> -static const u16 NCT6106_REG_WEIGHT_DUTY_STEP[] = { 0x16b, 0x17b, 0x17c };
> +static const u16 NCT6106_REG_WEIGHT_DUTY_STEP[] = { 0x16b, 0x17b, 0x18b };
>  static const u16 NCT6106_REG_WEIGHT_TEMP_BASE[] = { 0x16c, 0x17c, 0x18c };
>  static const u16 NCT6106_REG_WEIGHT_DUTY_BASE[] = { 0x16d, 0x17d, 0x18d };
>  
> @@ -3778,6 +3778,7 @@
>  		data->REG_FAN_TIME[0] = NCT6106_REG_FAN_STOP_TIME;
>  		data->REG_FAN_TIME[1] = NCT6106_REG_FAN_STEP_UP_TIME;
>  		data->REG_FAN_TIME[2] = NCT6106_REG_FAN_STEP_DOWN_TIME;
> +		data->REG_TOLERANCE_H = NCT6106_REG_TOLERANCE_H;
>  		data->REG_PWM[0] = NCT6106_REG_PWM;
>  		data->REG_PWM[1] = NCT6106_REG_FAN_START_OUTPUT;
>  		data->REG_PWM[2] = NCT6106_REG_FAN_STOP_OUTPUT;
> 
> 
> 
