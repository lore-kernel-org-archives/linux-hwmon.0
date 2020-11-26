Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4342DC56202
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Nov 2020 17:44:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E26BC207BC
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Nov 2020 17:44:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="fI52g7tq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391576AbgKZRoQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Nov 2020 12:44:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391549AbgKZRoQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Nov 2020 12:44:16 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D06B9C0613D4
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2020 09:44:14 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id a186so2852710wme.1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2020 09:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T3vAcGrxAeM9i+XGijMvdCjmwkO9mh98zr6AUe1ScFo=;
        b=fI52g7tqbc8RjHOZWQ3yruljqxOjg7JIxn801HJLlChUu3h4Klu+ahu7FMSQFjg0MQ
         KYG0Py4B/fxAWJ2yRr2IzEKPF00iC1ZuWNXPAb15xB0kK6Ggrdg+S8AOCUKVVKJCm23D
         X9lnurfnFkaVHEqoG73u4aCBgYjinYG+xuHLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T3vAcGrxAeM9i+XGijMvdCjmwkO9mh98zr6AUe1ScFo=;
        b=kunihZKfgVukDkEA4F+MVVuYWNPQKp2NUTB8NuGDkELwDgojBsKHZeLtBGbnEU7u30
         +72oiabFGmnaCk8UoQJ9gx+Lby6PqCWWLg2gfa/1XzgTzjFqM59kLqirbN4kvivILxDr
         a8Ol7fHMH/0TZ5a1ltG3hyAyp+yv7jYdsWcZTwMQDXOgT6v7TBGXCheVVTIpty+/xse6
         NlFcSwYHrsKW1kjh1eU0mNQG6BaNEh8YAjM2bNoF7jvAjRegSc5vPqNHLNjaYUTt6zgo
         G5tEBGkE35fSH40rddmdn7CbGOidKSnIHG9BGyVtB8abXbzC2G+kv2uR2Pzjs7y6R279
         Yc6g==
X-Gm-Message-State: AOAM531mei+D8gQqlnDouLt2Dw7DGUhGIvf1NYf1SLG+lNJvVKCspkKA
        BCceozl7BVtSP6hSQ1sDMN6hbg==
X-Google-Smtp-Source: ABdhPJwP4rL7H756pWFxS7t9Eca4Xh67uTnoh8b4Z/B7Q8mgw8D93QRwpigtRnvTuuK6UYru1ZucbQ==
X-Received: by 2002:a1c:2d47:: with SMTP id t68mr4651087wmt.148.1606412653527;
        Thu, 26 Nov 2020 09:44:13 -0800 (PST)
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id h98sm11578582wrh.69.2020.11.26.09.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 09:44:12 -0800 (PST)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH 0/2] pwm-fan: Refactor and convert to recommended API
Date:   Thu, 26 Nov 2020 17:44:06 +0000
Message-Id: <20201126174408.755-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This series includes the first patch from my previous series adding support
for multiple fan tachometers [1] which Guenter has already reviewed, plus a
second patch to convert the driver to use the hwmon_device_register_with_info
API as requested.

These patches have been tested on a SanCloud BeagleBone Enhanced using an
oscilloscope to check the PWM output and a signal generator to simulate
the fan tachometer signals. I've tested both with and without a fan
tachometer input defined in the device tree.

There shouldn't be any functional change to the driver after these patches,
it just puts us in a much better place for further development.

These changes can also be pulled from:

  https://gitlab.com/pbarker.dev/staging/linux.git
  tag: for-hwmon/pwm-fan-refactor_2020-11-26

Paul Barker (2):
  hwmon: pwm-fan: Refactor pwm_fan_probe
  hwmon: pwm-fan: Convert to hwmon_device_register_with_info API

 drivers/hwmon/pwm-fan.c | 162 ++++++++++++++++++++++++++--------------
 1 file changed, 104 insertions(+), 58 deletions(-)


base-commit: e6e2c18f63c62df778ce484945fccad088594533
-- 
2.26.2

