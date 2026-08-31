Received: from mta0.migadu.com (out-3.mta0.migadu.com [91.218.175.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21E1549377
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 13:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183985; cv=none; b=JzxnDvHOl7vhr71vo8PRIpOjEBgSOyXBrsBOz+fB3umcLnq+vzfTryIA4sxRfl9xJ+TgXGmBbomYx6+FgM5rRIL3oqBQ7k4v/4bM0XqUJs8khDLt7PEg39dgDzeCNnMTq6wuQimrm0Eg2hi7ViAH4iw+rQ+BuFRf6gx3wF9xetQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183985; c=relaxed/simple;
	bh=scBtiNDuToM2DtBv3G6lWHXNT3gA4Po3qt4MWXFmDe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O39Kq+pNw1XrrlxlIB5czsOcU6hh36bYjF2NKfAxEq//df4+BkTDJSF/tlpZaeEvv7R/769w32xnriorETabzevHs/qlfpnT3a1MhWBItUZ6+dhm5ygo8yVr9Cd8z9qKaCmzwjKQxVE61qcICNp4gisakNbT0d75FLRYVgVoUNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=URUqwe6x; arc=none smtp.client-ip=91.218.175.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="URUqwe6x"
X-Envelope-To: linux-hwmon@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=scBtiNDuToM2DtBv3G6lWHXNT3gA4Po3qt4MWXFmDe4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788183979; v=1; x=1788788779;
 b=URUqwe6x4gxi8rdjYpq6jwS9Veg9DbKLiyHLU5MiT79NJU7Lzjz4pyj755D79YxGi8BNdQ3W
 gjA+6XFfjZE1DCPUuP2NVjHLyLp8+dOVDebhBwoN5ReCAqiG/ykPShRSsIWvylYLYI/61u02WCs
 PIZGMqo6BLpY5xeo/2KbMhMM=
X-Envelope-To: linux-hwmon@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 2c159e777dd25be3;
	Mon, 31 Aug 2026 13:46:19 +0000
X-Mizu-Trace-ID: 2c159e777dd25be3
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Mon, 31 Aug 2026 21:45:35 +0800
Subject: [PATCH v4 1/6] dt-bindings: vendor-prefixes: Add Sensylink
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ctl2301-v4-1-b335d52a0570@linux.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=944;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=scBtiNDuToM2DtBv3G6lWHXNT3gA4Po3qt4MWXFmDe4=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlTW2der51/u3bLjp9vfNcWsbYUOs8uPJSgaF6qtfH1z
 pSLfqZ3OkpZGMS4GGTFFFm6H/BsK/CJsi0QKPSFmcPKBDKEgYtTACYS28jwP+TRgQ6eHBcL2w8N
 SqvfSLl+29dy8Ude9cZIoei3fF/2CjL8M9vl8rniTNTZnb+y2zy2uPQwd1pk5xV0fz347MGK/T2
 XWQE=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1

Add the vendor prefix for Sensylink Microelectronics.

Link: https://en.sensylink.com/
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..4a5cf436eb14 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1495,6 +1495,8 @@ patternProperties:
     description: Sensirion AG
   "^sensortek,.*":
     description: Sensortek Technology Corporation
+  "^sensylink,.*":
+    description: Sensylink Microelectronics Technology Co., Ltd.
   "^sercomm,.*":
     description: Sercomm (Suzhou) Corporation
   "^sff,.*":

-- 
2.55.0

