Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9111405C22
	for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 12:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779022407; cv=none; b=E5diO1ayr9v/jX+sJuvKq/f5tPg3UWzvah9GfyZXU5x/7UI0UZywDnYuI9GSo8H/X612GA/j5znUbi/nAGrRH/eAwWnqpYz/29wq5J/atuzGKXk8+T3/gv8sgxjKetjurQ+GsXRUv5cHL5W61UscGtoNxdCq+gfdIb6XseiZ2xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779022407; c=relaxed/simple;
	bh=391qIWo4cYVk+od4CnAXI3LRAlbBgSeafbcDlO1t8dE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d7V1ABrId7+Cie/K+XFXwjBYxC5kLJc4mBirnFzlWJC5YNQWQdCAPdCyNl0KrrZZ9VIi9deIC8L3Eg5PBoCsTz3T4j3F9/cp9s9tp9CD2rezva1JKmWVVCYADWNf/KcPmwBroIufRxqRXZJaJamDur8PZSOjrfy05TPbrF3q1BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJsZfePT; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJsZfePT"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-366330b6751so1114572a91.1
        for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 05:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779022406; x=1779627206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RHZ1M4yEHAJJ16tGf5b4knwqeJ/DaNdMkNl3YNcxA30=;
        b=TJsZfePTaj6ODxDjQSanombBTZZBx+PVwSOnJeLxTcrow3h2sIFG/UuKnePae/+ItK
         crF3Ls+Bh9RXmYqYSYVd28JkCNP/WTiu5+SZ4kZimUHhSV39VrzgUuy8msj+9vEUu7Xm
         M3LK1Hnzjz+6awd+P4iJzpx/MEF5bCxLLkeg64rSfXtM9dtHqi9aWy74VoRhLTyRCrs0
         ZTq4BaGhd0y9DmljrVj0UuGNiBk85CqfdGjNoyYNBqFWkJFxVPISKfueFF0pp7K37Ofx
         t5Nrq3dksP7selcJcBTDehdmGqyQX5l2p8YAyYtQ7zrz/N8cAEs/EPE2ti2/TEPrVy6+
         ce+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779022406; x=1779627206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHZ1M4yEHAJJ16tGf5b4knwqeJ/DaNdMkNl3YNcxA30=;
        b=bI+aI0du6ruJWZmd5SYWobQVYCxcdyaa3BNSVHrOJDWEgFuJPkwjsPVchzr554FpRA
         7/OqSs1A+HpKLQkcOkPXDiDZSZgNkq906NVj88B47X/lHG1x01b9BiK1zXNYTZvgWim4
         SYMD9/FnVjR8YDdJO7mcI9/yeINMVc8YOxoXDkeugsRrC4Iww+yPPxEIpws9Xc7iXEEu
         pMmwWEs3Fy7Rv68/SKwkp2pze7IcBMekU7EWphoLhPK79NZFiMYNMWLN9Tx6FQcG5L1w
         jKcamTMYYSQVAmYaSQ6CAT2COvYUsjbQ4Cia/Q/wtk/dNwt7LYSdo+rLDj/Poxb6KKFM
         npNg==
X-Forwarded-Encrypted: i=1; AFNElJ8mXG6pB7/mIHB+YwtsBoUi0qTmDwWrOzwzUHNmAyYhvD68HI+dwtmiT51WhMsbtOKzAG9cK1u9K5BwoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp7bizw9Wevwy50yLzv3VltWLHKGIztbYwrGryKxHyRx1KgYiL
	jZDSxx1/fuqKIu1xhyYMXJnWnEIGEdSnGxJYVITFOQcX30YQZ9EBNa3R
X-Gm-Gg: Acq92OFJqb5OfOSt1b+yjdooifT4LBnAl8/qfCJEMLREKbmwB2ZnZNJGe+ZJoQqg0C7
	bBUR9rQGt7fJXOgedVhjGgBINog7/WP3+8joYz8GVZq2RbEeqCw8piAzJoA5BbHe0Pp/CUUP6Aj
	wm30i7y9XyRaMd+MnD0IQyyPCwjcJpI9HiLzWBLdBrYdeM03t2v+RuO5tp6cE24Soh5XxTff0MW
	Xlpen4i5kk6j2gPshjUTd6E46+u7A4vUFheKFP7NbqwaIrnoxy7AtNhuW9ETADEyQxW7i7qTrvE
	1IdgUVemaTQB6jK4HI3yVy+1CXLa5Szs0tNUyV8LVL6LAU5ZNshws1Qdw24qvaIwUb/s8J1OPFR
	08MrhDEYD4m9kHTRpI+xGt06UT5n9ha74zKEMiP77dG0Y3KiwpANz73pQq6XMbsGj9uSSekCEFh
	naWLyzuB0l+2Zyoi7QmwmK4LT6yThuSMBFYP8BuzVF2SMdaanxMVz1kS770dg8VqjtWVYH+bddb
	TgLA8JVT7T1W27pu1AYOCBozvyURNdrpnn0ihJKHrQt7yUdsjCV/wqAOvharO4=
X-Received: by 2002:a05:6a21:3294:b0:3a0:b9d8:96b with SMTP id adf61e73a8af0-3b22ebe1b3dmr13415750637.26.1779022406159;
        Sun, 17 May 2026 05:53:26 -0700 (PDT)
Received: from ERIC039ERIC.localdomain (1-170-184-71.dynamic-ip.hinet.net. [1.170.184.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb115c38sm10688596a12.28.2026.05.17.05.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 05:53:25 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Shi-Hong <eric039eric@gmail.com>
Subject: [PATCH] docs: hwmon: htu31: document debugfs serial_number
Date: Sun, 17 May 2026 20:52:21 +0800
Message-ID: <20260517125320.2196-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the debugfs serial_number file exposed by the htu31 driver.

The driver creates a debugfs entry for the sensor serial number, but
the documentation currently only describes the sysfs interface.

Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
---
 Documentation/hwmon/htu31.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/hwmon/htu31.rst b/Documentation/hwmon/htu31.rst
index ccde84264643..9ab774dcf65d 100644
--- a/Documentation/hwmon/htu31.rst
+++ b/Documentation/hwmon/htu31.rst
@@ -35,3 +35,10 @@ temp1_input:        temperature input
 humidity1_input:    humidity input
 heater_enable:      heater control
 =================== =================
+
+debugfs-Interface
+-----------------
+
+=================== =========================================
+serial_number:      unique serial number of the sensor
+=================== =========================================
-- 
2.53.0

