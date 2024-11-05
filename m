Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7363118C938;
	Tue,  5 Nov 2024 13:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730814801; cv=none; b=A3HtekT+HM4u4a2KVcYHvnqqpfsUWCu2jiE01l0fMpzYKzqFRZC434zEGgNyJj//oRSnfTPoRnFhR8prJd6KlT/SlC8b/mM8ETJ5Cv4mqCOQX3L03S7IIcfPC+T2lyka/YugY1CxyOjr+3ptGlDPOEjpLMNxjg+7jNtEZ6eXa7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730814801; c=relaxed/simple;
	bh=xoNg+eIzxEtiIlEGndvr1nhq1j/wP8PdYBmy6bLK3pI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GIQ2PeATsk3uR6KbCJDgB/32e8zrE5ZN6scac4KKNblmgPXgY/fHMarrqZx1lW8Dj9UXTFSz/fub0pwwV4zPkYhI26SNy5NuypwMV1RKhbnwMtq2ynXh317oeSOXFT3xnkSioVaM0UeGLFITavHK7Mqj6Lvme+PznMZKSWujSY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=oAufRZPB; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="oAufRZPB"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 4ACEF88CF1;
	Tue,  5 Nov 2024 14:53:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730814797;
	bh=5CJT2Dmd1DEjDmnpLpEgnd/PONCNFSzoP0zzP2v0lJc=;
	h=From:To:Cc:Subject:Date:From;
	b=oAufRZPBq+kKftIpGDuJAZvC3Jp3ItPg45/R3KD8XElQSJ6w1OgsNSfifeHlzIuTd
	 gthW6ThDLWsgf6MeEphWq3bx/x/YQuhT/gK0lI9o7wX9anxu4DRa4YNafZYEuTlXCG
	 6oA4Qhh1+fGwhpWzjZpniDi2IaIoBfhc9LEX/LQSY3rv9A71d14lwx6UpQnnzm31eO
	 PV7bktEakHZtAMBS/RXrbPT7951RLuvcTezM19Yt8D79SD+7wnqcyVEO7p6F3PWrlr
	 8/W6aimZF4Ko5Xs9cyd8A/dyieHqUMe3DOOTJnGFe+3gCjuPPaBv97Hde8ekwyZk1T
	 n4nZYaZkihquA==
From: Marek Vasut <marex@denx.de>
To: linux-hwmon@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document start from dead stop properties
Date: Tue,  5 Nov 2024 14:52:15 +0100
Message-ID: <20241105135259.101126-1-marex@denx.de>
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
to spin up from a dead stop, and can be afterward throttled down to
lower PWM duty cycle. Introduce support for operating such fans which
need to start at higher PWM duty cycle first and can slow down next.

Document two new DT properties, "fan-dead-stop-start-percent" and
"fan-dead-stop-start-usec". The former describes the minimum percent
of fan RPM at which it will surely spin up from dead stop. This value
can be found in the fan datasheet and can be converted to PWM duty
cycle easily. The "fan-dead-stop-start-usec" describes the minimum
time in microseconds for which the fan has to be set to dead stop
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
 Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
index 4e5abf7580cc6..f1042471b5176 100644
--- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
@@ -31,6 +31,17 @@ properties:
       it must be self resetting edge interrupts.
     maxItems: 1
 
+  fan-dead-stop-start-percent:
+    description:
+      Minimum fan RPM in percent to start from dead stop.
+    minimum: 0
+    maximum: 100
+
+  fan-dead-stop-start-usec:
+    description:
+      Time to wait in microseconds after start from dead stop.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
   pulses-per-revolution:
     description:
       Define the number of pulses per fan revolution for each tachometer
-- 
2.45.2

