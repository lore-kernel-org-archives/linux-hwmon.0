Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F9F21FF4A
	for <linux-hwmon@vger.kernel.org>; Sat, 10 Jan 2026 01:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768008380; cv=none; b=N5QLnB0mj28he+KzswLLA/n+klxCHeBNc/HEVJKLqbotblEkg4SwMB/POZ2rTPzhq3xshCE5wS+23Ox3ADgs8Way5bv+iszZcTjUMeHxk74T+gOQRaXt9a1mmsxS0mifbD/BHi49RW0kBKO9MT8oG7QeOXoM3k4vA3b1kYkWJnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768008380; c=relaxed/simple;
	bh=G6MPiWmCfm4WeUOSkgdWaFCkPrUZYSc2Z3Bh2ntbl9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xqna+C9NQU893LRIsX6I6NY5bSG80biYXvrQGUWkhl5HOoN95OD1qM0yKuYTUthuSD9XXPsorkrx/9/V8wlSF6eAkzrQ5Vxak/xcT9RJI2A7QcJ5KJIul3D+qNbplfpPYhHNrSjq07/qgIIIStSPBVJaYRN0Y3XQpLAY2CkVo6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=iFBOPiAY; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="iFBOPiAY"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-432755545fcso2786708f8f.1
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Jan 2026 17:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1768008376; x=1768613176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvlTqiOO5NPtNnil6KKR4YRQ0iR/9rOxKazLvu+WIxg=;
        b=iFBOPiAY/tGEFjagqc3xH6I+U+/+XJhryWMhrdR+mx1Aa1d5021gecXWjknFjnfTdq
         2dswVD/WWAFB9qC7HEwMY0/PUKUUyszzK6r6Q6P1r/HAMW4ZBHse4Fxa2lrBsF+V+0Z9
         ctkEgFRHKMYAeTKPl55VF08gcquDRNHKye0YvPHMshpm7NE+AihTUckeKvmenlbKJp+L
         xrZUkxr5fbMsX09joaYEyZ5jUVO4A2iWLl+bYUJbaI40mcJRQXA1xv5a+CY8k8ngiA5g
         E+x5VrHlO/IWL/NqDjZ08Gq/yivbRt6B8KB0AmCbpT05y6y4Fx6XfaLrsNS+/XfNO6MQ
         VnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768008376; x=1768613176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WvlTqiOO5NPtNnil6KKR4YRQ0iR/9rOxKazLvu+WIxg=;
        b=bITXwo4ulBP3ZIjOC7qxeca3T02xMnjj1d+a9qsoYLX3At/vQYkdM1QNL5DWOd48KC
         M1kW/m7zocuU+KJIWCRE4CiboucUZC/WQPo7CdRUoN40aa+O/Tpmtj6fWIT5Wh10Iw0n
         oPAqCFne+IqgwtJFdv8fynE+peYLua8nWYwy4uuVPGb87xq5t56zZuMBngzCa3LE0ON5
         SW0gJAUyobVhMay3sgACa6PGrBAKrp3moceKqL8uuscCjnCpB4UNU9Lox3a1yK0lvDxZ
         7YNIBmyPnpJxBnXQN1STbMcrttfh6pc55nLVBRTgCvUU9fJCF8o8lLnOuGEJ3Eepwx6c
         CrIg==
X-Forwarded-Encrypted: i=1; AJvYcCW+gBR5J0qwTAtZorDcTMjyXuHT59gIGdt/wM8Psx3x9QAH/cyE61qG7+PN7hnA1Jy3OtdLcj6YIA+P+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhmQAu2ggi/RztZ4WBHY8RUINAYngaUUehJ9+bwcXTjRu9GuBn
	de1CTaEiW/ED1oSzoF/+kYscq9K7hXrMtJtDZZEkhGE+mvK8pHfd1lbAlwg4ZOm7vg==
X-Gm-Gg: AY/fxX6X8gcw6KuJpbH9QwuhVP78ciTSJhshhmdyr8Qo4QH0ntBde9VCc2fYs2/M3Fs
	0O7YJwk9vHItKTug9LyzAhqRSk454TeNSnhQzlgU+xG8yb0wx8kx2/AZ3m8HEZeSiS7k433Bzbk
	0qLv3gTS/dw1s12WWsQv83FNUKdZlLgapeJhbiomIx9eq+A8BPxxfk7Ajo3YS2CLSziPHkrm+eo
	FOVIyUac0C2/HZz7n8Iy55eSfqBB0iMB2QmuWRW5TxNTXmVEiX/KJlHpO/pK12UaNbQ6LR+0jI7
	7fsCmZpU8BqVjVHBy2nor1297NEs9C+DT6lgMy1tjZDEliszCXs7syKiN11OFW6r02zqn9etuDa
	f1YXNLD/+EMTjWqMzDmS9Nq40M2NQ/tHzF8e9KlgaUhUwd1Jno5YeD9ZsdXJXiLqzt/KfTPMFHh
	eQLhQ8TXI+njBsIRNriCyuighbL0BGfdMljAMBCk8=
X-Google-Smtp-Source: AGHT+IF9lM8KYyujz8/cfwH+zS1xvT8MEAAuD+dppuvtWLUMQ6qnwd6oQTPkpWwmaM2WBhIER/kqxQ==
X-Received: by 2002:a05:6000:1448:b0:430:fa9a:75a with SMTP id ffacd0b85a97d-432c37758a5mr15615908f8f.62.1768008376524;
        Fri, 09 Jan 2026 17:26:16 -0800 (PST)
Received: from mac.net ([2001:861:8b92:2c50:6cf2:f0aa:7bc6:15fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e1adbsm25859761f8f.17.2026.01.09.17.26.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 09 Jan 2026 17:26:16 -0800 (PST)
From: "benoit.masson" <yahoo@perenite.com>
To: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"benoit.masson" <yahoo@perenite.com>
Subject: [PATCH v3 4/5] hwmon: it87: add IT8613E identification
Date: Sat, 10 Jan 2026 02:26:12 +0100
Message-ID: <20260110012613.48150-4-yahoo@perenite.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260110012613.48150-1-yahoo@perenite.com>
References: <20260110012613.48150-1-yahoo@perenite.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Teach the Super I/O probe path to recognize IT8613E and advertise
its model name in the supported device list.

Signed-off-by: benoit.masson <yahoo@perenite.com>
---
 drivers/hwmon/it87.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 90230e693152..1f4936c0e746 100644
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
@@ -482,6 +484,10 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_AVCC3 | FEAT_PWM_FREQ2,
 		.peci_mask = 0x07,
 	},
+	[it8613] = {
+		.name = "it8613",
+		.model = "IT8613E",
+	},
 	[it8620] = {
 		.name = "it8620",
 		.model = "IT8620E",
@@ -2912,6 +2918,9 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	case IT8623E_DEVID:
 		sio_data->type = it8603;
 		break;
+	case IT8613E_DEVID:
+		sio_data->type = it8613;
+		break;
 	case IT8620E_DEVID:
 		sio_data->type = it8620;
 		break;
-- 
2.50.1 (Apple Git-155)

