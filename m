Received: from smtp1.math.uni-bielefeld.de (smtp1.math.uni-bielefeld.de [129.70.45.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2223EA83;
	Thu, 26 Dec 2024 17:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.70.45.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232584; cv=none; b=IXMy8cixfs6BFFaAf+H24ClG4x8YQf5J8ulCfKulLuGx7rtP09alOagH+A6EODN00gaytPlUQ9ZdO+haSwKeTAAc+iXfTi91MupFl0eNID6ihi+EQbaPbaDWwMI12kvNMe0Zf8u4+kPfxULMB9hEo6PBv8t06Dgv/Huw7gTOdj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232584; c=relaxed/simple;
	bh=C8XYXL1DYf/0MBz82fXusinpFQcjl5NwusygMLN0Uzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V6zjhG2WakFeytjl05AB3mYOB5sEC5rSilCTSvFY2dZ1YIsM/tJre+g2K+c719DxjTJbYDwljCNYLG9zGqMuRBkPp5muf1Gyv6zfNM9j+miT+pI+JZe8ZJgv0N7GZYP3ZifdaqdUKEoi08NL7GRlc/vt13tXF8gdMlVAfppC2/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=math.uni-bielefeld.de; spf=pass smtp.mailfrom=math.uni-bielefeld.de; dkim=pass (2048-bit key) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b=Et+rDswJ; arc=none smtp.client-ip=129.70.45.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=math.uni-bielefeld.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=math.uni-bielefeld.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b="Et+rDswJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=math.uni-bielefeld.de; s=default; t=1735232578;
	bh=C8XYXL1DYf/0MBz82fXusinpFQcjl5NwusygMLN0Uzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Et+rDswJF+eZwB4bXFfWOprqOssixG0kPz4biDtOFEOrfJecW/KMR2Qk/mkf6DMN3
	 4+6EHlYwdccznGIzI0g/Wn6AzgYrF4kWMSk07mLXn5qt2Wv7YTsUV3+0lEfI6vS9lN
	 S56mM/AWARs1Shp+c0kxXSO1I4fUoeFX2+VpfPuyFfZl2gw0md9nojaXGAGem7fztM
	 KTN/1Xr7eeNdM0i27yOPVe035ToEJRTo3OteZkoVuwYe7QeJy+H7Ny+Veb6OAlclR3
	 dkdFp+8pFz0oAEEFQFNg2w/y+rEJ1u8JusYdXOBHy91gPRes1u23DMUT6rsJS49VRP
	 znsc7Ra1icy0w==
Received: from localhost (58-32-133-N4.customer.vsm.sh [170.133.32.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp1.math.uni-bielefeld.de (Postfix) with ESMTPSA id E8797206CD;
	Thu, 26 Dec 2024 18:02:57 +0100 (CET)
From: tjakobi@math.uni-bielefeld.de
To: Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] hwmon: (oxp-sensors) Fix wording in code comment
Date: Thu, 26 Dec 2024 18:00:18 +0100
Message-ID: <858c2a5b712eebdf2fc7c9c6e3a2d2f832a68dfc.1735232354.git.tjakobi@math.uni-bielefeld.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1735232354.git.tjakobi@math.uni-bielefeld.de>
References: <cover.1735232354.git.tjakobi@math.uni-bielefeld.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Despite what the current comment says, the register is used
both for reading and writing the PWM value.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/hwmon/oxp-sensors.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/oxp-sensors.c b/drivers/hwmon/oxp-sensors.c
index fbd1463d1494..8089349fa508 100644
--- a/drivers/hwmon/oxp-sensors.c
+++ b/drivers/hwmon/oxp-sensors.c
@@ -46,14 +46,14 @@ static bool unlock_global_acpi_lock(void)
 #define OXP_SENSOR_FAN_REG             0x76 /* Fan reading is 2 registers long */
 #define OXP_2_SENSOR_FAN_REG           0x58 /* Fan reading is 2 registers long */
 #define OXP_SENSOR_PWM_ENABLE_REG      0x4A /* PWM enable is 1 register long */
-#define OXP_SENSOR_PWM_REG             0x4B /* PWM reading is 1 register long */
+#define OXP_SENSOR_PWM_REG             0x4B /* PWM control is 1 register long */
 #define PWM_MODE_AUTO                  0x00
 #define PWM_MODE_MANUAL                0x01
 
 /* OrangePi fan reading and PWM */
 #define ORANGEPI_SENSOR_FAN_REG        0x78 /* Fan reading is 2 registers long */
 #define ORANGEPI_SENSOR_PWM_ENABLE_REG 0x40 /* PWM enable is 1 register long */
-#define ORANGEPI_SENSOR_PWM_REG        0x38 /* PWM reading is 1 register long */
+#define ORANGEPI_SENSOR_PWM_REG        0x38 /* PWM control is 1 register long */
 
 /* Turbo button takeover function
  * Different boards have different values and EC registers
-- 
2.45.2

