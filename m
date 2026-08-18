Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA3341D23A
	for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 08:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040558; cv=none; b=dV5G17DQ/LjLfnEJ+3dLcxgGcchUKBREDoMSK8kFWqPAxrjJAekKDVseZyI1sGj02BqbpQeGvXWKcL035k8GdtIaE168TBQoKl4I09kfQRlb49D7Z2pEILP3Nc8sf7xmMzDgGC2fV4Ej+U+2iaDEHW1S4wOhYWiBi3foMZfelN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040558; c=relaxed/simple;
	bh=dluwEERvUmom1mlzUsP46XKkZ/Yul6nAzebqb2Z84yo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hFzW++Ad3vjyKanq0ggUeBniwuED8tmx5/04zepiZo4vH8qtRbVQ2rxEZmRom9dTD2f+B0w9zFeFXzFGiXuivmP8N3ThGwQB7PrKLzTdBebxyH4EHc05iRv+kwhmmgiO9O25nv6aRkE087agkKcDEriqiQhx4DUciJdB0OCW9Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uLqKTbtS; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uLqKTbtS"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 743A14E412AB;
	Tue, 18 Aug 2026 08:09:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A4AB60355;
	Tue, 18 Aug 2026 08:09:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0DDCD11C7496C;
	Tue, 18 Aug 2026 10:09:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787040546; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ImhzSx8fF0JQgZ85qGQ+X8Einl0vzCiqKScWhMcTbTc=;
	b=uLqKTbtSOg0MVf4EVxIrMPVyLwNdd8cEsgdOprKywizKbB44WYpiyUnchJFftkipaDJ1yO
	QsErhdG7nKnIGaIApFdy2LjnUFa14CBogE9xRMEgtNIFtEnFXVn/unKJeJ5cYMrtBn/eov
	vQhYDUeo1X7gzPiUjl9YqOlQI7cZeTlx6vx3/N8GbVabGu3Rxg0dsy2dXO6CegFSk1YaZD
	nTwLIwKYfWKnOJz6Lwl0cx+1JARerpH5+CrzD0Vdx8dtGS+CGlOWVxNf8OaFDHGA5f0Ymi
	I1vrFi8KHtJK8t4pE6qDCp0BLgWw7VJlSiqNSCggFGM/cfB5FEgDFK1ScFYVXQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 18 Aug 2026 10:08:40 +0200
Subject: [PATCH v2] Documentation: hwmon: replace full-width colon by a
 standard ASCII colon
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260818-doc-hwmon-remove-confusable-v2-1-c1dff1ec01cd@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NSw6CMBQAr0K69pm2AUFX3sOw6OchNdBHWqgaw
 t0FjFuXk0xmZhYxOIzsks0sYHLRkV9BHjJmWuXvCM6uzCSXJ14JCZYMtM+ePATsKSEY8s0Ule4
 QLOZFmUuOhku2FoaAjXvt9Vv95TjpB5pxS25G6+JI4b3vk9i836n8e0oCBFjdaKUqPBcSr5po7
 Jw/GupZvSzLB8CHcEfaAAAA
X-Change-ID: 20260812-doc-hwmon-remove-confusable-de457420ec02
To: Cryolitia PukNgae <cryolitia@uniontech.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1708;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=dluwEERvUmom1mlzUsP46XKkZ/Yul6nAzebqb2Z84yo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqhBMeCWiCqJQstkZZvVUrjrMNQxm7d4pwZ32SJ
 DrNWh5I0h6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaoQTHgAKCRDRgEFAKaOo
 Nt+aD/0Uci4pZxxy7ORH4R9kVAloGfzYTGv66Jgj58MeczocJbGbIvqJqjhY+UD4F30qeVFSLt4
 RA4NlLPlFAYjZ9itA55vcGjn8lNyTtUWbRNQpgvQs9NAt0P/ZgIZ2QvBeStopDh/XK2HjwTRRWH
 97jsX3xtH94MRAywt3YQB4/KY7dwB6Cf7QYJ/l08nc1SDtzujMIiUbtZ+SYe//GripK7iVcb9r8
 JB91OoYbWZMRvxpc20Vdldw/HmAa0WWJZZRwOb0K4apt8fvQSytUr5zxSy0qhcf7WcdK33RDdpy
 tFAy+n3tmP8jl7duoeR5WDiQwEW4rY7/8/1JcUYobUOLHgNpiQmvOSpOLCUWUYYjnanDEa3TaIF
 WUuMB+Cz7olkkYW8Uu7Rw+Ktz9TXYr3QNNQ2zdQAhKZoIhgVb/mdBd/Z9rGCRaJm2FRMl08hmET
 ZSiZADvoxqv1dhyIUbkvu1XeAWoh20w7AcwCqIoOr3uqqshRLsyOxmUMHOHkzgiuX1qSbzwrLJH
 1r8c6fTNLy4BVgH6KY0dr4juxZjn7rgJucX0lTaZx6RCJ/crdWluZRptnrvw/6hCfciDteun58a
 RaUcnRw7X2k/n72AZ3yD3os+bXw+bv38NNbfWKYkTj+vgJbplyPBvc/Vs7hebzm7ztS85maqlqV
 hyvxVVN9pu3tsvg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3

It prevented the pdfdocs target to complete, prompting the following
error:

  Latexmk: ====Problematic refs and citations with line #s in .tex file:
  Missing character: There is no ： (U+FF1A) in font DejaVu Serif/OT:script=latn;l

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Adjust commit title and body as suggested by Guenter Roeck
- Link to v1: https://patch.msgid.link/20260817-doc-hwmon-remove-confusable-v1-1-dbfbaa8e952e@bootlin.com

To: Cryolitia PukNgae <cryolitia@uniontech.com>
To: Guenter Roeck <linux@roeck-us.net>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: linux-hwmon@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/hwmon/gpd-fan.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/gpd-fan.rst b/Documentation/hwmon/gpd-fan.rst
index 29527a77fe88..b27657d33056 100644
--- a/Documentation/hwmon/gpd-fan.rst
+++ b/Documentation/hwmon/gpd-fan.rst
@@ -67,7 +67,7 @@ pwm1_enable
   at full speed. Write "1" to set to manual, write "2" to let the EC control
   decide fan speed. Read this attribute to see current status.
 
-  NB：In consideration of the safety of the device, when setting to manual mode,
+  NB: In consideration of the safety of the device, when setting to manual mode,
   the pwm speed will be set to the maximum value (255) by default. You can set
   a different value by writing pwm1 later.
 

---
base-commit: 248951ddc14de84de3910f9b13f51491a8cd91df
change-id: 20260812-doc-hwmon-remove-confusable-de457420ec02

