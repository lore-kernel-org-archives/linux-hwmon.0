Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5856C4332F
	for <linux-hwmon@archiver.kernel.org>; Wed, 16 Nov 2022 21:36:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234467AbiKPVgn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 16 Nov 2022 16:36:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234341AbiKPVg2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 16 Nov 2022 16:36:28 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D0B01208D
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Nov 2022 13:36:22 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id w14so32210852wru.8
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Nov 2022 13:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=To0SGhju10/tNZo+ykbCXk5at3KgpKIkkD0Iu7gHoH4=;
        b=AixU5wYbRtIAnMucvUFSxQvpTrTou7lJDR4gMEhy0v+Zn+BFpo3B0aT7ezYBMZGwJF
         6PKCVl64S5OkxiciJXq3ZfXg83YjD+zJStTGFfL3522p3YCqg1WdqVfQVI8Tn0XGYMZq
         RrTxdbCtqE25j4NpzurCu/Uf4K+hfUiI6HMdynhJ60yF2cypfxRPJW/eMsxW+tv1EEuz
         QQCFZ9p6hoaPdo9Ny7sUI5420Fpopsoi9YqEKz22eib8Hvr/Tqe1nMScxOK0kpunwpFt
         LbOBmO2zvP6JMBTT4DkzYDEmw/f0Lnr2HCe58lAsS2iYD5lb9AiHbhQS8+9jge3wwx5+
         ix9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=To0SGhju10/tNZo+ykbCXk5at3KgpKIkkD0Iu7gHoH4=;
        b=Ot+xR2o7Xd+3LgFk0y16gorjHLiXLkW8F1k11s7FReUTcJNQh0w7zfLCWng2R1UDW+
         aJ2z5hNXo0z+ZXZ3hooIeentJ+om+Msiww4CY4WCkEYX3IT08lfsOvdFwEfm0PZHWnSg
         tMjU75ZumFL72CqzvSsLrFvht5TWGPxueTrghOTCO48Qk8d3VCoWZcMlYYclcwlfumdO
         juTpQEslSXH/ws002vSvMEXC4UZ+2H1zFqlf1w2hMXbboejHKc02KbE9ujDKFr0ZzfMI
         gUJ+E3rDH5xrXepsQulswnC6uCJTqlo4nu4WTLFiz0WsUQKXlPjqx8idp9yRFbonuG4e
         8PHQ==
X-Gm-Message-State: ANoB5pmNTNCNdqerd9GJ+SBYrYvwW5klAOyljG5+/DDzyjN3po4oM1uS
        1LarwKHMGzIkG7n9e2M2O9NCFw==
X-Google-Smtp-Source: AA0mqf5Oe1ZaI5eG6YmRfi66xfOvKBFlUNac0sPPM5XqKjZc9bT/15KZpwPH1rrp4lqL8Yi0lJrTmQ==
X-Received: by 2002:a5d:5913:0:b0:236:e0d:9ad with SMTP id v19-20020a5d5913000000b002360e0d09admr15216920wrd.692.1668634580668;
        Wed, 16 Nov 2022 13:36:20 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id fn15-20020a05600c688f00b003b47ff307e1sm3133045wmb.31.2022.11.16.13.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 13:36:20 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v6 0/3] Add devicetree support for max6639
Date:   Wed, 16 Nov 2022 22:36:12 +0100
Message-Id: <20221116213615.1256297-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

These patches adds devicetree support for MAX6639.

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

Naresh Solanki (2):
  dt-bindings: hwmon: fan: Add fan binding to schema
  hwmon: (max6639) Change from pdata to dt configuration

 .../devicetree/bindings/hwmon/fan-common.yaml |  42 ++
 .../bindings/hwmon/maxim,max6639.yaml         |  93 ++++
 drivers/hwmon/Kconfig                         |   1 +
 drivers/hwmon/max6639.c                       | 460 +++++++++++++++---
 include/linux/platform_data/max6639.h         |  15 -
 5 files changed, 522 insertions(+), 89 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
 delete mode 100644 include/linux/platform_data/max6639.h


base-commit: 27fea302952d8c90cafbdbee96bafeca03544401
-- 
2.37.3

