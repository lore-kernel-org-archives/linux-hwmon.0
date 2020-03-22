Return-Path: <SRS0=Jxdb=5H=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1199C1975A
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 Mar 2020 20:55:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 82D032072E
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 Mar 2020 20:55:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6HpCV1p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgCVUzG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 22 Mar 2020 16:55:06 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38434 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgCVUzF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 22 Mar 2020 16:55:05 -0400
Received: by mail-pg1-f195.google.com with SMTP id x7so6088892pgh.5
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2020 13:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MHXk1eX8EUuQhD/AsqQngNndxpwhqb3mbPlRdVlNnMU=;
        b=h6HpCV1pNjOsPNLlAd4H7wyostecQJBfqfEiJ/qULI+PHnyYR/Cs8MxPtDOqmk/oOw
         hVouTHAl2Ekh4bEfPRU+qa20scjuFjBwjCrbgQGMDh27Gb70HXtavr/63167/wbKkb//
         3PRS+cIzQWJPUR1YFxC8lWyoNA9E2TULAuc0BbeVLsPL/hFHP2jIDZy+859Ya/gO+mIJ
         hUms8BNQaueEmzJDuHp6nvzlTN/noDo4q1vJTd6iFT3Jpfepr3xSk5uabJ81ZPePc1dB
         hLHPWZvBW1CSTFwEf+xgAZuDTMR8YMfm70b2INK8OulspkINxNiAUk2iGHmM36xm+JK0
         Jfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=MHXk1eX8EUuQhD/AsqQngNndxpwhqb3mbPlRdVlNnMU=;
        b=l3TmxN8kgt8LRSKciAhcgFOi7bSdOC06rRkhF6DUoy5ckyQqcgv6ch4qNNvmSJypks
         OBjPlg/megkMfjqkblmgcErqEZHHeTnTJkgTNmrZcC5BBbuPXcttn+AiNgevurN4wHhx
         kY5Dhk986i1j8lp7L0eg+pyYZZClcu3XWFTe36nm3iwYxgQ1j2NNQkZTcSJ0LNCPWyuS
         nB4MctFJfeUQdcnFikpkbdP4hgpoY4icN2hG87qEa2Af4s9p0GeT9RD3rHlc2bwC9gJ8
         pXalI1ksC6rzWVnXN+EAUHGckwvGeC6eoJkex/we1dg9u5sYUtAb5eSR/VWc5sNNePkt
         FBWg==
X-Gm-Message-State: ANhLgQ2pSpVgMKUs8m/P7yXCIoIeoi+1RC7sWs01tFgwH7rRGyrkXq0B
        HIQgD6SahR0WU+B2lRyUFFo=
X-Google-Smtp-Source: ADFU+vvoqt5btrEFfFcGt+3x9aVyMQQDvq6RBz2m+o4rTvTmbSVN3QEoYxFCKIsieYXZd1910UNk0g==
X-Received: by 2002:a65:6447:: with SMTP id s7mr19191494pgv.163.1584910504689;
        Sun, 22 Mar 2020 13:55:04 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y22sm11402474pfr.68.2020.03.22.13.55.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Mar 2020 13:55:03 -0700 (PDT)
Date:   Sun, 22 Mar 2020 13:55:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mike Pagano <mpagano@gentoo.org>
Cc:     linux-hwmon@vger.kernel.org, etremblay@distech-controls.com
Subject: Re: [PATCH 1/1] hwmon: (tmp513) Fix build issue by selecting
 CONFIG_REGMAP and CONFIG_REGMAP_I2C
Message-ID: <20200322205502.GA5744@roeck-us.net>
References: <3553433.LZWGnKmheA@crazyhorse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3553433.LZWGnKmheA@crazyhorse>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Mar 21, 2020 at 07:47:26PM -0400, Mike Pagano wrote:
> This driver requires REGMAP and REGMAP_I2C to build.  Select both by default
> in Kconfig. Reported at gentoo bugzilla: https://bugs.gentoo.org/710790
> 
> Reported-by: Phil Stracchino <phils@caerllewys.net>
> Signed-off-by: Mike Pagano <mpagano@gentoo.org>
> ---
>  drivers/hwmon/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 47ac20aee06f..6edf8522447d 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1769,6 +1769,8 @@ config SENSORS_TMP421
>  config SENSORS_TMP513
>      tristate "Texas Instruments TMP513 and compatibles"
>      depends on I2C
> +    select REGMAP
> +    select REGMAP_I2C

REGMAP is auto-selected by REGMAP_I2C, and can not be (de-)selected on its
own. Selecting both is never necessary.

Guenter

>      help
>        If you say yes here you get support for Texas Instruments TMP512,
>        and TMP513 temperature and power supply sensor chips.
