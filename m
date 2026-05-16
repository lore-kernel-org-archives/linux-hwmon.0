Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3864363C40
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 19:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778958979; cv=none; b=PwDo+ueIT+FlaqHd250SIGMQiuzc6bEiwyava1l273jqRn7VBCRqlMjTjxr90IenUqsHOfgz9Oxvv8DJlThvDJYVsFBxsOwGnyDGVxdcXvpXTrlkE3dJDaPq4ZAzFECGA+WFCE34cS1CvwAzfWrEZHs2exq3se/yoGXdk0qm5sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778958979; c=relaxed/simple;
	bh=MRPV5zUu6yyUdxum0e8Ue6sn/wJJi1vCfLPQouP7Bo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QDtq49FmQaYDM3sm2HU419yuyUy8dsmEuSmpauwQtPi5xYp2vbTC/uD71ZwJi4uKGeSacsv4EJ2fx2/ykaS89G8HeAX6+4RqzJg/wBBh/n+x5LrVTV41q5okcLxnhJg+jVi9G2UJ9Q3E8ewobrBGu2P4XWV1AsoFpg37DoTxUVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFt45YnW; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFt45YnW"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8383fb7143aso391643b3a.3
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 12:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778958977; x=1779563777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7JFWJeo/pdX1qMY2KKRekWYJYWmJZk+1tkiUe+PVAk=;
        b=KFt45YnWqo7F+zO3SCctwisCK5KUv2v7So6efS5tquxDQ8MHreTLKDbvBi6Lf2axCb
         poHv1e+LYFW8S+InNjjBkMPqrJ9Yst7SzshdYL82J6K4e31kKZVH2Et4LYm2C7pj7RFt
         BCmhPsqABLteMmMQAt/6c9Tu4WbZrXaWuPEd4/XUZoWmVzXuz2LZXGcvzOyiw1sXmQMr
         36HAuozw8KhfV6Vfh2QiImenGDN614iiyYxMmDMGT8DA39Zah40q5ZANUh1huUWcfYhv
         xkcTUkHIda5wm0jVI90eWI9xwpPPWL838atd919lHKay0hi8s0Vc4GrNKsQVpW6HQ+T5
         P7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778958977; x=1779563777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A7JFWJeo/pdX1qMY2KKRekWYJYWmJZk+1tkiUe+PVAk=;
        b=p+NYiWAT5xRAD01F2lcBZKyl0Am+5yco8nXPuXWqaFGgA233TXVgICpp2fL2B7a7uf
         tg1O3Waypwft561fDP1EOlJGQX1lKCGCpdu4tih/fFvjQakQneMpIkwe8RfDq4chYp2C
         h5JBY/6QEZDi7DBln3NCNOe/o2OCllWBrI8JqKVCMR/gHY/Ckk8nTDZF2yIqOWB7NMPe
         1ykUluPID8jlWAvDkPcSd93lFuEs4sgTRtl33iK72LL0HrW4geG5dD8O8CqsYXwX599c
         Iz/JpTEWuk8Erg+101N9JS30J0+ZczvPHU0UoCL5iOGfUztRaOmxVaUWIymdTI6NB4GL
         ov9w==
X-Forwarded-Encrypted: i=1; AFNElJ94ZvmjlfExeazbbduhK/GOv+AdmfCqcdIs3Fi3sT3YDBVxUv3j5SSKNP6BjkZxOFa4snm123i2UpDEbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw/1apBrNRm95X2fWkkM4p9WRZWqv7q3sJ4JW9DUYqGK40EpZm
	E88Jip4vh9ibOHfonID4MNzLKGdvifYL3z+YE5AL+X8TuQkonUv4slrt
X-Gm-Gg: Acq92OGKHiR7w13eXW2QF3cEHUiyIkXG6zv+uueibJykFmyfCq5Yb/ZPEeO/BYOHjiF
	af0r0O0bwc7twmj/cTqZvhFkwUKO4PkokK/BMoOcn/EMOHOPSZMWXoXlkUr/I2HCNVVnPiFDhQj
	A0i9iF77Nwww5Ct18KkRbz1cs96Vz+PfmDLXpldnBS35h/PNDoJzP5fxM2aiPb8mitkzpEY5Geu
	QonceX0+/fMPiCJC2ggKjURWgf8BE9oyCLirLYi02yvGLOV2MnMS0VES3p2B3S9o1nzlaiLZ9jl
	xgv5cJ7zqxPTvRDBXPnFSknCHMq+VrRIrBPX8WAD9K7Q7MGwPGQ5PpJLAZMBA8s/w4OdwdUP6jr
	SPE2rPDxvAmII+fyELqvYrxWGH5Qt4abrgzXCXyjjeF8bOrJs+TStaq3x5/FVddvYv7ew1D/EwL
	YlCrcuMvbQNApAXp45eJDsQMd+VrykE1UFLNnnlz0SKXz2MwAKlWVmeE/huQ==
X-Received: by 2002:a05:6a00:44c3:b0:82c:6da7:2d3d with SMTP id d2e1a72fcca58-83f33c2a8fdmr8270653b3a.11.1778958977236;
        Sat, 16 May 2026 12:16:17 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2409:40e5:100a:b5ee:87c:e578:2b2e:422b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19661261sm12297625b3a.3.2026.05.16.12.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 12:16:16 -0700 (PDT)
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
Subject: [PATCH v2 1/2] soc: bcm2835: raspberrypi-firmware: Add voltage domain IDs
Date: Sun, 17 May 2026 00:45:54 +0530
Message-ID: <20260516191555.17978-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516191555.17978-1-chakrabortyshubham66@gmail.com>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260516191555.17978-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add firmware voltage domain identifiers for the Raspberry Pi
mailbox property interface.

These IDs are used by firmware clients to query voltage rails
through the RPI_FIRMWARE_GET_VOLTAGE property.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 include/soc/bcm2835/raspberrypi-firmware.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index e1f87fbfe554..fd2e051ce05b 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -156,6 +156,14 @@ enum rpi_firmware_clk_id {
 	RPI_FIRMWARE_NUM_CLK_ID,
 };
 
+enum rpi_firmware_volt_id {
+	RPI_FIRMWARE_VOLT_ID_RESERVED = 0,
+	RPI_FIRMWARE_VOLT_ID_CORE = 1,
+	RPI_FIRMWARE_VOLT_ID_SDRAM_C = 2,
+	RPI_FIRMWARE_VOLT_ID_SDRAM_I = 3,
+	RPI_FIRMWARE_VOLT_ID_SDRAM_P = 4,
+};
+
 /**
  * struct rpi_firmware_clk_rate_request - Firmware Request for a rate
  * @id:	ID of the clock being queried
-- 
2.54.0

