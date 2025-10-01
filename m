Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FB42E06E6
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Oct 2025 11:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759319151; cv=none; b=Lt/KfBkjq2+xl6oA0bDZ4DQmRFkKwyEMfDYM1kaNwf4aFZC8VtMtQNYwn4p5AHI24t922cO2cbOfKrHmGLvaY3O3V04gbHpDCp3dOajlsrUbi8f4N+AZR0XWQRoYz93MwXlTBxaSb0BUEA4KZ/SvIuJFH3vsjx5qrTM+eR8aZzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759319151; c=relaxed/simple;
	bh=jbUAjE1/2bcKDmn0WNXhi+HKRDCywjmnQnhBDLi737c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cNmFf/cUWF/LSsj4PgttXEeXZ579JwAa6WzvYpWaDlDqXLrrAH98434CtR3Z0ljbL92vv0Pei2F1BY+wwMjM4NbbnWTkxnMVJ1yuf3NY8/dacSbn/pzwmyRsJ0U2EBAkMIEjx56pL0COiy+4uwXyIRMhNnG1WGw/InStQ2DKTKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1v3vGz-0007sj-F2; Wed, 01 Oct 2025 13:45:29 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1v3vGy-001PC8-2V;
	Wed, 01 Oct 2025 13:45:28 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1v3vGy-000000081Ta-2uJs;
	Wed, 01 Oct 2025 13:45:28 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 0/2] drivers: hwmon: ntc-thermistor: add Murata ncp18wm474
Date: Wed, 01 Oct 2025 13:45:26 +0200
Message-Id: <20251001-ntc-thermistor-ncp18wm474-v1-0-2c64b9b509ff@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFYU3WgC/x3MTQqEMAxA4atI1gYaqfhzFXExrVGzsEpadKB49
 ymz/BbvZYiswhHGKoPyLVHOUEB1BX7/hI1RlmJoTNOSMYQheUw76yExnYrBX9Q/h+0sOhqIrDO
 uHVYo/aW8yvf/nub3/QEE3t2IawAAAA==
X-Change-ID: 20251001-ntc-thermistor-ncp18wm474-b19114b0b59f
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Emil Dahl Juhl <juhl.emildahl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759319128; l=650;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=jbUAjE1/2bcKDmn0WNXhi+HKRDCywjmnQnhBDLi737c=;
 b=sAL3QQeRhIYR7OdZu385y+ymYh+90D9WOAFz8lkhOu725yIbm4ccWKnRZ86C5x0fv2RM9PyQB
 NE/wISfcG+lD2gOnj0EgS9hZfyabjpf6ACgETbarXTrXSxehVkGjDLm
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

This series adds support for the Murata ncp18wm474 NTC.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Emil Dahl Juhl (1):
      drivers: hwmon: ntc-thermistor: add Murata ncp18wm474

Sascha Hauer (1):
      dt-bindings: hwmon: ntc-thermistor: Add Murata ncp18wm474 NTC

 .../devicetree/bindings/hwmon/ntc-thermistor.yaml  |  1 +
 drivers/hwmon/ntc_thermistor.c                     | 43 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)
---
base-commit: 50c19e20ed2ef359cf155a39c8462b0a6351b9fa
change-id: 20251001-ntc-thermistor-ncp18wm474-b19114b0b59f

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>

