Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E28C54E94
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Jan 2023 13:50:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbjAZNuX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Jan 2023 08:50:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbjAZNuR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Jan 2023 08:50:17 -0500
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F9BF6227D
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Jan 2023 05:49:57 -0800 (PST)
Received: by mail-oo1-xc2f.google.com with SMTP id c145-20020a4a4f97000000b004f505540a20so240569oob.1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Jan 2023 05:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mow2e6yK+wVJ/rFQCQr5C+Jap4aTM2OyOVwxNn+AWjM=;
        b=nnZ7MDAESdGVgkdeHy+I/hVL4MrOZVQbTg3VvEAYmuI2GWE6KUG/4PIUETTjT3pZ6s
         F1q55kNXtRwD/twcIzZeYbT6DzK/FSi0XL0gJsW31cxnumfgO97WDPMamQoUadIqpFZD
         IQvcTrWxkCCiWSsd8SzRXSow/VZeQxOSPOXM0fEiAqN16zkSbIe3/Vb7rJBQXU1FzCon
         T1Tza+G9Or5TD+98goEVpGZixtHS5i2zJQP2NXvGZ4avdBnewPE/ncOPfI/U0VN3Z2Zt
         7TTNGI2RPavwZTt4GpEkNV2t6XMdUbHm9/v93zsmevO7xDfGtRk9HCUzWUTOMaMcbqdl
         Q8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mow2e6yK+wVJ/rFQCQr5C+Jap4aTM2OyOVwxNn+AWjM=;
        b=R7HxLORU681ntv8mlTMQjyKgCttmHr7AlkQP5kE4Ue5KRNZjIs3EKOdNIjawmzyUc4
         YXmbf0ZoGNpf/IY2c1+dh685n5xowhn6iInRMuCLMz8sK9n9ZvXG/WGc6DkE+k8F/KZG
         nQiFb1l1tHBrMqRyBu9yuOcA/jCbED2qD5B2NRz7KvBmWdNTAKHy5kmXx1/N65i+6NZ0
         xs8Bpeo+U7B50k3enyXHZnh1E8mUP23uh6uTgnV82slq8UM93U7fiyZeB1Yp1TJXDFUj
         JSUIJh4fhiOQUV/Jki3zHRYGayNoaq0ObPqGKKvuIVIfZiiDYdp0JeSuUGA9NrCFzTG0
         F2FA==
X-Gm-Message-State: AFqh2ko94UV4TROdlvzieIkEetn1G4Rx4syQah+n/xHmdkUQ09ou43ru
        HFBDAHKVmQtYnQJV0nO1WOKBT157idM=
X-Google-Smtp-Source: AMrXdXsW/GxSh+VTkHlfkLVFK3v7k//IhvNUjBq8TM/dnvH8Jy9RmALGOY8Z2h3vpgGcForSOtpnwQ==
X-Received: by 2002:a4a:1843:0:b0:4f2:8fa2:acda with SMTP id 64-20020a4a1843000000b004f28fa2acdamr15342050ooo.5.1674740995786;
        Thu, 26 Jan 2023 05:49:55 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bm27-20020a056820189b00b0049fd5c02d25sm555607oob.12.2023.01.26.05.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 05:49:55 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 26 Jan 2023 05:49:54 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 4/7] hwmon: (it87) Add chip_id in some info message
Message-ID: <20230126134954.GA1635195@roeck-us.net>
References: <20230126040223.986189-1-frank@crawford.emu.id.au>
 <20230126040223.986189-5-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126040223.986189-5-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jan 26, 2023 at 03:02:20PM +1100, Frank Crawford wrote:
> In cases where there are multiple chips, print out which chip is
> referred to, in the informational message.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> ---
>  drivers/hwmon/it87.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 16394b38dce3..5ca8449887da 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -2505,13 +2505,15 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>  
>  	superio_select(sioaddr, PME);
>  	if (!(superio_inb(sioaddr, IT87_ACT_REG) & 0x01)) {
> -		pr_info("Device not activated, skipping\n");
> +		pr_info("Device (DEVID=0x%x) not activated, skipping\n",
> +			chip_type);

At this point the textual name (it87_devices[sio_data->type].model)
is already known. I would suggest to print that instead.

Thanks,
Guenter

>  		goto exit;
>  	}
>  
>  	*address = superio_inw(sioaddr, IT87_BASE_REG) & ~(IT87_EXTENT - 1);
>  	if (*address == 0) {
> -		pr_info("Base address not set, skipping\n");
> +		pr_info("Base address not set (DEVID=0x%x), skipping\n",
> +			chip_type);
>  		goto exit;
>  	}
>  
> -- 
> 2.39.1
> 
