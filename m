Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C18C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jan 2022 09:54:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352916AbiASJyX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Jan 2022 04:54:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352824AbiASJyU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Jan 2022 04:54:20 -0500
Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [IPv6:2001:67c:2050:1::465:111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 337BEC061574
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jan 2022 01:54:20 -0800 (PST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4Jf1FN67V6z9sjM;
        Wed, 19 Jan 2022 10:54:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sylv.io; s=MBO0001;
        t=1642586055;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=9EZRZt5cKrrHLDj85utYbbaGFfLVXTvquovrmZ367m8=;
        b=p1OH/Ybb1zeBAkBiZ1hzmmpet2t2ANlqynp27p7iHtPPNzsgONuFfYiYrjTyjHEVyh3Mum
        X6w03wFzy+tkohVLQDgW4p0HZssDCsLCUjljn8NNm2Sta1bm7PlFjxovll3kuhcUtpg3Fk
        uEiH7KxEiBovLuT3oDi1p2+LxEDf4Q3DI8HHYZJAKqJ17BXX/sop/JbmGAml9x/Z6fDtTc
        bSAiBWfjQsKPFuxL3dzOaD6p3IXzn5aM6mqyk0ur875LrtRfIu3gr0jVacYyce1UW0TfBM
        1Hw7jEpl9ffJkEOMPWGz2bhD79ar4YPJN6m0nm0qVD0zfSfh6IBWBzyvEZL6fA==
From:   Marcello Sylvester Bauer <sylv@sylv.io>
To:     linux-hwmon@vger.kernel.org
Cc:     Marcello Sylvester Bauer <sylv@sylv.io>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v3 0/4] Add max6639 regulator and devicetree support
Date:   Wed, 19 Jan 2022 10:53:51 +0100
Message-Id: <cover.1642585539.git.sylv@sylv.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

these patches add devicetree support for the Maxim MAX6639.
In addition, it includes optional regulator support for the fan-supply and
updates the URL to the datasheet.

Changes in v3:
- Remove warning if devm_regulator_get_optional returns an error.

Changes in v2:
- dt: Rename polarity to pwm-polarity.
- Remove unused platform_data header.
- Remove regulator enable/disable calls in pwm_store due to imbalance of
  calls.
- Move to strict per channel dt configuration without defaults.

Marcello Sylvester Bauer (4):
  hwmon: (max6639) Update Datasheet URL
  hwmon: (max6639) Add regulator support
  dt-bindings: hwmon: Add binding for max6639
  hwmon: (max6639) Change from pdata to dt configuration

 .../bindings/hwmon/maxim,max6639.yaml         | 112 +++++++++
 Documentation/hwmon/max6639.rst               |   2 +-
 drivers/hwmon/max6639.c                       | 233 ++++++++++++++----
 include/linux/platform_data/max6639.h         |  15 --
 4 files changed, 295 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
 delete mode 100644 include/linux/platform_data/max6639.h

-- 
2.33.1

