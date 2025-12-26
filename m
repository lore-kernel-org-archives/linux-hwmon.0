Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49F21DDC33
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Dec 2025 23:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766790142; cv=none; b=i09e4cGHBupw27zSVY0ym+EZEz/ud2StREJMyeNsF+0QmtceryBjBwSXCf5LJKfJOXrVsWRquxamKVsjhfEGMzM/qBPv16n4pP50wac9jNUR1UocZiIOfioDDWzg+lBFGnwmagvs7FD5Ju95VKs6yIewhKp2+TNImg/Q58i0a2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766790142; c=relaxed/simple;
	bh=3vJP0vEFF+CdMyEI6neWY3RmuWXfFvEKiAhhUNCqo4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kXgPF2MNWeAu2s2f1EgDhhHb5bXFQvvmb/M9uWhjkHJWXzCby/wpTj2in2sjQhwZs9+NFoERDTgaXpa3FSRCxpY4+UVg71OzwpGFjzTxPRKyRKlpL1HEQT+pNJWdm8hxanIl4bd1tqxXT5pRJ59c9U1Icatu4zchtu1u/ogE6kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=0xu09zBo; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="0xu09zBo"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so59751325e9.3
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Dec 2025 15:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1766790137; x=1767394937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MlanCnT+X1TvZ3WNBq6uqil+ndvY4uRzfjvvIDNgIq0=;
        b=0xu09zBoH1g8lHV0h1q2hftqcWI0eVQFkZlaZ1iCjcKwPAp/yNok44XXQIKG2oyksZ
         eBPCBn83UmiYoGOXFd9YZwnuGce+rjdSC4pcWkyQQO420+7Cy0LwFjzgG+ttAYNPmmsh
         rwWcLyB5jD+tDXo5ZqeO54LS9o9qFsgdC+n4pPuSUZHmaSapkiVGF50RxQmNm8bWzJl3
         aOAGXrGsaIdYUq3+75IvxUNZCV3+rg8PXVsW9nJhnpB53QXVQgMT/FLK7ZcsrDG5dijd
         dOxvUvP2O+UGQz1N4CCJ7MAIYBQSZ/28bpkMap4yMdilgbgV1beBJYADQDTlWiKHBsgJ
         qRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766790137; x=1767394937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlanCnT+X1TvZ3WNBq6uqil+ndvY4uRzfjvvIDNgIq0=;
        b=cQUBzUSHrtcYbDhE8hPUI3a8nc8Sn7hPHoKZtV20BbMNjvk5XO76ff8IXm5MBrdf2A
         WZ0a9LfKgTv4mKK60dbvNjbNZ/ylR+VvXrPNMrQbsimIKHB/a9OQHgrGiSDz52rh2oaJ
         qNn+5YSfbc76oqcWLf3WdO5MaUu4ewLhe928ABlD3FFK5tGuZmnxkG6VZk/2O3FSc4pl
         M6BQaWksWXQmSP5Q8KFnSghGi8nWfGSaHzqCUexFEftRCFJgyIBrZBSxzdN01lE5H6o6
         eIFe3sllPJFLrUMiMSkMxBC7sL91pDnhuzeubD6oey3WQJpsRBEOJGOxx0Br9ZPOnCvf
         JTVw==
X-Gm-Message-State: AOJu0YwEZk72eBrzqleUDEZeArwkO3HjlCdms4g3iBsLNpR/q1pEwmjI
	oLF5Lpx820f8zJjHhbRA59Vme/iHXmKEQaM8TmjH6zQ2t/S05cYNeeNTcph2pfYgFA==
