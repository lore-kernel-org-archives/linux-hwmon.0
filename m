Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15DEC6379F
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 Jan 2023 16:13:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjAQQN6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 Jan 2023 11:13:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbjAQQN5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 Jan 2023 11:13:57 -0500
Received: from mail.zeus06.de (www.zeus06.de [194.117.254.36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35BFF3C2A8
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Jan 2023 08:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=kicherer.org; h=from:to
        :cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=zU7frCN0d9TT0Wwpkv8HanroHdF
        Zsg/PjkU3mZsb9/o=; b=YFXkS0bovtsBpYso2ymRITkfLHgnzyZn8m4CnJM518m
        rDon4Dof9HkvZAeINo4cwiudBmo5n0dSYS4AAsLSBrdACcsXu2xuhUzynPGTcEiz
        +dK+j0W6A0E9Xo6sAsfkrvtuwYyClasHS7XcSmcX2gKu9jtnxYmXMVKtg8NwuTZI
        =
Received: (qmail 1170832 invoked from network); 17 Jan 2023 17:13:54 +0100
Received: by mail.zeus06.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jan 2023 17:13:54 +0100
X-UD-Smtp-Session: l3s6476p2@Q+dR/Hfy1u7CtAHJ
From:   Mario Kicherer <dev@kicherer.org>
To:     linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        Mario Kicherer <dev@kicherer.org>
Subject: [PATCH v3 0/3] add initial NXP MC34VR500 PMIC monitoring support
Date:   Tue, 17 Jan 2023 17:13:37 +0100
Message-Id: <20230117161340.1310936-1-dev@kicherer.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch adds initial monitoring support for the MC34VR500 PMIC. In its
current form, input voltage and temperature alarms are reported to hwmon.

Changes since v2:
     - split documentation and dt-bindings patch

Changes since v1:
     - included required #defines directly in the C file
     - removed separate header file
     - removed #defines for unimplemented sensors
     - removed error log output
     - use hwmon_device_register_with_info API
     - cleaned probe function
     - added documentation for chip and dt bindings

Mario Kicherer (3):
  hwmon: add initial NXP MC34VR500 PMIC monitoring support
  dt-bindings: hwmon: add nxp,mc34vr500
  docs: hwmon: add docs for the NXP MC34VR500 PMIC

 .../bindings/hwmon/nxp,mc34vr500.yaml         |  36 +++
 Documentation/hwmon/mc34vr500.rst             |  32 +++
 drivers/hwmon/Kconfig                         |   7 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/mc34vr500.c                     | 245 ++++++++++++++++++
 5 files changed, 321 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nxp,mc34vr500.yaml
 create mode 100644 Documentation/hwmon/mc34vr500.rst
 create mode 100644 drivers/hwmon/mc34vr500.c

-- 
2.34.1

