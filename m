Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B3C3191D0
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Feb 2026 05:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771823325; cv=none; b=Iu0LC96HBD3Epz4g3XdYrt7Pj3yoWJ1bFbGw1bJMyTlQTYRLf/DsG2nzDFbcBtCylFtp1zEo907BFyX1x6RCQHaXiusAwOGRN325AieHEBEEmp7/oMnXeGGaiBv84/2N9rQeP2mOl0JRjyotKsyzZL8em9JAoL15eI0hbrL7p4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771823325; c=relaxed/simple;
	bh=4wDEv0PGjR2rBQZAmqDIZSaAMmcurf3DFBAh0KXwqUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FQEoSenKsQdc1w5RNO+wwpHfTbqTYBxAp67HH/yhVp4PwDcOEzKbnig2nfEywuZ5sfDAeP4WPEa62KBl9FhVlTHcfFyTzDSdx+z3SYyXbsKr0ixHronBgHj0MN/ed3qs8dWXnuER2/xdK1RKKSZZDcetJaBzy1Fjg7qPVGQM+bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aoeaBS2t; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aoeaBS2t"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-824a9348603so1550944b3a.2
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 21:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771823324; x=1772428124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HnTETGcGMywOispd3Uniut5lXDOEv1AIFJuxKzNySRM=;
        b=aoeaBS2tC4RreQOLJWBGIS35QOIcY0o/HAJ/5qducleBTUH7cTvX/PAMaDWQcZg+sT
         IfkdTZZ29j1H4arE6C+Vshh+YGGckZEaMu/zNW0+GrMg8LB6btoOGw/xS8bJElcKzgk5
         vmu+ZKCEGfB7q9E7AvkjxH7+PSSYLe6bWZjODu9Z4V3ylPx962Npa7zNkFG+jlG1pqvB
         1fyhGQQITveGUG1GRa14ovvK8s7VhjNqInKlyIw1uIUn4P18y+rsGDtZ2lr12/x12s0N
         GxPIzALedFFVV6qYgAaRkJb83XC6CfrlBzK5jsa8UXU44A8Jpn/DkxhWyWhDeboUPEpc
         QXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771823324; x=1772428124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HnTETGcGMywOispd3Uniut5lXDOEv1AIFJuxKzNySRM=;
        b=RrKK2fLQTErnOWkcVw8a7SiuX00KWospiXomysqW/o6WuTy2EZgOebGiGchIf7/BIo
         u6rfL1QjPQD9TaQSZNVhgs0Lc9MYBG8GVoD2/+ManYrxrfQb3lmIlthzG7ge4/1lvxh5
         ZGpZtQKh3u4uneciOcc2JYWHWwmyw1qQpLVi7M9Oyip414aOLjDAubZTtdyBwk/GB38R
         7LuZB1tpiKIgok+YtD9CTcyj5D1a57beEItGHQICLZ9KWtMJISGw3WAyoEu/AOhEdUk7
         bJbdP97VbGf/5YyQGLa6+9D8KQRAJ+OzXWweIJl/EUyg/oLDxMyGujo8EjOImaVT2rZc
         isbw==
X-Gm-Message-State: AOJu0YygNCB4iEf9VVUBjiA8CrlvVczu1TdvH0MhgJRqdLE9rOxSvR1F
	DecpdgVJppMZIm+TNGR1q/FaHCtGt8GEYu2WbtYFyV/f22J3EM0kIpXz
X-Gm-Gg: ATEYQzxDnYvIhl6IKwEsxcoyW7Sg1+FU65DDK4QtA9MtWRrXjtQXgWV4wPTjW7ALF7O
	pwYOYdEA3+m9+4KLEoQrYtydAal/IrpmDyCiQ1GFZgAplTkoZA1gdmOmcr3Hn6TTem81TeP9Qcv
	v9gdJX05fK9BT2MVAU/z6tL4v99D7Syu9hD0r9rh5HcFbcqM/JANAKBSol0SJy0KF38hj2vIzm1
	QWdX7Zu9XRfeJdO7Q1XS740HUI6HyhzAeqCnUdRCxzsgZBEV/3irWHhCmG30EeKJlIJRY9QrOQW
	Z++w258fL4GimIEiRdwAQ4NJsoeUqNJ0u8xIQ7uuDVmPrUoU6D2W4CEqAhxGixJCzuPHnbsw+es
	TbQxwwXKSjdBGhPO6au300nKnw0eSo73ycb2dQxWOaUJVA1f4LQGSBK2q8V3TCc6LItqbdCzPsb
	1AfkKLtGlcnGyA3KVb+CLFMqtAYr8yf5ssj8R9XjsX3km9NYRoUPPLHTIw
X-Received: by 2002:a05:6a00:2407:b0:81f:33a6:e9cd with SMTP id d2e1a72fcca58-826daa82b31mr7570852b3a.57.1771823324072;
        Sun, 22 Feb 2026 21:08:44 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:93aa:64a5:666f:7ac0:de3b:1659])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8bf9besm7502022b3a.55.2026.02.22.21.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 21:08:43 -0800 (PST)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH v3 2/3] hwmon: (pmbus/core) Add support for NVIDIA nvidia195mv mode
Date: Mon, 23 Feb 2026 10:38:03 +0530
Message-Id: <20260223050804.4287-3-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260223050804.4287-1-Ashish.Yadav@infineon.com>
References: <20260223050804.4287-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Extend the PMBus core vrm_version handling to support NVIDIA nvidia195mv
VID mode. This adds a new VRM/VID encoding type and the corresponding
voltage conversion logic so devices reporting nvidia195mv can have their
VOUT/VID values interpreted correctly by the hwmon PMBus core.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
 drivers/hwmon/pmbus/pmbus.h      | 2 +-
 drivers/hwmon/pmbus/pmbus_core.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index d2e9bfb5320f..3ddcb742d289 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -416,7 +416,7 @@ enum pmbus_sensor_classes {
 #define PMBUS_PAGE_VIRTUAL	BIT(31)	/* Page is virtual */
 
 enum pmbus_data_format { linear = 0, ieee754, direct, vid };
-enum vrm_version { vr11 = 0, vr12, vr13, imvp9, amd625mv };
+enum vrm_version { vr11 = 0, vr12, vr13, imvp9, amd625mv, nvidia195mv };
 
 /* PMBus revision identifiers */
 #define PMBUS_REV_10 0x00	/* PMBus revision 1.0 */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index be6d05def115..4d7634ee6148 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -885,6 +885,10 @@ static s64 pmbus_reg2data_vid(struct pmbus_data *data,
 		if (val >= 0x0 && val <= 0xd8)
 			rv = DIV_ROUND_CLOSEST(155000 - val * 625, 100);
 		break;
+	case nvidia195mv:
+		if (val >= 0x01)
+			rv = 195 + (val - 1) * 5;  /* VID step is 5mv */
+		break;
 	}
 	return rv;
 }
-- 
2.39.5

