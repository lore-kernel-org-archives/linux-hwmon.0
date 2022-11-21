Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B885C4332F
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Nov 2022 12:29:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbiKUM3v (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Nov 2022 07:29:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbiKUM3o (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Nov 2022 07:29:44 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29ECB23BC4
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Nov 2022 04:29:43 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id x17so6163838wrn.6
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Nov 2022 04:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qjSeS005UQ5ZO0KT6/w85LwsSdKiXAQUVmbgaFh4T/E=;
        b=MII8aOSKSfsTMEl4KK2fh0Pgr6CSyuNNO7aIUnsX2QMqGSVUJR2AJlf3i0Twu6rLHt
         YdpMg07od2c9W0bHpumvhjz5DltfE2xcJKERPiMj7bJrYbLn5qMixCydeQPrHE3rdqRv
         VVx1uUmKtZ3SbZs5z0vnTBB2ZSsESe+37D72ts+cMTha0+pA7spU7Qc9N9ipLem/BCmu
         j5bXJI7Q/AMuIKPZc5rL14URMogUaecESoLpJcgqr6JunvLZumr+STRYqGLc2c17X8tm
         R61g2+QMyO+mCWBYWzgXQL0VaQH+mj/CiZtbms3B5YAfVpi+HK/Vly6NKOp8EFLBpC0C
         JMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qjSeS005UQ5ZO0KT6/w85LwsSdKiXAQUVmbgaFh4T/E=;
        b=p/gTwKunI3eJ+oHSksCyxVc20cfK6fa8iQZBRFA5UItPRogZUNcuGpmL7em9I0OU2h
         9S6w58MLvm+pPmhvOzS4b8H4mkHq1RfM9bkzndkoA5ObONA3M90gZOJ+LDH0UwQjTuUX
         CsVPgPJI43uDwLhuVZLFiHFhDi3n9nxfUeNeID8/muqmFO94oau9vF5iLqIfhtjJpD1w
         yY6PtuZ+28Drvt33HhQGGNuSfPX+XU9jihKy4SZy0huBS1N7sH+oaYQawuXSJJQV5WSn
         7iqpW7poHu1bTxlnkPuAidxMQdK9GvEqOhj3jVtuq7ynyrzGQioJCwumFj8FBU4pzqT7
         RL8Q==
X-Gm-Message-State: ANoB5plODV2mzsw7w8eVhhAA3YfXDyWnrVpMzDV5oP8tsfXkIqny1qlg
        ZZWQQlYwWKK7Wi48Sni3FVaa4KW0b1C3U629
X-Google-Smtp-Source: AA0mqf48P4Gsc00ilVeHi7rZ+7eqT+DPFSgIIq7gyuFeWpxsDaQkpcwKUKcA6SFXvqcrsKDa5QrnQA==
X-Received: by 2002:adf:ed4b:0:b0:241:d4c2:e741 with SMTP id u11-20020adfed4b000000b00241d4c2e741mr3046832wro.628.1669033781714;
        Mon, 21 Nov 2022 04:29:41 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id dn12-20020a05600c654c00b003cf6c2f9513sm13929015wmb.2.2022.11.21.04.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 04:29:41 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v7 0/4] Add devicetree support for max6639
Date:   Mon, 21 Nov 2022 13:29:28 +0100
Message-Id: <20221121122932.2493174-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

These patches adds devicetree support for MAX6639.

Changes in V7:
- Split the patch into
 1. add dt support for max6639
 2. Add pwm support
- Ad DT property min-rpm in fan-common.yaml
Changes in V6:
- Remove unused header file
- minor cleanup 
Changes in V5:
- Add pwms support
Changes V4:
- Fix dt error
- update comment
Changes V3:
- correct fan dt property name
- remove unrelevent changes
Changes V2:
- Fix dt schema error.
Changes:
- Add fan-common dt schema.
- add dt-binding support for max6639
- add max6639 specific property

Marcello Sylvester Bauer (1):
  dt-bindings: hwmon: Add binding for max6639

Naresh Solanki (3):
  dt-bindings: hwmon: fan: Add fan binding to schema
  hwmon: (max6639) Change from pdata to dt configuration
  hwmon: (max6639) Add pwm support

 .../devicetree/bindings/hwmon/fan-common.yaml |  47 ++
 .../bindings/hwmon/maxim,max6639.yaml         |  93 ++++
 drivers/hwmon/Kconfig                         |   1 +
 drivers/hwmon/max6639.c                       | 460 +++++++++++++++---
 include/linux/platform_data/max6639.h         |  15 -
 5 files changed, 527 insertions(+), 89 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
 delete mode 100644 include/linux/platform_data/max6639.h


base-commit: 27fea302952d8c90cafbdbee96bafeca03544401
-- 
2.37.3

