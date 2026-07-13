Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBB9396B76
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2026 07:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928796; cv=none; b=YrDscgjexATdsqciY38i8y6/SFDfefIkX3Byb2DbfPancomFozZHHYAJqccQ3GpD1zKEqrNxC9BQYFKHRIt/SvTs5FwrzpPauVIHtNSPyRTWJ4XKx2tls8Z3uWhKabeBd9/Ug/s2tKa3xc+OAV80GVB/sKfosDThPx0zMkr6h/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928796; c=relaxed/simple;
	bh=8D3HkhAmphdUEpR1RhwzMh9d4uJOL7QA8i4LNDI3qZo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YwNb1XDrfJl0QQ7GGtCumXXFeIGcEUpq8BNWikK8PNnm3kwX+eZ4L4/m9no397DurrRaG6h9dlIYdULjlZMJZt6JFWZMJ7jLKLV2B029iI4ftvmmWOHjuS1zNEF2TZhZCBvbOuZ9h8enUwnS7jqtKYJsJuLCW5v5vum1PV0UDIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlPjOUq0; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlPjOUq0"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc6dd436c6so34866165ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2026 00:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783928795; x=1784533595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShwAbMygzjU0orOp/b1DdaJ5AXEffvG0rYavMQ4hKrQ=;
        b=UlPjOUq0viziSGGIGPghFbWJycTZ+O6k7ho7G001rPe6/2iu2OjjUtlGVFs6KWA5s+
         vfd15hUYMBDFh+dJMtV3OCpCarrT8kyPtdCVXdKAR1Cibiz2q6DaaDNslsbXOLJSRwmv
         pFtjkV0wp+SXolSQqHTnZdTHGeau2NsogD1R7ZXy62SOBYrz2RmshO08bbM+Ad/LhvT2
         UdR/JB8P0qW0wj07g2V9TK4NbhaVzlx/txKPrd+5Znki+N5nWesg32kyd79GYOojsF2i
         DS3XEruc1c1bZpRUW+eg4VrnROjS/45KkY70JRCDeakjg8oV54oE3nXvFHcCh1jpTBkF
         dNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928795; x=1784533595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ShwAbMygzjU0orOp/b1DdaJ5AXEffvG0rYavMQ4hKrQ=;
        b=julBZIEflEJrsMFitDtwcM7c3YECkHv3qXNIa8jDq/AYJ6JBKA5Pz1+cApZ2Yu6gvP
         8f7pdNTObBdowOSNCxXw0oqoibW+6F2PNixPcJdUtzjQnjvrSJIlqYQEx+CeMZ/avgGo
         erbyCS68ue+PLcc5hdizIiR5itYsJhupONQ7Xrbsk70aleQJadMZPVV+RweE6m5jn97e
         cKzmi6rFwkE4pCYJTUGehAjpzDqvsG6Xt81c7EDR0H1jv9J2UFReXWxq7PkZMOcHQe55
         niF1K9RqAbfni4CPcIg0r2rEQojp6LUMwnFF2KJbGukh6lYIoFs60pFJgXXw1BAPOMMg
         HwBg==
X-Forwarded-Encrypted: i=1; AHgh+RpmAy41bDlpiQ63ezKpkxI5P6Yzd/IGG0+5aJ+CsAeoL6/nXpE4AWmELOB753WoSc23PxJcVLEfzFJuZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yybepq+dP6MkoVIi9f0yVlSTEut6Z8/cNnDyQwEePEGtIH5JN/v
	AcdWo7aD4/SpUOiV78n9oz4s7snfX/1hThiw+CrgrE2lflkn+efjjcj5
