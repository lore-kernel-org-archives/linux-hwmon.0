Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420096;
	b=sV16WpP+2wekvB8DwPtgc0amuwWWSSf3YfjiqkE41NRqHknBdzSmnsc+Qe+rfFpkhlUV
	 CKL8ZEFsS+AusuccnbAZBlUO1ojXTFJ4u84rV5y5alpXpvZ1cVeLQcYMjnoeWFbd/+6vm
	 uIXQog6iNa9KnM+ARqnOflb/RXUiYRNO4ddn3W+jZnuArmNSdRH0CdFcERuyKv6V+Ijhd
	 DS6pE2DtoSzZoJLx72LwfClTI2TDooE+mxAd9uHOA8nxMEecd9orvXWJ9PJEEoh0L10HU
	 gB4+WQKk0rCHwbo/ubPeroDBWVgpNKOIdlxYKD/sgkNsTvP4Bcpbv0sW+r3UcojOkMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=b/wcztyFl1h504eOKkpYeINrgpdL6aBaPoc94w6/4j8=;
	b=pDQXPfxWZPHbXpFutmYS8GfTU/x7MBLydoNO7gSOxknchZWqfm7I46PLka9bHxGZcJgL
	 9CqB17eniY0AslkxlLyB1Xlfo7hbLVgKwBeW8gXrS5CbqyO7JYeYYEFXnlOg9LXtks4+4
	 Ghpt/kz5vqvZo7SEtzV194XNpOvOCk7brFm9Yhw82hTg5ITX2bWFWR7zSXjbFXitKr5T0
	 gQe0NKWeOoPBiJNHGFji02xPXxTzop4TD9RA/vfxFG5YpEXldz3hghZhulS6fMssNYNcd
	 t/V3veUlncdUC618RECL5LqS03KcKj5DpYKy/blmadOCtE1BtAULTwZhK5ehGmo1bcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pz/KfFaK";
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5BF606A31A
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 07:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A5BF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pz/KfFaK
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cde7e8abf9cso646782a12.0
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 23:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795420096; x=1796024896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b/wcztyFl1h504eOKkpYeINrgpdL6aBaPoc94w6/4j8=;
        b=pz/KfFaKh4QTmju0VFBAaZBqUUDw1EIh93CYEtgu/UkMZ7TWRl2W3D3tz9BpBc0pIM
         emuX/LIUY/XF+cLQKbp5xInqwJxiQhfvUF3ow9dnBCLt0Z2qpd7GhkGbUQnVJB2OGA48
         XIMAmEAZSTDnU9YiGWvWL4Tlfai0NWJ1nWc7AsRs7siJ8eP+uCmHAAKBmbpgtMBajOkd
         MQX9WcAVxG6T5k8zHUwoRNrEFWQboyjAFSogm5fLYJDe6VrgEoD2nBOdh5ruQrA52jv6
         8iyNTH1Zjm4wtzLq0Zgim98EpHJDzw0rASg629hxYM376OzMehM2JDvGucxYCDHwknyw
         Q/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795420096; x=1796024896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b/wcztyFl1h504eOKkpYeINrgpdL6aBaPoc94w6/4j8=;
        b=Q6uW3webxg+Y/cmcJgyXATShySdrTsaKA8rUwANiRLLtFcji8EHcPcnH3YvZXcex2g
         cKzpgBk8g9Ip5QiLVuq8vgeX5Qd066KU9nSQJHBG5RCpm0MfC8We5PvQfHn/DU9c48MF
         5WCw0Iwei/poLnm+sLDp/vmSIfKW1JZ1DZgip51FJzUjPgQzJc2jKGI5YjYQTxFR643Z
         9/2AcxGVnRWCzUfV5mbRocJTP+ekeZ/meCQp2MBMByIIELU3PQmi4VIH90+dMB8b8kfq
         2qNqbYRH9V3H3CfAjYlTTDR4aw2Zgdky3hv5dgQQZjTNOIeorakCBbtOLuDhokjfKXSn
         QfTg==
