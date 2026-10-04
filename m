Received: from out-zbxj-a87.jellyfish.systems (out-zbxj-a87.jellyfish.systems [198.54.127.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB84733A9CF
	for <linux-hwmon@vger.kernel.org>; Sun,  4 Oct 2026 15:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128067; cv=none; b=lnXtDaaxHfvdzbHvBX7MTdoF0mQo+Hb7WKJnu7t2SHHdJGrn32Qka7SkzAB5dX2a7owkdftYWFxzuByR80XeNcp2pnahHfhxAthezPze+UCoBBHqxvkgRVsPZSsZlj3mCGveLaMF+7tyWZ/+6gbYtpAayHNFvpdR6zBQsUJNhJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128067; c=relaxed/simple;
	bh=YAJMipmgnML2WZDKmgPkvnGx6/2a7e24gG4qAEFydl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EYPO9m2uRA4bdcaEgM9ZtGCLShfGCJvqFzzPnY8H6STXN5RrZDD/vsjPjMhw+upLMIb/Byxfg3mvwYcFOkVhxKtwAnMQM2ZlEKhxMuVwPtRmuMrUQLTgGJvREQe/y6gihDMR4yp3yEPLK/W24VJAHeOoz4aGcOI7kUEQGgtkwAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=effective-light.com; spf=pass smtp.mailfrom=effective-light.com; arc=none smtp.client-ip=198.54.127.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=effective-light.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=effective-light.com
Received: from mail.privateemail.com (unknown [174.89.145.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4hyRPv5rX0zyNW;
	Sun, 04 Oct 2026 15:33:55 +0000 (UTC)
From: Hamza Mahfooz <someguy@effective-light.com>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hamza Mahfooz <someguy@effective-light.com>
Subject: [PATCH 1/2] hwmon: (nct6683) Report the duty cycle of NCT6687D-R system fans
Date: Sun,  4 Oct 2026 11:32:49 -0400
Message-ID: <20261004153250.516730-2-someguy@effective-light.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004153250.516730-1-someguy@effective-light.com>
References: <20261004153250.516730-1-someguy@effective-light.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: someguy@effective-light.com

Recent MSI boards (customer ID 0x20d) use an NCT6687D-R. Its system fans
are connected to channels 10-15, which have no fan output configuration
register, so their duty cycle is not reported.

According to a reverse engineered register map, the duty cycle of these
channels is reported in register (0xe00 + channel - 10). Report it for the
system fans that are present, so that pwmN matches fanN. To do so,
support up to 16 pwm channels, indexed by fan channel.

Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
---
 drivers/hwmon/nct6683.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index e1c36c95a..a43e23c65 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -22,6 +22,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
+#include <linux/bits.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -169,6 +170,8 @@ superio_exit(int ioreg)
 #define NCT6683_FAN_CFG_REQ		0x80
 #define NCT6683_FAN_CFG_DONE		0x40
 
+#define NCT6687DR_REG_PWM_SYS(x)	(0xe00 + (x) - 10)	/* channels 10-15 */
+
 #define NCT6683_REG_CUSTOMER_ID		0x602
 #define NCT6683_CUSTOMER_ID_INTEL	0x805
 #define NCT6683_CUSTOMER_ID_MITAC	0xa0e
@@ -341,8 +344,8 @@ struct nct6683_data {
 	u8 fanout_cfg[NCT6683_NUM_REG_FAN];
 	u16 have_fan;			/* some fan inputs can be disabled */
 
-	u8 have_pwm;
-	u8 pwm[NCT6683_NUM_REG_PWM];
+	u16 have_pwm;
+	u8 pwm[NCT6683_NUM_REG_FAN];	/* indexed by fan channel */
 
 #ifdef CONFIG_PM
 	/* Remember extra register values over suspend/resume */
@@ -588,15 +591,21 @@ static int get_temp_reg(struct nct6683_data *data, int nr, int index)
 	return reg;
 }
 
+/* Channels 8-15 are only used on NCT6687D-R */
+static u16 nct6683_pwm_reg(int ch)
+{
+	return ch < 8 ? NCT6683_REG_PWM(ch) : NCT6687DR_REG_PWM_SYS(ch);
+}
+
 static void nct6683_update_pwm(struct device *dev)
 {
 	struct nct6683_data *data = dev_get_drvdata(dev);
 	int i;
 
-	for (i = 0; i < NCT6683_NUM_REG_PWM; i++) {
+	for (i = 0; i < ARRAY_SIZE(data->pwm); i++) {
 		if (!(data->have_pwm & (1 << i)))
 			continue;
-		data->pwm[i] = nct6683_read(data, NCT6683_REG_PWM(i));
+		data->pwm[i] = nct6683_read(data, nct6683_pwm_reg(i));
 	}
 }
 
@@ -1149,6 +1158,15 @@ nct6683_setup_fans(struct nct6683_data *data)
 			data->have_pwm |= 1 << i;
 		data->fanout_cfg[i] = reg;
 	}
+
+	if (data->kind == nct6687 &&
+	    data->customer_id == NCT6683_CUSTOMER_ID_MSI4) {
+		/*
+		 * The system fan channels (10-15) have no fan output
+		 * configuration register, so check their fan input instead.
+		 */
+		data->have_pwm |= data->have_fan & GENMASK(15, 10);
+	}
 }
 
 /*
-- 
2.56.0