X-Gm-Gg: AfdE7clihfP5BSL37N4gn+Q5priROXrbXgohyZIqnydmJQWiVwMjJIGCm9MqC2eEWGB
	deAhxyJMN/ley/m8R/vPfiMzCa8Lrvb4c5LU5h9teQgFjb89JX7wDvwkCzTW+hdwf9gC1kb/hn4
	CpVbMjzPNgfC/VAAYCZmLaFbMFwaXeSziQ1a+0/UhSJlrcwEqzI1MXBzoadVS7fwTv2n2QgHSXR
	xCPm1hBRgV3hxGew7NnRJjS/hn9tim5KRyg2YCB/QtJ+NQOnbT58AgrWGMfjQXJ3Fwc5jw6OpFP
	9tL/zQuLuvEePIk2hg2gMJHe9Fy8CKW8xgtY1nqazPeFo1TBSsPXAaFftfbbxpPV/Fz+r1gu81O
	0p0U6tDG/iUcCLAWHJ3WVN0oqUeTSV3/QtMWZGlNrDeSdf5axADcTnCevBa6l2IPl5FngRF4GSb
	VnZ/L9iycw4ti2iP/uGo+IZg==
X-Received: by 2002:a17:903:388c:b0:2cc:9773:1313 with SMTP id d9443c01a7336-2ce9ebf84f7mr74433375ad.11.1783928794600;
        Mon, 13 Jul 2026 00:46:34 -0700 (PDT)
Received: from HP.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bde9sm94960105ad.79.2026.07.13.00.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:46:34 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Subject: [PATCH v7 4/4] hwmon: (sht3x) Document support for GXCAS GXHT30
Date: Mon, 13 Jul 2026 15:45:59 +0800
Message-Id: <20260713074559.12196-5-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
References: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GXCAS GXHT30 is a humidity and temperature sensor that is a
drop-in replacement for and fully software compatible with the
Sensirion SHT30.

It is handled by the "sensirion,sht30" fallback compatible without
any driver changes; manual instantiation works with the existing
sht3x device name. Document the chip as supported.

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 Documentation/hwmon/sht3x.rst | 17 ++++++++++++++---
 drivers/hwmon/Kconfig         |  5 +++--
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/sht3x.rst b/Documentation/hwmon/sht3x.rst
index ea1642920295..4f67671eb0cd 100644
--- a/Documentation/hwmon/sht3x.rst
+++ b/Documentation/hwmon/sht3x.rst
@@ -31,6 +31,14 @@ Supported chips:
 
     Datasheet: https://sensirion.com/media/documents/4B40CEF3/640B2346/Sensirion_Humidity_Sensors_SHT85_Datasheet.pdf
 
+  * GXCAS GXHT30
+
+    Prefix: 'sht3x'
+
+    Addresses scanned: none
+
+    Datasheet: https://www.galaxy-cas.com/uploads/files/202509/GXHT30_datasheet_V3.9_20250919170350.pdf
+
 Author:
 
   - David Frey <david.frey@sensirion.com>
@@ -40,9 +48,12 @@ Description
 -----------
 
 This driver implements support for the Sensirion SHT3x-DIS, STS3x-DIS and SHT85
-series of humidity and temperature sensors. Temperature is measured in degrees
-celsius, relative humidity is expressed as a percentage. In the sysfs interface,
-all values are scaled by 1000, i.e. the value for 31.5 degrees celsius is 31500.
+series of humidity and temperature sensors, as well as the compatible GXCAS
+GXHT30. The GXHT30 is a drop-in replacement for the SHT30: instantiate it from
+devicetree with the "gxcas,gxht30", "sensirion,sht30" compatibles, or manually
+using the sht3x device name. Temperature is measured in degrees celsius,
+relative humidity is expressed as a percentage. In the sysfs interface, all
+values are scaled by 1000, i.e. the value for 31.5 degrees celsius is 31500.
 
 The device communicates with the I2C protocol. SHT3x sensors can have the I2C
 addresses 0x44 or 0x45 (0x4a or 0x4b for sts3x), depending on the wiring. SHT85
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 08c29685126a..64fc00ade5ca 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2023,8 +2023,9 @@ config SENSORS_SHT3x
 	depends on I2C
 	select CRC8
 	help
-	  If you say yes here you get support for the Sensiron SHT30, SHT31 and
-	  SHT85 humidity and temperature sensors.
+	  If you say yes here you get support for the Sensiron SHT30, SHT31,
+	  SHT85 and the compatible GXCAS GXHT30 humidity and temperature
+	  sensors.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called sht3x.
-- 
2.34.1