X-Gm-Message-State: APuU4Z+TCtRdGbnGBki+JPsACUFyOwhWxEAbbhOXkgxpOH7avhYgIsf4
	h6lBlsByDh55Qsfbqgb2dqccleVasww34SzwuvhGAf8PKnPvNgv3kV7XPLZM0w==
X-Gm-Gg: AZFdTZejFUZiES3a08Ct9i1z+uvjqx1vXg3dQ4Eo2ozA/gf8cXpGTUKT7jjyzo4sqj1
	QJ9E/gJn1qh73faaKi5urrPQhCPisKnMBnzykhjQRx4a3KXUYz1dJsbkyxNQlZHBlwbcd7eWZeF
	4pAK31HbkLAwAa/rJw5BcAKrbk+8C66SLISBZMhbwkYNSzdUeV2mpT4CM2heJl9Uv1dvJCtj8TL
	F83lNFjOdBMFPj23S764VX/7JGprqurWq16vb9F/beQdBeB3QharZbA9Di+9TwUnFDCEncX9t94
	a3KprM+CLgE/gawNPmlieY2NibBs1VEd8WWtp+mcU1OgqVYGcGRvnEQBKtPhgLtLXXilqBUkMZG
	d+GBW3Q6zXSqvh7kc47mx5lz+7H4FgosIS9qLVtkZj7SicvRSqpu5uwYNDDzSwb+X41qhd/zkOW
	ZMCBc7dgYZwW+wIWjmNyeHTAf2AFduWN10qSKNS+aRMmovrIrPRR7+jIU2lFka2Fc4N/gYSdI+e
	Ob74+s8pGVDnAS8uFCJX98kiOLqs+3QRI5E/oc0BOJ6ecuoo510w88j3F00RpSOfq3IqJ1ihkGb
	zYR1DFCmodmYu7qW5ft48i0wxkqpr3/68n5UV5n8pw4Yz41Q2fl2/vzHdQkKAQdWeOSKUKbIVeW
	zdrg30Ih6IbUWdT9utIByjRE/ynhyx8OpGwX16VVhUQfrCzsjxyM1+U86gqAdz7zOix3+hspWNB
	VCqw==
X-Received: by 2002:a17:90b:4a48:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3b41c7b60b5mr9555618a91.6.1795420095734;
        Sun, 22 Nov 2026 23:48:15 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8ef99sm17137865a91.12.2026.11.22.23.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:48:15 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-hwmon@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH hwmon-next] hwmon: (it87) Add support for IT8686E
Date: Sun, 22 Nov 2026 23:48:13 -0800
Message-ID: <20261123074813.18577-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IT8686E is the main Super I/O chip on many Gigabyte AM4 and LGA1151
boards, often paired with an IT8792E. Its hardware monitoring block
matches the IT8689E: 12 mV ADC, 16-bit fan counters, six fans, six PWM
channels, six temperature inputs and the newer autopwm. The fan and
PWM pin multiplexing is read from the same GPIO registers.

Unlike the IT8689E, where AVCC3 is always present on in9, the IT8686E
only measures AVCC3 when bit 0 of the PINX2 register is set. Hide in9
when it isn't.

Tested on a Gigabyte X470 AORUS ULTRA GAMING (IT8686E rev 2 at 0xa40,
IT8792E at 0xa60). All six temperatures, fan1/fan2 and pwm1-pwm4 report
sensible values; the CPU temperature tracks k10temp. in9 is hidden,
since the board's BIOS does not set PINX2 bit 0. The board's BIOS
claims the chip's I/O ports in an ACPI OpRegion, so testing used
ignore_resource_conflict=1.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 An AI coding assistant (Claude Code, Claude Opus 5.5) was used to port
 the chip description from the out-of-tree it87 driver, write this patch
 and run the hardware tests.

 Documentation/hwmon/it87.rst | 17 +++++++++++++----
 drivers/hwmon/Kconfig        |  4 ++--
 drivers/hwmon/it87.c         | 32 +++++++++++++++++++++++++++++---
 3 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/Documentation/hwmon/it87.rst b/Documentation/hwmon/it87.rst
