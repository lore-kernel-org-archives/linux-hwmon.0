Return-Path: <SRS0=+gze=VT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EE5C76188
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 11:08:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E47D20821
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 11:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563793689;
	bh=2z6i24+qb4j3b1P0viAqke4gZ6or3I0xXoMViGiT5xI=;
	h=From:Cc:Subject:Date:In-Reply-To:References:To:List-ID:From;
	b=zH+K+vLBohzg8eYTn0fFeX/TXrWXfbqJ0Iejj64HplqH5RAdvNFqYLdoAvHjDrSKn
	 qUDIsFmlyrjRs4F7rT2TEBrM7BpAdpPi6w1oV+Ln5vseuW2Q2T7n8JJQjg5Je+Mgi1
	 4g2na7ZuBQlBL1PaVoSKx8clZrMCEnZotaYxHk2w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729841AbfGVLIJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Jul 2019 07:08:09 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:35668 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729844AbfGVLIB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Jul 2019 07:08:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=3U1QrPfNvOtuuSLliYgGDMKrpJg0LMXUyN+mmcUPwa4=; b=SKYIEmIgcDHU6ufAzDpyezw2+k
        VdIaVrMSUeyLNTEw7OCPqoy2B5K7/twVfSHAH6SvzIsERQUWg+wpn9Na7Cv5OP6yeSiMUx+5/RN4G
        4RcuJiJxVP/asPMO7k4A4n52zAXH+dFXeWz/4U1aJqVU+Hf0l78DQpA1pQlRYZYjLQcx+emOts3pu
        gwfHS3SDlDE6BiSatgRLduioUtMxFG0jlF6aFBFnYh7QvICGIMbUZe6BXymepAmLqUe2oIcl6ef4n
        yywwbdziSSr5py8ADV4mCL1z1nSMEg8PKpbErEGaZkd8cvr4ioyiR1kM8gHfmklLuoa5NLT7GnEkF
        HRzo3KhQ==;
Received: from 177.157.124.3.dynamic.adsl.gvt.net.br ([177.157.124.3] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hpWAh-000257-EF; Mon, 22 Jul 2019 11:07:59 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hpWAa-00041q-FI; Mon, 22 Jul 2019 08:07:52 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 18/22] docs: hwmon: pxe1610: convert to ReST format and add to the index
Date:   Mon, 22 Jul 2019 08:07:45 -0300
Message-Id: <657bf022625e0888d3becf10c78d162eeb864608.1563792334.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563792333.git.mchehab+samsung@kernel.org>
References: <cover.1563792333.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This document was recently introduced. Convert it to ReST
just like the other hwmon documents, adding it to the hwmon index.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/hwmon/index.rst                |  1 +
 Documentation/hwmon/{pxe1610 => pxe1610.rst} | 33 +++++++++++++++-----
 2 files changed, 26 insertions(+), 8 deletions(-)
 rename Documentation/hwmon/{pxe1610 => pxe1610.rst} (82%)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index ee090e51653a..4d5f5fec43a3 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -130,6 +130,7 @@ Hardware Monitoring Kernel Drivers
    pcf8591
    pmbus
    powr1220
+   pxe1610
    pwm-fan
    raspberrypi-hwmon
    sch5627
diff --git a/Documentation/hwmon/pxe1610 b/Documentation/hwmon/pxe1610.rst
similarity index 82%
rename from Documentation/hwmon/pxe1610
rename to Documentation/hwmon/pxe1610.rst
index 211cedeefb44..4f2388840d06 100644
--- a/Documentation/hwmon/pxe1610
+++ b/Documentation/hwmon/pxe1610.rst
@@ -2,19 +2,29 @@ Kernel driver pxe1610
 =====================
 
 Supported chips:
+
   * Infineon PXE1610
+
     Prefix: 'pxe1610'
+
     Addresses scanned: -
+
     Datasheet: Datasheet is not publicly available.
 
   * Infineon PXE1110
+
     Prefix: 'pxe1110'
+
     Addresses scanned: -
+
     Datasheet: Datasheet is not publicly available.
 
   * Infineon PXM1310
+
     Prefix: 'pxm1310'
+
     Addresses scanned: -
+
     Datasheet: Datasheet is not publicly available.
 
 Author: Vijay Khemka <vijaykhemka@fb.com>
@@ -25,14 +35,19 @@ Description
 
 PXE1610/PXE1110 are Multi-rail/Multiphase Digital Controllers
 and compliant to
-	-- Intel VR13 DC-DC converter specifications.
-	-- Intel SVID protocol.
+
+	- Intel VR13 DC-DC converter specifications.
+	- Intel SVID protocol.
+
 Used for Vcore power regulation for Intel VR13 based microprocessors
-	-- Servers, Workstations, and High-end desktops
+
+	- Servers, Workstations, and High-end desktops
 
 PXM1310 is a Multi-rail Controller and it is compliant to
-	-- Intel VR13 DC-DC converter specifications.
-	-- Intel SVID protocol.
+
+	- Intel VR13 DC-DC converter specifications.
+	- Intel SVID protocol.
+
 Used for DDR3/DDR4 Memory power regulation for Intel VR13 and
 IMVP8 based systems
 
@@ -44,10 +59,10 @@ This driver does not probe for PMBus devices. You will have
 to instantiate devices explicitly.
 
 Example: the following commands will load the driver for an PXE1610
-at address 0x70 on I2C bus #4:
+at address 0x70 on I2C bus #4::
 
-# modprobe pxe1610
-# echo pxe1610 0x70 > /sys/bus/i2c/devices/i2c-4/new_device
+    # modprobe pxe1610
+    # echo pxe1610 0x70 > /sys/bus/i2c/devices/i2c-4/new_device
 
 It can also be instantiated by declaring in device tree
 
@@ -55,6 +70,7 @@ It can also be instantiated by declaring in device tree
 Sysfs attributes
 ----------------
 
+======================  ====================================
 curr1_label		"iin"
 curr1_input		Measured input current
 curr1_alarm		Current high alarm
@@ -88,3 +104,4 @@ temp[1-3]_crit		Critical high temperature
 temp[1-3]_crit_alarm	Chip temperature critical high alarm
 temp[1-3]_max		Maximum temperature
 temp[1-3]_max_alarm	Chip temperature high alarm
+======================  ====================================
-- 
2.21.0

