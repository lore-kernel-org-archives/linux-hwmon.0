Return-Path: <SRS0=9YG5=RX=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006ADC43381
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Mar 2019 17:38:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CBE6421841
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Mar 2019 17:38:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eib3ojI0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbfCTRiv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 20 Mar 2019 13:38:51 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42198 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfCTRiv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 Mar 2019 13:38:51 -0400
Received: by mail-pg1-f196.google.com with SMTP id p6so2298712pgh.9;
        Wed, 20 Mar 2019 10:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=blENCy9mwBLG2tN6eZU3rlZFUxlP1+egMgxoK6PQLzY=;
        b=eib3ojI0VnX4UoIvDEE4+bXnjURv+KKgwk63JSIzj//Kf4MtfqA5QZVQHcxQXtNFsQ
         FC6JiZ0r6CuVNv9sVkVh9XGvDnsMqUSU2KokWaQ3KCbXgja2+T6vFemuvWEBXRu8bni7
         ChaTUInw6XCoroH9fBtL9ZpAb9m7XUSHPf8yjEioXGt3/IVy+IoPTOO7qQBnv9NsQ1Ny
         x2qobcnoiAgKKf14nCZOgh1NqRtF+m/gjx57Wmn5Z0mlB5LmBJMrlo6ndrnZICjcl9A9
         8XdekEgsvgHwSLsrTpMPIXNoe1MPCQSgzbDcxQ+AEZcQejMdmDjAAsE3enhc0HOzf/Ni
         034w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=blENCy9mwBLG2tN6eZU3rlZFUxlP1+egMgxoK6PQLzY=;
        b=CiCG3v0hws6n3K/XSN2tTf/RvpJ8l6GSOOtzLv8W3iYmDNLImA4uRENh4Fjg96TPu7
         WjOQV8nUua3+onZxLnZWhHZdrEiKaMK6ybCR1mV3PpDwxUXk9ADMxJYgZsi5VzMiBV1S
         2RbjFkYQF4mMhdtBwJBHTjYoGFhgDDM41aeBemCWfl9e4kYm/tlDdEbFoZRBJNDPKW9p
         qT8IsnPfRKhf6Cj9zCXZBMZ3kXamjmqT93IHoUdXtHu5QGkqVXpt9B0KHhjK6J3aZJFs
         Tpry4CsoSweJvyDIXAZHu2nvwP2s/UkB9t4LAjVXEJxdbLJkp+6JnrVukMKhrh1AC4KY
         31Pg==
X-Gm-Message-State: APjAAAWh6Hui6YZJV4DfVfnjWxR+U/xFGOGOEfJM75XLWn6AJrfsAQC3
        3BE7g/BtZwEbF7vzBVMvacXCeM4n
X-Google-Smtp-Source: APXvYqx4ZqP26KWHH7SxSVKwJqcmcX9JPCTI/wHhozTIhIZAYzAnkfnTeT6i3CluZXmw4M/bIACHUQ==
X-Received: by 2002:a63:ef57:: with SMTP id c23mr8586725pgk.176.1553103530554;
        Wed, 20 Mar 2019 10:38:50 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l4sm3579301pff.30.2019.03.20.10.38.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Mar 2019 10:38:49 -0700 (PDT)
Date:   Wed, 20 Mar 2019 10:38:49 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-hwmon@vger.kernel.org, corbet@lwn.net,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 2/3] hwmon: Add convience macro to define simple static
 sensors
Message-ID: <20190320173849.GA17363@roeck-us.net>
References: <20190320145818.30644-1-ckeepax@opensource.cirrus.com>
 <20190320145818.30644-2-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190320145818.30644-2-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Mar 20, 2019 at 02:58:17PM +0000, Charles Keepax wrote:
> It takes a fair amount of boiler plate code to add new sensors, add a
> macro that can be used to specify simple static sensors.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Great idea!

Applied to hwmon-next; no need to resend.

Thanks,
Guenter

> ---
>  include/linux/hwmon.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
> index 99e0c1b0b5fb3..7a8cc06a0d61d 100644
> --- a/include/linux/hwmon.h
> +++ b/include/linux/hwmon.h
> @@ -365,6 +365,14 @@ struct hwmon_channel_info {
>  	const u32 *config;
>  };
>  
> +#define HWMON_CHANNEL_INFO(stype, ...)	\
> +	(&(struct hwmon_channel_info) {	\
> +		.type = hwmon_##stype,	\
> +		.config = (u32 []) {	\
> +			__VA_ARGS__, 0	\
> +		}			\
> +	})
> +
>  /**
>   * Chip configuration
>   * @ops:	Pointer to hwmon operations.
> -- 
> 2.11.0
> 
