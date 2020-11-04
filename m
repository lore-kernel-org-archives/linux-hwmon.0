Return-Path: <SRS0=xFUD=EK=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C6EC2D0A3
	for <linux-hwmon@archiver.kernel.org>; Wed,  4 Nov 2020 02:56:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27CA0206CB
	for <linux-hwmon@archiver.kernel.org>; Wed,  4 Nov 2020 02:56:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LR0c3UJ0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729799AbgKDC4c (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 Nov 2020 21:56:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728972AbgKDC4c (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Nov 2020 21:56:32 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D94BC061A4D
        for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2020 18:56:31 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id 79so10583812otc.7
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Nov 2020 18:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lYi4KTOPFPnbKDzo0cfTNafVMikwzD3Kl6C7McyOBXw=;
        b=LR0c3UJ0VTadN7VYUzzhQjuGT1Xo6gkkwh2stO/9ffse6AWSb7MW7mRxmTqEkDhXzL
         tFglabu+JiLyGkXFCbP/+r1hwCb1d69i3xKatmHmXMtC0jlbyjJ0PXXlGSsqjFPeeMBw
         1xRrXl2J4iuMsUbgC/O8t9LHwLjtKIy+sFM+bsbo60INgIypp0YIGpgtEAAeBTQU5dJ7
         lk2tRkCTjbhPMFNCfyU1wwwVOyu9QH/6RVvNwAw3sbDXT8NZPU9PkXMLquk6gzYNrKuC
         41cINxYAH0E7EQa0e7odZSiIMNk1WJhGOQO8RTjrMJSCQ9RcQWBc0+CL1zUDauzRj+Vl
         F0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=lYi4KTOPFPnbKDzo0cfTNafVMikwzD3Kl6C7McyOBXw=;
        b=ixfeZyUMASTWT7yECBNYTDDUnm6pDFF2pgESifvBzmGhDvUJr/0+DkJMlPWHFr3Lmd
         NwYsxuYonqxXRJXNmFwpjLYcwZCgYYMVkcQ9sm4804uiqrIeki86JJqyi/zMK89hRVwZ
         Z2+0vTC8fLGfNCNETr+S1SQ37rNmfjeh2aC6ShydcZAmvIubhuBJ6ddVbarOKTHjmM5O
         uvVNe+mW3iQxYl/ueEZCIhe6dKOIMZ+vt4Pt77FxauDT40Ue6wON5E/K2qCWO+qeh/i+
         5PGge3oguzY7GuRnI25rHHC6lGrmim9yU5X7qFXGMN2bZT7GN7eXd/CCMWaLmeLTkCFD
         QwSw==
X-Gm-Message-State: AOAM533NCGW/08oX0YRewOkyyx32JyX+I/rdX0AFFzgrA0QRMeHgtsk6
        gk0wSZPaFOjDsP+NogJLzTg=
X-Google-Smtp-Source: ABdhPJzpOwy3myb0wfv9e9akIPqN5Ejipm0B8kbLxcs9RbZG1A5p4IaT4xo9yA30QXPr4/ec+187vA==
X-Received: by 2002:a9d:aa8:: with SMTP id 37mr9024479otq.286.1604458590042;
        Tue, 03 Nov 2020 18:56:30 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n129sm61746ooa.17.2020.11.03.18.56.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Nov 2020 18:56:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 3 Nov 2020 18:56:28 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Robert Hancock <robert.hancock@calian.com>
Cc:     jdelvare@suse.com, xqiu@google.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus) Add mutex locking for sysfs reads
Message-ID: <20201104025628.GA117886@roeck-us.net>
References: <20201103193315.3011800-1-robert.hancock@calian.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103193315.3011800-1-robert.hancock@calian.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Nov 03, 2020 at 01:33:15PM -0600, Robert Hancock wrote:
> As part of commit a919ba06979a7 ("hwmon: (pmbus) Stop caching register
> values"), the update of the sensor value is now triggered directly by the
> sensor attribute value being read from sysfs. This created (or at least
> made much more likely) a locking issue, since nothing protected the device
> page selection from being unexpectedly modified by concurrent reads. If
> sensor values on different pages on the same device were being concurrently
> read by multiple threads, this could cause spurious read errors due to the
> page register not reading back the same value last written, or sensor
> values being read from the incorrect page.
> 
> Add locking of the update_lock mutex in pmbus_show_sensor and
> pmbus_show_samples so that these cannot result in concurrent reads from the
> underlying device.
> 
> Fixes: a919ba06979a7 ("hwmon: (pmbus) Stop caching register values")
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> Reviewed-by: Alex Qiu <xqiu@google.com>

Good catch. Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 170a9f82ca61..b0e2820a2d57 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -941,12 +941,16 @@ static ssize_t pmbus_show_sensor(struct device *dev,
>  	struct i2c_client *client = to_i2c_client(dev->parent);
>  	struct pmbus_sensor *sensor = to_pmbus_sensor(devattr);
>  	struct pmbus_data *data = i2c_get_clientdata(client);
> +	ssize_t ret;
>  
> +	mutex_lock(&data->update_lock);
>  	pmbus_update_sensor_data(client, sensor);
>  	if (sensor->data < 0)
> -		return sensor->data;
> -
> -	return snprintf(buf, PAGE_SIZE, "%lld\n", pmbus_reg2data(data, sensor));
> +		ret = sensor->data;
> +	else
> +		ret = snprintf(buf, PAGE_SIZE, "%lld\n", pmbus_reg2data(data, sensor));
> +	mutex_unlock(&data->update_lock);
> +	return ret;
>  }
>  
>  static ssize_t pmbus_set_sensor(struct device *dev,
> @@ -2012,8 +2016,11 @@ static ssize_t pmbus_show_samples(struct device *dev,
>  	int val;
>  	struct i2c_client *client = to_i2c_client(dev->parent);
>  	struct pmbus_samples_reg *reg = to_samples_reg(devattr);
> +	struct pmbus_data *data = i2c_get_clientdata(client);
>  
> +	mutex_lock(&data->update_lock);
>  	val = _pmbus_read_word_data(client, reg->page, 0xff, reg->attr->reg);
> +	mutex_unlock(&data->update_lock);
>  	if (val < 0)
>  		return val;
>  
