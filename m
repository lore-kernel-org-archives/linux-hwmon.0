Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27615C433ED
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Apr 2021 16:48:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D051961454
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Apr 2021 16:48:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237824AbhDUQsm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Apr 2021 12:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237358AbhDUQsm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Apr 2021 12:48:42 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1203C06174A
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Apr 2021 09:48:08 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id f12so31709494qtf.2
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Apr 2021 09:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=protocubo.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kuud2hPPUJLP0sOqoFKqRX4MRFjdnyr8+OvVrhCaT+E=;
        b=ddtN3w85QdIemHYqxcZBKlTo1YDB69DZxMCCI1bn2g9X+5YHxfUoNLGU04NiZrk2B5
         QRXfIG5gQzc0sC9GOnllBIhCv74B8jmBpd/Ov6kHPmHnSu4MB1KuFt5KX5en0P32sZke
         DZ54hVZvmGLm+LVftALyl7NX1nM/y36BlbdthJ+IHNW3AQLOH0Gr178DlCppCJf/RojQ
         T/t6vzlHcw7fjn+FPRMWXa8k2wgEnx+SNBlFXvW/URhI2eLmLOxst8jTSq99rMWeonxw
         7GsUBo68EnWrY9yzBOUBR6iB86Ua9T5154BuOFImN9UyIkxs1GE0qJ3kUi4yMGm/RUXh
         BhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kuud2hPPUJLP0sOqoFKqRX4MRFjdnyr8+OvVrhCaT+E=;
        b=faze+9DvH2O8XW9+mYPwBMHSHuNBGov4bozx4zJuBjPnrdTvDiCLRmqPiJRJ7MuRAn
         MSUgRIjG4RJiuGlT9pUTvBq0UcSUcqrw8I5n7AH6seB3RWLJihsMLKVdnZgghq+4IEFq
         aTscOqC4/PInaW4bA6EkgvUwKzOSAgcCq/7FdU0dmDcvLUoJVKJgrnWbkMhsL11j9Njj
         zbtQnv+FI2m1mj2XxBgJTIsDqDU+PMhLvJ8Dl9Sl+t9IhFNNtJ9dokt6r2ZLREj7SCK7
         Dppi68b2raVgVQVV5Lu1mIY9zn5/JP4Dw8AEzfvLyxDvJCHbud6+JcQHmVN255L+n/S2
         OMIQ==
X-Gm-Message-State: AOAM530EDtUzmmsJqEPZTvOrKguMWdzenDbboJL5rzN30D9sa6CDjp+W
        RfUMhDuo6XNcEIDx+AQdyygBEifYX7Cz+Q==
X-Google-Smtp-Source: ABdhPJwKS1Cs5WxAKUCQvbhqp5fvb3a6V1NYNfb9SHwpluHP/lvq6gIiflZuBJzbvPfdEwXnY5mZcg==
X-Received: by 2002:a05:622a:1341:: with SMTP id w1mr22940531qtk.347.1619023687674;
        Wed, 21 Apr 2021 09:48:07 -0700 (PDT)
Received: from calvin.localdomain ([2804:14d:5c5a:802e:bdc9:ded9:cc08:a4e9])
        by smtp.gmail.com with ESMTPSA id e14sm33370qte.78.2021.04.21.09.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 09:48:07 -0700 (PDT)
Date:   Wed, 21 Apr 2021 13:48:03 -0300
From:   Jonas Malaco <jonas@protocubo.io>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: PWM control in NZXT Grid+ V3 and Smart Device
Message-ID: <20210421164803.up7ndcsor6gxptj4@calvin.localdomain>
References: <20210413124529.jdi6ambxusd47y34@calvin.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210413124529.jdi6ambxusd47y34@calvin.localdomain>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Apr 13, 2021 at 09:45:29AM -0300, Jonas Malaco wrote:
> Guenter (and others on this list),

Very gentle ping.

I also thought posting these questions first would be less disruptive
than a RFC patch, but please let me know if you prefer the latter.

Thanks again,
Jonas

> 
> I am getting ready to submit a driver for NZXT Grid+ V3 and Smart Device
> (V1) fan controllers, but I am having trouble deciding how to expose
> their PWM control due to some device limitations.
> 
> Before getting into those, let me first give some very basic context...
> 
> These devices are USB HIDs, and asynchronously send "status" reports
> every 200 ms to communicate speed, current, voltage and control mode for
> their channels (one channel per report).
> 
> Fans can be controlled by sending HID output reports to the device, and
> both DC and PWM modes are supported.  The device features a special
> initialization routine (that must be requested during probe) which
> automatically detects the appropriate control mode for each channel.
> 
> Back to the device limitations...
> 
> The first is that PWM values can be set, but not read back.  And neither
> hwmon[1] nor lm-sensors' pwmconfig/fancontrol expect pmw* attributes to
> be WO.  One solution is to have the driver track the PWM values that are
> set through it and return those, but is this acceptable?
> 
> The other starts with PWM control being disabled for channels that the
> device identifies as unconnected.  This is not in itself a problem, but
> the initialization routine (where the detection happens) is
> asynchronous, takes somewhere around 5 seconds, and we do not have any
> way of directly querying its result.  We only know the control mode of
> each channel (be it DC, PWM or disabled) from the regular status
> reports.
> 
> These limitations make it complicated to simply use is_visible() to hide
> pwm attributes of unconnected channels.  We would need to register with
> the hwmon subsystem only after getting enough post-initialization status
> reports for all channels, and this would essentially mean to sleep for
> 6+ seconds.  We would also need to unregister and re-register when going
> through a suspend-reset_resume cycle, because the device may have its
> state wiped, requiring reinitialization.[2]
> 
> A different approach to handle this, which I have preferred _so far,_ is
> to use pwm*_enable = 0 to report the unconnected channels to user-space,
> while keeping the other pwm attributes visible.  But this comes with
> other problems.
> 
> First, lm-sensors' pwmconfig expects to be able to write to a
> pwm*_enable attribute if it exists, but the device does not support that
> operation.  The hwmon documentation states that RW values may be RO, but
> pwmconfig is out there and in use.  So far I simply return 0 to attempts
> at those writes, silently ignoring them; functional, but certainly a
> hack.
> 
> Second, if PWM control is disabled for a channel, but its pwm* and
> pwm*_mode attributes are still visible, what should we return when
> user-space attempts to write to them?  The practical answer may simply
> be to return -EOPNOTSUPP, but this makes me wonder if the whole approach
> (of handling these cases with pwm*_enable instead of is_visible()) is
> not doomed.
> 
> A final minor problem is that channels detected as unconnected run at
> 40% PWM, but the documentation for pwm*_enable == 0 is a bit too
> specific: "no fan speed control (i.e. fan at *full* speed)" (emphasis
> mine).
> 
> Do you have any suggestions and/or recommendations?
> 
> If it helps, a pre-RFC (but functional and mostly clean) version of the
> driver can be found at:
> 
> https://github.com/jonasmalacofilho/linux/blob/p-hwmon-add-nzxt-smartdevice-gridplus3/drivers/hwmon/nzxt-smartdevice.c
> 
> Thanks,
> Jonas
> 
> [1] According to Documentation/hwmon/sysfs-interface.rst.
> [2] The device also does not respond to HID Get_Report, so it is not
>     trivial to check whether it really needs to be reinitialized, since
>     the only symptom of that being necessary is the absence of the
>     asynchronous status reports.
