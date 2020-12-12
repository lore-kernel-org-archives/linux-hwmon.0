Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78EAC4361B
	for <linux-hwmon@archiver.kernel.org>; Sat, 12 Dec 2020 19:51:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E1A122257
	for <linux-hwmon@archiver.kernel.org>; Sat, 12 Dec 2020 19:51:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407850AbgLLTuy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 12 Dec 2020 14:50:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407848AbgLLTux (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 12 Dec 2020 14:50:53 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71CC8C0613D3
        for <linux-hwmon@vger.kernel.org>; Sat, 12 Dec 2020 11:50:12 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id x22so10358820wmc.5
        for <linux-hwmon@vger.kernel.org>; Sat, 12 Dec 2020 11:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2vgF1w7aNt89m+fhML2A9LVTfd/7zqNE43wd33P5iyA=;
        b=N4NhUMfgW0mW+gMg3LtdWhPrD9Gu1b4X1eda64PjJzPsOX+x/6w+IIg9lCEJl4gTUW
         IrIflcT/MSnqIBvHLm9UjTaI4qwDQ/qtycTPWpQZG0QCqol67nI6kmg5wbz9qjEJluw+
         DDDqUL9tSuk341zlnhphfZnZrxba32aCNWyy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2vgF1w7aNt89m+fhML2A9LVTfd/7zqNE43wd33P5iyA=;
        b=pUkSFBd29ZSZr4W0stWKoB343Hyav0MHsfTdTwTcBXulNMwc9EhHVwTHoHnIP5iZUH
         FQvt8ziJuioVV4SkERpnb4sNR+wUB71U9HiwhGUHL+uVyUJwK7zlJL38jqElIGCvn/L0
         npgNXkuYzaRfbqqIZuJKIWa6C+w/z8fboVgT7wwTA+l4pn8GXKna3LukX102bnVleL8h
         jOL3BqGibw+cT22E6JyAMIsKO88wFeKY+2p33oAXhst14jNwQ6Gcq3d1zZzVUL/CPanw
         8nQo2UoKINuBrln6UReExupzowinNq/2VyPKr3OBOfY+HIHTG8jtxJqgSC33aakpuhGZ
         U9jQ==
X-Gm-Message-State: AOAM531f1iMrQoEJP3w33CpMJwdm9gWZ36bVo4LqrHHcucmC21nl5Cq2
        7QQuh+7oNk/g/7UfLp67xdli+Q==
X-Google-Smtp-Source: ABdhPJwja/hHnETNi+Y+SAKlLKmIa/d+XxRbKsTFHxn2tLFMvdMHYlmK4xkRK4obgM2ki2Zd3KWVMw==
X-Received: by 2002:a1c:1bcc:: with SMTP id b195mr20036667wmb.131.1607802611068;
        Sat, 12 Dec 2020 11:50:11 -0800 (PST)
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id u66sm22128086wmg.2.2020.12.12.11.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Dec 2020 11:50:10 -0800 (PST)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH v3 0/2] pwm-fan: Support multiple tachometer inputs
Date:   Sat, 12 Dec 2020 19:50:06 +0000
Message-Id: <20201212195008.6036-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

These changes were made to support a custom board where one PWM output
is routed to two fans, each of which has a tachometer signal routed to a
GPIO input on the SoC.

As the custom board doesn't currently support the latest mainline kernel
I've tested these changes on a SanCloud BeagleBone Enhanced using an
oscilloscope to check the PWM output and a signal generator to simulate
the fan tachometer signals. I've tested variants of the device tree with
0, 1 and 2 fan tachometer inputs configured to ensure the logic in the
probe function is correct.

The device tree bindings changes have been submitted in a separate
series:
https://lore.kernel.org/linux-devicetree/20200920180943.352526-1-pbarker@konsulko.com/

These changes can also be pulled from:

  https://gitlab.com/pbarker.dev/staging/linux.git
  tag: for-hwmon/pwm-fan-tachometers-v3_2020-12-12

Changes since v2:

  * Split refactoring and API conversion into a separate patch series
    which has now been accepted. These changes now use the recommended
    hwmon API and dynamically allocate struct hwmon_channel_info
    objects as needed.

  * Rebased changes on the current HEAD of hwmon-next.

Changes since v1:

  * Split RPM calculation fix into a separate patch which has now been
    accepted.

  * Break the changes down into smaller patches so they're easier to
    review.

  * Rebased changes on hwmon-next.

Paul Barker (2):
  hwmon: pwm-fan: Store tach data separately
  hwmon: pwm-fan: Support multiple fan tachometers

 drivers/hwmon/pwm-fan.c | 111 +++++++++++++++++++++++++---------------
 1 file changed, 69 insertions(+), 42 deletions(-)


base-commit: 1a033769a4fe9a86ee791fd553b6a996dd76e026
-- 
2.26.2