index 17bfffb5fb11..defbcff4d5b8 100644
--- a/Documentation/hwmon/it87.rst
+++ b/Documentation/hwmon/it87.rst
@@ -41,6 +41,14 @@ Supported chips:
 
     Datasheet: Not publicly available
 
+  * IT8686E
+
+    Prefix: 'it8686'
+
+    Addresses scanned: from Super I/O config space (8 I/O ports)
+
+    Datasheet: Not publicly available
+
   * IT8689E
 
     Prefix: 'it8689'
@@ -252,7 +260,7 @@ Description
 -----------
 
 This driver implements support for the IT8603E, IT8607E, IT8620E, IT8623E, IT8628E,
-IT8689E, IT8705F, IT8712F, IT8716F, IT8718F, IT8720F, IT8721F, IT8726F,
+IT8686E, IT8689E, IT8705F, IT8712F, IT8716F, IT8718F, IT8720F, IT8721F, IT8726F,
 IT8728F, IT8732F, IT8758E, IT8771E, IT8772E, IT8781F, IT8782F, IT8783E/F,
 IT8786E, IT8790E, IT8792E/IT8795E, IT87952E and SiS950 chips.
 
@@ -304,7 +312,7 @@ with ``ignore_resource_conflict=1``.
 The IT8620E and IT8628E are custom designs, hardware monitoring part is similar
 to IT8728F. It only supports 16-bit fan mode. Both chips support up to 6 fans.
 
-The IT8689E supports newer autopwm, 12mV ADC, 16-bit fans, six fans, six PWM
+The IT8686E and IT8689E support newer autopwm, 12mV ADC, 16-bit fans, six fans, six PWM
 channels, PWM frequency 2, six temperature inputs, and AVCC3 (in9).
 
 The IT8790E, IT8792E/IT8795E and IT87952E support up to 3 fans. 16-bit fan
@@ -334,14 +342,15 @@ of 0.016 volt.  IT8603E, IT8721F/IT8758E and IT8728F can measure between 0 and
 2.8 volts with a resolution of 0.0109 volt.  The battery voltage in8 does not
 have limit registers.
 
-On the IT8603E, IT8620E, IT8628E, IT8689E, IT8721F/IT8758E, IT8732F, IT8781F,
+On the IT8603E, IT8620E, IT8628E, IT8686E, IT8689E, IT8721F/IT8758E, IT8732F, IT8781F,
 IT8782F, and IT8783E/F, some voltage inputs are internal and scaled inside the
 chip:
 
 * in3 (optional)
 * in7 (optional for IT8781F, IT8782F, and IT8783E/F)
 * in8 (always)
-* in9 (IT8603E, IT8622E, and IT8689E: always AVCC3; others: optional)
+* in9 (IT8603E, IT8622E, and IT8689E: always AVCC3;
+  IT8686E: AVCC3 if enabled; others: optional)
 
 The driver handles this transparently so user-space doesn't have to care.
 
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index bd408fc6f876..a99c8a127f4a 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -976,8 +976,8 @@ config SENSORS_IT87
 	  If you say yes here you get support for ITE IT8705F, IT8712F, IT8716F,
 	  IT8718F, IT8720F, IT8721F, IT8726F, IT8728F, IT8732F, IT8758E,
 	  IT8771E, IT8772E, IT8781F, IT8782F, IT8783E/F, IT8786E, IT8790E,
