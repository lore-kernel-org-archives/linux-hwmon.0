Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297EA32ED39
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 05:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787289783; cv=none; b=YK6vEq3BTFvXijD4a4lujdtMjZbFi0859MrEjjvamOP2pLU3Q4kKqZTNN0sn/ARG2+VGZTaQVg+D9oeCmXKzYoEFfRGEU/L+y3oESvu3glmhSHiKfHYs1g0oIndIPqtvbgBV9YgwanzySLHCfygYRgrXdSJInHZyycFf1Ye3n1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787289783; c=relaxed/simple;
	bh=yIlgmWxBjb/IC6j0IE1uiwAIucDGeNUUzPrVr4kBfUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qbv3QWcW16bYJKCPU5BjaJgcDBs/xKmqzb01S6gAoO6XLilr/Ddixy6DsXo9ItOoy5iMJuPw1feWLO5BogivPkFZYhqGpinXtt7rnL4Cr9Yu8Iva6eoYEtGSV2beCCoyYUYvBfSuj3C5qh8sCvWFgUPDSK5f2KdtfYbCUaSnMGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6E+h6J6; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6E+h6J6"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38759bcd877so664784a91.2
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 22:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787289781; x=1787894581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GvfmuriFHHl5xYyGm+xRe3v/gof/oVtODWS53/ujgvQ=;
        b=C6E+h6J6jDiRcyEOrRxdUk1ydIe8gvwnetvOuYKXizXmZ3KSoM8gCb1ge5bVp8ZHzx
         9zWjAVrKdEQWGYu5Obo4JXJSmdJrwGv4NFRTmHPsFNsaj+YwlhAa73Ds2VgpI5MBo6cR
         B2sl3QtAx4vmW87GSDW+T1Dvm8JtJ+gWqYBqNcpzirOcQoFP3bWH1QvLEsMv3SaDz4pL
         0LVZ5WiOC/XrGo5WAvZOGZGz6wIDIFUPtDsy70mdGfmWulwBFunned10fWZTRwliufUc
         m5Aa5x+E6z6jj2n5txLoOlscuRelwAguQQNjoRGlbt0jj1Yjm0p0so73bzu8cEcV9k4N
         Fncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787289781; x=1787894581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GvfmuriFHHl5xYyGm+xRe3v/gof/oVtODWS53/ujgvQ=;
        b=S4UAn5ppG80dK3tFTOpm8OjjoNsY1NWPZ2WM5tTmP25M0cqJBZs3yHJwUhsNmF84eq
         o8g4A/GLk5vPV+j3X8/qnvZOpPRbOyG9IRK9XfGHBpw9uP1bbwPmSFY4Wwcho07glXCA
         uxg4ScFS1zbhCdxlvGjDZkWsAoGXvmj+QSpMj/0/3DvWp+F7CklAQb7c+ZYBvs6pgpSP
         fJrif6oI1/rItSWae5iL7fmcizuq9pCUztUWTEIx/c1zvbio0/FRry6KcoJ7pWwtz8yd
         KZYqD+L4ORyywIk6w0Fc78JKvWTcPTOgZ1K0R09FY1Huq7Jpaa2TILDZYtImoT51YliO
         69Ug==
X-Gm-Message-State: AFuF++lFYs+7dJvdEkrrZ4bGxiM1nWfyd/bUeXFNMGF9nc4xKyic7d2T
	ZBDJAUi3SwZh0lB1Ii710Sr45xnh/HdGPVoaDDekpas4RkG56vIxenF5CgFySw==
X-Gm-Gg: AR+sD11RIjqtaxYFI5HXC0sE7ljh6v9afmFIttb80QaHLzJKsOjW6rrN5G76tibYIY0
	6shfB2fH89oEAcINHm83oh08SP3bTMatvVjSuJ3bePvcpJW8WnxwG9EW1AuDroJQpQHkvEnef1v
	imnTKn/vprT2biLoLVx1aeKLTO0N95yRgJUIx++Ll7cbFeyh2lD9WaD7jS/t/K9bbo27NIllnIE
	XhdvxGNAB8loXb1/iVnPOSYCXVQ5rdfPqpkZNrPjl2lynKbDlz5ElDWMnBKvMCZodd9044/M6n7
	o7nYuNlX9egRuJNmq2FQX86PI7ray8DPWD7VtqWtWdg0pvnIuBNFr/qQHgA5ThO3E1eX4qrQsG4
	dF4WywGWQGY9rIvxXGVgA8WjQfavkZSW1hH+xFBryNGjbxqETVQvcuQsa8N2pH50oJqmX4c5rgh
	8P8FowoffNogmzq3aEpfwD2xHPbN1YWYPQ62Cy8PuqM6TvKOIXlAMN7pnG544qC8txd0MwDeEJL
	A==
X-Received: by 2002:a17:90b:3d4e:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-395c371d76fmr7286779a91.15.1787289781382;
        Thu, 20 Aug 2026 22:23:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ac3d1bfsm20947129c88.0.2026.08.20.22.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 22:23:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: Ensure that 'dev' passed to hwmon_notify_event() is a hwmon device
Date: Thu, 20 Aug 2026 22:22:58 -0700
Message-ID: <20260821052258.672697-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The device parameter of hwmon_notify_event() must be a hardware monitoring
device. Since this is easy to get wrong, and since passing a non-hwmon
device may result in a crash, generate a warning traceback and abort if
a wrong device class is passed as parameter.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 3e65fc6d25eb..24ce28239316 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -336,11 +336,16 @@ static int hwmon_attr_base(enum hwmon_sensor_types type)
  * attached to an i2c client device.
  */
 
-static int hwmon_match_device(struct device *dev, const void *data)
+static bool is_hwmon_device(struct device *dev)
 {
 	return dev->class == &hwmon_class;
 }
 
+static int hwmon_match_device(struct device *dev, const void *data)
+{
+	return is_hwmon_device(dev);
+}
+
 static ssize_t pec_show(struct device *dev, const struct device_attribute *dummy,
 			char *buf)
 {
@@ -781,6 +786,9 @@ int hwmon_notify_event(struct device *dev, enum hwmon_sensor_types type,
 	const char *template;
 	int base;
 
+	if (WARN(!is_hwmon_device(dev), "%s is not a hardware monitoring device\n",
+		 dev_name(dev)))
+		return -EINVAL;
 	if (type >= ARRAY_SIZE(__templates))
 		return -EINVAL;
 	if (attr >= __templates_size[type])
-- 
2.45.2

