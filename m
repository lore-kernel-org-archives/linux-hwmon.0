Return-Path: <SRS0=WP0z=C5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACC6C43465
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Sep 2020 18:09:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A30CC20874
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Sep 2020 18:09:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="VAZFW+kA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgITSJ6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 20 Sep 2020 14:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgITSJ6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 20 Sep 2020 14:09:58 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A19C061755
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Sep 2020 11:09:57 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id o5so10437255wrn.13
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Sep 2020 11:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o9ZSr26pTGhws676MKwCogvk/ryi/f/aEAtVcjlVGEM=;
        b=VAZFW+kAPphxZNKzO6kHbetDqXvYaSwmCiCcWIx/P+C5HG3STH9iSPgO7U5NkxB5KP
         rmaOK+z5+J3y5GgiXUj4FS2+EPfZj4kW2QXVtlh60KTbv9BPfOG+OHbLj5GdIAJO5jrr
         zKUXH1w+Ny3KmfDYVBF4OETylc/q4+IepAwzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o9ZSr26pTGhws676MKwCogvk/ryi/f/aEAtVcjlVGEM=;
        b=uoZzmvyf9cS9eE/lQitWXcCuBKlKhM+k/osEZ0DhWUhUsFTZ7WXADkkycp62LV7hKU
         mjUwFq3nbgOlYMQfn8Nfrr511QuqVAjfwPkKiCyWYvdqaJs43X7rvS3/m3Izki/qBd35
         qGTH0kHMgoVrFrzYrBuO6YQC239AnR+zuZD0LVstVagsk3NGzhmvkxwgsohGX77udy2e
         6LWYu0oA6tUFtv0EkPQO6DbFjHBAoWJYd+ZzioX5CzCwx4fVxjgfMl/Q29WISP/0uZp6
         6reoEVfvk1yEs1QDh6INheMW7XLiEt+68dsFAZ5zgwsBTBN2mv8+2C+27lprsIKhQJTf
         eJ5g==
X-Gm-Message-State: AOAM532V/MrGIv7W4gPE8D76rOzG5PkSi9B+N4udLrAXxjzZSrfIruXX
        rMHHZvyXFo9oBLN5ZkL4ZgMTOA==
X-Google-Smtp-Source: ABdhPJw+e+xRzaJR94poeEWW7ELiQKfPdMAMwsfeuDmouRMBB4x/0QPdJaP6yONiMzCS79RWxoK9Fg==
X-Received: by 2002:a5d:6a45:: with SMTP id t5mr52074581wrw.58.1600625396644;
        Sun, 20 Sep 2020 11:09:56 -0700 (PDT)
Received: from ar2.home.b5net.uk ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id h186sm15823702wmf.24.2020.09.20.11.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 11:09:56 -0700 (PDT)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH 0/2] pwm-fan: Support multiple tach inputs & fix RPM calc
Date:   Sun, 20 Sep 2020 19:09:41 +0100
Message-Id: <20200920180943.352526-3-pbarker@konsulko.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200920180943.352526-1-pbarker@konsulko.com>
References: <20200920180943.352526-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

These changes were made to support a custom board where one PWM output
is routed to two fans, each of which has a tachometer signal routed to a
GPIO input on the SoC. While debugging on this board it was found that
the RPM readings were being overestimated due to a bug in the
calculation code so I've included a fix for that.

As the custom board doesn't currently support the latest mainline kernel
I've tested these changes on a SanCloud BeagleBone Enhanced using an
oscilloscope to check the PWM output and a signal generator to simulate
the fan tachometer signals. I've tested variants of the device tree with
0, 1 and 2 fan tachometer inputs configured to ensure the logic in the
probe function is correct.

The device tree bindings changes have been submitted in a separate
patch.

These changes can also be pulled from:

  https://gitlab.com/pbarker.dev/staging/linux.git
  tag: for-hwmon/pwm-fan_2020-09-20

Paul Barker (2):
  hwmon: pwm-fan: Support multiple tachometer inputs
  hwmon: pwm-fan: Fix RPM calculation

 drivers/hwmon/pwm-fan.c | 164 ++++++++++++++++++++++++----------------
 1 file changed, 100 insertions(+), 64 deletions(-)


base-commit: 2835d860d3fcc3e4829e96987544e811d35dee48
-- 
2.28.0

