Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B758218AD4;
	Sun, 22 Mar 2026 10:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774175591; cv=none; b=ZTbiXqnWjAMbyaA6a7YoS0Sz4Z4Vz1+7jkInWcBswmvPv0uwZ26jPtwBBZlAHZjDWoDQoUpd1tNmVTwnpi3aynX/OeCAA/tdwgYoGUxFYIGnQWHRFaNF8DRfvWy+RyFcw667zGv359kt9NK6dILyn77fJZznZ8sygD8gzDt8WiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774175591; c=relaxed/simple;
	bh=n5mS/0qW5g8GLERK26e6XbCnHHzgW4MYru319kurdTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YuBuU61wnMqFMsoNADG28vafyD9GBskF/6l9WXiYe2VPCNJnhU2bncMNFvOxMtTi6POlhec3jNTlBslJ52Dj2tsdfD1XB5f4LpoVxclsckXJLY6kQMf5JEbTL8ZVi5N3YW/bjEMDa5yPttl+5SpCTOG49NkIVdBpP9vMjo0R/zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thehoffs.at; spf=pass smtp.mailfrom=thehoffs.at; dkim=pass (2048-bit key) header.d=thehoffs.at header.i=@thehoffs.at header.b=MsP74pr6; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thehoffs.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thehoffs.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thehoffs.at header.i=@thehoffs.at header.b="MsP74pr6"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fdt1D6TmQz9tBc;
	Sun, 22 Mar 2026 11:33:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thehoffs.at; s=MBO0001;
	t=1774175584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M8oPzVQc+tZ5nUk2ot2sdlgt2xlC3Dhg+iyDIXyIbgU=;
	b=MsP74pr6WiuT3WbQrggeuBl13ivhk/IARMTAGZH9NaO4PLn1boZFoiXEt2JCQBStWRrCsq
	njjLJD/nzdueZPXBbr0icIJikdH0F/ldxQ432JDVhAhwzRxXhSgonYFURQw0AzCHQhtk66
	LbhyJVs/LaDvwdf6ozB4fbPqcExi21FF8FHtwYXCDEhOIs2OU3Ut8sFkGX9CB4xhSdgaru
	bb1UNrMD+5ZfeS2P4AlWD5zCPW8eZDanGAq9tIGZzZuztXekVTMumjoxR4nm4O+eaAoT0z
	JGMR/YcWLHAGVt3pDsKNE80zWaJ9YFWq3N3GigNQm+XXOsJR1z1GAQFk9/9XBQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of markus@thehoffs.at designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=markus@thehoffs.at
From: Markus Hoffmann <markus@thehoffs.at>
To: linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.com,
	linux@roeck-us.net,
	linux-kernel@vger.kernel.org,
	Markus Hoffmann <markus@thehoffs.at>
Subject: [PATCH v3] hwmon: (it87) Add support for IT8689E
Date: Sun, 22 Mar 2026 10:33:01 +0000
Message-ID: <20260322103301.18112-1-markus@thehoffs.at>
In-Reply-To: <20260320144323.4870-1-markus@thehoffs.at>
References: <20260320144323.4870-1-markus@thehoffs.at>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4fdt1D6TmQz9tBc

Add support for the ITE IT8689E Super I/O chip. The IT8689E supports
newer autopwm, 12mV ADC, 16-bit fans, six fans, six PWM channels,
PWM frequency 2, six temperature inputs, AVCC3, temperature offset,
and fan on/off control.

Give it8689 its own GPIO configuration block in it87_find() rather
than sharing the it8620/it8628 block. The shared block reads
IT87_SIO_PINX2_REG and either marks IN3 as internal AVCC or skips
IN9. Because it8689 declares FEAT_AVCC3, IN9 is already marked as
always-internal before the GPIO block is reached; applying the PINX2
check would either create duplicate AVCC labels on IN3 and IN9 or
incorrectly skip IN9.

Also update Documentation/hwmon/it87.rst and drivers/hwmon/Kconfig to
document the newly supported chip.

Signed-off-by: Markus Hoffmann <markus@thehoffs.at>
---
Changes in v3:
- Fix AVCC/PINX2 conflict: give it8689 its own GPIO block instead of
  sharing the it8620/it8628 block. The shared block applies an
  IT87_SIO_PINX2_REG check that is incompatible with FEAT_AVCC3:
  it either creates duplicate AVCC labels on IN3 and IN9, or skips
  IN9 while its label remains visible. it8622 (also FEAT_AVCC3) is
  handled the same way for the same reason.
- Add FEAT_TEMP_OFFSET: verified on hardware, temp[1-3]_offset sysfs
  attributes respond correctly.
- Add FEAT_FANCTL_ONOFF: verified on hardware, writing 0 to
  pwm1_enable is accepted.
