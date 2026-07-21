Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC6F446BF1
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 09:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627376; cv=none; b=UPWh/2lGLbrzYWPfpwrd3IYg0bevoFxAsVeMNJtxBCTsI4Rbp1cGR2zjK8SA0LcWQg9Z+yLuCpK1WXo5UoXegBUV4kEx0VbBhZvrJA5d4nDYukTqxB3LoR4uhIDFllZze6BoM58b02h8jVsU4jyHKoV+dJBBXmQeGE42Ol1USVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627376; c=relaxed/simple;
	bh=7P27P6ju6I4cnl3ul9wP1C3dtnMbhkQQdst2PiSJx64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XXvPkeapfpFoeKuMXVPcGZ4E1KerGlMeqyy895qeE3B573bB3ASt95hmgvmDj1UDYG+YL1MAP9CP2spTIBR4cfsiOLpbR1xZQoIHoqr1VIofUKEYx9l688J0TQ9ZzIKZJfjz7bt0KPZSEOSx0FvUzaoScODqm8a/CNtVbZWTP0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nHkbTD2y; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nHkbTD2y"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784627372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=To+PeiUG1xpdz90ubRrVLr6OYAbpZVaZf3etlt4FW6o=;
	b=nHkbTD2y4qxyLqzmCsPzQKVkVxQH8OooIcqvjSmfpd7sPykTdb2nkNPjavfMmP6oKqKOB5
	t5XdXzIdARhkRiVek8gW7rXFQ4RwYq/FkTbrrGsjQ29HNxSty84QhA25KfK8CYpNxYAKKN
	FUjrnEH8uP4yitH+skso+ks8vshMDrc=
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Tue, 21 Jul 2026 02:48:29 -0700
Subject: [PATCH v2 3/6] dt-bindings: hwmon: Add Sensylink CTF2301
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-ctl2301-v2-3-ef5fb342872a@linux.dev>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
In-Reply-To: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=7P27P6ju6I4cnl3ul9wP1C3dtnMbhkQQdst2PiSJx64=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnxDkW/LVOnezR3rU9KvbKyaqqC0b9PtUtOWe75IBnye
 79yQGVHRykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwESeKTL8r1zSvyLAcU53Ue1b
 CSFG7mgv5cMbvM0m9Ncb9lzfsPNqFMN/zxrbBedyxPlCH3NtfaHHNkd1gUVGnOPpwIPLJzSdVVN
 lAgA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-Migadu-Flow: FLOW_OUT

Add the Sensylink CTF2301 temperature sensor and fan controller to the
LM63 family binding. The chip follows the LM63 register model and can
provide a thermal cooling device when #cooling-cells is present.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 Documentation/devicetree/bindings/hwmon/national,lm63.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
index 92b0094ff303..4a1ffebfdbef 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
@@ -12,7 +12,8 @@ maintainers:
 description: |
   The LM63 family provides local and remote temperature monitoring together
   with fan speed monitoring and PWM fan control. Supported devices include
-  the National Semiconductor LM63, LM64 and LM96163.
+  the National Semiconductor LM63, LM64 and LM96163, and the Sensylink
+  CTF2301.
 
 allOf:
   - $ref: hwmon-common.yaml#
@@ -23,6 +24,7 @@ properties:
       - national,lm63
       - national,lm64
       - national,lm96163
+      - sensylink,ctf2301
 
   reg:
     maxItems: 1

-- 
2.55.0