X-Gm-Gg: AY/fxX7hRzOnpbi7SYx2E+1i1RKOgSVzAwhwK3N4i5RmizollNGRmS/o1SOuqJgBYBl
	3HQi6Ls3q0bRuY3fctazAAhSm2LFGMj0XE4IdK+13Jh/2fpi5kyY7ebqhVK/yU1tgE6Hl4ylcWb
	3ErqAMRrGvV/662LkSWuVm2bFqIJIn4hU6whik7/V4GDLDSSPDzYNJRvUX9q/+19QSMajMcGPug
	hTE65AKrVKGAA+p5KwnDwpjzNnCqgpeZ5ypApDv6O1lWgUyfPSFOArz7Yqyd40vvI1SvNn7WgFH
	LEY5Jo++I44oy4O6P2CF3JZ49McFHXQhytZfeXUDqyTq8Co+Ayz5YLelxd4riieDmXSPnN5JT8y
	02OEtON92SyYO0pwrWaskTHNDEqy4pYP/ke9XRjGjl0WLH4vjzcg6RV6JKymdBaknk+vGvBrbXE
	hyLNwxCow573ULIs0B0OFgJfgPcgCcOL7R7pavRlg=
X-Google-Smtp-Source: AGHT+IE2L5kOkn+m6onUYkY9WjykShw+I9WJbbreoLTepQwm1b+2vGih9PnUIzP/q7iUal2nAPgDzg==
X-Received: by 2002:a05:600c:46d1:b0:47a:8088:439c with SMTP id 5b1f17b1804b1-47d1959d6a0mr269774575e9.35.1766790136522;
        Fri, 26 Dec 2025 15:02:16 -0800 (PST)
Received: from mac.net ([2001:861:8b92:2c50:e0be:8639:3d60:4c9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346d33sm422589085e9.3.2025.12.26.15.02.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Dec 2025 15:02:16 -0800 (PST)
From: "benoit.masson" <yahoo@perenite.com>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"benoit.masson" <yahoo@perenite.com>
Subject: [PATCH] hwmon: it87: add IT8613E detection and quirks
Date: Sat, 27 Dec 2025 00:02:13 +0100
Message-ID: <20251226230213.51974-1-yahoo@perenite.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: benoit.masson <yahoo@perenite.com>
---
 drivers/hwmon/it87.c | 63 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index d50c40f8607f..747775e58c25 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -35,6 +35,7 @@
  *            IT8790E  Super I/O chip w/LPC interface
  *            IT8792E  Super I/O chip w/LPC interface
  *            IT87952E  Super I/O chip w/LPC interface
+ *            IT8613E  Super I/O chip w/LPC interface
  *            Sis950   A clone of the IT8705F
  *
  *  Copyright (C) 2001 Chris Gauthron
@@ -65,7 +66,7 @@
 
 enum chips { it87, it8712, it8716, it8718, it8720, it8721, it8728, it8732,
 	     it8771, it8772, it8781, it8782, it8783, it8786, it8790,
-	     it8792, it8603, it8620, it8622, it8628, it87952 };
+	     it8792, it8603, it8613, it8620, it8622, it8628, it87952 };
 
 static struct platform_device *it87_pdev[2];
 
@@ -159,6 +160,7 @@ static inline void superio_exit(int ioreg, bool noexit)
 #define IT8786E_DEVID 0x8786
 #define IT8790E_DEVID 0x8790
 #define IT8603E_DEVID 0x8603
+#define IT8613E_DEVID 0x8613
 #define IT8620E_DEVID 0x8620
 #define IT8622E_DEVID 0x8622
 #define IT8623E_DEVID 0x8623
@@ -339,6 +341,7 @@ struct it87_devices {
 #define FEAT_FOUR_TEMP		BIT(22)
 #define FEAT_FANCTL_ONOFF	BIT(23)	/* chip has FAN_CTL ON/OFF */
 #define FEAT_NEW_TEMPMAP	BIT(24)	/* PWM uses extended temp map */
+#define FEAT_11MV_ADC		BIT(25)
 
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
@@ -487,6 +490,18 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_AVCC3 | FEAT_PWM_FREQ2,
 		.peci_mask = 0x07,
 	},
+	[it8613] = {
+		.name = "it8613",
+		.model = "IT8613E",
+		.features = FEAT_NEWER_AUTOPWM | FEAT_11MV_ADC | FEAT_16BIT_FANS
+		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_FIVE_FANS
+		  | FEAT_FIVE_PWM | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
+		  | FEAT_AVCC3 | FEAT_NEW_TEMPMAP,
+		.num_temp_limit = 6,
+		.num_temp_offset = 6,
+		.num_temp_map = 6,
+		.peci_mask = 0x07,
+	},
 	[it8620] = {
 		.name = "it8620",
 		.model = "IT8620E",
@@ -530,6 +545,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_16bit_fans(data)	((data)->features & FEAT_16BIT_FANS)
 #define has_12mv_adc(data)	((data)->features & FEAT_12MV_ADC)
 #define has_10_9mv_adc(data)	((data)->features & FEAT_10_9MV_ADC)
+#define has_11mv_adc(data)	((data)->features & FEAT_11MV_ADC)
 #define has_newer_autopwm(data)	((data)->features & FEAT_NEWER_AUTOPWM)
 #define has_old_autopwm(data)	((data)->features & FEAT_OLD_AUTOPWM)
 #define has_temp_offset(data)	((data)->features & FEAT_TEMP_OFFSET)
@@ -560,7 +576,8 @@ static const struct it87_devices it87_devices[] = {
 #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
 #define has_noconf(data)	((data)->features & FEAT_NOCONF)
 #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
-						     FEAT_10_9MV_ADC))
+						     FEAT_10_9MV_ADC | \
+						     FEAT_11MV_ADC))
 #define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
 #define has_new_tempmap(data)	((data)->features & FEAT_NEW_TEMPMAP)
 
