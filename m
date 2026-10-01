Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FD826982C;
	Thu,  1 Oct 2026 07:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839715; cv=none; b=jB7cj8Ph7452/OVHMFt2pBnEPIfCxLP6uId8S8QcFjo8CG0P3keRwIJX9AFdwinY830WMZvoSyXcXJgFQKi4ZIb+cYXkxcEM5op3+09GKQkGbIkx+XY34KNbFIvHLQ6h95C53t4UcQ3MMB33I6EJM6vPorsxgrvtqQMZ2+FFSOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839715; c=relaxed/simple;
	bh=IehjHGyeTB3qOxdnG2Qu4ujZGQukL04r22A8lNc2Xac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HPcOFfIaOWTuRGxqWahWZydsJk/Q3ZWTrgp5qha+GctImkK7TayGdJ0ZrzPmOJNmFPJiEvDX7n1TFytAyBeWLltSp8vu0BFqR3HHgxS00QHxanFifRmHbuLM5ETo47gQdmCV07uVOFhc4Nd3oPb7+J6XpIbYymwjzbW+CcYAHcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XE2OPNhm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XE2OPNhm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51443C4AF12;
	Thu,  1 Oct 2026 07:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790839714;
	bh=IehjHGyeTB3qOxdnG2Qu4ujZGQukL04r22A8lNc2Xac=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XE2OPNhmTHMZ8DpR7JC2R1Qo19+qfYd+KyNC7BhrH8NEASAtQwPh6yI/L6TOZwLwJ
	 JU7RUZrclDwVHn+Zi80CIJ1NXXdH7cP1jkmJxyEb4S+3glRdR8Dgmt1rHIq7NKxWzo
	 LFJvSVmnNFt6Tnrt7mrT1Nf7wniI1KapQFM10v0pDKM2M1B/bni3JiQU7pkKm+usA6
	 l1vb1rczfWagN+eWaFYuhTIxqVSNKj2a2HM0ry2G91M379p/xiosCh5PGda/0Z0UtO
	 eWvNn3FQqENkpocKS49pKCHmpWvRJbvTy7L7OJ1wsJzciAPR3tG8H6TW+D8HW+KzRa
	 QeNHj109z3VMg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 313A2CA5FCE;
	Thu,  1 Oct 2026 07:28:34 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Thu, 01 Oct 2026 09:28:23 +0200
Subject: [PATCH v2 2/2] dt-bindings: hwmon: pmbus: mps,mpq8785: add
 #thermal-sensor-cells
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v2-2-07d368dcc662@free.fr>
References: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v2-0-07d368dcc662@free.fr>
In-Reply-To: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v2-0-07d368dcc662@free.fr>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Charles Hsu <ythsu0511@gmail.com>, 
 Eduardo Valentin <eduval@amazon.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790839710; l=1207;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=eUACogoOzN7KH0RZ64dJTRG0jM5WEIXL8p7BWtlD+1c=;
 b=P6Eevym8r4AST3C2BvKlz+p6AtnuCeFhPK+3u2/layzRDgXBvLUjdAh5V8ekmkFKTG+WI4W2m
 /nx+nYTxalVDKgh4fED7WVF5oTtxjpq7Wj8HEqJhGDoyVmAXhpI/kEt
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

Since commit
  3aa74796cfd0 ("hwmon: (pmbus) Register with thermal for PSC_TEMPERATURE")
the PMBus core calls devm_thermal_of_zone_register() for every
temperature input, so the devices of this binding can be referenced as
thermal sensors.

By code review, it should work for the MPQ and MPM device bindings.
They register a single page with PMBUS_HAVE_TEMP through
pmbus_do_probe(), it means that one device has one
temperature input, temp1.

The PMBus core registers the first temperature input as sensor 0, so no
cell is needed.

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


