Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6F47B3E1;
	Sat, 15 Nov 2025 06:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763189492; cv=none; b=dAGTTP2iR47iYbn++ATy7epNkvzm6OBoIPCKH7V09reUGnORlXXFY8rqUH8dL4zyE0dW9C/MlTD0lpUwouyQZBSUtlywXtVY6mL+8POL7Acyf5d7hg5iDRGUOlWwRii8AIhu7B/0oTQerVTexk6KSlJPWZnKEMCajGfqodLjtEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763189492; c=relaxed/simple;
	bh=jYbQ7o0KxICJbcxjzxdMBcwRk7D4INZnd7TgdDh9Z5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M2GQPcm2VrgBqJ/aTIIPlmpily32JlKJTaILZ9MusvbBqLpehqEKUBrN93byyGJd5XbiScs4DVgQDCqpQLLMKDnimGYKV8HeBuSvcAxZcJMXqZzuMzjMuGfDbX1PMGSHzlftdMEyff4amwMIFoonYqfXSxIEcrymhm9mfgUcPww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=S7Bsd1Wp; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="S7Bsd1Wp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:In-Reply-To:References:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=n/jAlABld68ENZLcMexUg87ks9Doqw4zXG+gu9ErXMA=; b=S7Bsd1WpoMJcCrjaPKl/eInG9A
	cLokeY3Tz/Flc+PECf12Ni68b3qv0M+lXvyAIWXOW0DYrf8InnDp/sWeMfhVsuN9Bf4zWWUPz5gf5
	1X9i4n0xmVqNrT0AwswPs8GcY3WJ5Uty80ovp7YbTQ7F+QtX6mcVXjPQxXsKJkFJjjTvxm+QIFBt5
	x3bMawn7ql5rFyxRdqVF/hWuMIjel7gOWdETBkxJw+vsVzFdv8YkmAASH3Wz2dKDK82O6c7CgPd+F
	YC6ZgHs/21fXM5vUfrbmPjk/44wH9wGAfzDyChPpU5i4McOHDpMx9MN/JdtQ/TBP8P/1j0BcA+mMC
	XlR9Irqg==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Sat, 15 Nov 2025 07:50:49 +0100
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add Fitipower
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251115-fp9931-submit-v3-1-92f5d0772b68@kemnade.info>
References: <20251115-fp9931-submit-v3-0-92f5d0772b68@kemnade.info>
In-Reply-To: <20251115-fp9931-submit-v3-0-92f5d0772b68@kemnade.info>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=882; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=jYbQ7o0KxICJbcxjzxdMBcwRk7D4INZnd7TgdDh9Z5I=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJkSSo+DBCaFnu1lNVxSumx/Rt3UmpaOGg43a1V5ve9W6
 +cvOf25o5SFQYyLQVZMkeWXtYLbJ5VnucFTI+xh5rAygQxh4OIUgInI7mJk+DpN7R+H8K6WKRv2
 +d2sNnzZFLfL49+qv2vusnIEPq2WEWJk2HZeQVc2euKXsNSFP3a/Y+X597/v1e3oMv6CGUrXp78
 IYgAA
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Add Fitipower Integrated Technology Inc. to the vendor prefixes.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1d1882009ba..80fbde5ac48f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -570,6 +570,8 @@ patternProperties:
     description: Foxconn Industrial Internet
   "^firefly,.*":
     description: Firefly
+  "^fitipower,.*":
+    description: Fitipower Integrated Technology Inc.
   "^flipkart,.*":
     description: Flipkart Inc.
   "^focaltech,.*":

-- 
2.47.3

