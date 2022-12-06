Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B66C3A5A7
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Dec 2022 22:39:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiLFWjQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Dec 2022 17:39:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbiLFWjP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Dec 2022 17:39:15 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6184A040
        for <linux-hwmon@vger.kernel.org>; Tue,  6 Dec 2022 14:39:14 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id t62so18639374oib.12
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Dec 2022 14:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smY3oweR6vP60IZ/HLKywFgt6V5Iwy6Tqaobsage7ZA=;
        b=hodHJ+LzG0np2qYMUP6bdd6OStAb5AoL6NiK7w64dlNKZi/a0Gl/O81NzCzzLQhL4g
         dcDgVgEhJjzeg5I7UhTB1Is/XZ5lbn4UkmloOT/0bDDqs6bfl8tv2ZCAQhrbRWRQqpro
         zL/bDtK9w+b2OYJgehSAO3TJrbdlyzEV6KtYgMwuXgv4MNSMimGpQLwn77/FC35nDxYR
         NAFcevnwHXDz2ZhN2V7QS6lxAnhFpwlJ9THi6q067hkszd9tckL1yRkfs7eMCxNPpPXH
         wovDVqlWbmXmri3n9hmkgnXRld4xNK5z06lnEjwHDO3FAWZlrYneqL/vXQtRiNO+eR5F
         zZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smY3oweR6vP60IZ/HLKywFgt6V5Iwy6Tqaobsage7ZA=;
        b=AZaV8OptkwyP+lsA2f9926oXc05BOMkvgjtwRl+R6DcaK73NtO/bsy1aOvRW+fFtLg
         pvVwx1bdTZ3iko1n8Zbj5eE1tNNKk48jsCJtwg5Fg5hJ+6dRS1tkzBYuffYG78BSLV7Z
         SIZbKB8uhthbRcpm7Sl8wtjfxcdLYXuWc35ygQ3EumPtu2JZsUNDcD92kEif6zzFapn0
         xzBbgYgM/cldT5rVKkgtmvDHgfDFJoD2lXClFBj/eR9mK3vM3Jm8C97cOJRbBGSVm5K6
         ruBKTEwjOUHLK5lWQKOl3Hj8dQ3kSZLc7lWx+kVEBpiACHeymXPpf+WfZDaV71Ov/XIo
         7bXQ==
X-Gm-Message-State: ANoB5ple68qKw2f+zn3XG1acXockQFoGW5CIhhU2p/OSLDP/c4bL1Z3C
        r5PhS7Zxw66SzOv7OQ6hdR/3FX6zDDA=
X-Google-Smtp-Source: AA0mqf7gP65+/Oquk6mQJVSonft1q2i8KFWt8xcE7CS2VDT2nzVCOF5uCepLXVTC2SjzK1UIovEKbA==
X-Received: by 2002:a05:6808:3af:b0:35c:27c2:68a4 with SMTP id n15-20020a05680803af00b0035c27c268a4mr6384249oie.42.1670366353987;
        Tue, 06 Dec 2022 14:39:13 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f13-20020a9d6c0d000000b006704589eb54sm2717203otq.74.2022.12.06.14.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 14:39:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 6 Dec 2022 14:39:12 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Xingjiang Qiao <nanpuyue@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Michael Shych <michaelsh@nvidia.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: (emc2305) fix unable to probe emc2301/2/3
Message-ID: <20221206223912.GA863125@roeck-us.net>
References: <20221205173611.145571-1-nanpuyue@gmail.com>
 <20221206055331.170459-1-nanpuyue@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221206055331.170459-1-nanpuyue@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Dec 06, 2022 at 01:53:30PM +0800, Xingjiang Qiao wrote:
> The definitions of 'EMC2305_REG_PRODUCT_ID' and 'EMC2305_REG_DEVICE' are
> both '0xfd', they actually return the same value, but the values returned
> by emc2301/2/3/5 are different, so probe emc2301/2/3 will fail, This patch
> fixes that.
> 
> Signed-off-by: Xingjiang Qiao <nanpuyue@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/emc2305.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index aa1f25add0b6..9a78ca22541e 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c
> @@ -16,7 +16,6 @@ static const unsigned short
>  emc2305_normal_i2c[] = { 0x27, 0x2c, 0x2d, 0x2e, 0x2f, 0x4c, 0x4d, I2C_CLIENT_END };
>  
>  #define EMC2305_REG_DRIVE_FAIL_STATUS	0x27
> -#define EMC2305_REG_DEVICE		0xfd
>  #define EMC2305_REG_VENDOR		0xfe
>  #define EMC2305_FAN_MAX			0xff
>  #define EMC2305_FAN_MIN			0x00
> @@ -524,7 +523,7 @@ static int emc2305_probe(struct i2c_client *client, const struct i2c_device_id *
>  	struct device *dev = &client->dev;
>  	struct emc2305_data *data;
>  	struct emc2305_platform_data *pdata;
> -	int vendor, device;
> +	int vendor;
>  	int ret;
>  	int i;
>  
> @@ -535,10 +534,6 @@ static int emc2305_probe(struct i2c_client *client, const struct i2c_device_id *
>  	if (vendor != EMC2305_VENDOR)
>  		return -ENODEV;
>  
> -	device = i2c_smbus_read_byte_data(client, EMC2305_REG_DEVICE);
> -	if (device != EMC2305_DEVICE)
> -		return -ENODEV;
> -
>  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
