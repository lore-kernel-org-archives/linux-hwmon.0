Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044E2C25B4E
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Jan 2023 14:14:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234780AbjAXOOx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Jan 2023 09:14:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233767AbjAXOOn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Jan 2023 09:14:43 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B350142DC4
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 06:14:41 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id n7so14011354wrx.5
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 06:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Au4u9KBkIo5to8crSQusvLcqb1ZkXUDlXU6YC07WRXI=;
        b=gZAd503SLY6MJPqZDjkv8FhjyUSMk7GS7KaqF95p6p3jWsfu7lVw7q67XxdOnrFl7Q
         qHIkH08vS3YJPGl6XpIVBEksDZQkhrIwl3hP/cZi4NvIrgh+b9xKNn6STdCLte3T4CwV
         e0q/6e5B+YzgD9oyMooGjagxRK5USD9016yZiHd/99vUmgArlRhI0sO7lqV8odg7xci1
         y2ORxbe6fJ6ayZly3eYucsU4YrUBVgEsQh7GsUOqyGhpXh23YY/RlRlPn2CC+P8wE/rk
         4qRv5kkaxGNj+dpMvj6c7hLfuYYCWnVmb5pjxJpF+BjElQbUOmUXlQYNsfeP36QDmTMS
         7JHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Au4u9KBkIo5to8crSQusvLcqb1ZkXUDlXU6YC07WRXI=;
        b=bU2HkpTDH6Y0m3RD8Apo8DV3lxGsfzBnOhQJpShSQvxR4KPCOeMkLBaYOMfxV0+zwH
         NDRK+DG6nNpOfOLtRvYxFkJHyBAiHWD5Siiym/LJ9HLZSjh83U+tEjDBApbtvZozBb8X
         2jS5qzho9sBD7zw4npmaZS3o5rytxLgVsDRVxGN7KLFzC3Q1mH30j1d+dmdsBKj7VIPn
         TQhZLTntOpyCv8xOoHReNRtsdMyEM/GurVCy/qaOJKdsSIN77AwIApin1rSJTqG3l7JN
         2Mzf+J0ZEqsxvqiEM4rjSOTHha93CxZnk2t+fEYGmLEh+RUlvrfedm1zYeVyRwKTHWZp
         WQkw==
X-Gm-Message-State: AO0yUKUkCB5avfwrRswQOVnqZrw5vR1EACaYz+XEJ6u5KZRtnBCpVOzR
        jDd+gQZ09YMaJDz/e4zQUkNig8kh3nxQtA/bQo4=
X-Google-Smtp-Source: AK7set9XOZzJZckd2Wolnok/+YCvr+Xch61X0yc1EZEaHHKPPJqgNCKMisSGVCnlFoMSmPnf1AudbQ==
X-Received: by 2002:a05:6000:1186:b0:2bf:b511:115 with SMTP id g6-20020a056000118600b002bfb5110115mr471810wrx.54.1674569680254;
        Tue, 24 Jan 2023 06:14:40 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id z8-20020a5d4408000000b002b8fe58d6desm1966269wrq.62.2023.01.24.06.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 06:14:39 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-hwmon@vger.kernel.org,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: trivial-devices: Add Infineon TDA38640 Voltage Regulator
Date:   Tue, 24 Jan 2023 15:14:34 +0100
Message-Id: <20230124141436.1687397-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Infineon TDA38640 is PMBUS compliant voltage regulator.

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 .../devicetree/bindings/trivial-devices.yaml  |  2 +
 Documentation/hwmon/tda38640.rst              | 66 +++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/hwmon/tda38640.rst

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index f5c0a6283e61..a28b02036489 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -141,6 +141,8 @@ properties:
           - infineon,slb9645tt
             # Infineon SLB9673 I2C TPM 2.0
           - infineon,slb9673
+            # Infineon TDA38640 Voltage Regulator
+          - infineon,tda38640
             # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
           - infineon,tlv493d-a1b6
             # Infineon Multi-phase Digital VR Controller xdpe11280
diff --git a/Documentation/hwmon/tda38640.rst b/Documentation/hwmon/tda38640.rst
new file mode 100644
index 000000000000..45dd07e41247
--- /dev/null
+++ b/Documentation/hwmon/tda38640.rst
@@ -0,0 +1,66 @@
+Kernel driver tda38640
+=====================
+
+Supported chips:
+
+  * Infineon TDA38060
+
+    Prefix: 'TDA38640'
+    Addresses scanned: -
+
+    Datasheet: Publicly available at the Infineon website
+      https://www.infineon.com/dgdl/Infineon-TDA38640-0000-DataSheet-v02_04-EN.pdf?fileId=8ac78c8c80027ecd018042f2337f00c9
+
+Authors:
+      - Patrick Rudolph <patrick.rudolph@9elements.com>
+      - Naresh Solanki <Naresh.Solanki@9elements.com>
+
+Description
+-----------
+
+TDA38640 is a 40A Single-voltage Synchronous Buck Regulator with SVID and I2C.
+
+Usage Notes
+-----------
+
+This driver does not probe for PMBus devices. You will have to instantiate
+devices explicitly.
+
+Sysfs attributes
+----------------
+
+======================= ===========================
+curr1_label		"iout1"
+curr1_input		Measured output current
+curr1_crit		Critical maximum current
+curr1_crit_alarm	Current critical high alarm
+curr1_max		Maximum current
+curr1_max_alarm		Current high alarm
+
+in1_label		"vin"
+in1_input		Measured input voltage
+in1_crit		Critical maximum input voltage
+in1_crit_alarm		Input voltage critical high alarm
+in1_min			Minimum input voltage
+in1_min_alarm		Input voltage low alarm
+
+in2_label		"vout1"
+in2_input		Measured output voltage
+in2_lcrit		Critical minimum output voltage
+in2_lcrit_alarm		Output voltage critical low alarm
+in2_crit		Critical maximum output voltage
+in2_crit_alarm		Output voltage critical high alarm
+in2_max			Maximum output voltage
+in2_max_alarm		Output voltage high alarm
+in2_min			Minimum output voltage
+in2_min_alarm		Output voltage low alarm
+
+power1_label		"pout1"
+power1_input		Measured output power
+
+temp1_input		Measured temperature
+temp1_crit		Critical high temperature
+temp1_crit_alarm	Chip temperature critical high alarm
+temp1_max		Maximum temperature
+temp1_max_alarm		Chip temperature high alarm
+======================= ===========================

base-commit: 4d891f76a30d3be4194a805c5e4277786140ef05
-- 
2.38.1

