Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E081366049;
	Wed, 12 Aug 2026 19:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786562186; cv=none; b=k+ZWPeQ01WE5v2Rs+MNbYzQgKVQa+hE6AnCJIZ4AVluWVcD2aX9Iz+6o73NCrnO/41FKGAi9wvL1VyFLLSOqO6rZN/KK5T7MYyQINJT9hv1NvTn916+J1hNXYcqDx+OInQI39bbXNA/H5oau/ZNF2bSfZOMp7jdqhMsrKndUlME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786562186; c=relaxed/simple;
	bh=KlIwDRS5hRSSpwRJwAawDjqXwbWcNP0sM/xicFNBMfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XirsYYkbMTIsE1eXWvV7sZcJNDZkSlvf5FSiUyxizFvdGpxc0i8uMQXRLA5g1hx7c4f881t/qCYaInAcJeBrNeuNDBsxx5jq+nIgBqx2rslU2NAgfz8BjdUBdjVbXFJPjzj7l/dl3PgD7tikcBkM3vFHxnHA7QhhFM7Dam6Tb5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=iGJbaT4F; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="iGJbaT4F"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6207611B89B;
	Wed, 12 Aug 2026 21:10:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786561826; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Xw6BXxHLzXrNZEEI+KrklfgMSK5+e16+iNCzSSFFR78=;
	b=iGJbaT4FrzQQPrhrhc1ON4RlLRMfS4QqX0ht5+IOh6NcRZSEiP/tq+B39283QHFjP/Aars
	mUbV5kW23XGRtkkhk1R8MMoxtP6wgKE16xWPNxf/dUCeL3hM7I16w0y3rYotibepVWCWg0
	nLN+v/jHbSmuVWQU8hcbhGeiv43DD/TyjY53ryVbcnhtoBPpseV4avSLsGleRlWCQspbzU
	13/YdDpVoJl2TvAsVTesosZPa6BmfWJ3WM5A3crLFtFQo6HfS9j1pj/7fNwCgRPaLnWhHc
	cmWYbzmOrLBKHuznZzy3Xe2SxAnLH39bWc3BjGV+O8u/gWKTWbYsEB+t0yh+gw==
From: Marek Vasut <marex@nabladev.com>
To: linux-hwmon@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: hwmon: tmp102: Document TMP110
Date: Wed, 12 Aug 2026 21:09:44 +0200
Message-ID: <20260812191021.65304-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The TMP110 is register compatible with TMP102, document it using
a fallback compatible.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 .../devicetree/bindings/hwmon/ti,tmp102.yaml         | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
index 96b2e4969f78a..f0dbe9f07b939 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
@@ -4,15 +4,19 @@
 $id: http://devicetree.org/schemas/hwmon/ti,tmp102.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TMP102 temperature sensor
+title: TMP102 and TMP110 temperature sensor
 
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 properties:
   compatible:
-    enum:
-      - ti,tmp102
+    oneOf:
+      - items:
+          - const: ti,tmp110
+          - const: ti,tmp102
+      - enum:
+          - ti,tmp102
 
   interrupts:
     maxItems: 1
@@ -28,7 +32,7 @@ properties:
     const: 1
 
   vcc-supply:
-    description: Power supply for tmp102
+    description: Power supply for the sensor
 
 required:
   - compatible
-- 
2.53.0

