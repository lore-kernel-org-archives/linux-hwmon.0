Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3371D241695
	for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 08:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779005106; cv=none; b=e+QezQhZGHF8gl5cKy4irT5agl7MCD0gRuAiTC2ijVNZeDxb2orzISPAXr2oTc1DjuSGus9aseOhSfCQqUn3VOlTxbMFyPMt32EYQCSyH3TWJg3884N8OzduXJeVd57mPZMJSSLiJ1Hdkicewotj+uA8Xgh2TtxQvL/EBUhGYho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779005106; c=relaxed/simple;
	bh=DDnLVn9KE0r6n+8qdAW6um++L3c2y7QGNd7NAvWSOzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JFEnQEnusXWzYs2YnjSOlWKUP5VX+LXh5cHq7YmehTe9YMHkMHtSC+24SduJYEsMOGBxavV+LhlEk5RVQKTm5rqm2LtptCmtsNPDcDVXQXJndsGnRy09k3GIJFX4hKxdE+AAvAFDvKg7teXi+mvg7Bzu2uEaamw7tR3bpdw74us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZzIkHyJ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZzIkHyJ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b458ca2296so8860465ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 01:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779005104; x=1779609904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rx2QX5K9is5rKmLAU+EuwGG/waj5UvUtwnyY95MhkWg=;
        b=dZzIkHyJwIwKjRtAACmqjHKejKi6O+KAouItx2LW0EzOK6kz/wjPaoF2EO0TjPTsVr
         zkR0M6TnHN8SSPl7YJGeYPTVJwgS2eOSXUGgD24hOVrXbGsGQ1lRRBwp6+jtyh1ytMLO
         iplwYaUmFDKxgvyFW7XfEG/5puhGRGCW942tTRqUbxyYkFaiJg95EMWtkH1zRnu3jGxw
         OrrZukARW8WxIcoWsQEvz8yN1aHHBxg9DPGojgQFuKMcI6vRgNbKR4OWk8fsuZ3Jfwfp
         yb4Il7J3hWXkurOiEaHz9VAtmD89cZAy2sVw/7B0lWpqABbhzMKPBMDpah9mIrOXT3fi
         ojRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779005104; x=1779609904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rx2QX5K9is5rKmLAU+EuwGG/waj5UvUtwnyY95MhkWg=;
        b=sicqpbZi8v9wNuBGWukJxFE4ywGLEHqa5En27LAgzjN04WCtPBQk6ZMkOnkdgW91of
         wVITSznQq5qPtUEBk9gDgkJKok++S1F/mihPy5yCA4Ymtz9X2NLrfzJskP6VpYMwe9o/
         a1jG3yfXTx2+j0hqR1/V59KYpgiFmS0arlu/F29wDzeWjIY18h29PY6dRnmtLwAREqCD
         6mWXCWyC37L3gWFgDwks8DtTITf3+K7WW2o4p/suidjKdTX1atswZr9xSMrPDvFe8u+Z
         e/kHbCzFOs7BqO2vebFwUPcJwvaqZizzato47bh8WyhUZBOx8Uil5ge7rWc3aMWEMf2x
         secA==
X-Forwarded-Encrypted: i=1; AFNElJ9AGaxhp8mVhZi7xmbjzh9uRZ9/LbKUKv6dm2teRjLZdTCC8GwWesRDSb9h2WIK+47TMPqKcMkW9gZqNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwsDhoybRZBpxt6ipOUS5x0fDyPpuVBsQO4CyYFV3tos0R2gBu
	sJaERX6K76Gp1xHQwPMBEbaqKtWmNwPrwDeOm8iT0rXCXIG9piwpeBPz
X-Gm-Gg: Acq92OFmsLxeiehnA1yi7eba/+akt4Lm0HZW7Kj6C4I0kRycfMxJ39ag+5IZdZK35sm
	H/hJyzgzhVNMZXj24LkS8RUSLlhBBoErxRyjQyDGIhn8pFPozHq3ZiJHIpzkSfwNkIOiub3ULy+
	CFkioL2ASay9vXiFyy3n0U4TxF0AzX8hqb8/YeHri6mCXXeslVkPrs+4vj0Dd4sPytAP74H9CY+
	ABWLS7LAzxP6nM6e3gKB7urj6J8UqGyqYi1Z2nhwqhOo1BngC+Hwb2vhElpOegbqvcJ+nuMRttl
	wEH0UkTEltqOqBgrGLkTi0rD4gG77J98l+M0XwdJzQcsViq9LCnKHRRp3J57Axm62cAvvIIHROB
	hpYr8vdt9EtgmhhfKPnmkyUz4Xu33oypI6zSLnOtvKH93lLJetYnG60YS2319D2EnKnEmkEYmMJ
	mOvym2fj6FID1yA1Vc6db7uMJ11DH3mPoZaqW0nhibs27+o8/n3/TsqVDu9PX1tRCLns8QT+4=
X-Received: by 2002:a17:903:2ec5:b0:2bd:9061:d544 with SMTP id d9443c01a7336-2bd9061d6bbmr91383835ad.34.1779005104454;
        Sun, 17 May 2026 01:05:04 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2409:4064:2d80:75ca:8541:272f:2bb3:5e55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fb17sm109834595ad.1.2026.05.17.01.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:05:03 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v3 1/3] soc: bcm2835: raspberrypi-firmware: Add voltage domain IDs
Date: Sun, 17 May 2026 13:34:43 +0530
Message-ID: <20260517080445.103962-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Raspberry Pi firmware voltage domain identifiers for the mailbox
property interface.

Also add the voltage request structure used with
RPI_FIRMWARE_GET_VOLTAGE so firmware clients can share the common API
definition from the firmware header.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 include/soc/bcm2835/raspberrypi-firmware.h | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index e1f87fbfe554..975bef529854 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -156,6 +156,31 @@ enum rpi_firmware_clk_id {
 	RPI_FIRMWARE_NUM_CLK_ID,
 };
 
+enum rpi_firmware_volt_id {
+	RPI_FIRMWARE_VOLT_ID_CORE = 1,
+	RPI_FIRMWARE_VOLT_ID_SDRAM_C = 2,
+	RPI_FIRMWARE_VOLT_ID_SDRAM_P = 3,
+	RPI_FIRMWARE_VOLT_ID_SDRAM_I = 4,
+	RPI_FIRMWARE_NUM_VOLT_ID,
+};
+
+/**
+ * struct rpi_firmware_get_voltage_request - Firmware request for a voltage
+ * @id:		ID of the voltage being queried
+ * @value:	Voltage in microvolts. Set by the firmware.
+ *
+ * Used by @RPI_FIRMWARE_GET_VOLTAGE.
+ */
+struct rpi_firmware_get_voltage_request {
+	__le32 id;
+	__le32 value;
+} __packed;
+
+#define RPI_FIRMWARE_GET_VOLTAGE_REQUEST(_id)	\
+	{					\
+		.id = cpu_to_le32(_id),		\
+	}
+
 /**
  * struct rpi_firmware_clk_rate_request - Firmware Request for a rate
  * @id:	ID of the clock being queried
-- 
2.54.0

