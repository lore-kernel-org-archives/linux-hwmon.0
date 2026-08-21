Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C723859C2
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 04:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787287902; cv=none; b=BoF3NDx69b1HWlUZnx6PkG5xtcuMhuAguQeAdNJBryfvwR1r+Dm2XvJjRINlPaQ50Yo2DIQ8XuHBOa4vnpXgDMXmkmMiioLMS/olvm62UfeEC/tQQLnDRm2Q/fZkN/6TDOE9c/IUKECbnzuagGjTCPsPV2HAwyvuXPNR3oITvGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787287902; c=relaxed/simple;
	bh=JldN3mGgInpCiSYvXCgKI9FMUhGerxwYdggZT1AH00A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CBChuPHU1kTlaeKWGMPWYJYNJTZYN4iyj4zuzSzhomSp93cnrMlG2dZH4IbEhnOhhsU95Ds04812kPXScH3GYtU1iuwmjssBIB/LbF/tHIgB4I3qB2JSpccs4ivLlwSed/szWuKoKjK5wWUZKms/KS7Y6vNJY/xTg7kesXGlO4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7SyXX1x; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7SyXX1x"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso450595a12.2
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 21:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787287899; x=1787892699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vd1GSEu5D9RPY0Oh2a+wCYDNQZeXEc+v88C8RSXg15o=;
        b=E7SyXX1xIG/KxlNj61XZounbA1ETEJNZiCnvfws91n2V7hm/pMDcodxxSstWXIKTFQ
         wd9Hf5wILTHKiQq5iidyYI/7sNriyl7fzcBqoZgjIXJGLHnfLGf2KCuUqvRwRAXF2u7L
         pmjSFLokjY9Q+n2FZsDDsmmLCM+L6dSddKeo1doQ5uFuAxJmj+EWBuJPuztfTcOJ+DfW
         sMxd1v2VEpAOeG7rp5Sj2Q319ME98PSpZe6C7oU1nVLYSYTIHdkQRKDnf5fVk9rJuaKT
         ZwsRHs0UOFbsFVSqebxKODuhwK/Q9nAtv+RcdOHpoe6qXRvSPE7tC8R0WUrdfY4Hg2hS
         YM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787287899; x=1787892699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vd1GSEu5D9RPY0Oh2a+wCYDNQZeXEc+v88C8RSXg15o=;
        b=jsPkcNeQe3omli7xZmy9nymVFlUgbukW1wVtqpDbfBN/COVj50OHABdYZzNW7saakB
         7LF0EFiHotmY7JgFsmQU7y63OLCxYI8ubwQQcYd+T4iy9cPBkgSTkEJW73ETJDM63hYS
         k2+k9VcY6yTqhNYb7dofDTQi8n7wrmGYgRnq4b+Mkbdln02gWchJP48FnGdpbU9Vcw/0
         sMu76I+hZ3lCJCEU0wYHTgIrIEM4WsVaTzIGpIH1P8l1d6cUTMlqHbxOzXqo4rUzc/rY
         qaoMJs3+bK/UrTpf5PJSFMXNhv/yVPWhBcGbrZdb9y7LK8lzRRRWeO5YYSUBNAd/W8hK
         0T9w==
X-Gm-Message-State: AFuF++nqAovlbou7WP9F49cKz94iJUFTm3kMuSC0KTKVrJg4k2FxyZZv
	z6YsjmV9zrhxbUM42y6TBDXHn4f5K/6chffW2ewujOveonqNdqIzqnDJABeTmw==
X-Gm-Gg: AR+sD11xYp5vmvay3TQPAKlLovmQP8nt46xLciwcOOJdzvesBGnzsvzYJl/VpnpO2uh
	zAD7qF1wx/oPDYuJU/k5/byDm8DV3Gk6xqK9ISYyzSIo4weO0vOQNn4EDb/7QltZVUp0jc3irx1
	beslXrdtj72o4dhxaDHCcwnsrJmFoMIK+/I4QoYnPqbhFPAdf3WNmBnFXbLDhq7KqaRsOEoaq3h
	6gE9dmPZ1NO7acjr9+grQX5hvKIOnSSQORa3nVUvlrcdPC31kR26HCkgNvbxubNUZmRoIsFLVeF
	LtBIq1TUwbCLxi7nsfM6k1myavofQIAF286rerNE6XJRpZVO/1V3IYCoW4mjK45PX3JVDPxdkS6
	YVvmxJ4zTQjJ2Wx+sZ175cCT/4CCVqKawes6ywncDawPJzWGdaMOj/tp4EXkstA9AMfd2W9m5uq
	ijjju2R51dauTlVorNKigQYluQtWCWDnSgdiDgJ1jcGN+VSKVFEu2JdSMSpJPI8ikfHmACF6lnv
	w==
X-Received: by 2002:a05:6a00:9506:b0:84e:89a:b8ec with SMTP id d2e1a72fcca58-851f9fd6b66mr5394236b3a.11.1787287899273;
        Thu, 20 Aug 2026 21:51:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3617efdsm2358004b3a.39.2026.08.20.21.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:51:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>
Subject: [PATCH] Documentation/hwmon: Document hwmon_notify_event()
Date: Thu, 20 Aug 2026 21:51:35 -0700
Message-ID: <20260821045136.664480-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hwmon core provides hwmon_notify_event() for drivers to report events
such as alarm or fault conditions to userspace via sysfs notifications
and uevents, as well as to the thermal subsystem for temperature sensors.
However, this function is not documented in the hwmon kernel API guide.

Add the function prototype and description of hwmon_notify_event() to
Documentation/hwmon/hwmon-kernel-api.rst.

Cc: Kalesh AP <kalesh-anakkur.purayil@broadcom.com>
Fixes: 1597b374af222 ("hwmon: Add notification support")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/hwmon-kernel-api.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/hwmon/hwmon-kernel-api.rst b/Documentation/hwmon/hwmon-kernel-api.rst
index 9fcde32a140d..c3eb433a78f6 100644
--- a/Documentation/hwmon/hwmon-kernel-api.rst
+++ b/Documentation/hwmon/hwmon-kernel-api.rst
@@ -42,6 +42,9 @@ register/unregister functions::
 
   char *devm_hwmon_sanitize_name(struct device *dev, const char *name);
 
+  int hwmon_notify_event(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel);
+
   void hwmon_lock(struct device *dev);
   void hwmon_unlock(struct device *dev);
 
@@ -90,6 +93,18 @@ implemented in the driver, or debugfs functions, hwmon_lock() and hwmon_unlock()
 can be used to ensure that calls to those functions are serialized. Those
 functions also support guard() and scoped_guard() variants.
 
+Drivers can call hwmon_notify_event() to notify userspace and the thermal
+subsystem when a hardware monitoring event (such as an alarm or a fault
+condition) occurs or clears. The parameters are the hwmon device, the sensor
+type, the attribute identifier associated with the event (such as
+hwmon_temp_max_alarm or hwmon_fan_fault), and the sensor channel number.
+hwmon_notify_event() generates a sysfs event (calling sysfs_notify()) and a
+udev event with the attribute name passed in the NAME environment property
+(e.g., "NAME=temp1_max_alarm"). If the event is for a temperature sensor and
+the sensor is attached to a thermal zone, it also notifies the thermal
+subsystem to update the thermal zone. hwmon_notify_event() returns 0 on
+success or a negative error code on failure.
+
 Using devm_hwmon_device_register_with_info()
 --------------------------------------------
 
-- 
2.45.2

