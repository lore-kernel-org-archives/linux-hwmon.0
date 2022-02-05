Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C20C433EF
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Feb 2022 17:52:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241974AbiBERww (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Feb 2022 12:52:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235159AbiBERww (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Feb 2022 12:52:52 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF8DC061348;
        Sat,  5 Feb 2022 09:52:50 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id s24so4824707oic.6;
        Sat, 05 Feb 2022 09:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LvqLl3sI/qDNvWJAgisIMWIxaUXxt0qalK1P5E2CFVg=;
        b=gDOw4LiyScccEzKP2Nggc+ncLFVz10V47V4W1GjHF58fUWsAvlRctEcp5Z/UQPowf9
         UMuwdEyIC/8C7O1QnUVdTLNvAg2cSEwlZFx9NdhrAP41L8G7eAeLRaSQ45auT6lHjDLy
         1xgZnVmO7SH1M4DLa3jcJWRapCM2JriJlmZnry7OGQhN2FaPRVWaCfPsjTOAHbwvEv8M
         7I9DyaXxv6EAZJW4+1e2MAgZYVRO0v89cuxrxLQqdolVXiw6sR8ILsmTJOpjkWsKtmzE
         nTNrJTLYA/40Yi50dVBWPnntH1hh05w9Pd6evV4k3gl8z02OdiijsSJk6P6VyBzmSWY5
         S1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=LvqLl3sI/qDNvWJAgisIMWIxaUXxt0qalK1P5E2CFVg=;
        b=QUqQplYh8Fhl5d7WejCE+gt+oB63k7OfliXghQPOKKHjgDkXAPcPh7IuTTOCYoSLwd
         Q2ovemCaBdS7EPVJVTy1/qfBj3JFsvklSPdGQ7IuhwHHItw9IWv1z+bDnPX+PlB8wPCr
         9f+4OUQtKsLC616e9FlHzK0hyviMhYFLyHhRmmRw4z9oCu+saiIXKvFwD4OBzSjmGolW
         V3IzfiqBFXzjybq3jtdLII2tK3UxNXEPPST/GCc1UQYQcUbCf2HhgXMn3Pm83I+SJxdR
         L/Z+8RB8lTIg1zSmhdwJURw/9SuAAKLIo9/XsjVcAjdwhxbqZ7+IumYWzaM5RadeTz79
         8Hkw==
X-Gm-Message-State: AOAM532GkHQAPXccWTJvyv2/HQuMHG9C5qlboyPh+Y+OtFHnQPaGFh7Z
        Q8mZofvK6l59k7/2+/J241E=
X-Google-Smtp-Source: ABdhPJwZRfIpz294jcHfnACRMR37oxFqBKstiwFbDMiFaMMQRuruLtEB23L+EozAR0gQPjexDB3rWA==
X-Received: by 2002:a05:6808:3022:: with SMTP id ay34mr3991421oib.37.1644083569532;
        Sat, 05 Feb 2022 09:52:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t21sm2072765oor.4.2022.02.05.09.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Feb 2022 09:52:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 5 Feb 2022 09:52:47 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Eugene Shalygin <eugene.shalygin@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) fix a typo in asus_ec_probe()
Message-ID: <20220205175247.GA3075896@roeck-us.net>
References: <20220205092015.GA612@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220205092015.GA612@kili>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Feb 05, 2022 at 12:20:15PM +0300, Dan Carpenter wrote:
> There is no such struct as "asus_ec_sensors", it was supposed to be
> "ec_sensors_data".  This typo does not affect either build or runtime.
> 
> Fixes: c4b1687d6897 ("hwmon: (asus-ec-sensors) add driver for ASUS EC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/asus-ec-sensors.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
> index 7285334c7d80..cb266ba30c97 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -653,7 +653,7 @@ static int __init configure_sensor_setup(struct device *dev)
>  
>  static int __init asus_ec_probe(struct platform_device *pdev)
>  {
> -	struct asus_ec_sensors *state;
> +	struct ec_sensors_data *state;
>  	int status = 0;
>  
>  	state = devm_kzalloc(&pdev->dev, sizeof(struct ec_sensors_data),
