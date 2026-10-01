Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83084921B3;
	Thu,  1 Oct 2026 07:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839715; cv=none; b=jzQjh0h/lEcY+Hm39xS5oLV4qr77Yzq8suHAg40We73H8OpNj7b2HwgZyTG8jjlCRa53aG9ScXRg+wXU/sFwo8nuw0RJ7ZEBKQh/mgghDpfVr3rYhPuCN7/h7+iqQYPiIVHoCOrO6WpeM6aYnNZrHFy4bAOvKp9C5Q94orE7ApU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839715; c=relaxed/simple;
	bh=fnkw+GF/J35hw3r+1vkzRsr1snb5UGGguV8teybYY48=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ezFvTNnJXqHaWdwBqUhut3wcOjpomPVL0AiS4LnnXnd+BeN3oj3NbECeFLR9UYUYur9oGF91aU6PFSVvoyiiz77Iy9aoiWdEscuo+y3DlfaLCE1yQuqYHujoWzwQxmgxpAQ5M4V1jpedxSipkbFIWidA0IRv+JDuEVs1Y0pl27M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hz62UEvp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hz62UEvp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30FFFC2BCF4;
	Thu,  1 Oct 2026 07:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790839714;
	bh=fnkw+GF/J35hw3r+1vkzRsr1snb5UGGguV8teybYY48=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hz62UEvpiCfjpz97stp/2jykdxF7Hv8BS4Rr57tRgbEkube/qjVX1ZYa74b1M9ITc
	 JwKaOZK9BvhlQ0S2rQOghrkv8Si8TlDSS3eNETEvaowrIVbxR2UKHw6HSeQJSCg0He
	 OZ5lxMEfCBiqZj/H9uXkYdgFIhCP2IGipyCQQGEAZ8UvkH4fNQK3Z0ZHqMtNoJgXXn
	 CCJSlmd0Gyl74DUOvdHpDYqQuop1AYfi1cBxIZdWr+nqyVbqwnAYtNaBjUEJaBwYZP
	 hMpxnnD6G8mV/qWVeXnir8YFZqr3n/SVhM3zEOJP8SEw2m5lxPFzbgcHiEcumCtvhb
	 AlkBKUSVyQ8eg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BD7CA5FA5;
	Thu,  1 Oct 2026 07:28:34 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Subject: [PATCH v2 0/2] hwmon: pmbus: 0-based thermal sensor index,
 mps,mpq8785 #thermal-sensor-cells
Date: Thu, 01 Oct 2026 09:28:21 +0200
Message-Id: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v2-0-07d368dcc662@free.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJULvmoC/52NTQ6CMBBGr2Jm7ZgCtkVX3sOwaMpUmvDnTCUaw
 t2tHMHl+/LlvRWEOJLA9bAC0xIlTmOG8ngA37nxQRjbzFCq0qhLpTBMjK9ZEpMbsE04zM/a1hp
 TRzy4HoVGyRdPfS/orQ3OtE6flYGsnJlCfO+5e5O5i5Im/uz1pfitf4aWAgs02lbeGk0U6ltgo
 lNgaLZt+wIrI/7N5gAAAA==
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Charles Hsu <ythsu0511@gmail.com>, 
 Eduardo Valentin <eduval@amazon.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vincent Jardin <vjardin@free.fr>, 
 stable+noautosel@kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790839710; l=1592;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=fnkw+GF/J35hw3r+1vkzRsr1snb5UGGguV8teybYY48=;
 b=FmoTpu7IVAFu9zOx+03ETWgBzk239thQMC9+HKq6GWg3wexsOK/Xv89dEIjNaLMZWlvlyNN9v
 OAo4xaOS5m0AK82vN2i9sAckVt4/3t/crwhLSv/HvvNrqydE78+3kES
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

The PMBus core registers its temperature inputs with the thermal core
from index 1, while the thermal core expects a 0-based index.

Patch 1 fixes it, as Guenter commente on v1 [1].

Patch 2 is the v1 binding change, now with #thermal-sensor-cells = <0>.

[1] https://lore.kernel.org/r/37298c5b-aa6b-473a-8e22-d29ddec12c04@roeck-us.net

To: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Charles Hsu <ythsu0511@gmail.com>
To: Eduardo Valentin <eduval@amazon.com>
Cc: linux-hwmon@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Vincent Jardin <vjardin@free.fr>

Changes in v2:
- New patch 1: register the PMBus thermal sensors with a 0-based index (Sashiko, Guenter)
- Patch 2: #thermal-sensor-cells const: 0 instead of 1
- Link to v1: https://lore.kernel.org/r/20260930-for-upstream-dt-mpq8785-thermal-sensor-cells-v1-1-6573c765eef8@free.fr

---
Vincent Jardin (2):
      hwmon: (pmbus/core) Register the thermal sensors with a 0-based index
      dt-bindings: hwmon: pmbus: mps,mpq8785: add #thermal-sensor-cells

 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml | 3 +++
 drivers/hwmon/pmbus/pmbus_core.c                               | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
---
base-commit: 4781ca52761e666cf18b591e6bb0478396c90320
change-id: 20260930-for-upstream-dt-mpq8785-thermal-sensor-cells-c77fa6da5406

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


