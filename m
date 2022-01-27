Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560B2C4332F
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Jan 2022 16:17:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238004AbiA0QRq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Jan 2022 11:17:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243566AbiA0QRo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Jan 2022 11:17:44 -0500
Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [IPv6:2001:67c:2050:1::465:209])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78BBDC061748
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Jan 2022 08:17:44 -0800 (PST)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:105:465:1:4:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4Jl5N45sXtz9sR8;
        Thu, 27 Jan 2022 17:17:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sylv.io; s=MBO0001;
        t=1643300259;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=q6iXyVSrMGBtTfdlahBC92ITnlbOSSzzZPISPHpxkR0=;
        b=uRg5pynHjgcfJHGtg8LrIUBGP+hjxHkgWIQaMWJdTGI3S/DAR1O8eg4bA2QIGWb+DudfY4
        hIHKGOh9U99nDwS6rqhvvvrdk3tPM+8RIL3fgD6Bfo55CWW/jsjs33FfKPfeB2EsquZ4Kt
        WmTu8RTD0bmx4qWvSWxhbfFhba6cWYXAkL3dEa77l/FwegttmXpJ4l7UXE3QGIM9wtlTaQ
        LQ4TZP6zPv5RwyCi6Czl6hOplaYeT/JbPp/OAm85J64tOCOIzPLnU+5SYTLn26NTonY6D8
        sk4nxJOo3Ux/2EvKEITm365O0zVPrxWhKUSI+lxqwce3vCwbwCTAvvhJyaQGrQ==
From:   Marcello Sylvester Bauer <sylv@sylv.io>
To:     linux-hwmon@vger.kernel.org
Cc:     Marcello Sylvester Bauer <sylv@sylv.io>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v4 0/4] Add max6639 regulator and devicetree support
Date:   Thu, 27 Jan 2022 17:17:26 +0100
Message-Id: <cover.1643299570.git.sylv@sylv.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

these patches add devicetree support for the Maxim MAX6639.
In addition, it includes optional regulator support for the fan-supply and
updates the URL to the datasheet.

Changes in v4:
- dt: rename rpm-range property to rpm-max
- dt: make rpm-max, pulses-per-revolution, and pwm-polarity optional

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
 drivers/hwmon/max6639.c                       | 224 ++++++++++++++----
 include/linux/platform_data/max6639.h         |  15 --
 4 files changed, 286 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
 delete mode 100644 include/linux/platform_data/max6639.h

-- 
2.34.1

