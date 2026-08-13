Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BB93E4C72;
	Thu, 13 Aug 2026 09:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786611914; cv=none; b=h/7/GjurRY1JWSjsMannSePWiZuVt2v/MtO3AfqqRlucRiIRNRBQ5VZyxRfdltJ0fsiAh69+D/fEgazhfPN+y8YTaVlX9BPJKrzCzre2n8f0DzJveun4HaaUrrzUZ00ZBHOfNuFMc+g5R0hUPU9AJ7WiB8aO6EVUcBaZdtew4rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786611914; c=relaxed/simple;
	bh=OoGw8i+WwL2gvgjlnT1mWOK+VD5Vr9o/9Eg6MClKit0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DNN+0gERVpkS6ZM5VQk3oGPPmaGPsAEUGDgLsKR92oUQs/PtlVxX1ktkN8fPpqJLfkthlCfV0/nPKiWJESWB2pY0bbTHV6stkbID+pg0f+NyHifIOoyoIcAyqnqEstcU5Qw5vfUtYNUBIb2irZLBBfyP8WZJeEDrI61AenNs+TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=DSJjDsrD; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="DSJjDsrD"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF67211A81C;
	Thu, 13 Aug 2026 11:05:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786611903; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=GEQachEo7ZduE/FB09ZoDcNTg9U7Po/QV8snFmxMEVw=;
	b=DSJjDsrDiE32sOeQlTBa0HvmZRwbg6gJaOrLtXjEC6wPQ6bSvVpiTCAuQGiFgIxkIM7WLF
	pXl003ZpmN/9T7hwFdLKSgfJRnLf7BzdpoKZPtdbalxP9kVgVw4eecXZDMpBpV/XD5GRke
	bl8Mh7c2okFtFKuKvTXQHOkwDT5qXEnaTCzLwwRn8enQydbH/H0r8RohbM/hIdy46I31jh
	iwYbBWy0o+4E7YeqBe5sAonNlHn+G//JGds2DoV1HiP2+/X8SsxPKKxcuyu7re8D4ahc/h
	8QDseXu24zymUChGrZect/T6YPZZZqOAr0LwxG8fMMlPqen0uf7UVVFYdLN70A==
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
Subject: [PATCH 1/2] dt-bindings: hwmon: tmp102: Document TMP113
Date: Thu, 13 Aug 2026 11:04:23 +0200
Message-ID: <20260813090456.70816-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The TMP113 temperature sensor part is register compatible with TMP102,
document it using a fallback compatible. Unlike TMP102 and TMP110, the
TMP113 does have additional unique ID registers, it is up to the driver
to handle those.

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
 Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
index f0dbe9f07b939..6bc10c73d2e2b 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/hwmon/ti,tmp102.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TMP102 and TMP110 temperature sensor
+title: TMP102, TMP110 and TMP113 temperature sensor
 
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
@@ -13,7 +13,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: ti,tmp110
+          - enum:
+              - ti,tmp110
+              - ti,tmp113
           - const: ti,tmp102
       - enum:
           - ti,tmp102
-- 
2.53.0

