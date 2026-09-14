Received: from mta0.migadu.com (out-10.mta0.migadu.com [91.218.175.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367783F54C5
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 08:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373068; cv=none; b=aFYiRUQBmhSdK+E8kH5HKcIGjB4rFBmiWLk5OURByw5cc9hFryVt5o0ywM/pbf6axI47B6mclrIRWGSz4S8y69GRrntlsFVLGBlR5BjpwFJf1VNkK0kMw72HSHfChK6vl2JxJbTGDGYmcAzFugpEp7zb9evMuwFWapnBnUpB388=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373068; c=relaxed/simple;
	bh=E5xt/1mOElwOhR1ufBKAZ0sBz0+eynAA6ExNACTFvPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AZ+YoycEjOcEb2syoE+iM5R/yAWGtdby8h2XBHx/XPa6NW88YrCwk8jTWq+BqEkikrIOV561mnDNIoG4mBwq5lUczx/l6T45Mdf0br/m63VheemGfMHOfQ6wE+8PLMCtfqkjBwSfnZD2BhETDKKmBaQEJk8YwSk5uOa1vLJJIk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Pk2rJ8I4; arc=none smtp.client-ip=91.218.175.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Pk2rJ8I4"
X-Envelope-To: linux-hwmon@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=E5xt/1mOElwOhR1ufBKAZ0sBz0+eynAA6ExNACTFvPs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789373063; v=1; x=1789977863;
 b=Pk2rJ8I48ERt2viIW8/n26C3RkzChGbFec8zdIvHuhk2urtI4WD+irv98KciQ5p3ILmhvEAS
 LkguAUsN2g8mRtZV60wQrBGDe7wg8b6g3e7eUvcnskrSsheiRcXqYLzDLb2tpvgId83bENKXn/8
 ieiG9aLQ+m03N/tlPXBNcq1Q=
X-Envelope-To: linux-hwmon@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 861199b7fb9f0c8e;
	Mon, 14 Sep 2026 08:04:23 +0000
X-Mizu-Trace-ID: 861199b7fb9f0c8e
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Mon, 14 Sep 2026 16:03:53 +0800
Subject: [PATCH v5 1/6] dt-bindings: vendor-prefixes: Add Sensylink
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ctl2301-v5-1-b44b81cd2c3c@linux.dev>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
In-Reply-To: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=E5xt/1mOElwOhR1ufBKAZ0sBz0+eynAA6ExNACTFvPs=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnLV+Vtvpm+brVcimA1G5vYJJH3m78FWVrq+5kdWD6j4
 nDuu9mPO0pZGMS4GGTFFFm6H/BsK/CJsi0QKPSFmcPKBDKEgYtTACYyyZHhf+y/377MXjxXuNYl
 3H2vZHI3zqBLW5olfcdjoU8e4pv/nWX4Z1+d46JxfvvCqxvbWR+KFlYFV0yU32jdbSXQt+OPn9w
 JVgA=
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
index ba20029693734..4a5cf436eb143 100644
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

