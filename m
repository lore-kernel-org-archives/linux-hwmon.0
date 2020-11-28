Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553CAC8301A
	for <linux-hwmon@archiver.kernel.org>; Sat, 28 Nov 2020 22:19:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B60C221FD
	for <linux-hwmon@archiver.kernel.org>; Sat, 28 Nov 2020 22:19:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="QTHHFfyI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388746AbgK1Vto (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 28 Nov 2020 16:49:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731368AbgK1SAo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 28 Nov 2020 13:00:44 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E4CEC0A3BDF
        for <linux-hwmon@vger.kernel.org>; Sat, 28 Nov 2020 09:49:13 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id k14so9116891wrn.1
        for <linux-hwmon@vger.kernel.org>; Sat, 28 Nov 2020 09:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vRaBYMrmWKkT6V3qyd7QdmvRflyrzB0bQLS6FqdpjT4=;
        b=QTHHFfyIqCoYevzlRgeLNGyC5bz4RdUWAx/wgN+7Zv4Ov7wskjGtK49qVA1WPBO/Dd
         ukRfWTzklordcpLrbLewxjtFeb1D2Gc/VeYMfZKCwX/Njoo5c3jwzDAfX1s35/9OGELv
         AC20LH2nAKtHyyORbEjrG1vci+H8zQ3Zn3aEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vRaBYMrmWKkT6V3qyd7QdmvRflyrzB0bQLS6FqdpjT4=;
        b=FoYWFa1abKVZbJ+1Bm8HX2dinu7d1YBhuAb85pG993h4PQ6b7jO8+VUE+3lbYJmq9n
         nAp6mF7xUQ5BWjS5Evw9YafYBbN3/TbELoctE3Jf1UE1IFIUhUPyXMsW87wdObUinacP
         J+HMrLTEQF0LBBPpTUKSb+BiBK7LwKURM+KczVXT0WTqmVls2k7nmFhHf+jhpaAfM50q
         Rx4wFDGYzfXyND6U2PXdZN+D7fd7fnS7QCxlYGH5+F35Dwuxo/rC8w4O9G/1sNrMjWxO
         bGx5AqG/AZNaplrpECGs4c0OPYQAgX/Tmu79xkUY2zj1a44GN/jzbcYaFnHla8njcTLW
         +S+g==
X-Gm-Message-State: AOAM533IL9djCZiy3WPbL2WBBOjcmLlgrHWUalolkoBnJ36OFz2Pnx7i
        yAIQfq8cztp12LL5wg6LLvwp0zUVMmH9CQ==
X-Google-Smtp-Source: ABdhPJzSH7BDptTmU4oHoUo6CCdkkKggBCGwByrZYbSuys6dkIGP4bE7hTct2gux+XxLzx4XPxQhQw==
X-Received: by 2002:adf:ec0c:: with SMTP id x12mr19114723wrn.307.1606585752272;
        Sat, 28 Nov 2020 09:49:12 -0800 (PST)
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id s133sm17991481wmf.38.2020.11.28.09.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 09:49:11 -0800 (PST)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 0/2] pwm-fan: Refactor and convert to recommended API
Date:   Sat, 28 Nov 2020 17:49:07 +0000
Message-Id: <20201128174909.26687-1-pbarker@konsulko.com>
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
  tag: for-hwmon/pwm-fan-refactor-v2_2020-11-28

Changes from v1:

  * Addressed review comment from Guenter: Simplify pwm_fan_write, return
    -ENOTSUPP from pwm_fan_read if the wrong type is given, use devm_kcalloc
    instead of devm_kzalloc to ensure multiplication is safe.

Paul Barker (2):
  hwmon: pwm-fan: Refactor pwm_fan_probe
  hwmon: pwm-fan: Convert to hwmon_device_register_with_info API

 drivers/hwmon/pwm-fan.c | 164 +++++++++++++++++++++++++---------------
 1 file changed, 104 insertions(+), 60 deletions(-)


base-commit: e6e2c18f63c62df778ce484945fccad088594533
-- 
2.26.2

