Return-Path: <SRS0=uXUr=SR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28406C10F12
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 21:47:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E943A218D3
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 21:47:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r6y84j5s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727301AbfDOVrX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Apr 2019 17:47:23 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40454 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727186AbfDOVrV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Apr 2019 17:47:21 -0400
Received: by mail-pg1-f195.google.com with SMTP id d31so9225693pgl.7
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Apr 2019 14:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2MplsPkUxKX7FgqDnWbqVmpC4Dhvhb5suxLXr35c7y4=;
        b=r6y84j5sjdKeh9OzNPPTClID3S1K4gQ74pNVi/fnMF/xq0FKqgQGKUwxLG0N+5UV0a
         XUbLbal1dkN9Now1rHQXVCWz0NfCOwIS3zFTbyedtKXypMsZrfabwlSnK8uRhxZF5h3D
         U/+50KlYwhN+1ZLG5E5YtDyRFRFNR84tOsifADY5+htZxsWB25ouo3K4ym6RKyS8dqV6
         xjJDkZvSaTbo3LGazWwOxDqdrIuiv6ggKT+D6qDSw5bqzSRjwNPv66qDOcM6A0QzNGv8
         st1/j/W43Zn7Q297ACX5W3tslrfIrtO+m22WAJmCfhsrgRrD4iAJVQs5b/00p0AYuArv
         Q97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2MplsPkUxKX7FgqDnWbqVmpC4Dhvhb5suxLXr35c7y4=;
        b=PQteFmSUutpFmcy0f+HaQGccfHPBX5Bkk9EuXn04isvfZaVKUuE4v/a5ZlVh0YKLpX
         3fx7hTqzoCA+yJZQY52EtFi6jItU7IhKIkqu7s/vT1LMCHVA7ZADumVeCMxhjv14AktC
         sPkhhxkmppDdkwUxyRr4p1qlJdp4ZmrOMeH2QoyXpkV8vAacu7vjObEl2jpgYHd9/nh1
         a0I2CP1iGCeEirCQFgQIYRfpdB7VaQWEQ8Sf0z/yqafB63rYhLGcaADngamC52OT0Fcb
         kXPCAIiaEodnr5CCC0QVme6u1xpZ2j1P6Mx6WfgvUV0EYLc4R8hW/WQUVHU5dCx7OM0P
         iL6Q==
X-Gm-Message-State: APjAAAVv8Z86ps/6RbjLeGrCM4Vc2aWgGGhxLzipiifsYAR7XKo6jcN3
        lUW4g/T8brEH10E416a7DYM=
X-Google-Smtp-Source: APXvYqy3FWI3VspE5hNV8LbBuWwVvC+vXDwcezluqJBHYyRfc1SQOm45EUoTAbeGqX7tRmpQfTvj9Q==
X-Received: by 2002:a63:744b:: with SMTP id e11mr71989641pgn.327.1555364841189;
        Mon, 15 Apr 2019 14:47:21 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id e4sm69381661pgd.32.2019.04.15.14.47.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Apr 2019 14:47:20 -0700 (PDT)
Date:   Mon, 15 Apr 2019 14:47:16 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>
Subject: Re: [PATCH] hwmon: Add support for samples attributes
Message-ID: <20190415214715.GA11156@Asurada-Nvidia.nvidia.com>
References: <1555360032-31159-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1555360032-31159-1-git-send-email-linux@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Thanks for adding this.

On Mon, Apr 15, 2019 at 01:27:12PM -0700, Guenter Roeck wrote:
> Add support for the new samples attributes to the hwmon core.
> 
> Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> Cc: Nicolin Chen <nicoleotsuka@gmail.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Will redo my change and test through API later.

> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/hwmon.c |  5 +++++
>  include/linux/hwmon.h | 11 +++++++++++
>  2 files changed, 16 insertions(+)

> diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
> index 7a8cc06a0d61..7b18a6150a11 100644
> --- a/include/linux/hwmon.h
> +++ b/include/linux/hwmon.h
> @@ -40,6 +40,12 @@ enum hwmon_chip_attributes {
>  	hwmon_chip_register_tz,
>  	hwmon_chip_update_interval,
>  	hwmon_chip_alarms,
> +	hwmon_chip_samples,
> +	hwmon_chip_curr_samples,
> +	hwmon_chip_in_samples,
> +	hwmon_chip_power_samples,
> +	hwmon_chip_temp_samples,
> +
>  };

Why add a blank line at the end?
