Return-Path: <SRS0=9cdn=4D=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F255AC4741C
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Feb 2020 12:26:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CB65B2073A
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Feb 2020 12:26:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UcjXn5oN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgBOM0R (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Feb 2020 07:26:17 -0500
Received: from mail-pf1-f175.google.com ([209.85.210.175]:42684 "EHLO
        mail-pf1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgBOM0R (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Feb 2020 07:26:17 -0500
Received: by mail-pf1-f175.google.com with SMTP id 4so6413474pfz.9
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Feb 2020 04:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UWjND2QgvvYLWyUrbBVs+iZBMdMm+VT6RUnJQxTl6g0=;
        b=UcjXn5oNN5v2WN+X2Ira+dRqH/JsEibfcUyfgEJFI4rbucQ1iqHHLiVLXOFUno/Dua
         ShnOQacNu5ONUj74388YQ971qUakT3LMuow4oCfXg/zbpD0JW+HtyxUvvlai2T7cadUq
         dcpAiBTVUKoUO8tFou0rvh3zV5FpOzL7GkU+W7aM4VlrvisusOn6Mpg0U3zGc+16P6IU
         j1PPUi1uEwRqlquTrfkLSfsosm6sptzANbioUndGdJt/Ldi27Q3973Eznt90dGPb6oMj
         mm6tg/OAizm4Z+Pt/aazE/P/MCAZjGZTLWghui7MvGIeyUZnqsyyT0Jkm0yNOi1VQ0Rp
         3sGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=UWjND2QgvvYLWyUrbBVs+iZBMdMm+VT6RUnJQxTl6g0=;
        b=LWW3SW3oiPe2q4NgzjMLPKIT+vVPxYpy5t2D6+iEUNOYB7CpLKZ6+6iPh882jIpDQb
         ALQn62pucKzcevNmfkLGiUUGM/02csDJGlmHjdlLs9tYgmJ+TlJVDhU1gP3L0djOwQ3y
         szckl1Poh82Tbb90Tn0AMrVX7PhAryKETdl3J9ANZN8VhirSl5l+l7m+tP41clSSOSw3
         GwFxUqs1SBh+JuEMS5cfqngpG0tdLn7ZCWiDsfN8Tc0lqWq8OZ/BbZNaDZ0GJToLakuQ
         /4JhkHPCiX21DxN8tSz8J7D31VDbs7p6dkEI1/4W/l41Qz7Eo6gTX2rIRvk+2ET3lJpn
         rNUQ==
X-Gm-Message-State: APjAAAWpKhVPtwf99YF+JB0PoD+3ufzG4bqf886/f9o9nCjopRuTUQ0J
        VDhmXfe0pVK6IYxyMV9yxSxoVx5K
X-Google-Smtp-Source: APXvYqwn5ptx5yDXj21piGU6Zx4QA0ZIQBvp5+mToTyUvuzaIpyM4FwPItY4cZ4VFfzGUgprnLQ44A==
X-Received: by 2002:a63:a541:: with SMTP id r1mr8417080pgu.118.1581769576210;
        Sat, 15 Feb 2020 04:26:16 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 13sm10225234pfj.68.2020.02.15.04.26.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Feb 2020 04:26:15 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 8/8] hwmon: (pmbus/tps53679) Add documentation
Date:   Sat, 15 Feb 2020 04:26:02 -0800
Message-Id: <20200215122602.14245-8-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215122602.14245-1-linux@roeck-us.net>
References: <20200215122602.14245-1-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document tps53679 driver with all chips supported by it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/index.rst    |   1 +
 Documentation/hwmon/tps53679.rst | 178 +++++++++++++++++++++++++++++++
 2 files changed, 179 insertions(+)
 create mode 100644 Documentation/hwmon/tps53679.rst

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index b24adb67ddca..8ef62fd39787 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -162,6 +162,7 @@ Hardware Monitoring Kernel Drivers
    tmp421
    tmp513
    tps40422
+   tps53679
    twl4030-madc-hwmon
    ucd9000
    ucd9200
diff --git a/Documentation/hwmon/tps53679.rst b/Documentation/hwmon/tps53679.rst
new file mode 100644
index 000000000000..be94cab78967
--- /dev/null
+++ b/Documentation/hwmon/tps53679.rst
@@ -0,0 +1,178 @@
+Kernel driver tps53679
+======================
+
+Supported chips:
+
+  * Texas Instruments TPS53647
+
+    Prefix: 'tps53647'
+
+    Addresses scanned: -
+
+    Datasheet: http://www.ti.com/lit/gpn/tps53647
+
+  * Texas Instruments TPS53667
+
+    Prefix: 'tps53667'
+
+    Addresses scanned: -
+
+    Datasheet: http://www.ti.com/lit/gpn/TPS53667
+
+  * Texas Instruments TPS53679
+
+    Prefix: 'tps53679'
+
+    Addresses scanned: -
+
+    Datasheet: http://www.ti.com/lit/gpn/TPS53679 (short version)
+
+  * Texas Instruments TPS53681
+
+    Prefix: 'tps53681'
+
+    Addresses scanned: -
+
+    Datasheet: http://www.ti.com/lit/gpn/TPS53681
+
+  * Texas Instruments TPS53688
+
+    Prefix: 'tps53688'
+
+    Addresses scanned: -
+
+    Datasheet: Available under NDA
+
+
+Authors:
+	Vadim Pasternak <vadimp@mellanox.com>
+	Guenter Roeck <linux@roeck-us.net>
+
+
+Description
+-----------
+
+Chips in this series are multi-phase step-down converters with one or two
+output channels and up to 8 phases per channel.
+
+
+Usage Notes
+-----------
+
+This driver does not probe for PMBus devices. You will have to instantiate
+devices explicitly.
+
+Example: the following commands will load the driver for an TPS53681 at address
+0x60 on I2C bus #1::
+
+	# modprobe tps53679
+	# echo tps53681 0x60 > /sys/bus/i2c/devices/i2c-1/new_device
+
+
+Sysfs attributes
+----------------
+
+======================= ========================================================
+in1_label		"vin"
+
+in1_input		Measured input voltage.
+
+in1_lcrit		Critical minimum input voltage
+
+			TPS53679, TPS53681, TPS53688 only.
+
+in1_lcrit_alarm		Input voltage critical low alarm.
+
+			TPS53679, TPS53681, TPS53688 only.
+
+in1_crit		Critical maximum input voltage.
+
+in1_crit_alarm		Input voltage critical high alarm.
+
+in[N]_label		"vout[1-2]"
+
+			- TPS53647, TPS53667: N=2
+			- TPS53679, TPS53588: N=2,3
+
+in[N]_input		Measured output voltage.
+
+in[N]_lcrit		Critical minimum input voltage.
+
+			TPS53679, TPS53681, TPS53688 only.
+
+in[N]_lcrit_alarm	Critical minimum voltage alarm.
+
+			TPS53679, TPS53681, TPS53688 only.
+
+in[N]_alarm		Output voltage alarm.
+
+			TPS53647, TPS53667 only.
+
+in[N]_crit		Critical maximum output voltage.
+
+			TPS53679, TPS53681, TPS53688 only.
+
+in[N]_crit_alarm	Output voltage critical high alarm.
+
+			TPS53679, TPS53681, TPS53688 only.
+
+temp[N]_input		Measured temperature.
+
+			- TPS53647, TPS53667: N=1
+			- TPS53679, TPS53681, TPS53588: N=1,2
+
+temp[N]_max		Maximum temperature.
+
+temp[N]_crit		Critical high temperature.
+
+temp[N]_max_alarm	Temperature high alarm.
+
+temp[N]_crit_alarm	Temperature critical high alarm.
+
+power1_label		"pin".
+
+power1_input		Measured input power.
+
+power[N]_label		"pout[1-2]".
+
+			- TPS53647, TPS53667: N=2
+			- TPS53679, TPS53681, TPS53588: N=2,3
+
+power[N]_input		Measured output power.
+
+curr1_label		"iin".
+
+curr1_input		Measured input current.
+
+curr1_max		Maximum input current.
+
+curr1_max_alarm		Input current high alarm.
+
+curr1_crit		Critical input current.
+
+curr1_crit_alarm	Input current critical alarm.
+
+curr[N]_label		"iout[1-2]" or "iout1.[0-5]".
+
+			The first digit is the output channel, the second
+			digit is the phase within the channel. Per-phase
+			telemetry supported on TPS53681 only.
+
+			- TPS53647, TPS53667: N=2
+			- TPS53679, TPS53588: N=2,3
+			- TPS53681: N=2-9
+
+curr[N]_input		Measured output current.
+
+curr[N]_max		Maximum output current.
+
+curr[N]_crit		Critical high output current.
+
+curr[N]_max_alarm	Output current high alarm.
+
+curr[N]_crit_alarm	Output current critical high alarm.
+
+			Limit and alarm attributes are only available for
+			non-phase telemetry (iout1, iout2).
+
+======================= ========================================================
-- 
2.17.1

