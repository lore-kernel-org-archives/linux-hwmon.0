Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCE739A4CF;
	Thu, 10 Sep 2026 07:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789023811; cv=none; b=qv0YZHbw6cHbBNHhQYG7psJ2muqdQ0u1AbMUooOQtkq1Ja7cjSzWoO+jEWxnsmlkwm7RKLBKErJ1lJB3wHu5ihOLgGt6KtXsyjSgNOjzuQsaq01EbrypF9UTMaLMmJx3K6P1vhFDEYn+FdxEKTrRgVkKL3f2rAvz/N00oAwstyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789023811; c=relaxed/simple;
	bh=f5aiTZ4e42jlzpUAaNGbkK9DSqCTLeI3+3SKAshCoLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tsPkLevTe/CmB1GYO/loiU1PSpSKOJ0z43o6Atlq3sVwXByEMKwvMOuQePjYsHHwbbUnA+LojYqFxes4xbvc9M/6WyN50kzAerUk3dqxEqbrp33vi+f3Mf9igKVSO+lClIsOSA8m+IzJLvYoTGzTxg+St5ewrAYexSFZRS3A2S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=E9fEDXPs; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="E9fEDXPs"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 01F611A1A91;
	Thu, 10 Sep 2026 07:03:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1EA5602B8;
	Thu, 10 Sep 2026 07:03:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A1DD11C7AF99;
	Thu, 10 Sep 2026 09:03:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789023798; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LC797ZJK0mgOkjvXz+Q18uE/g6w9FA8e4i9NKAzTH6M=;
	b=E9fEDXPsKJnxoqMssyS1ePwglpFFUJA/o+TMxbKztuHyXDdsbtUHBKuuwFZ/QlrOloqFA9
	uztyivOZOlgUqzl59/t6nzNyehv0w43+QVyCazl1U5yzZxyLkym5Xngh7OzB7bCsHx5BaU
	ZoYKOotx7xR7axm2726xYxM31LbDnecXf3Jo174OzgiwIftNi4LjVEx8exgNec4Hx837FQ
	r4xJM/pjr0nskoiLjPtxZq+oPY+KaGydnPXzh15yb6KBDrWdgloz70K/4VGWZeUh5HLO2p
	SdNxl9T+tu8aWMWqQ1stKEoflyMkhMXzScaFsg6fb4rycI9oF4V8PohZJr8ajA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Thu, 10 Sep 2026 09:02:38 +0200
Subject: [PATCH v2 1/3] Documentation: hwmon: (nct6775) Document
 NCT6116D/NCT6122D/NCT6126D support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-bootlin-hwmon-nct6126-v2-1-ee629ab35e49@bootlin.com>
References: <20260910-bootlin-hwmon-nct6126-v2-0-ee629ab35e49@bootlin.com>
In-Reply-To: <20260910-bootlin-hwmon-nct6126-v2-0-ee629ab35e49@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789023793; l=1255;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=f5aiTZ4e42jlzpUAaNGbkK9DSqCTLeI3+3SKAshCoLQ=;
 b=Zcy/5c85KChh1d8CvlwuZgKEdGLTlQ4yXv0xyIz1iL0b/camH1UvxyJ8075wijHgB+tbcuUKx
 rCz3Gt89wZzB8unC4mOKyJ1Lp4mvokaBVYY2X5PsdRvUj5HzD6+fyYQ
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

The NCT6112D/NCT6114D/NCT6116D family has been supported by the driver
since commit 29c7cb485b32 ("hwmon: (nct6775) Integrate new model
nct6116"), but was never added to the list of supported chips in the
driver documentation.

Also add the NCT6122D/NCT6126D.

Assisted-by: opencode:z-ai/glm-5.3-flash
Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 Documentation/hwmon/nct6775.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/hwmon/nct6775.rst b/Documentation/hwmon/nct6775.rst
index 41b21bed7e27..5199c083b9e7 100644
--- a/Documentation/hwmon/nct6775.rst
+++ b/Documentation/hwmon/nct6775.rst
@@ -16,6 +16,22 @@ Supported chips:
 
     Datasheet: Available from the Nuvoton web site
 
+  * Nuvoton NCT6112D/NCT6114D/NCT6116D
+
+    Prefix: 'nct6116'
+
+    Addresses scanned: ISA address retrieved from Super I/O registers
+
+    Datasheet: Available from the Nuvoton web site
+
+  * Nuvoton NCT6122D/NCT6126D
+
+    Prefix: 'nct6126'
+
+    Addresses scanned: ISA address retrieved from Super I/O registers
+
+    Datasheet: Available from the Nuvoton web site
+
   * Nuvoton NCT5572D/NCT6771F/NCT6772F/NCT6775F/W83677HG-I
 
     Prefix: 'nct6775'

-- 
2.55.0

