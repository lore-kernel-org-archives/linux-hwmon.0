Received: from mta0.migadu.com (out-17.mta0.migadu.com [91.218.175.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC884A6CFD
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 13:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183995; cv=none; b=LV+7FKG1Ice/MCIrXzyaE4xdH60Nh8jlgSGgJu0t8FnuJL8guPG71m9kVQpi9rv6yXAGBCMBC8tmWuEvdPSQJzaGw2SDBFBmPHFn3jfs2MeEoCX2J2dmH7HL/eKsiObAsfPs3t2Cf3gN6K9uJlHxgBDLfC1PBTx9GVHWEUDsSa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183995; c=relaxed/simple;
	bh=yRqRgPijYmsIK6SmmV9Po0rmE7qecT+mk2IoaUzPjf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ei8peS/67x7HBpk8M8D+6XC0JuWp2vN2L44Ikn3PL8AR7aAnsAH0W/Y6NeTO4+xH6cRLoipVu9QlsiiY9qNdByFlGYAzKhflqgeyQFNJWkSXCJX6PeqOfGsAmjt0FTYQJbpCTASZyYCrhxRApZaGHxOBXSsXBvbSA+AbzaMsLlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ua0vX6oT; arc=none smtp.client-ip=91.218.175.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ua0vX6oT"
X-Envelope-To: linux-hwmon@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yRqRgPijYmsIK6SmmV9Po0rmE7qecT+mk2IoaUzPjf0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788183989; v=1; x=1788788789;
 b=ua0vX6oTRJNXlU4bAIU6ToM90lu0GuSnRtz2vUDdAvKflKt7cV5WM3y1pcBBRNaRoz/0Nf9g
 AWv0r3ER4d5MHzmaqZKqu2KNpPTt5IAhVKvq5FQguEfyV17OwY2MLZ+FLDbFdIaILWwq1DelLH7
 uM5NQ3J0e//qDnKakJkbud4M=
X-Envelope-To: linux-hwmon@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id d6effb9741c8df24;
	Mon, 31 Aug 2026 13:46:28 +0000
X-Mizu-Trace-ID: d6effb9741c8df24
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Mon, 31 Aug 2026 21:45:37 +0800
Subject: [PATCH v4 3/6] dt-bindings: hwmon: Add Sensylink CTF2301
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ctl2301-v4-3-b335d52a0570@linux.dev>
References: <20260831-ctl2301-v4-0-b335d52a0570@linux.dev>
In-Reply-To: <20260831-ctl2301-v4-0-b335d52a0570@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1684;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=yRqRgPijYmsIK6SmmV9Po0rmE7qecT+mk2IoaUzPjf0=;
 b=kA0DAAoWmAnvgPkzNC8ByyZiAGqVhZyj4hHW3Ytd5gXevNKC/we1F2ZEmdDs/j53zZmht8RD4
 Ih1BAAWCgAdFiEEi+AMtnBMWj1wEHFNmAnvgPkzNC8FAmqVhZwACgkQmAnvgPkzNC/e0gEA3YMM
 ZPqTO+6Ykw8I0GX13qF7QDbWzfwVX5ZBdsrgDmMBAKX0Vo48wN2iNivLubwYrFE7mwsDTXYPj2a
 kqUgr20wH
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1

Add the Sensylink CTF2301 temperature sensor and fan controller to the
LM63 family binding. The chip follows the LM63 register model and can
provide a thermal cooling device when #cooling-cells is present.

Do not provide a national,lm63 fallback because the CTF2301 is not fully
compatible with LM63. It uses different conversion-rate encodings,
extended local-temperature registers, additional fan lookup table
entries, and device-specific PWM and ALERT/TACH configuration. An older
LM63 driver would therefore not operate the device correctly.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 Documentation/devicetree/bindings/hwmon/national,lm63.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
index f2e0993cfbef..4c8d0a15fbd1 100644
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

