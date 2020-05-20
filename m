Return-Path: <SRS0=CmOj=7C=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF1CC433DF
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 May 2020 09:30:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 479ED207D3
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 May 2020 09:30:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p72EAhzO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbgETJau (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 20 May 2020 05:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgETJat (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 May 2020 05:30:49 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C70BC061A0F
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2020 02:30:49 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id w64so2125256wmg.4
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2020 02:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=fGDkv4T8MKhXtvtJhdYon6fPiccDhuj/0wt8Z1uWsd8=;
        b=p72EAhzOvJg9XPS9RUikePxiTlmYlJFNUxuGbRzRvsdb1BEVuMAdpH5kk/OBi0eTA7
         vdTKlnacAjitKdVwUnK+myaFNInSDpausUj6DohOiL5EJxgzpn949JV+PFCI9Bi8qW51
         nxawfjVZE6gZZ4+BjtIa6oNPUB2RdgLiEijYTB1yvcW8PkCyEILZ4Gh1umyp8wsmdQBl
         iIFCae1IBS7L5ryGCOxqGz4B6zj7i569WinQvW950seT5+MsNkJf3XIsmGlCGR4683Q8
         kgVW8KW2zi2cFDPu3l8d+UcC1lGTlHnVxl1tVBcTrpKlHl6SqiuXvy0OSvPaBpl4GsyS
         vv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fGDkv4T8MKhXtvtJhdYon6fPiccDhuj/0wt8Z1uWsd8=;
        b=Gx+bvZngs0Rxl5wwndS/LRyMPnwziC/DeFLY5QT7IR/8NyLM6HmeX5nt49zWK7TLld
         gChjFq9HddVeEfRsoi8aTXYh0CaybWt8QJ7NKUDiJC/UG3Oo0O/xTp2RDkW+B8jrgqxV
         YwvArubFXephjoiVBbpk0F378n5pCHSMegDp/hYuNlmH5YMzaERv6cYvE0pgNtiQ/WHJ
         1kMuW2/0S8NuNvANXX8e3VP/1nEkCQornjvQO0CsFtPsCbFOMM/HwGThyijD90k4ZvCX
         dtWmbh0JDL+DKztr7anaZHwvowiP/xpvts0XYTfEhEXJ7yhB6T1CPsnnMLlsFjTWFILU
         TnvA==
X-Gm-Message-State: AOAM533vry03sYRBuku9vvLUT0iGOiTuLnuxg8LSKyrFe9aTWbXdbWQ4
        aCvwKRKPLFVzCHwnt/YqK0LtFw==
X-Google-Smtp-Source: ABdhPJySUzxgA6PvX8P0+GYKFhmCe11AVemLOhabpbbwcdPsEg+HZLUM1MflW4+2Ma1M8CIZXizHtQ==
X-Received: by 2002:a1c:7212:: with SMTP id n18mr4115090wmc.129.1589967048028;
        Wed, 20 May 2020 02:30:48 -0700 (PDT)
Received: from dell ([95.149.164.102])
        by smtp.gmail.com with ESMTPSA id q144sm2584703wme.0.2020.05.20.02.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 02:30:47 -0700 (PDT)
Date:   Wed, 20 May 2020 10:30:45 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Robert Jones <rjones@gateworks.com>
Subject: Re: [PATCH v11 2/3] mfd: add Gateworks System Controller core driver
Message-ID: <20200520093045.GG271301@dell>
References: <1589565428-28886-1-git-send-email-tharvey@gateworks.com>
 <1589565428-28886-3-git-send-email-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1589565428-28886-3-git-send-email-tharvey@gateworks.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 15 May 2020, Tim Harvey wrote:

> The Gateworks System Controller (GSC) is an I2C slave controller
> implemented with an MSP430 micro-controller whose firmware embeds the
> following features:
>  - I/O expander (16 GPIO's) using PCA955x protocol
>  - Real Time Clock using DS1672 protocol
>  - User EEPROM using AT24 protocol
>  - HWMON using custom protocol
>  - Interrupt controller with tamper detect, user pushbotton
>  - Watchdog controller capable of full board power-cycle
>  - Power Control capable of full board power-cycle
> 
> see http://trac.gateworks.com/wiki/gsc for more details
> 
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
> v11:
> - fix compile error
> 
> v10:
> - fix typo and gramatical errors in Kconfig and comment block
> - drop unused i2c device-id table
> - added Lee's ack in s-o-b
> 
> v9:
> - rebase against 5.7-rc2
> - cleanup gsc_powerdown() by using BIT(), put_unaligned_le32(), and avoid
>   unnecessary assignments
> - rename GSC_CTRL_1 SLEEP related defines to simplify
> - add better description and sub-module info to driver description
> - whitespace changes per review
> - remove unused irq_data pointer in ddata
> - remove unnecesary i2c_set_clientdata
> - use devm_i2c_new_dummy_device to avoid need of free's
> - change regsiter definitions to enum
> - export gsc_{read,write} instead of sharing them via ddata
> 
> v8:
> - whitespace fixes
> - describe sub-devices in Kconfig
> - add error print for invalid command
> - update copyright
> - use devm_of_platform_populate
> - use probe_new
> - move hwmon's regmap init to hwmon
> 
> v7:
> - remove irq from private data struct
> 
> v6:
> - remove duplicate signature and fix commit log
> 
> v5:
> - simplify powerdown function
> 
> v4:
> - remove hwmon max reg check/define
> - fix powerdown function
> 
> v3:
> - rename gsc->gateworks-gsc
> - remove uncecessary include for linux/mfd/core.h
> - upercase I2C in comments
> - remove i2c debug
> - remove uncecessary comments
> - don't use KBUILD_MODNAME for name
> - remove unnecessary v1/v2/v3 tracking
> - unregister hwmon i2c adapter on remove
> 
> v2:
> - change license comment block style
> - remove COMPILE_TEST (Randy)
> - fixed whitespace issues
> - replaced a printk with dev_err
> ---
>  MAINTAINERS                 |   8 ++
>  drivers/mfd/Kconfig         |  15 +++
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/gateworks-gsc.c | 277 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/gsc.h     |  76 ++++++++++++
>  5 files changed, 377 insertions(+)
>  create mode 100644 drivers/mfd/gateworks-gsc.c
>  create mode 100644 include/linux/mfd/gsc.h

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