@@ -669,6 +686,8 @@ static int adc_lsb(const struct it87_data *data, int nr)
 		lsb = 120;
 	else if (has_10_9mv_adc(data))
 		lsb = 109;
+	else if (has_11mv_adc(data))
+		lsb = 110;
 	else
 		lsb = 160;
 	if (data->in_scaled & BIT(nr))
@@ -2904,6 +2923,9 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	case IT8623E_DEVID:
 		sio_data->type = it8603;
 		break;
+	case IT8613E_DEVID:
+		sio_data->type = it8613;
+		break;
 	case IT8620E_DEVID:
 		sio_data->type = it8620;
 		break;
@@ -3078,6 +3100,43 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 		sio_data->skip_in |= BIT(5); /* No VIN5 */
 		sio_data->skip_in |= BIT(6); /* No VIN6 */
 
+		sio_data->beep_pin = superio_inb(sioaddr,
+						 IT87_SIO_BEEP_PIN_REG) & 0x3f;
+	} else if (sio_data->type == it8613) {
+		int reg27, reg29, reg2a;
+
+		superio_select(sioaddr, GPIO);
+
+		/* Check for pwm3, fan3, pwm5, fan5 */
+		reg27 = superio_inb(sioaddr, IT87_SIO_GPIO3_REG);
+		if (!(reg27 & BIT(1)))
+			sio_data->skip_fan |= BIT(4);
+		if (reg27 & BIT(3))
+			sio_data->skip_pwm |= BIT(4);
+		if (reg27 & BIT(6))
+			sio_data->skip_pwm |= BIT(2);
+		if (reg27 & BIT(7))
+			sio_data->skip_fan |= BIT(2);
+
+		/* Check for pwm2, fan2 */
+		reg29 = superio_inb(sioaddr, IT87_SIO_GPIO5_REG);
+		if (reg29 & BIT(1))
+			sio_data->skip_pwm |= BIT(1);
+		if (reg29 & BIT(2))
+			sio_data->skip_fan |= BIT(1);
+
+		/* Check for pwm4, fan4 */
+		reg2a = superio_inb(sioaddr, IT87_SIO_PINX1_REG);
+		if (!(reg2a & BIT(0)) || (reg29 & BIT(7))) {
+			sio_data->skip_fan |= BIT(3);
+			sio_data->skip_pwm |= BIT(3);
+		}
+
+		sio_data->skip_pwm |= BIT(0); /* No pwm1 */
+		sio_data->skip_fan |= BIT(0); /* No fan1 */
+		sio_data->skip_in |= BIT(3);  /* No VIN3 */
+		sio_data->skip_in |= BIT(6);  /* No VIN6 */
+
 		sio_data->beep_pin = superio_inb(sioaddr,
 						 IT87_SIO_BEEP_PIN_REG) & 0x3f;
 	} else if (sio_data->type == it8620 || sio_data->type == it8628) {
-- 
2.50.1 (Apple Git-155)

