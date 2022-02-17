Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C18C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Feb 2022 09:28:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238635AbiBQJ2P (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Feb 2022 04:28:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238134AbiBQJ2O (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Feb 2022 04:28:14 -0500
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA071B1D00;
        Thu, 17 Feb 2022 01:27:59 -0800 (PST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4JzqHc3s6Rz9sVt;
        Thu, 17 Feb 2022 10:27:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sylv.io; s=MBO0001;
        t=1645090074;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=lZBW8/OdtoSbB7RijRn6Z2UlrNUdNxfBaT5VLpRPy0Y=;
        b=eRdbSJijIC3IeNhSnIW4k/b1WSTBmxwZvHQiW3Cw6DXBDjsa52fyQ33gBfqc/2V0804ozJ
        pW0yF6y6SSnr6Nm7RJI/YDzRbaMNyRbjzJs5f0AmSMV/loGHog1OIJJFaqNafjlrnkqO2x
        USbr5saBe7bATrMVkFQ5XjYT+yw17WKm5AYYtCo5P8UALr7ZMVbaXBhLdgE+cUlMdrC2+Y
        r29LKvVMscEqTSgZS7di4UtsVHlWGpMePDSbRq7/tmz6SfBAd6I//IZK135didvavCpKlb
        kJ4rMWkM+L6BaXvC0NSlSdj0/cnf9gRxTlfusVAHR/C7xr4YIbpSdPQkgElH+Q==
From:   Marcello Sylvester Bauer <sylv@sylv.io>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Marcello Sylvester Bauer <sylv@sylv.io>
Subject: [PATCH v1 0/3] Support XDPE112
Date:   Thu, 17 Feb 2022 10:27:27 +0100
Message-Id: <cover.1645088804.git.sylv@sylv.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for Infineon Multi-phase XDPE112 family regulator. The main
difference to the XDPE122 family is it uses a different format for
voltage out. Add the required logic to the existing  xdpe12284 driver
accordingly.

Marcello Sylvester Bauer (3):
  dt-bindings: trivial-devices: Add xdpe11280
  hwmon (xdpe12284): Add support for xdpe11280
  hwmon (xdpe12284): Add regulator support

 .../devicetree/bindings/trivial-devices.yaml  |  2 ++
 Documentation/hwmon/xdpe12284.rst             | 10 +++++--
 drivers/hwmon/pmbus/Kconfig                   |  6 ++++
 drivers/hwmon/pmbus/xdpe12284.c               | 28 ++++++++++++++++++-
 4 files changed, 42 insertions(+), 4 deletions(-)

-- 
2.34.1

