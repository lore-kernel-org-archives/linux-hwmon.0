Return-Path: <SRS0=UELc=WC=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232BCC31E40
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Aug 2019 22:29:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF63D2086D
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Aug 2019 22:29:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDSnewjn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbfHFW3a (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Aug 2019 18:29:30 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34869 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbfHFW3a (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Aug 2019 18:29:30 -0400
Received: by mail-pg1-f195.google.com with SMTP id n4so603308pgv.2
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Aug 2019 15:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=20oSuUC47zp/jjr6wt/D4r8QA0radaQPRn+eg2vNbNc=;
        b=LDSnewjnFPd0Ya86onOVUMSXbtX4hgCPnbmd33vlP92X91prXB43pqHKKLny/AvLF2
         c8Vl4g4eGUQfPcT6nIDBpRhxBK/v9hfMVeMCvFTH6Ft0OaXaaclnPzTLVpxfiG86MR3d
         gE/WNd9ct7gVeHSNWfUPsHVb3qB3+fHXeCAAHipP+hxxj8XVwX541QYO432gywfR53BW
         g813Z68ZOzKcnsFU/RD532SIp8taTx7pRU+qJyUK6qSk7VNFcrkJuPRchP7ObIok/YxB
         gFnqfoSKS2AWOsU5duew89GUDaVS2XysATs+2qqStdWjbry8O3UGoz5+9bLHtGs7FjsK
         rwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=20oSuUC47zp/jjr6wt/D4r8QA0radaQPRn+eg2vNbNc=;
        b=iJTxx9GlIxlH3zLJJZE+efxGD2sx2XDrSgeJXpUuYxq5L01nrxIPBezSdu5aCVe8YU
         QUSO/G8PwZ069eFYDeTRpsI0g1XiKdYywwhzuhT9tV22MrmRw+7xHRfs0MH2bzD7z6d9
         AeZoBMOd3vEGy6y576z22m63SA5p61/w+hOhPypN6XTgP9P5uR3E9P83qb1ZChCn80y8
         eI9qekQsu8dARgoTIsbcE2VrcTdT5fOqC/zDceZv/KmEFTKNHEqhCLsUOqbT+WoAhzwa
         wm+O5inLGmt1Vg8PSivT8C/qjN6opVFmFRtpiZ9GX+DZh4f5rumkqHuelLXQyNDYjhhU
         qKiQ==
X-Gm-Message-State: APjAAAUrEL5QhFhOvb/G1mszK3VlrYX7Cs/+4y2kowbAgqSYr4FF2xaq
        tq0T4qUF99+MYzEpTkCse8M=
X-Google-Smtp-Source: APXvYqxuZM4ETfEUAWvLSi8QKGhMwKom4xdWd4oQbV47QIJ1KTosgicdLIss6vme5b3c+BfdFtxYvw==
X-Received: by 2002:a63:c50f:: with SMTP id f15mr4976040pgd.372.1565130569572;
        Tue, 06 Aug 2019 15:29:29 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u6sm20638189pjx.23.2019.08.06.15.29.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 15:29:28 -0700 (PDT)
Date:   Tue, 6 Aug 2019 15:29:27 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: w83795: Fan control option isn't that dangerous
Message-ID: <20190806222927.GA16956@roeck-us.net>
References: <20190806102123.3118bcc5@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190806102123.3118bcc5@endymion>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Aug 06, 2019 at 10:21:23AM +0200, Jean Delvare wrote:
> I have been using SENSORS_W83795_FANCTRL for several years and never
> had any problem. When the driver was added, I had not tested that
> part of the driver yet so I wanted to be super cautious, but time has
> shown that it works just fine.
> 
> In the long run I even believe that we should drop the option and
> enable the feature unconditionally. It doesn't do anything until the
> user explicitly starts twiddling with sysfs attributes anyway.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

Applied to hwmon-next. And, yes, dropping the option is fine with me.

Thanks,
Guenter

> ---
>  drivers/hwmon/Kconfig |    7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> --- linux-5.2.orig/drivers/hwmon/Kconfig	2019-07-08 00:41:56.000000000 +0200
> +++ linux-5.2/drivers/hwmon/Kconfig	2019-08-06 09:55:16.344547556 +0200
> @@ -1834,17 +1834,12 @@ config SENSORS_W83795
>  	  will be called w83795.
>  
>  config SENSORS_W83795_FANCTRL
> -	bool "Include automatic fan control support (DANGEROUS)"
> +	bool "Include automatic fan control support"
>  	depends on SENSORS_W83795
>  	help
>  	  If you say yes here, support for automatic fan speed control
>  	  will be included in the driver.
>  
> -	  This part of the code wasn't carefully reviewed and tested yet,
> -	  so enabling this option is strongly discouraged on production
> -	  servers. Only developers and testers should enable it for the
> -	  time being.
> -
>  	  Please also note that this option will create sysfs attribute
>  	  files which may change in the future, so you shouldn't rely
>  	  on them being stable.
