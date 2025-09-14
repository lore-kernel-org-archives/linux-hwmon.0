Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A8822A1C5
	for <linux-hwmon@vger.kernel.org>; Sun, 14 Sep 2025 08:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757839227; cv=none; b=BcV2XvXNtDZvkHMQa8sRL9McSotp1LKkzM+uA9vL4Ior3yewyAfGVB7O4bzsg9BLkrSYXicPybZduiVJM0SzHxowBjmNkrTTIvLP7DlWFd9hBy1+n1T/fiFngl+AMmC+uj/3KKoS7nrTxZs3OXSkR24XhxOgs+kPNh1UmFgSjRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757839227; c=relaxed/simple;
	bh=hvqqhKDwn0KttZ7YI/pFa/dPygt7+4qJkMXYteumt+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lieSp9Ml3ikjptHb9Xebqp4AaGwBRTg/+Twfcg35ipeTmD1rlA6CPfB0+TqBQppgn1Du34dHn0oXGNzeml1aXhA91xLUuHm1JZF88LmO475Tllw9ize7/9twx1sUxFx9RkV6XvLjc6MyZGX6XhPbkd6vNtwmuNVH8XbkEMUH648=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=At8o9FRl; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="At8o9FRl"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-62f37aebd6bso38269a12.3
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Sep 2025 01:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757839224; x=1758444024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t8jAyzV+acKcWO9q4mFH0eEwR5GYgn/NUD1fgTglKnI=;
        b=At8o9FRl2eAk38KzuOlRAiZ/cRwD8tV1W6ynXM17DfpuMari9+LTOfGeZAH8Ll7RZm
         QILe7XZ95daOSh6ypaZoYjMNGQYilv4YuLKN9g9gxQlCanSsGhDeks/+MiXvaoAWlEJb
         nZxnK8vCC2xVKXcdx6IdYdS5SKyAmN12H+f28GEqLpkJRiRIhYYzARP8HuGpT4wANb7L
         IDKy2SvqfGAvkv7b+Z/GRb8+E9N5Pwin8T0rsWMml4RGqymhYe2GRrcFrJ1WofniLIWh
         IwL4DQzg1NpMrMkTIJWxQHADCR6lvNLz3wH/UF+q3pnhpShWnVnZBGI4hokEYk+x+3NX
         JMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757839224; x=1758444024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8jAyzV+acKcWO9q4mFH0eEwR5GYgn/NUD1fgTglKnI=;
        b=mwijKp3XWJ3u+HIznUOMj48wS/IwSp9AmyHQA5jMtHJEr7M/EqeGX5UnfFFmJfSLQM
         zsPY6ldW/g8XZwnryGUfatVbJr1DlosIQ7BtP1is5mYAMJRx+0uBonFBz5N8QME272t5
         ae/CFt56baTm8jTmGOYmtu7TTjFc/SSwUNlFjpYIDM9cRR9R40yItZa3i0xqdOERUOqL
         oE78Gq9MA6iiwbTXjQmBlnfPtEh1OJ7LXgjb5MRte0TP+3wnmA9WlxI+yMLEftLURGnt
         QxZahfFfyNN/1swWhk8382HKBZ9U4+00tAD/qh1vcaITFYfPCgZ4Ku3z9NsEckb8QDQ1
         lt3A==
X-Forwarded-Encrypted: i=1; AJvYcCXdWFGqQdLuzqyY+AnqkUvT1vKZfYSYSaHxpzNECAfgsb6KdzmTMLDES9xjCQGResqrS2mZGzq/atHsBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmGYRHx/+wewfXAw9QzEgsz5w+0oMh6ypbbPUEe0Mn4F4c8oHh
	GVkH508A+gFxTfAy4s9Mvergc5VYuLXr9/96Pkq5MZc6ngQooWO4Nr3n
X-Gm-Gg: ASbGncvOURqOPQ6XKINTViVG6G8jrcFzNWA+zQ3mUErjmR2jKv3sBD3fNBONBh/mNvM
	HxmU0xSHVkcntpwf8KZJ7f8DjmtogW5UBLOedJoTG1nMJJRqlbOuCChTelmlsWN6aBMu3g7blFx
	yJXOvaWaBOiWZMPwVBKaG81tU0oBxYIKGuLYWABXB9Y6r3HqzZmx1SuSm2tAtDKFzFRe63joJok
	hQemomxBCayA3U+mHG8VJMbzpuvKNNoBGpgGgk4YcWxr+ceAGTAeENeyu2PNa0LM3M3MM4U+Fic
	uGANZrae0w0qPu+0cnLTdXClIlLIcizJsXTdwnwVn83kJPdsyDf2584R6g5nDAyjptR7e9WRBQh
	xvMfaVXt/rjLGKPW3FJ/uDtbFCW35vhtOiZBASgsNwYmHrVRVL3XwEw==
X-Google-Smtp-Source: AGHT+IH5BreF0jNdm1JhmaZYhd36b3wPJHK9s5ZiIRSzQP1rPJTWRUoxQcoEakCnqIxdeYIuh1MxAQ==
X-Received: by 2002:a17:907:9621:b0:b0e:d477:4972 with SMTP id a640c23a62f3a-b0ed4777388mr94391266b.25.1757839223690;
        Sun, 14 Sep 2025 01:40:23 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b3ea:9c00:26e7:b56a:5a2d:1d72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32f21a2sm721370466b.83.2025.09.14.01.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 01:40:23 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Mohamad Kamal <mohamad.kamal.85@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (asus-ec-sensors) add TUF GAMING X670E PLUS WIFI
Date: Sun, 14 Sep 2025 10:40:10 +0200
Message-ID: <20250914084019.1108941-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohamad Kamal <mohamad.kamal.85@gmail.com>

Add support for TUF GAMING X670E PLUS WIFI

Signed-off-by: Mohamad Kamal <mohamad.kamal.85@gmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 836d41373848..4a99b65338bf 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -45,6 +45,7 @@ Supported boards:
  * ROG ZENITH II EXTREME
  * ROG ZENITH II EXTREME ALPHA
  * TUF GAMING X670E PLUS
+ * TUF GAMING X670E PLUS WIFI
 
 Authors:
     - Eugene Shalygin <eugene.shalygin@gmail.com>
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 3f6d89bcc8a2..dff13132847c 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -795,6 +795,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_zenith_ii_extreme),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("TUF GAMING X670E-PLUS",
 					&board_info_tuf_gaming_x670e_plus),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("TUF GAMING X670E-PLUS WIFI",
+					&board_info_tuf_gaming_x670e_plus),
 	{},
 };
 
-- 
2.51.0

