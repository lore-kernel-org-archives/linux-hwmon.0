Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933B6C4332F
	for <linux-hwmon@archiver.kernel.org>; Thu,  2 Nov 2023 03:09:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232896AbjKBDJZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 1 Nov 2023 23:09:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232949AbjKBDJZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Nov 2023 23:09:25 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B0DB11B;
        Wed,  1 Nov 2023 20:09:22 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-586ba7cdb6bso233099eaf.2;
        Wed, 01 Nov 2023 20:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698894561; x=1699499361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cf6ShtWCGBzrM5MqeJfbPoi4JRtVO50ryFgW6KiQr44=;
        b=OKVZ9Dj2QGtgfpKn5SSSI6+bH0f0InLXxwOuNv5jugKSaErA6fh/5hjj+H8dPWWZiu
         58PpET6ydCZ19BQIy+VWJ66Nr80J6fgVYhf6aJx2514OhtQkBcYvN4XsJuNKFNak1FFD
         EDSDPB/CQhJHwK/U2SxF4BxqWHkIns4ytfxAF48abHX2yew5QztaQWG0D3LNImhFBWKG
         oiCkyTUw5Tj44P3RFzd4xya27rJCP5vIAD6LQgDG+lVkWpWutOrxvngYWP2qlOc1B7vJ
         twjl88Pjdelc/TsS2jvpMsKh1oS7lZdD7NBINTUpQz3uDTzC3PvaMnkpvA4M5sLayv0T
         H3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698894561; x=1699499361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cf6ShtWCGBzrM5MqeJfbPoi4JRtVO50ryFgW6KiQr44=;
        b=wxVgwCwDQHrAGXB7yspqveKuLTlZuPb55zWQ2qFIB0cIJ76R3wpkkxL20FpAxyN8la
         +NxNZV6VLo6xN/+MFRgREeb/4QMa7PJKhXsiMJRKhHGgaWsr2x7YsS83M+U+HtceSy9K
         UsNvir2Gpez+OofleNS9lzdVqrWbUSmMzfcyXai/Awx10xIyqfltlrLcWxOfedDORkx7
         YavEcfw2e7+piCDqSv4+k4/DD8e+TvGNjKBVU0M/3EQDtSeIhpGjuyb30f7kgPYJVGnG
         6WPTUZVi1QFxApnaHSc2BH+Zbq6R8kqrslEAVm0H8/AK2Bh7pJCVyNTzN6NlYgl4ET9l
         8niw==
X-Gm-Message-State: AOJu0YxQ5Qs6Mwno27TzCAL2b2HnoSleL60gbPcS31pROoSFhkGQbLHP
        lbMajusSXPBnr+Bc7igtHyk=
X-Google-Smtp-Source: AGHT+IH5sVClCbsTwS+LUk7ehteYhS62U8WpXdsFmyuBIMQwuyBqvqtzHvGLlxCQK4R91BuP/taHPA==
X-Received: by 2002:a4a:d48b:0:b0:57b:5a55:2bba with SMTP id o11-20020a4ad48b000000b0057b5a552bbamr16351815oos.2.1698894561556;
        Wed, 01 Nov 2023 20:09:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r22-20020a4a3716000000b0057b6d8e51ddsm851561oor.40.2023.11.01.20.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 20:09:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 1 Nov 2023 20:09:20 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc:     Daniel Matyas <daniel.matyas@analog.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: max31827: include regulator header
Message-ID: <431f80b4-7e1c-4048-a014-3ec11cfbeac9@roeck-us.net>
References: <20231031091324.23991-1-antoniu.miclaus@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031091324.23991-1-antoniu.miclaus@analog.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Oct 31, 2023 at 11:13:24AM +0200, Antoniu Miclaus wrote:
> Include `linux/regulator/consumer.h` since the driver is using
> `devm_regulator_get_enable` function.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/max31827.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/max31827.c b/drivers/hwmon/max31827.c
> index 0508b020a408..b29f25321dc4 100644
> --- a/drivers/hwmon/max31827.c
> +++ b/drivers/hwmon/max31827.c
> @@ -12,6 +12,7 @@
>  #include <linux/i2c.h>
>  #include <linux/mutex.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  
>  #define MAX31827_T_REG			0x0
>  #define MAX31827_CONFIGURATION_REG	0x2
