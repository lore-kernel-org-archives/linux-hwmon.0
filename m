Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363881624D5;
	Thu,  1 Oct 2026 21:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790891266; cv=none; b=bST2/xr9vRrgyv1U8qxq0Awc5SLOjUr5mzALyo8QKrIcWcKs4BcbXVauPYIY1LqD844mdWOzeyDgr0Gl2uDp7pxE7cAdfkhAFH0NE3EaSwxwkXZIhhJmGfFY6fiWu0Xr62IWGoXHYmVhetAcO8NnOEw3oDgFdSBkN/oNINVYu2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790891266; c=relaxed/simple;
	bh=G9KqaY6RJaYcc42fosBWmM3xBSDQ5brxuEHl/lRpxH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AX5LvthvyRVQ/FD8FWqBlsGhgE5lEsHt8W6E092yHyHB7WU30tNDEBodPuNlsN0hpiAPNlD4ekZSrEuJ9walPhVSzNyoYnzMUsrTIl5MjgTRy/w6jORoSXAFcYEk3bDSL4lJ3k+0iuH+zKWkx42SRS+a0ctzSm/qrCpOdXAeQnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLSeo8/O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLSeo8/O"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D530FC4AF0B;
	Thu,  1 Oct 2026 21:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790891265;
	bh=G9KqaY6RJaYcc42fosBWmM3xBSDQ5brxuEHl/lRpxH8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TLSeo8/OWevblSH8ejtmFpJgbsBO6Pd44z+7HZSTbP6z4i/Rb3HJPiOhlcTIP4I9l
	 PmghKiv5VN/Fm92IV7U3uJVnqFZH1D+ZLe1LKvdqUCGmPq2FyGpzkUk+aUbz/wzKgT
	 OyI7bR9wH73WLR0s4Do9GRo1lVk2PEKCClDO9IYp1FBrEBv8eXNFEykn795Y1YnDsw
	 d6xG7l9e5fKLfM38ULky0PJRFaYQGSQ+2twk0wVfCDiQHuIgnz9nKOvmurgc1cILi9
	 pN/d7VAHxseIPIMN6eAvQ19XQqn+8lFo0EQt0lAq3h/4M36CbiDBY3Ja3T2U3yKk2E
	 t0aDsoc4gMAEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6AAFCA5FDD;
	Thu,  1 Oct 2026 21:47:45 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Thu, 01 Oct 2026 23:47:40 +0200
Subject: [PATCH v3 2/2] dt-bindings: hwmon: pmbus: mps,mpq8785: add
 #thermal-sensor-cells
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-2-bfafba9fcc95@free.fr>
References: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr>
In-Reply-To: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Charles Hsu <ythsu0511@gmail.com>, 
 Eduardo Valentin <eduval@amazon.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790891264; l=1273;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=DDjneRrrCwg1pEDeBRgiYbnRLHQFomHKDXpTcRftV6A=;
 b=HII73c2NfEVZqTAH1QMvhqIaUsg8cwcKNBue+XRG0aWFmchoQCnwWy57v8Qn0t0XBeZ3IEA1H
 UJK9RWiFFlhA6xDE8XvCFco2QXR0Pu6Qlxd1/UtdnKF5p13uSnCkUci
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

Each device of this binding has a single temperature sensor: the
internal sensor of its die, which the device also uses for its
over-temperature protection. It is read over PMBus with
READ_TEMPERATURE_1 (8Dh). The sensor is internal, not an input:
none of these devices has a pin for an external temperature sensor.

Allow a thermal zone to use the device as its sensor, to monitor the
regulator's temperature. With a single sensor per device, no cell is
needed.

The MPM82504 has four channels, each with its own PMBus address set by
its own ADDR pin, so each channel is described by its own node.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
index d7a32fb3b7af..6257a8030e53 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
@@ -34,6 +34,9 @@ properties:
     maximum: 4095
     default: 706
 
+  "#thermal-sensor-cells":
+    const: 0
+
 required:
   - compatible
   - reg

-- 
2.43.0