- Add Documentation/hwmon/it87.rst entry for IT8689E, update the chip
  list in the Description section, add IT8689E description paragraph,
  and fix the in9 note to also list IT8622E (which also has FEAT_AVCC3).
- Add IT8689E to drivers/hwmon/Kconfig help text.

Changes in v2:
- Add it8689 to the GPIO pin multiplexing checks in it87_find() to
  avoid ghost fans and non-functional PWM controls.

 Documentation/hwmon/it87.rst | 26 +++++++++++----
 drivers/hwmon/Kconfig        |  4 +--
 drivers/hwmon/it87.c         | 61 +++++++++++++++++++++++++++++++++++-
 3 files changed, 82 insertions(+), 9 deletions(-)

diff --git a/Documentation/hwmon/it87.rst b/Documentation/hwmon/it87.rst
index 5cef4f265..fc1c90b02 100644
--- a/Documentation/hwmon/it87.rst
+++ b/Documentation/hwmon/it87.rst
@@ -25,6 +25,14 @@ Supported chips:
 
     Datasheet: Not publicly available
 
+  * IT8689E
+
+    Prefix: 'it8689'
+
+    Addresses scanned: from Super I/O config space (8 I/O ports)
+
+    Datasheet: Not publicly available
+
   * IT8705F
 
     Prefix: 'it87'
@@ -228,9 +236,9 @@ Description
 -----------
 
 This driver implements support for the IT8603E, IT8620E, IT8623E, IT8628E,
-IT8705F, IT8712F, IT8716F, IT8718F, IT8720F, IT8721F, IT8726F, IT8728F, IT8732F,
-IT8758E, IT8771E, IT8772E, IT8781F, IT8782F, IT8783E/F, IT8786E, IT8790E,
-IT8792E/IT8795E, IT87952E and SiS950 chips.
+IT8689E, IT8705F, IT8712F, IT8716F, IT8718F, IT8720F, IT8721F, IT8726F,
+IT8728F, IT8732F, IT8758E, IT8771E, IT8772E, IT8781F, IT8782F, IT8783E/F,
+IT8786E, IT8790E, IT8792E/IT8795E, IT87952E and SiS950 chips.
 
 These chips are 'Super I/O chips', supporting floppy disks, infrared ports,
 joysticks and other miscellaneous stuff. For hardware monitoring, they
@@ -274,6 +282,9 @@ of the fan is not supported (value 0 of pwmX_enable).
 The IT8620E and IT8628E are custom designs, hardware monitoring part is similar
 to IT8728F. It only supports 16-bit fan mode. Both chips support up to 6 fans.
 
+The IT8689E supports newer autopwm, 12mV ADC, 16-bit fans, six fans, six PWM
+channels, PWM frequency 2, six temperature inputs, and AVCC3 (in9).
+
 The IT8790E, IT8792E/IT8795E and IT87952E support up to 3 fans. 16-bit fan
 mode is always enabled.
 
@@ -301,12 +312,15 @@ of 0.016 volt.  IT8603E, IT8721F/IT8758E and IT8728F can measure between 0 and
 2.8 volts with a resolution of 0.0109 volt.  The battery voltage in8 does not
 have limit registers.
 
-On the IT8603E, IT8620E, IT8628E, IT8721F/IT8758E, IT8732F, IT8781F, IT8782F,
-and IT8783E/F, some voltage inputs are internal and scaled inside the chip:
+On the IT8603E, IT8620E, IT8628E, IT8689E, IT8721F/IT8758E, IT8732F, IT8781F,
+IT8782F, and IT8783E/F, some voltage inputs are internal and scaled inside the
+chip:
+
 * in3 (optional)
 * in7 (optional for IT8781F, IT8782F, and IT8783E/F)
 * in8 (always)
-* in9 (relevant for IT8603E only)
+* in9 (IT8603E, IT8622E, and IT8689E: always AVCC3; others: optional)
+
 The driver handles this transparently so user-space doesn't have to care.
 
 The VID lines (IT8712F/IT8716F/IT8718F/IT8720F) encode the core voltage value:
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 328867242..85e29be93 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -936,8 +936,8 @@ config SENSORS_IT87
 	  If you say yes here you get support for ITE IT8705F, IT8712F, IT8716F,
 	  IT8718F, IT8720F, IT8721F, IT8726F, IT8728F, IT8732F, IT8758E,
 	  IT8771E, IT8772E, IT8781F, IT8782F, IT8783E/F, IT8786E, IT8790E,
