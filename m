Return-Path: <SRS0=tuU4=D2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7ABFC43457
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Oct 2020 22:19:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4ACD12223C
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Oct 2020 22:19:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura-hr.20150623.gappssmtp.com header.i=@sartura-hr.20150623.gappssmtp.com header.b="S0kypUfN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388033AbgJSWTb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Oct 2020 18:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387984AbgJSWTa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Oct 2020 18:19:30 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5122CC0613D1
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2020 15:19:29 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id qp15so1287383ejb.3
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2020 15:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jsG9e64+hm1kWvWLBkpftUqDmTbdR66JgHzNao/M1zI=;
        b=S0kypUfNkZdJmUpKO3eVHMW2czEr6tq/BzlHf8MHEqtsdbU0PeC+hTd55kMU20qjgF
         6TiPruAuBiuxKrEhXZirHPSxAgy2XQOsGCVTzxu5yR9RU9TVvHA9LK2w+roXwGHA0MA9
         wwOfYGzu494qrSbLuYNL01ICNvZhw4iTwyyS+Hn/kRaxkQ61FZnNjWR42lvEwUL0/+tf
         Pc4LB2vfKXzMCefwK8MvP7BBzu3h40+PeP2XlVpJbSaMPJ23GxfiZIXU29GtZz4wqY+g
         ovDuqPnJT+4AGyoqvZvblTQucsf0SeUhR9gDC7dLf5bXoBToPQBJIKXJST7ObGis8Sb+
         o9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jsG9e64+hm1kWvWLBkpftUqDmTbdR66JgHzNao/M1zI=;
        b=FOrKZyuNocrmS7jC+WEkHWG0nZUKrnzbYqYg/3HfjheqCxEaQRoODP/XY1vzUvr/FQ
         Bagp+ssr3DuBkKxEy7KY6+0j2iDW5UQRlaCBYebqsAXFy2LSnNoBlFO9RpRn9FieqJOP
         1v3ax2NnvGzTSnx1tjj29IUEpLwM4FFcPWxar6bWTEKEfuXKCfurqh69gaZaJMkmEUT4
         Jt6nwM1UIMTTvy4y95cvLrcOvSrVgJ+3+FR7q8jQD9PMLdEngGbXhckgHg348hXx7DCu
         Ym3Yeu1s4gnsKXQcwxdeUtoj1yawc4EL7f6alD+MFuLVgz4dwxazngGmGczIAiIFxJHD
         +RYA==
X-Gm-Message-State: AOAM531phyLWudaL4nUWNNg4g24E66BQG/AIUe4d+dczdCQK0nCOuTb4
        QlP707Rcptq1IWdoV1lc8Woujw==
X-Google-Smtp-Source: ABdhPJyWciawZSL77AlTNCSJu5YLz/xNn2WK1QFB/mgPaO5Qjx8SQpGMld8ir8BjAWHIL2sB+M7GTg==
X-Received: by 2002:a17:906:190b:: with SMTP id a11mr19616eje.260.1603145968029;
        Mon, 19 Oct 2020 15:19:28 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fbc5:498b:ed6d:cfac])
        by smtp.gmail.com with ESMTPSA id e17sm1645400ejh.64.2020.10.19.15.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 15:19:27 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        marek.behun@nic.cz, luka.perkov@sartura.hr,
        andy.shevchenko@gmail.com, robert.marko@sartura.hr,
        Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v6 5/6] Documentation/ABI: Add iei-wt61p803-puzzle driver sysfs interface documentation
Date:   Tue, 20 Oct 2020 00:18:58 +0200
Message-Id: <20201019221859.56680-6-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019221859.56680-1-luka.kovacic@sartura.hr>
References: <20201019221859.56680-1-luka.kovacic@sartura.hr>
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