-	  IT8603E, IT8607E, IT8620E, IT8623E, IT8628E, and IT8689E sensor chips,
-	  and the SiS950 clone.
+	  IT8603E, IT8607E, IT8620E, IT8623E, IT8628E, IT8686E, and IT8689E
+	  sensor chips, and the SiS950 clone.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called it87.
diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index c6cdb04add1a..fa4fcd5f685f 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -17,6 +17,7 @@
  *            IT8622E  Super I/O chip w/LPC interface
  *            IT8623E  Super I/O chip w/LPC interface
  *            IT8628E  Super I/O chip w/LPC interface
+ *            IT8686E  Super I/O chip w/LPC interface
  *            IT8689E  Super I/O chip w/LPC interface
  *            IT8705F  Super I/O chip w/LPC interface
  *            IT8712F  Super I/O chip w/LPC interface
@@ -67,7 +68,7 @@
 
 enum chips { it87, it8712, it8716, it8718, it8720, it8721, it8728, it8732,
 	     it8771, it8772, it8781, it8782, it8783, it8786, it8790,
-	     it8792, it8603, it8607, it8613, it8620, it8622, it8628, it8689, it87952 };
+	     it8792, it8603, it8607, it8613, it8620, it8622, it8628, it8686, it8689, it87952 };
 
 static struct platform_device *it87_pdev[2];
 
@@ -167,6 +168,7 @@ static inline void superio_exit(int ioreg, bool noexit)
 #define IT8622E_DEVID 0x8622
 #define IT8623E_DEVID 0x8623
 #define IT8628E_DEVID 0x8628
+#define IT8686E_DEVID 0x8686
 #define IT8689E_DEVID 0x8689
 #define IT87952E_DEVID 0x8695
 
@@ -576,6 +578,17 @@ static const struct it87_devices it87_devices[] = {
 		.num_temp_map = 3,
 		.peci_mask = 0x07,
 	},
+	[it8686] = {
+		.name = "it8686",
+		.model = "IT8686E",
+		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
+		  | FEAT_TEMP_OFFSET | FEAT_SIX_FANS | FEAT_IN7_INTERNAL
+		  | FEAT_SIX_PWM | FEAT_PWM_FREQ2 | FEAT_SIX_TEMP | FEAT_AVCC3
+		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
+		.num_temp_map = 3,
+		.smbus_bitmap = BIT(1) | BIT(2),
+	},
 	[it8689] = {
 		.name = "it8689",
 		.model = "IT8689E",
@@ -2965,6 +2978,9 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	case IT8628E_DEVID:
 		sio_data->type = it8628;
 		break;
+	case IT8686E_DEVID:
+		sio_data->type = it8686;
+		break;
 	case IT8689E_DEVID:
 		sio_data->type = it8689;
 		break;
@@ -3222,7 +3238,7 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 
 		sio_data->beep_pin = superio_inb(sioaddr,
 						 IT87_SIO_BEEP_PIN_REG) & 0x3f;
-	} else if (sio_data->type == it8689) {
+	} else if (sio_data->type == it8686 || sio_data->type == it8689) {
 		int reg;
 
 		superio_select(sioaddr, GPIO);
@@ -3263,7 +3279,17 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 			sio_data->skip_fan |= BIT(5);
 		}
 
-		/* in9 (AVCC3) is always internal, no PINX2 check needed */
+		/*
+		 * in9 (AVCC3) is always internal on the IT8689E. On the
+		 * IT8686E, PINX2 bit 0 enables AVCC3 monitoring on in9.
+		 */
+		if (sio_data->type == it8686) {
+			reg = superio_inb(sioaddr, IT87_SIO_PINX2_REG);
+			if (!(reg & BIT(0))) {
+				sio_data->internal &= ~BIT(3);
+				sio_data->skip_in |= BIT(9);
+			}
+		}
 
 		sio_data->beep_pin = superio_inb(sioaddr,
 						 IT87_SIO_BEEP_PIN_REG) & 0x3f;
-- 
2.56.1

