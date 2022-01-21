Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E25C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Jan 2022 14:06:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350871AbiAUOGD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Jan 2022 09:06:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348573AbiAUOGC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Jan 2022 09:06:02 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F655C061574;
        Fri, 21 Jan 2022 06:06:02 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id w188so13569198oiw.13;
        Fri, 21 Jan 2022 06:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ib6uWpFzOIJS5K3QRgxaJf0K1cZH9571u93z71YZSO4=;
        b=Nzx15lz6LfiKl+jbHrjr7Odqpv8lX5XRt/2Ds/94/jpf+CLTRzIt2/WFJy+pWcEHPw
         XWcS4elk+UYrvU57UY+MOgSkSPf2WKWo3GJ3RQ+pK4smgTwSluNSvLrlM4vytQ9/P7Tr
         vNa5ToV77RVD3/o/+gnFf879j7jgq8Eu06aTKD8kPMNFjB44u3EnfHCBezdlKbIoyyzp
         Hbe2AZe+YaDAfLQp1D0S0JhdAEs8919m4uZX6vXgPKgct1SSieqp2gRnkUXU1jX2q9k0
         pLdSOVd7Tk4ytvClnS3P6siP83EYgzzWkdDZKWiM0QCFdpM2auDU5a7XAsdj+bpM2Mij
         edzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=ib6uWpFzOIJS5K3QRgxaJf0K1cZH9571u93z71YZSO4=;
        b=GWM1mr7h7D82KxKZD0vO1WYXXbauHoAUz/HytqBirNDHf2aEpdYqp1vz0oBpQrOiAZ
         kZws69ItWx8c7h2vlvKxv/FFXeX3Xwvs5vtssAc3Jq9dVnphEdmaohjs5mPAy5EFgMN4
         dHd/OBpkMLBdDjTy3x1GqO45ILe2ZXzyGXJYp9j+SJWVrEGqwqEryimE6PVfGtGJH5s6
         h21g3Jb3U+gJJU5DnByZsMCOBWasjqjq9/uKP0v63kgyG4Sp5fWDaaOZCJkl+jrnIzNH
         ciMEEfv8o3lZId91EqcTvYCXSOubppg/mhVK3a8k4143LdVkmt3q6YVZo5Ap/pzhiR0l
         5b5g==
X-Gm-Message-State: AOAM532OmbXDP30Em+xKg6pz6jGvt4aYq+7IzBjwcIyY6TV3XLyqik7c
        7L2pXppMw1YlIm9b0oS0f4k=
X-Google-Smtp-Source: ABdhPJy71p+WlpQw0uaWsZgf6BI0kDz4IhTdIlFuKrkqq3s4+tGUPzVwehtdrWEJMaK6RK9NPw9Y0g==
X-Received: by 2002:a54:4498:: with SMTP id v24mr649458oiv.126.1642773961932;
        Fri, 21 Jan 2022 06:06:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k17sm1074761otk.80.2022.01.21.06.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 06:06:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 21 Jan 2022 06:05:59 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (adt7470) Prevent divide by zero in
 adt7470_fan_write()
Message-ID: <20220121140559.GA307376@roeck-us.net>
References: <20220121115543.GA25292@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220121115543.GA25292@kili>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jan 21, 2022 at 02:55:43PM +0300, Dan Carpenter wrote:
> The "val" variable is controlled by the user and comes from
> hwmon_attr_store().  The FAN_RPM_TO_PERIOD() macro divides by "val"
> so a zero will crash the system.  Check for that and return -EINVAL.
> Negatives are also invalid so return -EINVAL for those too.
> 
> Fixes: fc958a61ff6d ("hwmon: (adt7470) Convert to devm_hwmon_device_register_with_info API")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/adt7470.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index d519aca4a9d6..fb6d14d213a1 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -662,6 +662,9 @@ static int adt7470_fan_write(struct device *dev, u32 attr, int channel, long val
>  	struct adt7470_data *data = dev_get_drvdata(dev);
>  	int err;
>  
> +	if (val <= 0)
> +		return -EINVAL;
> +
>  	val = FAN_RPM_TO_PERIOD(val);
>  	val = clamp_val(val, 1, 65534);
>  
> -- 
> 2.20.1
> 
