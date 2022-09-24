Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081A2C07E9D
	for <linux-hwmon@archiver.kernel.org>; Sat, 24 Sep 2022 14:34:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233324AbiIXOeM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 24 Sep 2022 10:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbiIXOeJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 24 Sep 2022 10:34:09 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A0DD814C4
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Sep 2022 07:34:07 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id c24so2580622plo.3
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Sep 2022 07:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date;
        bh=ywaPv8Ww0nkF4HB2KLl9H8X3kPlfCgrHFU7KpXPhWkg=;
        b=HMvP+x7fSC8QQwZxa3mAITQ7I65nS7BntMrzSKcKYh8fw3oTVJinWHUzxBC45NhS+u
         ySKKom18LCC94BLum0bUBLX2sxQe8EjgqTAEnOqVHmpSn5JAKRlyV8p+8F12w41jthqD
         vVHLb0DnLasZL80QeZlUPYIsxdSSlrf70cWi+xxEQVD0PI14lPo/wWI6yHSyK240X+rC
         E6569VK5wAr9+d/BJOURucaZCCuklEmUyDdkUfmJwtTzXZNQeUK0xcMYCSPlqs8OQ1IU
         h5JSPxOFqNIxhlpOuwDUoHHq2gffZMvqGrN+rQJlamZeecxUaiFtjbT/7LmXV5/zFtJp
         iA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ywaPv8Ww0nkF4HB2KLl9H8X3kPlfCgrHFU7KpXPhWkg=;
        b=3Z85kXzfylIgh0rA++Y/er5EfzJZs/P+1JVRWNB0F7J9IEqe4Ih3Vx5ii0K+t5JUbe
         P0iqflG+o1rIMrwS4uO6vXOakdmXfNGCchqZ3Vo0gWgBuWsxfaal8zL6oRw6GbzI0UF7
         bGFhHXeTSS71PMk7Jqm8nNnWoZq4MRXKmzPKpJ7LX9zWlIzN817ve717f6+rA0Qs7gTb
         8aQEyb/Bb6WPqVwUOs8ZsPnxPWojOA6dMq9jzu1UtyCaP2QANg3pHBTKxxSqzv0BDoaM
         pqGyBzhgPE/vggoqmTFii/LypYGUW/abSeWFnk6ELVaTpGtrN0phyY0c5r24rNkm2GfU
         LcjQ==
X-Gm-Message-State: ACrzQf1xkh09DRNOf81L8ij/PeD2w+75OaJ/j6Pw9URUoOzvf0+hWqDI
        ulgwt6aVdH0FoPPeVzaQ7Lg=
X-Google-Smtp-Source: AMsMyM610eTeGGsczmhF9Z/sxUc/84E1mfhWvfBsoiktuvaT3HWmwQKAj8Yh28PvQTTyJP1Bhay9tQ==
X-Received: by 2002:a17:902:ce11:b0:172:6f2c:a910 with SMTP id k17-20020a170902ce1100b001726f2ca910mr13970246plg.156.1664030047011;
        Sat, 24 Sep 2022 07:34:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q11-20020a170902dacb00b00176683cde9bsm7935909plx.294.2022.09.24.07.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 07:34:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 24 Sep 2022 07:34:05 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/2] hwmon: via686a: Introduce a #define for the driver
 name and use it
Message-ID: <20220924143405.GA2299744@roeck-us.net>
References: <20220924135738.234051-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220924135738.234051-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Sep 24, 2022 at 03:57:37PM +0200, Uwe Kleine-König wrote:
> Make use of the cpp symbol DRIVER_NAME to set the driver's name and use
> it instead of all explicit usages of the same string. Also make use of
> it instead of sis5595_driver.driver.name which breaks a cyclic dependency
> between sis5595_probe() and sis5595_driver that in the next commit allows
> to drop some forward declarations. For an amd64 allyesconfig this even
> reduces the size of the driver by 3 bytes.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied.

Thanks,
Guenter
