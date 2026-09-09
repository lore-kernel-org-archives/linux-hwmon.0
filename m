Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412C739A07B
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Sep 2026 18:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978397; cv=none; b=QuR0WGhLh0lmKZDCe4UmzwDxen1I1a5UCbjL95OAa0BoV6T5/ugN4jvcUEaOu5Y1Qlcpi4NrnX6nTOYsXJ+xGjk5UQXyERozPFdPwt5ouPCcBxGFx6I7bQt9CROOTm1sXdlRZ9SeOmxHCG56OJ2SRjWSnket9RfKEd78Le0wfos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978397; c=relaxed/simple;
	bh=d4k89D7CPInjprjLDMTQowhDkmrCkN2LLi8fr3qHmd0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sIFoeb30CdhXSuagAJX1B1Odj1fU/aWEzjgHfFOPgoOcV+uNg1HsvE0b+bKERjpnHYMs5OcFzsZA7m2mNY8Gd//E2s7+DZ6K6R/dUQTalJhmh8+vH+u17r3skffqFIVOjMItdp9/SNt1xRR6Mvfvp53avirOLISBi35ug8Inb+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=usU2au/z; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="usU2au/z"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 58E261A1A7F;
	Wed,  9 Sep 2026 18:26:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11B6D60448;
	Wed,  9 Sep 2026 18:26:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DEFFC11C7AF8E;
	Wed,  9 Sep 2026 20:26:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788978387; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=pe+AvNOM34cItPQw4A0hTo3S7QyF+xIhTuSPU+mKmTo=;
	b=usU2au/zZ9s/g+0VfCnY+j8mtrA7WWeUBwHvfjvNdOxfKeKuYo2BluApybvXePbHQxY0gJ
	mI5GFN/vsWwuw9clDCvNcXV7HVQfPGtf83DHaLen0Lv5hCT5SFOeOFjcGYOSGEYx/9us+T
	/f8VJgUcOLmQyP8Id/GBK2+koYLfll7MZgCKMSPMDeUWVVAG+85kf022JvO5zavJfCA4JJ
	NJVeJMmjy44/Pf6FTqn2ijfg8SE15nMU8qkYZm+Prlb9FRVwYztunqUciZMO0LNzb1/0wP
	wyWZ4WA7VUfymVh0jB6lLPvubsdxSvnDm4WmRkkE+ve18nmRpXRac1o6fB3WfQ==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH 0/3] hwmon: (nct6775) Add support for NCT6122D and NCT6126D
Date: Wed, 09 Sep 2026 20:25:53 +0200
Message-Id: <20260909-bootlin-hwmon-nct6126-v1-0-4e85615fef10@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTvJUGJJvYpxQcsoQ3Rq2iokh
 LtbdfkW/2+QOQlnODUbJH5LlqgV7aGBMA16Y5SxGgwZS44c+hjLXRSn5REVNRTbGovBGhq63vk
 jOajtM/FV1t/3fPk7v/zMoXxnsO8fYGwvJ3kAAAA=
X-Change-ID: 20260909-bootlin-hwmon-nct6126-c620a379b509
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788978382; l=1437;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=d4k89D7CPInjprjLDMTQowhDkmrCkN2LLi8fr3qHmd0=;
 b=iNRlatUmvdQA7IncWBL1FIAWCnLrR6eAecjmwb+LdlmbEDKpeu1wtnDJxjwPzFBNzs1jLW72E
 9pDu2uq16z7CmoXZVj2NBk9KVg3vzSdew+e+yrn99DZlXTs8exMPJox
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Hi,

This series adds support for the hardware monitoring functionality of
the Nuvoton NCT6122D and NCT6126D Super-I/O chips. It is based on the
NCT6122D/NCT6126D datasheet (V2.4) availale on Nuvoton website.

The two chips shares the same hardware monitor block, so both are
handled through a single chip kind.

Patch 1 document the support of NCT6116D/NCT6122D/NCT6126D.

Patch 2 adds the NCT6126D and reuses the existing NCT6116D register
tables, adding only different VIN tables.

Patch 3 then adds the NCT6122D, which differs only in its device IDs and
UART count.

Tested on a Kontron SBC-EKL 3"5.

Thanks.

Assisted-by: opencode:z-ai/glm-5.3-flash
Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
Paul Louvel (3):
      Documentation: hwmon: (nct6775) Document NCT6116D/NCT6122D/NCT6126D support
      hwmon: (nct6775) Add support for NCT6126D
      hwmon: (nct6775) Add support for NCT6122D

 Documentation/hwmon/nct6775.rst  |  16 ++++++
 drivers/hwmon/nct6775-core.c     | 116 +++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/nct6775-platform.c |  33 ++++++++++-
 drivers/hwmon/nct6775.h          |   4 +-
 4 files changed, 166 insertions(+), 3 deletions(-)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260909-bootlin-hwmon-nct6126-c620a379b509

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

