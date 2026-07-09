Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41D13D6663
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jul 2026 20:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783629673; cv=none; b=IkZbZaZTNFNwRdiuvJUdeZvOfeSjVjJqP0iOq5gmAwwI+/T+pFI2Yoi25iinY15B6uNx7CXL5Pyurtpvw04RiOtTldD7D3QkZ16aW22Vk/z5snmR2Al/E9RCBTiEMxzXhLekSl86XyXGMK05mHB8UnK8NoGGPKCWrqglhYGrBvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783629673; c=relaxed/simple;
	bh=m+G+JuVTGfgM5TT9FSekcHZI3EJdPTwx++YovSUhQno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pu7c+kvbqlPv/pc/VQWLaQz76/JynlEm4T2NbjtX4YKlm6a8C5PnRix8IAV9pDm2FwTetAuSFwavwxHrPEsrFJ1jV59w4xzbp9oTK2RX40rJ3xReg+IGKFmSNPRqARqNfVvHD5YXDyL+S5oAn5vOwlPgOp9i8BoUe/Mjt/vjATM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fthf5aXd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fthf5aXd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b7612475so1779675e9.3
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Jul 2026 13:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783629670; x=1784234470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R6V4Vm1s8ZF3aI+yNeXFElkc91wk6n/W+vZRyVog1qQ=;
        b=fthf5aXdsYEMJ6u+Lu+HCA/zDWG33EN518O3Jquqj9YtgiJyktM2mHjaK2XT+Og53+
         DpL+bRrDvPuVYs5Z/+9LIP+y6IE9H6RF1U9EDwK218C2eUZMRi3iGmfFjSPi/kKsMVFQ
         JM4SZOVZUNrXyY5ot/lVG9OY9ztl18nZtCaaejdojrAvfQ9ooWQsb+po4HbQLC+pffoh
         jruqFxvhVyN5gP7xmZpaJ7sa1ky+QIwXOjmi8wqNyQsa07zubS1WLTNh5HCPhBFM42cO
         j8ffCiRCtksLiA4rT5jTHRn3gGM99Gw7ARkrdc0qShhgO3PZ+Y4GDX2vHbbK+PAnQpz6
         oKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783629670; x=1784234470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R6V4Vm1s8ZF3aI+yNeXFElkc91wk6n/W+vZRyVog1qQ=;
        b=mkmaAf+taZ00zBYqbLsDcve69xNGXC83ILEnOghWj0dokX2Fp9FDqLLBScC2nNbOB5
         HhW5v4CgSkmYJvHkQ2BPn2hXdkmpZtDsVk3GlQMz1xDoPu7ZhxMRLiEErFf+bjPuo3FY
         KSBXl1868cEWOBCwZo4dFBdRmkkXp9aZB1Gu56yX/UarQBVNb0F1F5/V7VXqi80wHTnf
         atL6tOKhXa6I0hzkCsD/94HbaCX91hhBwzzI+AqNg/+ddC+qnDmliQVDthLHeSVSK9ZP
         jtCR0kzryU2wUbbMoyGDfjPhapiV/swYtyX4heNVYyxa5DbAqcopxuPVbjfFQF6Dl/d4
         WMHQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7tjxSy1f+1oaQx4cILEKgT3LvE6edJSliicNSqfgLttXj1yEm6Z+gQ8xNAHR5b8KuOqHb246EK1iJaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrJqmQ91YkX7wWgP8x7Kyp5eDwuEijxi5dHdyel1++aMdoYqA7
	r63RhnIoDIk1xSrlGRgZgubrOQS3vCr1AUAhXp3WIVFnUCmrMsg0eM6Q
X-Gm-Gg: AfdE7ckhKhYawzRliD0D3QviOoADnecVQuwfIcRW5GMal61r58ob+Gl692leLXv+Z50
	dBhHKzP66u9SBPmtv3M3qHZKyfCjD48wQG1GHIGIhbuIdANkHuX16kyj25h0py20mZiXgYFyLdr
	JXfn5namrf6qkazDi6/eB21FIk44HeFqYxWRc5kdwUOWt/MPveU5WYHyzyDFlEqvRnCILuc6vyb
	k7dJbqxdmv1IpfzGFdslX/ug8lf4OcNgNSRi1ZoUP7y5HwqkRe+jdbpB4orjL6V8FOUmi/dPHMK
	pUb39UBxD7dT0xcGGoUY+f3q4aZzu4heU8oKy9WzkFxC7avRTcV+YG+xmyzkVFciMFW/wfU01NV
	W0Rgxda7xt5cagrbr3lbOJTXRQqBuBIe4EC5VWRf1cRTLd0ghopN/wel6WsiPFmqA4Nl+wp+gVu
	gwP4HaeivvgYvvOsxk6q43dEfhLFSxaN4=
X-Received: by 2002:a05:600c:3acb:b0:493:c535:3934 with SMTP id 5b1f17b1804b1-493e687d05fmr79588805e9.36.1783629670078;
        Thu, 09 Jul 2026 13:41:10 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3c42sm87100785e9.1.2026.07.09.13.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 13:41:09 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Vishaal Saraiya <vishaal.saraiya@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (asus-ec-sensors) add ROG STRIX X870E-E GAMING WIFI7 R2
Date: Thu,  9 Jul 2026 22:38:35 +0200
Message-ID: <20260709204037.1998433-3-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709204037.1998433-1-eugene.shalygin@gmail.com>
References: <20260709204037.1998433-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vishaal Saraiya <vishaal.saraiya@gmail.com>

The board sensors is a copy of ROG STRIX X870E-E GAMING WIFI7, thus we
simply reuse its board_info struct.

Signed-off-by: Vishaal Saraiya <vishaal.saraiya@gmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 77a709517437..e288f8ed6602 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -47,6 +47,7 @@ Supported boards:
  * ROG STRIX X870-F GAMING WIFI
  * ROG STRIX X870-I GAMING WIFI
  * ROG STRIX X870E-E GAMING WIFI
+ * ROG STRIX X870E-E GAMING WIFI7 R2
  * ROG STRIX X870E-H GAMING WIFI7
  * ROG STRIX Z390-F GAMING
  * ROG STRIX Z490-F GAMING
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 742520c485ca..473157b5f739 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -927,6 +927,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_x870_i_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870E-E GAMING WIFI",
 					&board_info_strix_x870e_e_gaming_wifi),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870E-E GAMING WIFI7 R2",
+					&board_info_strix_x870e_e_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870E-H GAMING WIFI7",
 					&board_info_strix_x870e_h_gaming_wifi7),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z390-F GAMING",
-- 
2.55.0

