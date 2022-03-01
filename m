Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381E0C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Mar 2022 18:01:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236777AbiCASCW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Mar 2022 13:02:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiCASCV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 Mar 2022 13:02:21 -0500
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [IPv6:2001:67c:2050::465:102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997A6403C9;
        Tue,  1 Mar 2022 10:01:39 -0800 (PST)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [80.241.60.245])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4K7Q6m2hRDz9sVt;
        Tue,  1 Mar 2022 19:01:36 +0100 (CET)
From:   Marcello Sylvester Bauer <sylv@sylv.io>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sylv.io; s=MBO0001;
        t=1646157694;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=qr3piLsJkvKGkvDAwPxtTYhjCFzK3baLQIKb7gE9Eyk=;
        b=13pqvHg8BmNMtk+415/+C6R/QYAV18PtdLz1K0z5n5eEw+XqxIVh+SB3Lz6T9/gypfFkek
        4/dQ+Jvo0KENvZC47T1OFF7Br4tS5XTatQ9yenreipcURLAVP8XEK2/tBoiT8bw8yKzvyF
        sfuNcf6B3Fj3gnA0wrQC0wt8IWET4gnpytRn0q5WyOQHOcH9H246pOkjq+m3xECOtsCPyc
        iwDMFCRTfh3D90GnXvQpkAa1CvCko4Q62ymSrPg52gz/cvlBDxwpwtBf/idbPNVSC/EmtY
        kSqTu975FdnAYwqTBDc392W3hKKUfpY76WgCvXxZev0Uizfvx8hbOmesfcB0vw==
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Marcello Sylvester Bauer <sylv@sylv.io>
Subject: [PATCH v3 0/3] Support XDPE112
Date:   Tue,  1 Mar 2022 19:01:10 +0100
Message-Id: <cover.1646157237.git.sylv@sylv.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for Infineon Multi-phase XDPE112 family regulator. The main
difference to the XDPE122 family is it uses a different format for
voltage out. Add the required logic to the existing xdpe12284 driver
accordingly.

Changes in v3:
- detect VOUT_MODE during probing
- set xdpe122_identify/xdpe122_read_word_data only if VOUT is vid

Changes in v2:
- rebase on current hwmon-next branch

Marcello Sylvester Bauer (3):
  dt-bindings: trivial-devices: Add xdpe11280
  hwmon (xdpe12284): Add support for xdpe11280
  hwmon (xdpe12284): Add regulator support

 .../devicetree/bindings/trivial-devices.yaml  |  2 ++
 Documentation/hwmon/xdpe12284.rst             | 12 ++++---
 drivers/hwmon/pmbus/Kconfig                   |  6 ++++
 drivers/hwmon/pmbus/xdpe12284.c               | 33 +++++++++++++++++--
 4 files changed, 46 insertions(+), 7 deletions(-)

-- 
2.35.1

