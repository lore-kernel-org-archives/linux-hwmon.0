Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13D147D440
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 13:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046923; cv=none; b=JPBI4XB2aWWrw0VklQqCaugcUCbJCX6HWv2NeN+3KNNElMD5QOVUxYm/hocdPml0BWFdVfj/jvbmX5qAKOsNLPSrtuqsKcCG2szdfchmMD0Fq0OniljXU+uFX9M5ZBPbG/uvzIhReiZ1Nsl2usvB78QmJ1uOyLeqmdSC7S0cXS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046923; c=relaxed/simple;
	bh=5n0TVYlPfaHLD0smim+iM71+EvFKdC6MnbuWimuwA4g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M/MQNJuevDH8fHsc1EkfPe0eiQNnZhdi2SZ44HsfGlJKCx/PKp777Fe+pn0+Je+b1v2lJQMRhtiyw3Vt+5+yMexoUT2JkDSt3cWrOz2b+nYaPBsMew5OX2BUc7PkW7+kKxR6o8v76aQO/zT5wxy1LZeCcYfOJCJraE7frT1LOtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ckPHdH1Z; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ckPHdH1Z"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 14D3C4E400E7;
	Thu, 10 Sep 2026 13:28:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC7AE5FA2F;
	Thu, 10 Sep 2026 13:28:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D19A11C7942F;
	Thu, 10 Sep 2026 15:28:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789046914; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=K+/zAG2hLyvFJeet1kO+yTewsJ/LJSKWjeMa9bPeP2A=;
	b=ckPHdH1ZQx+h+d9KRbf21IVculbcWrQxq/Key6YzvErZludnDWX4HbQkM4dNFtNlg1wCtf
	kL0owNO+wN5eNWuuJVEmQCe7i36PSqcBmmBbNSdfhV1yJGU1UwHLID9RK2Iq7bB5AikVMO
	JMQMe+0DfDBHpghyTZSrE+jaAv5HKUa3SXYW5b+KjMrQgUdrVHEros51hp1+gFzXBcGqOX
	6qMZpfhnJ8CEgZIC1x/L4H7zEljHjfEhy08c/MeTUePv5W+Myb2jyNU/Ymc1eNQyN4R69W
	vr7X33HHxauu4gOWFpMMb2SB43VmmoAjQPak4WnRBBm2MxKAuZwgi/EYfAtwLg==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Subject: [PATCH 0/2] Congatec Board Controller: Fix current sensor lookup
 and add new sensors
Date: Thu, 10 Sep 2026 15:28:20 +0200
Message-Id: <20260910-cgbc-hwmon-fix-and-new-sensors-v1-0-ef13ae2fa147@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNywqDMBCF4VeRWXcgRqrSV5EukjjVKXQiGS8F8
 d2b6vKDw392UEpMCo9ih0QrK0fJKG8FhNHJQMh9Nlhja9OaGsPgA47bJwq++ItOehTaUEk0JkV
 busb5e9U2voIcmRLl2XnQPS/r4t8U5n8VjuMHmHCrSoIAAAA=
X-Change-ID: 20260806-cgbc-hwmon-fix-and-new-sensors-21a7ab5387b3
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>, 
 stable@kernel.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

This two patches series fixes the unknown sensor warning on conga-sa7 board.

Patch 1 fixes current sensor lookup. With patch 1 the unknown sensor
warning is still there, but sensor type and sensor id are now correct.

Patch 2 adds new sensors and so it fixes the unknown sensor warning.

Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
Thomas Richard (congatec GmbH) (2):
      hwmon: (cgbc-hwmon): Fix current sensors ID lookup
      hwmon: (cgbc-hwmon): Add some temperature sensors

 Documentation/hwmon/cgbc-hwmon.rst |  42 ++++++++-----
 drivers/hwmon/cgbc-hwmon.c         | 126 +++++++++++++++++++++++--------------
 2 files changed, 104 insertions(+), 64 deletions(-)
---
base-commit: d2587340a8575100d9ddd10270c7a5c216766b5b
change-id: 20260806-cgbc-hwmon-fix-and-new-sensors-21a7ab5387b3

Best regards,
--  
Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

