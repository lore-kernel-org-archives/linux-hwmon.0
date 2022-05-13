Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4738C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 May 2022 08:02:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377994AbiEMICY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 13 May 2022 04:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238439AbiEMICW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 13 May 2022 04:02:22 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3A0E3DA6E
        for <linux-hwmon@vger.kernel.org>; Fri, 13 May 2022 01:02:20 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id n126-20020a1c2784000000b0038e8af3e788so4305823wmn.1
        for <linux-hwmon@vger.kernel.org>; Fri, 13 May 2022 01:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=OXgBzGZGEU7zxP/doiWF3UTQSdG2zI3MrmBCu1stYVY=;
        b=QbdeR4HZ3E9008FT1y7yNIW+xDhJpNx1BUEBRMxckW2cHxFJMiGqMabDWXxOSmPco2
         WgMLwixB0mWf4mfHTlMkLHfejLDiUsutaNcyqZyUiAIrnU1XipA1dSYW9VTlDUBoPGGu
         4rZ68ON1okF8uAY1YxGi/dPqwN1eJzwoq7D0PGSXhv+HNI9bB5K6vVAedUcC+JrceBbp
         xltN53IuAkpVXXAYhUoN9MtAjO/jDEC1L6BxjCRr8DAr7sdpvOuh6P1NnzJ8U12wB/H9
         aVwa4yd/jMvQrGszv569DrYm63CnUZPkAo5RN0H2+Sp8xjnHCNNGiM5tIrq1ClcrRt9s
         YnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=OXgBzGZGEU7zxP/doiWF3UTQSdG2zI3MrmBCu1stYVY=;
        b=Z2lFL+7ChlEyuXcpGBi5bB8vniq4VGfNRT0oG2JaZLmEWt6o8otjr8aGdTD29XsQ9N
         WE4HPqkl+SyTqZryBXUqIz2y5c1IfeFbKHAI5s2BGWbVmhj/+EcEOdRxWIieNaqc0UMP
         c/HiNr7/GjCZaVvblEfHRF6jB+ZsNOKdTb12QLonfMtL1Ws5+p1BJFcAyMpdiLz55+3b
         fVwb3b8swA8mK3kv9LoFtrFalcjqNb2RkiO2lA7YCKp0rXHCcPu3AiTyUNnY62cvQMng
         6vaGQ1p1I4fDx02YEgvNvYBGPvOWBL2sSO32AJts4y6PCZtcjtaHLpGae5La7XjLoVEH
         r/tA==
X-Gm-Message-State: AOAM5321XYlhdP/gzmJnGWn0F+6D3cnlmbH8cJIT38IKb8YTb0ZqcLfm
        Th1+CaWDrKuJcb81pqNGFddIfQ==
X-Google-Smtp-Source: ABdhPJy5ysr4EBxCGcvRMSEzgORxx0SBOq2IB8jyz19bVEcu4J2yc7c+c3xCVTKJ6VBmZPEIcFIMIg==
X-Received: by 2002:a05:600c:4ba1:b0:394:9ae3:ee98 with SMTP id e33-20020a05600c4ba100b003949ae3ee98mr13735148wmp.160.1652428939076;
        Fri, 13 May 2022 01:02:19 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id m32-20020a05600c3b2000b003942a244ed2sm2283993wms.23.2022.05.13.01.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 01:02:18 -0700 (PDT)
Date:   Fri, 13 May 2022 10:02:14 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>
Subject: Re: [PATCH v3 2/2] hwmon: acpi_power_meter: convert to
 hwmon_device_register_with_info
Message-ID: <Yn4QhhTI7t6Gi+fE@Red>
References: <20220509063010.3878134-1-clabbe@baylibre.com>
 <20220509063010.3878134-3-clabbe@baylibre.com>
 <e5f6c712-efed-2126-de2b-9a0d09150e7b@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5f6c712-efed-2126-de2b-9a0d09150e7b@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Le Wed, May 11, 2022 at 07:10:29PM -0700, Guenter Roeck a écrit :
> Corentin,
> 
> On 5/8/22 23:30, Corentin Labbe wrote:
> > Booting lead to a hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
> > So let's convert the driver to use hwmon_device_register_with_info().
> > 
> > Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> > ---
> [ ... ]
> 
> > @@ -836,20 +740,20 @@ static void acpi_power_meter_notify(struct acpi_device *device, u32 event)
> >   		if (res)
> >   			break;
> >   
> > -		remove_attrs(resource);
> > +		remove_domain_devices(resource);
> >   		setup_attrs(resource);
> 
> Zhang Rui found an interesting problem with this code:
> It needs a call to sysfs_update_groups(hwmon_dev->groups)
> to update sysfs attribute visibility, probably between
> remove_domain_devices() and setup_attrs().
> 
> >   		break;
> >   	case METER_NOTIFY_TRIP:
> > -		sysfs_notify(&device->dev.kobj, NULL, POWER_AVERAGE_NAME);
> > +		hwmon_notify_event(&device->dev, hwmon_power, hwmon_power_average, 0);
> 
> ... which makes realize: The notification device should be the hwmon device.
> That would be resource->hwmon_dev, not the acpi device.
> 

Hello

I will fix this, but do you have an example how to test thoses code path easily ?

Thanks
