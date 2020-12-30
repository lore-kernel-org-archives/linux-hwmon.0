Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB354C433E0
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Dec 2020 16:13:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74C9020770
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Dec 2020 16:13:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgL3QNc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Dec 2020 11:13:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbgL3QNc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Dec 2020 11:13:32 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9FF0C061799
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Dec 2020 08:12:51 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id x13so19117678oic.5
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Dec 2020 08:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wl1W2RPq3i9N082YD5r+y5k0zCkfLrW6r5kSZSEhXT4=;
        b=iParR7rAgsvKw9maE5lGAaKCIElDrj21Y0h9Qlgv5zdi88UpxaQwv6sWr4+vhaYsH+
         ltl++BEkkBDMEIf/wKylfLKfXgbqdc9uM7x2Q/wq5muFtCobmEg/bryuz4NA5hhaAcQF
         6+oWIu+M4zEszDmK4x2gfSZ2LotuScKwdQmY4hGc3NV9RKRxwNZ3PDQ7ABWMW7IbT6SP
         7qRuPHVFrKhT/niFXpjS39DLoxKA7Odrp0UCXcP5Iar1Pc6/u0NFVDuDmSJJNJpA08KF
         zMiTDN1v2FoCoTBzqLTYLGiLhgdM0NUXPwvKXmQ6ZudRkIkLZF1g20GSlGxQBEwZBwO6
         FB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=wl1W2RPq3i9N082YD5r+y5k0zCkfLrW6r5kSZSEhXT4=;
        b=JmY1FaZbEWOn47MVlerEGVrwYXp5EUwNiIgQqzuaf2tdYJC4WIrOSeUPaez/lpljyh
         979z7JoOZ3CXXfoS+X6COlbdcarm8W6XoNCoEZMncO3GFSozuGH75W67Ht3ZnkY1t41s
         QIljylz8GT5DqY0Bn3BdiecD2LGoSRyFIb0WRJSjoQ7xcrzyCpJ1FQEV5NVmuyMHbG0L
         HKSarkQVokD8TIstIqeH4eFFHPXQwilplQQDqLVu1gOR66/RIWEIISf96vkkNdSF3QGP
         9pYovYPGbFJda8cE92Qdo94/CWLIdvRrUZBbvnaPQKlt5IUvvkmemegwlf4rmOeiu+rR
         H5mQ==
X-Gm-Message-State: AOAM531fHV5LNTs9CWC3vU9l6yQj2+561K3C6Fk3pu5Ig4n6klRPezkq
        lGyIKF75wr+PaInR3Ae/jv8=
X-Google-Smtp-Source: ABdhPJw8K8imijJ/0pyLPkAoylYPxvnIfz0mPhA4A2e76w4E5F6OG2ZviphF2eht7S5rvkNGrrSP3w==
X-Received: by 2002:aca:cc01:: with SMTP id c1mr5703217oig.18.1609344771457;
        Wed, 30 Dec 2020 08:12:51 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s77sm11162361oos.27.2020.12.30.08.12.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Dec 2020 08:12:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 30 Dec 2020 08:12:49 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (abx500): Decomission abx500 driver
Message-ID: <20201230161249.GA101363@roeck-us.net>
References: <20201223211319.937757-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201223211319.937757-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Dec 23, 2020 at 10:13:19PM +0100, Linus Walleij wrote:
> This deletes the ABx500 hwmon driver, the only supported
> variant being the AB8500.
> 
> This driver has been replaced by generic frameworks. By
> inspecting the abx500 sysfs files we see that it contains
> things such as temp1_max, temp1_max_alarm, temp1_max_hyst,
> temp1_max_hyst_alarm, temp1_min, temp1_min_alarm.
> 
> It becomes obvious that the abx500.c is a reimplementation
> of thermal zones. This is not very strange as the generic
> thermal zones were not invented when this driver was merged
> so people were rolling their own.
> 
> The ab8500.c driver contains conversion tables for handling
> a thermistor on ADC channels AUX1 and AUX2.
> 
> I managed to replace the functionality of the driver with:
> 
> - Activation of the ntc_thermistor.c driver,
>   CONFIG_SENSORS_NTC_THERMISTOR
> - Activation of thermal zones, CONFIG_THERMAL
> - In the device tree, connecting the NTC driver to the
>   processed IIO channels from the AB8500 GPADC ADC forming
>   two instances of NTC sensors.
> - Connecting the two NTC sensors to a "chassis" thermal zone
>   in the device tree and setting that to hit the CPU frequency
>   at 50 degrees celsius and do a critical shutdown at 70
>   degrees celsius, deploying a policy using the sensors.
> 
> After talking to the original authors we concluded that the
> driver was never properly parameterized in production so
> what we now have in the device tree is already puts the
> thermistors to better use than what the hwmon driver did.
> 
> The two remaining channels for two battery temperatures is
> already handled in the charging algorithms but can be
> optionally extended to thermal zones as well if we want
> these to trigger critical shutdown for the platform.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Also drop the Kconfig and Makefile entries. I was
>   sloppy and didn't commit all changes in my tree.

Looks like my response didn't make it to the list. Sigh.
Continuously struggling with e-mail servers believing that
I am a spammer.

Anyway, I applied v1 and fixed everything up there (Makefile,
Kconfig, and removed documentation). No need to resend.

Thanks,
Guenter
