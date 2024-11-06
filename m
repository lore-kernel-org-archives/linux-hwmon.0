Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086D020897E;
	Wed,  6 Nov 2024 18:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730919589; cv=none; b=uFNEIqlTceowg5sWpW072CVgLcHsvRE0YGV0ky4YFw2q4jgZ3fpPIifpNbTIQLnfTtYH9aUyT1p9Bdl+8cydZ+M+CsvP+dJxtK9ZetK/hw0h2s6PYsN2uAVuZYl0TXam/M2SePDo4urVCFYgjPoN+8H9AP3sQ390HG1VYkvEjA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730919589; c=relaxed/simple;
	bh=A+h7+07q9cExSBsYBLYLyJ+4E1J04ZGB6tUH1ATbOUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r509Y5krqPH1Wc9sE9EcgO0CLSVg+XaBJca3CF03EZhNT8jUcsDK7xlYkWu8q67YSdTXVcMqYiPxNu+gKyAIgu4V0N8xB0oYLt7dV1sNrhBm6joJPgpmK4KGooL4ZQpp2eCdqpkWrFfNOPD+XMoRH1dOo3GSrwemM6yoGagMvlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=C6tzo1YW; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="C6tzo1YW"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6F66D88D56;
	Wed,  6 Nov 2024 19:59:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730919584;
	bh=C0pqE6Uarj3/X+8mgeqT1xuY1v7WQMo5Arx6rRH8H1c=;
	h=From:To:Cc:Subject:Date:From;
	b=C6tzo1YW0ajhcdd9YUt+AC80DEvY+g2L+UCyD6s4b6fsZYrOl2PeCqRXF/LjP7pYD
	 QjRvDB7PP4F1Emh1pVR36RstlLCTYkdifsvTQjaUfDvwbP686BVf5DHDcOUOInwYid
	 OK1aydkiNxxR82vVBTqGPCXNldkFOPKin7Pxf2oVPfl+1SShC9Iix8vlfJXwYRtOT6
	 YoZmlbUrDWbTTLgJEqrCg5P6038ywKbXmOxPR2vDZJ195k4euvp3lh5JX4xuQLcGBY
	 tdpI5Zap56j2PfmJcHGF4FF/eR2ai7NlaGUyt/uUXxUIf6bIR+21f1N3g7oHnoW1DD
	 X0YhFYRs35Nfg==
From: Marek Vasut <marex@denx.de>
To: linux-hwmon@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: hwmon: pwm-fan: Document start from stopped state properties
Date: Wed,  6 Nov 2024 19:59:04 +0100
Message-ID: <20241106185925.223736-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Delta AFC0612DB-F00 fan has to be set to at least 30% PWM duty cycle
to spin up from a stopped state, and can be afterward throttled down to
lower PWM duty cycle. Introduce support for operating such fans which
need to start at higher PWM duty cycle first and can slow down next.

Document two new DT properties, "fan-stop-to-start-percent" and
"fan-stop-to-start-usec". The former describes the minimum percent
of fan RPM at which it will surely spin up from stopped state. This
value can be found in the fan datasheet and can be converted to PWM
duty cycle easily. The "fan-stop-to-start-usec" describes the minimum
time in microseconds for which the fan has to be set to stopped state
start RPM for the fan to surely spin up.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
---
V2: - Rename fan-dead-stop-start-percent to fan-stop-to-start-percent
    - Rename fan-dead-stop-start-usec to fan-stop-to-start-us
V3: - Drop ref: /schemas/types.yaml#/definitions/uint32 from fan-stop-to-start-us
---
 Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
index 4e5abf7580cc6..8b4ed5ee962fb 100644
--- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
@@ -31,6 +31,16 @@ properties:
       it must be self resetting edge interrupts.
     maxItems: 1
 
+  fan-stop-to-start-percent:
+    description:
+      Minimum fan RPM in percent to start when stopped.
+    minimum: 0
+    maximum: 100
+
+  fan-stop-to-start-us:
+    description:
+      Time to wait in microseconds after start when stopped.
+
   pulses-per-revolution:
     description:
       Define the number of pulses per fan revolution for each tachometer
-- 
2.45.2

