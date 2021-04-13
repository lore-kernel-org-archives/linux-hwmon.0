Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89BD2C433B4
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Apr 2021 12:46:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6473E611CE
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Apr 2021 12:46:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345804AbhDMMq6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 13 Apr 2021 08:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345829AbhDMMpz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Apr 2021 08:45:55 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0443C06138C
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Apr 2021 05:45:33 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id g24so12549462qts.6
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Apr 2021 05:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=protocubo.io; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=2pTGEuz8Mersa6tWS3oU7Rvv4CGe+UUW2AnTlYODVfQ=;
        b=boaHmbmhpSuXbreREPtAlCWcol7tqbMUSaF/X2vpChU+rrRsNIkX7pzOTMykCwbRhZ
         D66+H+jvZlnjnXZ47s40nUD5dfstoqjMchdviqBQSmeR9zbPxH5thh/DFi0FF0uBPH5f
         z5rdD/zPEIujxzPlW26GfO/0az+8Swwdiid6rCPaduYYB6q+q/amdMRWyomuBj8sYv6Y
         jEPTJFyULxvcUuHUBZIJjhVk0Bt5U9t1PIXG4JCPWMcJJxNeU0TIu3B8pjPyl9r+AJbh
         dOD9/KsONNmrxAEh9xGSrhjuWgmW21+if3961QemJHm4I9TfaPRx7InJvo3qVmrH6hX1
         V7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=2pTGEuz8Mersa6tWS3oU7Rvv4CGe+UUW2AnTlYODVfQ=;
        b=djweG/xeK4NM33rKDkNc46Xp4wMnVPimJJuPkXVquPW48zAD0DqczESTyW2yavnEv0
         oabpZVIgurAm+JEx/27Fjn0ra6y4rNopgBLZjHN8is8bglWKEyFnyA9NvPwpNKzbHzPS
         mAv8/87CRUsdacwjMQDDBex+VxL1x+gxku856ZT3qXmnqLLFJVokmtqrSX9u+5ZgyGo/
         lDheCdYG6mqPS8tpOuOlg7zMoHdN6TYJh+PcVrtWuHSslcpl/phhDNTn1ohio1jAjXqO
         egZeyHnaoBnNeiSDXY+hxGqyT231NcFRRpKAFr1XThD9v2aPxM8+HPQOMhsYRsutgWtc
         7HhQ==
X-Gm-Message-State: AOAM53229Ibe1+PvLUxEd8r7iejayS9Bwpkx/4nW7uOpkS9dZ5loKQfo
        D+7R5cb3OdOeI0kkwQRQgaoPxFPh4Y9OaQ==
X-Google-Smtp-Source: ABdhPJwrEmmy6353aZtM/cmVbY+7Sd75QjRxztT/ruGweryxDhyavAc00HKR5Bf/Rli47HfgdOy9Hg==
X-Received: by 2002:a05:622a:52:: with SMTP id y18mr6605193qtw.216.1618317932804;
        Tue, 13 Apr 2021 05:45:32 -0700 (PDT)
Received: from calvin.localdomain ([2804:14d:5c5a:802e:bdc9:ded9:cc08:a4e9])
        by smtp.gmail.com with ESMTPSA id n136sm4475360qka.133.2021.04.13.05.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 05:45:32 -0700 (PDT)
Date:   Tue, 13 Apr 2021 09:45:29 -0300
From:   Jonas Malaco <jonas@protocubo.io>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: PWM control in NZXT Grid+ V3 and Smart Device
Message-ID: <20210413124529.jdi6ambxusd47y34@calvin.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Guenter (and others on this list),

I am getting ready to submit a driver for NZXT Grid+ V3 and Smart Device
(V1) fan controllers, but I am having trouble deciding how to expose
their PWM control due to some device limitations.

Before getting into those, let me first give some very basic context...

These devices are USB HIDs, and asynchronously send "status" reports
every 200 ms to communicate speed, current, voltage and control mode for
their channels (one channel per report).

Fans can be controlled by sending HID output reports to the device, and
both DC and PWM modes are supported.  The device features a special
initialization routine (that must be requested during probe) which
automatically detects the appropriate control mode for each channel.

Back to the device limitations...

The first is that PWM values can be set, but not read back.  And neither
hwmon[1] nor lm-sensors' pwmconfig/fancontrol expect pmw* attributes to
be WO.  One solution is to have the driver track the PWM values that are
set through it and return those, but is this acceptable?

The other starts with PWM control being disabled for channels that the
device identifies as unconnected.  This is not in itself a problem, but
the initialization routine (where the detection happens) is
asynchronous, takes somewhere around 5 seconds, and we do not have any
way of directly querying its result.  We only know the control mode of
each channel (be it DC, PWM or disabled) from the regular status
reports.

These limitations make it complicated to simply use is_visible() to hide
pwm attributes of unconnected channels.  We would need to register with
the hwmon subsystem only after getting enough post-initialization status
reports for all channels, and this would essentially mean to sleep for
6+ seconds.  We would also need to unregister and re-register when going
through a suspend-reset_resume cycle, because the device may have its
state wiped, requiring reinitialization.[2]

A different approach to handle this, which I have preferred _so far,_ is
to use pwm*_enable = 0 to report the unconnected channels to user-space,
while keeping the other pwm attributes visible.  But this comes with
other problems.

First, lm-sensors' pwmconfig expects to be able to write to a
pwm*_enable attribute if it exists, but the device does not support that
operation.  The hwmon documentation states that RW values may be RO, but
pwmconfig is out there and in use.  So far I simply return 0 to attempts
at those writes, silently ignoring them; functional, but certainly a
hack.

Second, if PWM control is disabled for a channel, but its pwm* and
pwm*_mode attributes are still visible, what should we return when
user-space attempts to write to them?  The practical answer may simply
be to return -EOPNOTSUPP, but this makes me wonder if the whole approach
(of handling these cases with pwm*_enable instead of is_visible()) is
not doomed.

A final minor problem is that channels detected as unconnected run at
40% PWM, but the documentation for pwm*_enable == 0 is a bit too
specific: "no fan speed control (i.e. fan at *full* speed)" (emphasis
mine).

Do you have any suggestions and/or recommendations?

If it helps, a pre-RFC (but functional and mostly clean) version of the
driver can be found at:

https://github.com/jonasmalacofilho/linux/blob/p-hwmon-add-nzxt-smartdevice-gridplus3/drivers/hwmon/nzxt-smartdevice.c

Thanks,
Jonas

[1] According to Documentation/hwmon/sysfs-interface.rst.
[2] The device also does not respond to HID Get_Report, so it is not
    trivial to check whether it really needs to be reinitialized, since
    the only symptom of that being necessary is the absence of the
    asynchronous status reports.
