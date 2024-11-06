Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84397190054;
	Wed,  6 Nov 2024 02:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730859382; cv=none; b=jzaUEGDp9aRS4QfO1s4F4h25scS4JirHVKKfPFLKC6oj6TjlgzR+7zPy9YlcM2Uk1y+am24sUUMnYKbDTo3df37bqI3L7La5xXthIxaljTsQaJGfbGS6sQy7FDAOvmic0BtVhon5vfbMDFoc4WvrPqmUK90V7o0ukxFhbhV4XBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730859382; c=relaxed/simple;
	bh=JTO7SfbO0850l5lbXJAz/q94peujIR1IaErqA1wRbwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HMXtQsx/q63GEVn7m+BfIwvbS930/Ywd4DnYMuvL5h32i6sXW3dy4U/R6P2WromqZycyaeGM/+barutgxr7mjViYlMAck6tdG8kibkFFoQd+WswCZwQtmuLWUObim7mKLowt8ec4NP2suqnBPtwhE33uvaZvsdgWzIUEeFdZ59o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=MV6cWjzd; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="MV6cWjzd"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 64F6889035;
	Wed,  6 Nov 2024 03:16:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730859378;
	bh=h9X0O2Hzjg5kn4ifgOlahz90ng030Q2pBFCxaOMZxGk=;
	h=From:To:Cc:Subject:Date:From;
	b=MV6cWjzdUxtK23gyxZ2xJJBZIEyzmvy/1bWrqRQy1oMAqwoudMib7uBdc/tdEK1K9
	 MJvivU7vyOWnq+tV/fkUkVuTc3LhgU5dPyFyIGwx+blnHXHvv+zNOyPIZ+CB+4siz7
	 WjzXaoWeXaWfB7pGLfwNwCsdbJWTvTRcX6e3QDApDqed7MNw29b9Rjbiu80iqW+7SX
	 elUmr8V5MPLsPOEL0RZt2AXYOSPR0hWDZh+bl6DmmqNm0Qbp9Ohg3NMqUEAWCZn4LX
	 r5ZzVXL0eNCsaEMGXQIsLidNE93ekZqk1BSwWcvIVKAL5PvAAEMp4er5573oqRrr9f
	 QucPKgfmRjOBw==
From: Marek Vasut <marex@denx.de>
To: linux-hwmon@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: hwmon: pwm-fan: Document start from stopped state properties
Date: Wed,  6 Nov 2024 03:14:36 +0100
Message-ID: <20241106021559.175105-1-marex@denx.de>
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
---
 Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
index 4e5abf7580cc6..f4911e3fdb5b5 100644
--- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
@@ -31,6 +31,17 @@ properties:
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
+    $ref: /schemas/types.yaml#/definitions/uint32
+
   pulses-per-revolution:
     description:
       Define the number of pulses per fan revolution for each tachometer
-- 
2.45.2

