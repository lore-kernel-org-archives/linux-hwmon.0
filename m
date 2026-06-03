Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C1444B68E
	for <linux-hwmon@vger.kernel.org>; Wed,  3 Jun 2026 11:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485062; cv=none; b=sD27twfWJYXN81U+ipj0uokPVYV/fK3v07sPHEKZ2VW84zB0knwUOk39/wdSi6l7dLbbEmdq1H8erIfhlCh/lWjD9uBfqytGDV5wjPy8aZma5neuSMqYGRzgyrLQz1AsVChY5kE5lt7rr8IrddpUuCM3om4yblzPTeDVmYuUlT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485062; c=relaxed/simple;
	bh=WElohaeoibrya2r+epkGi8m685N84IZm8WbzdHi27bY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a0Xb0h5FTL0NJEddk+BdjPZ0z9kEXF07WegcsUnmX0qTFYTRZmzMeT6v4mDX6kVBvlUhs7LQs04K2l7CcGOTKDfflHOO3M9sC+KuAlnnsoWm/Pi/8wSNhRUceavK4VrdyFP0AzasGbAS5O4gnpNujRBJYlZTuP1roIOZR4K04fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eddGT0FL; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eddGT0FL"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 146BCC62217;
	Wed,  3 Jun 2026 11:11:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 385955FFA8;
	Wed,  3 Jun 2026 11:10:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6CA810888CC6;
	Wed,  3 Jun 2026 13:10:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780485057; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=2yi9G/1y9Z13guvXDVzFImdd81dbfyWpcJ5ACUM8Nk4=;
	b=eddGT0FL4v5E32Lki/qeZdJuKQpajl8VYPSA7NFslyx3iKRlDCddKW+ZKsovLLeN8Pa0Hx
	67DIomi9PHeMcQ/bZaQSX0C/9g8NnvQoqhnPvoXL47eAdGQnYNZNbswrF3XL8vyXnekbfb
	pY83pr16DxE7/YI1Bhbj9TozPo9deBWVlgXP6FJeZmx7YovwYGx0VT/uZRrKkoesGUykke
	XFdEZfN05fWyYx1vpmGHP/+3YCyDBxHihC9N1XDH79Zl6Bk/8OFDNsrn6q2LaPCxz468ZT
	JVoBJ9ofPK0sb9XY2DdbIVP2RQD4v8I0jMfFLfQmw4m8d4TcnP632u/cPp+NDQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Subject: [PATCH 0/2] hwmon: (adt7462) Support probing via device tree
Date: Wed, 03 Jun 2026 13:10:48 +0200
Message-Id: <20260603-adt7462-bindings-v1-0-301304bcf774@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6DIBBA0auYWZdkCohJr9J0oTDguMCGUWNiv
 LvYLt/i/wOECpPAqzmg0MbCc654PhrwY58TKQ7VoFE7dGhUH5bOOq0GzoFzEtWSjwZNhxYj1Ox
 bKPL+W74/f8s6TOSX+wPneQEjCM6QdAAAAA==
X-Change-ID: 20260603-adt7462-bindings-5ecf3037040f
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kory Maincent <kory.maincent@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

Hello everyone,

These two patches from my colleague Köry add support for device tree
probing of ADT7462 fan controllers.

Best Regards,

Romain

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
Kory Maincent (2):
      dt-binding: hwmon: Add binding for ADT7462
      hwmon: (adt7462) Add of_match_table to support devicetree

 .../devicetree/bindings/hwmon/adt7462.yaml         | 53 ++++++++++++++++++++++
 drivers/hwmon/adt7462.c                            |  7 +++
 2 files changed, 60 insertions(+)
---
base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
change-id: 20260603-adt7462-bindings-5ecf3037040f

Best regards,
--  
Romain Gantois <romain.gantois@bootlin.com>

