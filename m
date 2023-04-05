Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 502C1C76188
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Apr 2023 07:31:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237148AbjDEHbe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Apr 2023 03:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237149AbjDEHbP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Apr 2023 03:31:15 -0400
Received: from s.wrqvtzvf.outbound-mail.sendgrid.net (s.wrqvtzvf.outbound-mail.sendgrid.net [149.72.126.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC195261
        for <linux-hwmon@vger.kernel.org>; Wed,  5 Apr 2023 00:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equiv.tech;
        h=from:subject:in-reply-to:references:mime-version:cc:
        content-transfer-encoding:content-type:cc:content-type:from:subject:to;
        s=org; bh=WHm2RIViCzWT3zYPU2Vw9vCyr3A/PowltDWn5Mk40eo=;
        b=c5qHmt/IuHZZxjznRhn0jk+1NCIJWMVLSNYyvDZt0h+8FuLmwbMbN18lkfcpJ9c0td0W
        LmIpzy3WI09Tb3xIcsYxDXQKoHBySQxdWNEUWnxln2qmYutU9tDVFJnT8aOIGcuBPs4xUr
        oGbLdNSJrehHyCRfxpZxs6/slAoXyVR50=
Received: by filterdrecv-5848969764-44p6h with SMTP id filterdrecv-5848969764-44p6h-1-642D23BB-7
        2023-04-05 07:31:07.265212223 +0000 UTC m=+3657493.273161580
Received: from localhost (unknown)
        by geopod-ismtpd-11 (SG) with ESMTP
        id yZLoy5XZQl6wiZgmdZCnmA
        Wed, 05 Apr 2023 07:31:07.061 +0000 (UTC)
From:   James Seo <james@equiv.tech>
Subject: [PATCH 2/2] hwmon: fix typo in Makefile
Date:   Wed, 05 Apr 2023 07:31:07 +0000 (UTC)
Message-Id: <20230405073056.53466-3-james@equiv.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230405073056.53466-1-james@equiv.tech>
References: <20230405073056.53466-1-james@equiv.tech>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?1X41iaRO4wVP+tFXGLuxpQ0yxxMDhGIesR5UcsYKVengQKgidLJSXwOMZlPQwP?=
 =?us-ascii?Q?WsRtMyA1321KpgTLuhAnL1Q906rlnMtB0DnOXYE?=
 =?us-ascii?Q?bbiFcTMm7bAjVX0c04NwOQfq+hLlCn7ZqNW=2Fy46?=
 =?us-ascii?Q?ppxByYNwVJQ5OKxYFT9CJQIOH71j+WWKpuSR+aw?=
 =?us-ascii?Q?E0HCM=2FdYjNgXZAuxRDM5b7nBFP15clCP6hy5Su8?=
 =?us-ascii?Q?DwekMFAOMFKFovmznuABhH58gp7p09N6C3gBNI?=
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        James Seo <james@equiv.tech>
X-Entity-ID: Y+qgTyM7KJvXcwsg19bS4g==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fix the spelling of "ACPI" in Makefile.

Signed-off-by: James Seo <james@equiv.tech>
---
 drivers/hwmon/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 88712b5031c8..e12c111a174a 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -6,7 +6,7 @@
 obj-$(CONFIG_HWMON)		+= hwmon.o
 obj-$(CONFIG_HWMON_VID)		+= hwmon-vid.o
 
-# APCI drivers
+# ACPI drivers
 obj-$(CONFIG_SENSORS_ACPI_POWER) += acpi_power_meter.o
 obj-$(CONFIG_SENSORS_ATK0110)	+= asus_atk0110.o
 obj-$(CONFIG_SENSORS_ASUS_EC)	+= asus-ec-sensors.o
-- 
2.34.1

