Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2BD3093CF
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Dec 2025 16:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816713; cv=none; b=Qs4L1ADtHMpeayZVxGKDzjZfb49MMAjJ1lh1vCPpaU7CKCIwlGqPnry7jhGGJ+kbwCsfQF0rFCmMGo6LUvUCSLoOby0Z0dAasBEDVkSPMc6eqK5HhigWYX4BG+VKfIcN9Tn3YImAM1MeAMIhOSKtKUc14XNxzgk93orKu0DjBKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816713; c=relaxed/simple;
	bh=k/Yd1BmFzU0e9UFcJv9URIkTbmDEVBM0hOo+JTGIPAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZMccETcEl0Czv3Q8wUI9O2KYQLv6rc8hNe4YkndRKTZL4R2tpYnEe+o9RkaH5y7jS4l1fUEGV7c2LUCYixHUh4OK39oZ24C3IZYefh+rpnhoRtZ9mX36+RTJnIO21Ezvv5ixUgh8eR/mCJHGBxYtXbcY2KlMu+QfRcAQwq6KW7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=AIWJvlhh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="AIWJvlhh"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so28536135e9.3
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Dec 2025 08:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816709; x=1766421509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cnKll+Mu3yr6wHuUg3E47hI29XfbMlTNI5VvcSPHEnI=;
        b=AIWJvlhhcWl5hbSyydkjLe/GDVS3V4vTDb4qeNWdR80M81ODF67qfM5mpLQNIjN2zg
         Cg0N+4vq4jQXHdnYY3svgMl/T49I5Zrp29STPCUNk6JrOin56BtaqbkiwBbaqR3OEZxD
         49isbVf+h4T2y7jhcwZgxNVTn28fbsNDx6pSx03mQF/0PDPnwg/ClnbgMkoHgXwi33ES
         l4rcR55YPGa4n54zK4ReHi/Fp9QkdZ9iXcPVs3V1UJHq0sTlTOTD31QjCOJN1tBd4HdH
         ScnT8mVHvKhb7KcWLzK4aDi21gN7q6e+xh5Vf/QLRwsO8/PdYTmcByG2duRS9HvdtUPv
         m4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816709; x=1766421509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnKll+Mu3yr6wHuUg3E47hI29XfbMlTNI5VvcSPHEnI=;
        b=RTT4qmEmDt6pXHVm/kD9m2wjvGhUXE9PGz0wrWWFrttgJjsGGTrajOYdrGdpNCHqn0
         GJ+C6v/lDGFpve4QcSbH27ANEaJWdFF5s6mpuhCBkvV+4mGk9Z2rYHDHaQT5akiEad30
         dfjRQQjKscUXflnR9GBhf8Sb+dvSktymspkyVQx+NkQeusXQtU/iH9XmeyrFQ+2ct+01
         c+SKdeLUPR8rWcLo2wsCy5YVounber+c3JtXf50rbkbFGCIDD3TEx0kzNXVlbMHdNyc4
         7zmiQT8+WOODlPMJoc0etZ0Ue5svlMKZlaMlHIUO9LQq5bfHUn6t2zi1aJt7FLVFWFGG
         V1yg==
X-Forwarded-Encrypted: i=1; AJvYcCW6WtjPczEvmRLaF6RQiJsbjCvJYFnIwh4375AeKVR/ldJd7YrHdVPbj8b9ncpGEwQlRqO2AHiv1m0MvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhVOgLXqfgMtjZU+cKirnRP2GuKnGiuIA3Jjo50UfrJ458AY1M
	JNCCfTk7p0t0FLTuNZTCwkNcsaau/RvzT33opSpkURorNihsKuSuZByDc6P4OVO/7ZE=
X-Gm-Gg: AY/fxX4gajsBloYwc5riwitF3DiE2b8HRT2feQxGt/8Hyu/aMDwdOSeWtOMfxo5p1Pi
	XJA5IyK+h+UnIIpwL4fhR9GsjrbxdQb0WabHXo3+dAGHcApkVtM/amfz4R9oYnYtKSi1bM6FUja
	z9DOikMwOP78/CATeBdJ1LUfs4DV2PUq0G/uUcww7Ro4cW+oZ5taRwMymclbwm919ds8MborlOU
	55tEUqohJvb9zH4d7KpLvvzg6kNS/ZVfdAQtwlUZVvlBi2UAH5GZDAgAz9EkhMfAcazGg2oZjGC
	jofjxvOfQ3JI4cZZTSl1mhZiOB9VOoi6Or7pfDSyhSrENsjlyXKVSIVD931ZKdN6k7B0MEJB2S3
	5Rw96ZHeBNG+ODdvKF8ynvThSiNe14J+/77Pirm60TTA4khRJos/EFYOm2JPSohFr7U68ngtz3d
	TV1T9jSdoNlcxbLe6w2qe0+7Rae+GCBXKa7Y0eUbk3aDsq
X-Google-Smtp-Source: AGHT+IHqk87hRgFNW+4zdWPZBEuhhkRVJA1LnAloDmFeZHxaQu5P+L96TkAMIyaxKGjp4sqU43QQWQ==
X-Received: by 2002:a05:600c:a086:b0:471:1774:3003 with SMTP id 5b1f17b1804b1-47a8f90fefamr116081975e9.29.1765816709336;
        Mon, 15 Dec 2025 08:38:29 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:28 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	linux@roeck-us.net,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com,
	wsa+renesas@sang-engineering.com,
	romain.sioen@microchip.com,
	Ryan.Wanner@microchip.com,
	lars.povlsen@microchip.com,
	tudor.ambarus@linaro.org,
	charan.pedumuru@microchip.com,
	kavyasree.kotagiri@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	mwalle@kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 01/19] include: dt-bindings: add LAN969x clock bindings
Date: Mon, 15 Dec 2025 17:35:18 +0100
Message-ID: <20251215163820.1584926-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the required LAN969x clock bindings.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Rename file to microchip,lan9691.h

 include/dt-bindings/clock/microchip,lan9691.h | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 include/dt-bindings/clock/microchip,lan9691.h

diff --git a/include/dt-bindings/clock/microchip,lan9691.h b/include/dt-bindings/clock/microchip,lan9691.h
new file mode 100644
index 000000000000..260370c2b238
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,lan9691.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_LAN9691_H
+#define _DT_BINDINGS_CLK_LAN9691_H
+
+#define GCK_ID_QSPI0		0
+#define GCK_ID_QSPI2		1
+#define GCK_ID_SDMMC0		2
+#define GCK_ID_SDMMC1		3
+#define GCK_ID_MCAN0		4
+#define GCK_ID_MCAN1		5
+#define GCK_ID_FLEXCOM0		6
+#define GCK_ID_FLEXCOM1		7
+#define GCK_ID_FLEXCOM2		8
+#define GCK_ID_FLEXCOM3		9
+#define GCK_ID_TIMER		10
+#define GCK_ID_USB_REFCLK	11
+
+/* Gate clocks */
+#define GCK_GATE_USB_DRD	12
+#define GCK_GATE_MCRAMC		13
+#define GCK_GATE_HMATRIX	14
+
+#endif
-- 
2.52.0

