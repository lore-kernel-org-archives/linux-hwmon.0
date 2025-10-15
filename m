Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63BE2D46B3;
	Wed, 15 Oct 2025 14:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760539907; cv=none; b=dweXS0uhjAuRVvfR0tZoe3xkEuZGAQ9LchbEVYIKHQ7v0eMDtPB4S98jJFj0g4cY1+SYT37wDRaAOXzhUpVQJlR/Zk6hmHZ1nHn089qFjUFoM/nIyAjAy6lp5ptsljXiAcG/BYh6+17bO71gUzas7xvMxF0NZd0nURznT8YR5lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760539907; c=relaxed/simple;
	bh=4/RXllx3+WvhwZzuQWZAdUUaSNYz5k2/VSJqVYXKqnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f7+FSUN0vHhwUikAOlKcoWUokmeTbYb5ZPh9u/2eiTaV9CKR0vEw60EOD9ieBpbmSOXYrHc0ww3bAhzDSKly4z1KWWXhonbCbceZnc96mwD5IgEDkTpbtQnHKrP3gdFj+bpI+EM823LAVAtpuR6TIdZf5SEr9Topah8yXPQOYms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2PFizJt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2PFizJt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D492C4CEFE;
	Wed, 15 Oct 2025 14:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760539907;
	bh=4/RXllx3+WvhwZzuQWZAdUUaSNYz5k2/VSJqVYXKqnk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=j2PFizJt670dPxDpzgMxkiFKby5sm57FPW1k+EnKEsv6H2PyqAu7YDCB+/tTbJ3yl
	 lD4h59njnwhOFS11Pw0ek4E96beRS3dSr1acPDzA6WhXhMYpAt11qIHBFgglzSirec
	 goR8+QSPjz3K54A5OrBWq2/Fsk2A5lwmJSWCzq+wAKxArA4zQP/MMomwWqy+zJW7TL
	 hEnVps9UIv0pvO5ug3ImN3DPGE5Y9Fz0rlu6YW14eWA5efjzuUT/5ZaCYLV/Tjzmul
	 LWehzT7bswOTwiwQWUrAUAZ4o/MqCI4AcaqQiNvCU+0s8+RWOI7qhmYlEmtdN4a7l4
	 pwcEip9kI0LRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBC6CCD192;
	Wed, 15 Oct 2025 14:51:47 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Wed, 15 Oct 2025 15:52:19 +0100
Subject: [PATCH 1/3] dt-bindings: trivial-devices: add ADT7410, ADT7420 and
 ADT7422
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251015-dev-add-adt7422-v1-1-7cf72d3253ad@analog.com>
References: <20251015-dev-add-adt7422-v1-0-7cf72d3253ad@analog.com>
In-Reply-To: <20251015-dev-add-adt7422-v1-0-7cf72d3253ad@analog.com>
To: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760539940; l=1264;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=vofQw/rQ6b56oljOKSigkB7SRZD/pcZTXouUVgZJ6rk=;
 b=mnLk4naQnCqRbPazej4DF37wgL2ET3O7vHzSvSOuPiTl8DyF/3whe1oqS/OTF6VwDZwhNXaJM
 uJStHtKEidGBZm/Mqa7fzjDeeoETF+Jk2c4A8nOfOWzpnrscJNp5qye
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

Add Analog Devices high accuracy digital temperature sensors to trivial
devices.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index deccb119493e..884a071a1f14 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -43,8 +43,14 @@ properties:
           - adi,ad5110
             # Temperature sensor with integrated fan control
           - adi,adm1027
+            # Analog Devices ADT7410 High Accuracy Digital Temperature Sensor
+          - adi,adt7410
             # Analog Devices ADT7411 Temperature Sensor and 8-channel ADC
           - adi,adt7411
+            # Analog Devices ADT7420 High Accuracy Digital Temperature Sensor
+          - adi,adt7420
+            # Analog Devices ADT7422 High Accuracy Digital Temperature Sensor
+          - adi,adt7422
             # Temperature sensor with integrated fan control
           - adi,adt7463
             # Temperature sensor with integrated fan control

-- 
2.51.0


