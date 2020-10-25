Return-Path: <SRS0=FQn6=EA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDE5C5DF9D
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Oct 2020 00:59:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44DDB2098B
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Oct 2020 00:59:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura-hr.20150623.gappssmtp.com header.i=@sartura-hr.20150623.gappssmtp.com header.b="z2zvmmLy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1766010AbgJYA7n (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 24 Oct 2020 20:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1766004AbgJYA7l (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 24 Oct 2020 20:59:41 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB94BC0613D6
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2020 17:59:40 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id h24so8175844ejg.9
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2020 17:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jsG9e64+hm1kWvWLBkpftUqDmTbdR66JgHzNao/M1zI=;
        b=z2zvmmLynPgR1cbJpxqtOTD+kgGz3tkVfBRK1tcVtKpke4GttpBchWQksQP5VYvTyL
         ZAcgK5TDZrBttv3+/L7nb+E0N/EL3YIIL73JVJyzVHawoK0RUTfOpDCZiMJEYjV6/7XU
         8PnGCBimp3gyp6Ruabs+CLmLjfedrk065lS7XyathaleAXkV2SVfh/6ahWEKNzRfj0Hp
         jSyKOOx22en4us0Tjb3/siM+7E0jwGJzcmHD+jAMsYTfm1tehE4E74rr28Q+w4CBnrkt
         EGVwvmdqQWOVuI8R8Vn1DYpUnGLll64MpcG21W/GR0zFoROJ7vPAr8ITOT+xx2mrZBmJ
         ptQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jsG9e64+hm1kWvWLBkpftUqDmTbdR66JgHzNao/M1zI=;
        b=tyh6VLVP4UB7nHKUNIKQs+tLJd6QmP1vv9ZCAkQMIuG1n21jCoFQWXtRdAR6Az1+FC
         j0sEDQJpu2I1inPo+k2TxuV+812+OiOi69hZ8qu3GSi/TU3IRtGsmo58LnCEySKrQL5+
         +Qet4PM09Q2LsBnPgBqWTAKZW48b5sV3LfrOrytzkPm3CpqBYFn7yuZIzhNbi4jmEH6K
         5StaS4G5aiuD6UpgkJDZPJ326Wyt/U5qmwq/7ryqsSd3aNxhdT30raYhz2YXT3IwkPwv
         ohBFT3hqoPJEkch0WJl94wXIZvVbWGH3lYIIJEyT4FzcGX2DAQXn3SinWjk6IIl9rKpN
         2Zhw==
X-Gm-Message-State: AOAM530we5vIa2L1vcCxAcmZlgf+qvRi1bBOPLa+5yW5+dSbmnwTS4zk
        inhepv8y8V/Ulks6IOZk31W14Q==
X-Google-Smtp-Source: ABdhPJy2YUH+9pwxUXc+ErJ+s6/P4Fpl0mK8GJOl/Xh+cOmBWyjrESZVLgVUjULn9fBAd/G0ugvBqw==
X-Received: by 2002:a17:906:edb0:: with SMTP id sa16mr9062858ejb.327.1603587578110;
        Sat, 24 Oct 2020 17:59:38 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fbc5:498b:ed6d:cfac])
        by smtp.gmail.com with ESMTPSA id q5sm2797274edt.79.2020.10.24.17.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 17:59:37 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        marek.behun@nic.cz, luka.perkov@sartura.hr,
        andy.shevchenko@gmail.com, robert.marko@sartura.hr,
        Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v7 5/6] Documentation/ABI: Add iei-wt61p803-puzzle driver sysfs interface documentation
Date:   Sun, 25 Oct 2020 02:59:15 +0200
Message-Id: <20201025005916.64747-6-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201025005916.64747-1-luka.kovacic@sartura.hr>
References: <20201025005916.64747-1-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add the iei-wt61p803-puzzle driver sysfs interface documentation to allow
monitoring and control of the microcontroller from user space.

Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Cc: Robert Marko <robert.marko@sartura.hr>
---
 .../testing/sysfs-driver-iei-wt61p803-puzzle  | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-iei-wt61p803-puzzle

diff --git a/Documentation/ABI/testing/sysfs-driver-iei-wt61p803-puzzle b/Documentation/ABI/testing/sysfs-driver-iei-wt61p803-puzzle
new file mode 100644
index 000000000000..6e71d85f3296
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-iei-wt61p803-puzzle
@@ -0,0 +1,55 @@
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/mac_address_*
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RW) Internal factory assigned MAC address values
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/serial_number
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RW) Internal factory assigned serial number
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/version
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RO) Internal MCU firmware version
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/protocol_version
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RO) Internal MCU communication protocol version
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/power_loss_recovery
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RW) Host platform power loss recovery settings
+		Value mapping: 0 - Always-On, 1 - Always-Off, 2 - Always-AC, 3 - Always-WA
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/bootloader_mode
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RO) Internal MCU bootloader mode status
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/power_status
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RO) Power status indicates the host platform power on method.
+		Value mapping (bitwise list):
+		0x80 - Null
+		0x40 - Firmware flag
+		0x20 - Power loss detection flag (powered off)
+		0x10 - Power loss detection flag (AC mode)
+		0x08 - Button power on
+		0x04 - WOL power on
+		0x02 - RTC alarm power on
+		0x01 - AC recover power on
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/build_info
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RO) Internal MCU firmware build date
+		Format: yyyy/mm/dd hh:mm
+
+What:		/sys/bus/serial/devices/.../iei_wt61p803_puzzle_core/ac_recovery_status
+Date:		September 2020
+Contact:	Luka Kovacic <luka.kovacic@sartura.hr>
+Description:	(RO) Host platform AC recovery status value
-- 
2.26.2