-	  IT8603E, IT8620E, IT8623E, and IT8628E sensor chips, and the SiS950
-	  clone.
+	  IT8603E, IT8620E, IT8623E, IT8628E, and IT8689E sensor chips, and
+	  the SiS950 clone.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called it87.
diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 5cfb98a05..5fd310662 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -16,6 +16,7 @@
  *            IT8622E  Super I/O chip w/LPC interface
  *            IT8623E  Super I/O chip w/LPC interface
  *            IT8628E  Super I/O chip w/LPC interface
+ *            IT8689E  Super I/O chip w/LPC interface
  *            IT8705F  Super I/O chip w/LPC interface
  *            IT8712F  Super I/O chip w/LPC interface
  *            IT8716F  Super I/O chip w/LPC interface
@@ -64,7 +65,7 @@
 
 enum chips { it87, it8712, it8716, it8718, it8720, it8721, it8728, it8732,
 	     it8771, it8772, it8781, it8782, it8783, it8786, it8790,
-	     it8792, it8603, it8620, it8622, it8628, it87952 };
+	     it8792, it8603, it8620, it8622, it8628, it8689, it87952 };
 
 static struct platform_device *it87_pdev[2];
 
@@ -162,6 +163,7 @@ static inline void superio_exit(int ioreg, bool noexit)
 #define IT8622E_DEVID 0x8622
 #define IT8623E_DEVID 0x8623
 #define IT8628E_DEVID 0x8628
+#define IT8689E_DEVID 0x8689
 #define IT87952E_DEVID 0x8695
 
 /* Logical device 4 (Environmental Monitor) registers */
@@ -502,6 +504,15 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_SIX_TEMP | FEAT_VIN3_5V | FEAT_FANCTL_ONOFF,
 		.peci_mask = 0x07,
 	},
+	[it8689] = {
+		.name = "it8689",
+		.model = "IT8689E",
+		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
+		  | FEAT_TEMP_OFFSET | FEAT_SIX_FANS | FEAT_IN7_INTERNAL
+		  | FEAT_SIX_PWM | FEAT_PWM_FREQ2 | FEAT_SIX_TEMP | FEAT_AVCC3
+		  | FEAT_FANCTL_ONOFF,
+		.smbus_bitmap = BIT(1) | BIT(2),
+	},
 	[it87952] = {
 		.name = "it87952",
 		.model = "IT87952E",
@@ -2785,6 +2796,9 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	case IT8628E_DEVID:
 		sio_data->type = it8628;
 		break;
+	case IT8689E_DEVID:
+		sio_data->type = it8689;
+		break;
 	case IT87952E_DEVID:
 		sio_data->type = it87952;
 		break;
@@ -3000,6 +3014,51 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 		else
 			sio_data->skip_in |= BIT(9);
 
+		sio_data->beep_pin = superio_inb(sioaddr,
+						 IT87_SIO_BEEP_PIN_REG) & 0x3f;
+	} else if (sio_data->type == it8689) {
+		int reg;
+
+		superio_select(sioaddr, GPIO);
+
+		/* Check for pwm5 */
+		reg = superio_inb(sioaddr, IT87_SIO_GPIO1_REG);
+		if (reg & BIT(6))
+			sio_data->skip_pwm |= BIT(4);
+
+		/* Check for fan4, fan5 */
+		reg = superio_inb(sioaddr, IT87_SIO_GPIO2_REG);
+		if (!(reg & BIT(5)))
+			sio_data->skip_fan |= BIT(3);
+		if (!(reg & BIT(4)))
+			sio_data->skip_fan |= BIT(4);
+
+		/* Check for pwm3, fan3 */
+		reg = superio_inb(sioaddr, IT87_SIO_GPIO3_REG);
+		if (reg & BIT(6))
+			sio_data->skip_pwm |= BIT(2);
+		if (reg & BIT(7))
+			sio_data->skip_fan |= BIT(2);
+
+		/* Check for pwm4 */
+		reg = superio_inb(sioaddr, IT87_SIO_GPIO4_REG);
+		if (reg & BIT(2))
+			sio_data->skip_pwm |= BIT(3);
+
+		/* Check for pwm2, fan2 */
+		reg = superio_inb(sioaddr, IT87_SIO_GPIO5_REG);
+		if (reg & BIT(1))
+			sio_data->skip_pwm |= BIT(1);
+		if (reg & BIT(2))
+			sio_data->skip_fan |= BIT(1);
+		/* Check for pwm6, fan6 */
+		if (!(reg & BIT(7))) {
+			sio_data->skip_pwm |= BIT(5);
+			sio_data->skip_fan |= BIT(5);
+		}
+
+		/* in9 (AVCC3) is always internal, no PINX2 check needed */
+
 		sio_data->beep_pin = superio_inb(sioaddr,
 						 IT87_SIO_BEEP_PIN_REG) & 0x3f;
 	} else if (sio_data->type == it8622) {
-- 
2.53.0

