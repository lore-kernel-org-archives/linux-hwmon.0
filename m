Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C2AC38159
	for <linux-hwmon@archiver.kernel.org>; Wed, 18 Jan 2023 13:08:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbjARNIl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 18 Jan 2023 08:08:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbjARNHw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 18 Jan 2023 08:07:52 -0500
Received: from mail.zeus06.de (www.zeus06.de [194.117.254.36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7301912F08
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Jan 2023 04:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=kicherer.org; h=from:to
        :cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=yvQAZbCJCz8mPdqAu5EqhSO3xtt
        nvCAfcEXbhrl040c=; b=TbzvNzm8zOMRmmF8XPcwHY1F4JDgrP7JZHC1kg1GmgJ
        rJzCQUdZHgAc1mg+lAhhMREbyyECEXTGtEwkOVOV3YdDa4jk+SeFMirACTGha9ec
        iI8lWWqIaoHrQLv7Prqs0y0JFoQu1A1hNiP03yad1MXeiAl611JKPbvA5lDKyMQw
        =
Received: (qmail 1506375 invoked from network); 18 Jan 2023 13:30:23 +0100
Received: by mail.zeus06.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jan 2023 13:30:23 +0100
X-UD-Smtp-Session: l3s6476p2@YDrZ+ojyrffCtAHJ
From:   Mario Kicherer <dev@kicherer.org>
To:     linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        Mario Kicherer <dev@kicherer.org>
Subject: [PATCH v4 0/3] hwmon: add initial NXP MC34VR500 PMIC monitoring support
Date:   Wed, 18 Jan 2023 13:30:16 +0100
Message-Id: <20230118123019.3041303-1-dev@kicherer.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add initial monitoring support for the MC34VR500 PMIC. In its current
state, input voltage and temperature alarms are reported to hwmon.

Changes since v3:
 - added specific #includes
 - use INTSENSE0 instead of INTSTAT0 register to query alarm status
 - abort probe if hwmon_device_register fails
 - fixed interrupt clear and unmask
 - added device tree match id
 - removed client from struct mc34vr500_data
 - fixed commit messages
 - fixed filename and node name in dtbinding

Changes since v2:
 - split documentation and dt-bindings patch

Changes since v1:
 - included required #defines directly in the C file
 - removed separate header file
 - removed #defines for unimplemented sensors
 - removed error log output
 - use hwmon_device_register_with_info API
 - cleaned probe function


Mario Kicherer (3):
  dt-bindings: hwmon: add nxp,mc34vr500
  docs: hwmon: add docs for the NXP MC34VR500 PMIC
  hwmon: add initial NXP MC34VR500 PMIC monitoring support

 .../bindings/hwmon/nxp,mc34vr500.yaml         |  36 +++
 Documentation/hwmon/mc34vr500.rst             |  30 ++
 drivers/hwmon/Kconfig                         |   7 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/mc34vr500.c                     | 262 ++++++++++++++++++
 5 files changed, 336 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nxp,mc34vr500.yaml
 create mode 100644 Documentation/hwmon/mc34vr500.rst
 create mode 100644 drivers/hwmon/mc34vr500.c

-- 
2.34.1

