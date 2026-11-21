Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.91
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289567;
	b=spVFS3Gh7Y+7jHW6qmxeuwNe7Igq6BCndUgY3NVoGBQctAk34M4xGrXTl3ZxhUgacJ7+
	 qPNndregYc7YkZLQXvJnKh5BPeqcD70dRKRBncgn7Gu4XjO8z6a7QSCwGl3sryc0Ysv4+
	 59TWqZQWY9r+2R3MihqtaKF2+AjBEAxjL+oUsK8xCIg523ODq2DET8SgoTKQOJZwjlMos
	 lgyWYfFknOrfvruKYKSyUwRczHX0KVzcMgwA/8OSJ3LjHA9pPmgnt0XptPpxdcvEn5aE9
	 oQjkTX6ITW0PmO5Pmx41K/MwEQzTdNu5z9ao1SV+atL12N1bTt+lfDalY0kTOsWqMuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289567;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=cAnI0c9hFjCMwUmPlUPWn1Le7Jb1Y2BnchBdQ6mVz6Y=;
	b=qvwsYXewV711XN44UCMNDekRfddWZTNHfnbjZuktYqhYYbPqIH4xC2NjJPWDn95MGJd/
	 SR2elFDAjGTF0j7XuszfhuCaW33vGmLudUeZnF7UF+UFhR4Ad/87RMexbEzzKwZRXi3YX
	 DZz5Z7YbSCf37XFbu8TrvKR6DS1fH6aJmApJR/ju/Nm95YclPS1WGgCMbSI2bJ+RjjqML
	 0KjHhNG46vPoo+7niOF15qO3kODRtRQrX7RR2yFdbo6omZELcDBWJ5/q+LSm+wYN3HAcu
	 BdOVMWF7s5VZuNEBGxZiNEWr2dlIsg8sWTEa1XmvI/I77l6xiaC7pfaZGkKhKnX6jLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ipvych.com;
	spf=pass smtp.mailfrom=ipvych.com;
	dkim=pass header.d=ipvych.com header.i=@ipvych.com header.a=rsa-sha256 header.s=key1 header.b=h9JzfjAc;
	arc=none smtp.remote-ip=95.215.58.91
Received: from mta1.migadu.com (out-91.mta1.migadu.com [95.215.58.91])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2C7606A32A
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Nov 2026 19:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC2C7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ipvych.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ipvych.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ipvych.com header.i=@ipvych.com header.a=rsa-sha256 header.s=key1 header.b=h9JzfjAc
X-Envelope-To: linux-hwmon@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=i2m/DFlMYzZ+rROkmhKoOHRI1qUFGH+RsFuOBgbVOsI=;
 c=simple/simple; d=ipvych.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795289563; v=1; x=1795894363;
 b=h9JzfjAcaxBpLxbeqHyOPBWgPvzufnokvfuQj7xWLnBhLHoMGBNjnoiWv4vRP0t+v9tmTWdM
 vjNOFRis1fTo3SBqUV4XHqauptvM6K3GTkJQ/qM4Q1dU3ee2HDaFX0jUVhpedlizfrtU289V3BA
 zNmmVUMFwHZ4D7TDLNw+CB6fY+htzrHPlYLf3oPyMxV1mgES9sUqGSJZPumRKbbaU/AbFRzF3YY
 54W7wILpewwWU8tSpiOww5QwtX+tsgzfcFItA190tSxo7EFNJSSFD08PjArF954aMcz5Ix4o2QL
 NAJnp1MB0nzy94d60AZs75GurQtW9Y3C1+EYjhYkQ4JZQ==
X-Envelope-To: linux-hwmon@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ffd402e7f7cd30ea;
	Sat, 21 Nov 2026 19:32:43 +0000
X-Mizu-Trace-ID: ffd402e7f7cd30ea
X-Migadu-Flow: FLOW_OUT
From: Ivan Popovych <ivan@ipvych.com>
To: linux-kernel@vger.kernel.org
Cc: pali@kernel.org,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	Ivan Popovych <ivan@ipvych.com>
Subject: [PATCH] hwmon: (dell-smm) Add Dell XPS 15 9550 to fan control whitelist
Date: Sat, 21 Nov 2026 21:32:27 +0200
Message-ID: <20261121193227.9408-1-ivan@ipvych.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Confirmed on my own Dell XPS 15 9550 running BIOS version 1.14.0
running "echo 1 > pwm1_enable" disables automatic fan control and
"echo 2 > pwm1_enable" enables it back.

Signed-off-by: Ivan Popovych <ivan@ipvych.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 5963f908972f..ba189b086b22 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1640,6 +1640,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
 		},
 		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
 	},
+	{
+		.ident = "Dell XPS 15 9550",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 15 9550"),
+		},
+		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
+	},
 	{
 		.ident = "Dell Optiplex 7000",
 		.matches = {
-- 
2.56.1

