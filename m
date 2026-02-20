Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75F6330656;
	Fri, 20 Feb 2026 16:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771604182; cv=none; b=Pn/FDK8Y8OdlCaEj6heVryYdyIP7D8ffXMLgHjBCyTKK1vSqpddYAFfyTivqQRiTVNMCDoHLF/Seb9kQI4uZoKwELkMaS0Qo8OTabTk9wVdV1q+VjCGxG2sMeDNdFZj645oe7X7gxMsAy5Wvr7SSiHA9/gJqv7YCAsZJipM6aQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771604182; c=relaxed/simple;
	bh=Ow7F5GIWawhSR4JBi/3O7CZPndyvHx+7k2zRJNaBQog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sz5ZvK8inqifK6VxziT9bMq1rFgIHiIr0xL0IRB0MwqzYIH4wRR5/MzVM31qiWhg2yn95KSXRzPeIbTXxFonLBfcqq0DrCZowHpw6523FzRyEQQXE6Q08GpvWTiUve4m9RAiPO+SwekUAED3/AeF4z5egGGip91EZe8SjbS1tpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=HbPtGgiE; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="HbPtGgiE"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id E4E7C5E6DD;
	Fri, 20 Feb 2026 18:16:12 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 1E2075E5B1;
	Fri, 20 Feb 2026 18:16:12 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 4983B1FC623;
	Fri, 20 Feb 2026 18:16:10 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1771604171;
	bh=edlqhZFsg65vg98Hx1EW1UqJpnZMNs0wW9RVdNL/cJo=; h=From:To:Subject;
	b=HbPtGgiEPsYxsJFIPmeBWZRUED1rH0g21bW/fty+z0i3H+la0l6eueLnfqErdrcLA
	 KUBSh43P10D9gbAJbZyTzsmNVnz8uY9d0ShZYnqadmRP34tYgYnb8euKAuyEM2gG+M
	 +O0qOxatuSpNk3aj25VU/TX25ten40IxXdeSxYno2RKrWSX7252+2rIpilWaPX+e5S
	 rn/SbgYJAA1b4/BGQEyd4SjqiP0rT54pnrBqynFpoUl8QD8PWBgZ7I5++Ew+suJh2Z
	 rx6aXD7ZiHAvooHLQZdWsifWrBOv7xv2Se1VhVikhBe+FK2duaL8I5ceKLVCN8P4EQ
	 vaMAIMETfRwaA==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: Cryolitia PukNgae <cryolitia@uniontech.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v1] hwmon: (gpd-fan) Add GPD Win 5
Date: Fri, 20 Feb 2026 17:16:01 +0100
Message-ID: <20260220161601.2344291-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177160417126.769062.307551911716027441@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

The GPD Win 5 is a new device by GPD with an AMD AI MAX 385/395 chip.
It uses the same fan control registers as the GPD Win Duo. This
information was provided by GPD.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
The GPD Win 5 has dual fans, as noted in [1], there is potential that
they might be able to be controlled independently (duo writes on two
registers).

However, for my application I do not need independent controls so for
me this is good to merge.

If a follow-up patch separates the fans, I will not treat it as a
breaking ABI change and will just update my userspace, so it will be
fine to merge by me. Just, please cc when posting.

I verified the functionality of this patch.

[1] https://github.com/Cryolitia/gpd-fan-driver/pull/21
---
 drivers/hwmon/gpd-fan.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index 237f496c4862..4c5e24b890c8 100644
--- a/drivers/hwmon/gpd-fan.c
+++ b/drivers/hwmon/gpd-fan.c
@@ -196,6 +196,14 @@ static const struct dmi_system_id dmi_table[] = {
 		},
 		.driver_data = &gpd_duo_drvdata,
 	},
+	{
+		// GPD Win 5 with AMD AI MAX 395
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G1618-05"),
+		},
+		.driver_data = &gpd_duo_drvdata,
+	},
 	{
 		// GPD Pocket 4
 		.matches = {

base-commit: 598cf272195d27d2a45462baa051959dc53690e5
-- 
2.52.0


