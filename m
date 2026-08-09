Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E45F3624DB
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Aug 2026 21:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786310862; cv=none; b=uZCj5Yj9vLxGt4H924F5EH++C3RHb5OgIlVyvDP3UpyOZQJ82I40dOL3IK9amRFQ/2N8MEI4W1IPVViNARP63qNQCabe0yuijHL4PGifUUQVrmZmWNRCi+OZ/wYSnL0FLxyQL24ERJHpdHXPhmwWKpc+74hiwZywKNCtEz0Pwl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786310862; c=relaxed/simple;
	bh=plmgoBpbYhRCWT0JxnAm9IkKn261Mxy3FSq1pxN2Zlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qj5J9wfwN1tNMGjKRNsVGSkrJCNVTypzpWVVQD3gZy/VQ6OKCu1yEZMUCoGArgfLZ6Jg10sjWV8+1NVs5k8bshQFEg9rFmV/ypfMueQNBXrikBwbEd2i1EqRb0zO63Q1IUsw0AddqHHveNsJ7kKXFwd5bqRwQ5kp2KnUXcmudjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRfs2bNc; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRfs2bNc"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f703a9d05so873649f8f.0
        for <linux-hwmon@vger.kernel.org>; Sun, 09 Aug 2026 14:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786310859; x=1786915659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s9SsY0QKXcaRlIAy+QAk19WmDERCo8fOpysI9MsNVJk=;
        b=iRfs2bNcpJBT4HCjcAbVEMC1RcNSUxS8tRJZO7EJ3xz1h5LDXTnWALlU5QlJqaW7gw
         dnept+Rv/xH1oljBkuBjdlRwlge5dtX7B2s1wGSZHpmutBlilGhxJA2y0wbe7HLATLME
         TXXPY7WuuoZmWmp+CqOipCojuLvy8ypTQrBJCO+ghIMeZf97miEIvJC2HfRWPYH6gnzA
         R/q2t1zRZ8ktsRhARxvWrs76sefe3BZVl0vIj3SJoesw85PHeoTirPvHQF2cvhyIWJpT
         n831dMPqrdZ0fG7uY47cCAfhbBwGkg7bpHZXrCNPwx0jX3AoPKOLzLWggQpBBEkAGQV+
         nl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786310859; x=1786915659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s9SsY0QKXcaRlIAy+QAk19WmDERCo8fOpysI9MsNVJk=;
        b=lWhBveyWMJotQOUeP1pqwv7O58iZZqtUEwlFPNARldsTdSOSvQIW34L+w2gS/pO/E6
         48gY0dQFC3jTUymDLCZcfODVwfaqLMvuWEJqWZ/peOSU8Srk0gN/jHa56eIDYBi2pd1V
         ljPVzAb282n16pu0OI9Wby2o+TKUNt5dxXk6kxAtc9KM2HgdIo+Hkxz51oEwJwpos7zU
         SfpHc+4HS0jV3OB9aj28MQPV/G4LI0f9M568hLkhaS4/t1ds2hdRfQEAQuav1Nnfcooj
         uFvRxsDkGIWQeE8NEjC3yax88zX1YX5KbhEXMopITPBle873tHLAYm7C5BWNyIhMkfKv
         lq4w==
X-Forwarded-Encrypted: i=1; AHgh+RpVlnLb4le9lxV1tGNpLFhv7gLZAcWlbkSmFtnW/ek3hlb6NwkuL5CMPv86wRIzlN86P7XHgBG6QERPlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcSVybyOnI7aQ25cCy714weuzCXtePITKtv5wTXidxhD9KZhrG
	vExZik55CpT6/KBbc5fxDGgIqbSMs8iYmiFC7bTcyf7v4SHgO3HGV5dh
X-Gm-Gg: AR+sD11Gn/BikAeInJvJST/4+bkHvJWd61TUypLvc4x3x4RAGh5CbRQ8pZ7Yhoju81z
	lBHzKcU6R0u9EFJr6Syn+0btespOcBvRLqtKoLgqUjLV4+PLEdN3cJpnqY0kJKxR8OAAFcr9O8e
	0Ogd+Shol7YdEzK/Zhcu2uuL4YVW0K1s1juV8yO/ZU+bwysyCuRtoBXqq8OCFBRpxeScKwN0ThV
	4uO0516rU8V/gvFryRstlB7mroLpDziojGxuJZc9aN+BTPX6n0BpKSyk7hpmIV+WoxnebdfLjmd
	Mb8OjT5twIfMIDzhV35tcYZO3VlQZ92peeRsgSVSYgHfbF5zGn8HJFFBmNxJwDaiVLa56q5ygp4
	RjiFd3ryxuwhkyJbkVLwiIpql+XL8rVDGzUuVfyjqZAt7Rk5IyrY26HDEYYb0gOC25RIQTKYx8J
	qIp9mSHUl0pEu5l+JFecmusRBS/R+9frPK9clGbtJdR1vCQCRBZ53xPl/DBBYDqrJRPJ8wPS5rR
	MhCGcyUunKUBXzqhA==
X-Received: by 2002:a05:600c:1553:b0:495:3da3:beb with SMTP id 5b1f17b1804b1-4995e0d0182mr234037635e9.10.1786310858679;
        Sun, 09 Aug 2026 14:27:38 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9e7164sm286806455e9.2.2026.08.09.14.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 14:27:37 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Rodrigo Araujo <araujo.rm@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX Z390-E GAMING
Date: Sun,  9 Aug 2026 23:26:53 +0200
Message-ID: <20260809212705.1501382-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rodrigo Araujo <araujo.rm@gmail.com>

The ROG STRIX Z390-E GAMING and Z390-F GAMING are essentially the
same board apart from the E's onboard WiFi, so they share the same
EC sensor layout.

Signed-off-by: Rodrigo Araujo <araujo.rm@gmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index a5db48d5a72e..2c68a343a2ed 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -52,6 +52,7 @@ Supported boards:
  * ROG STRIX X870E-E GAMING WIFI
  * ROG STRIX X870E-E GAMING WIFI7 R2
  * ROG STRIX X870E-H GAMING WIFI7
+ * ROG STRIX Z390-E GAMING
  * ROG STRIX Z390-F GAMING
  * ROG STRIX Z490-F GAMING
  * ROG STRIX Z690-A GAMING WIFI D4
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index d386f056dc55..e43645e884fd 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -976,6 +976,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_x870e_e_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870E-H GAMING WIFI7",
 					&board_info_strix_x870e_h_gaming_wifi7),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z390-E GAMING",
+					&board_info_strix_z390_f_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z390-F GAMING",
 					&board_info_strix_z390_f_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z490-F GAMING",
-- 
2.55.0

