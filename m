Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D583ED3B4;
	Wed, 15 Jul 2026 09:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106561; cv=none; b=Cyv+JCLlJbdSsdRtTifO9vtjr/JcwT1pLFLWiUtUgIGpE+cceQ/yO8pLEvhRx6+8aagt77TeYjpJ7MwIES23ajJdLk1nwx6DFGd4EUQnbgnTfF+omNwzpQddvpSo24/4xjpJpZHOBeIZZpiPy80ZWpgJUMxVVTzCPi0Umg+fjKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106561; c=relaxed/simple;
	bh=Bn+mjHD2IEppmCcxLbMdGRfdadYeLoPUhKh/DKeDdwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qirsbsv+ZG94BFMwvnzoK40GJnEKJw08XpJVc8+7lHSPibRQ43B/TLnSWZJMacnT5bRVkkZxZQ9IWZV/Zd7/+tqBn6hwB2mO1jqV0j0PNGj2cHOooiYGp/6UGBkhjzzxCub72us2n+UOkpWsUR+xbkBpdhjWcheLoRCTeLmR9Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ceVY5GZq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ceVY5GZq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D3F4C2BCFA;
	Wed, 15 Jul 2026 09:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784106561;
	bh=Bn+mjHD2IEppmCcxLbMdGRfdadYeLoPUhKh/DKeDdwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ceVY5GZqGx8MDZ/acgyRwg6tFX1ECG5/ugt6JmFgv6OpVbTdYyIMG88gyVv5SG8oc
	 ubbObhv6woMPD1MmQQ/h+81MiG3EsHf0roeZcIGjC+XJW+d+7VVzXEmM5jaTjY2K08
	 MKK+wtlQXB+cUFT5MgoGQw8Wh2xgcpaewfOi9r/o7G3axCtjS0k4dV5sldSVMuj/1s
	 KoTWIuY1UBWJqBEoIwO8Pzylk3jmu1NF7PZBJAIqmt+8EZYM9bRV/KS+kzvIDFoWFt
	 30PJncysrt/+GAZW//E1fBYVCO8tCqBpsGmPhcR+JdUf9wG+4ngKNyWCI+yJnNGXPW
	 lRCDNL7M/Otow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39555C44501;
	Wed, 15 Jul 2026 09:09:21 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Date: Wed, 15 Jul 2026 17:08:35 +0800
Subject: [PATCH v2 1/4] dt-bindings: Add vendor prefix for Kandou
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-kb9002-upstream-v2-1-2fd390383da5@amd.com>
References: <20260715-kb9002-upstream-v2-0-2fd390383da5@amd.com>
In-Reply-To: <20260715-kb9002-upstream-v2-0-2fd390383da5@amd.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Chung <andy.chung@amd.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784106525; l=789;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=3lNslbOQdXYZMYDoyDnFtx7x1pZDPtfgEkyZivjTfbY=;
 b=2Pg94Hv0wcuG3PJvbfl+sOyQRS8zBNL21sZh3lgxOkNDo3aO112GH+P/tguYmZTA57XkiEqNc
 8sXVbJjs5HpAp+qp/kYPTdQnx3HqxduPP6jSXt9mTrabO1Qbhvlx34B
X-Developer-Key: i=Andy.Chung@amd.com; a=ed25519;
 pk=X2gaHRnhU2q5hvMjkC6xmIcC03vKNvHY9CQRdsj9ecM=
X-Endpoint-Received: by B4 Relay for Andy.Chung@amd.com/20260327 with
 auth_id=696
X-Original-From: Andy Chung <Andy.Chung@amd.com>
Reply-To: Andy.Chung@amd.com

From: Andy Chung <Andy.Chung@amd.com>

Kandou Bus, S.A. is the vendor of the KB9002 PCIe retimer.

Signed-off-by: Andy Chung <Andy.Chung@amd.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..727871970d97 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -879,6 +879,8 @@ patternProperties:
     description: JuTouch Technology Co., Ltd.
   "^kam,.*":
     description: Kamstrup A/S
+  "^kandou,.*":
+    description: Kandou Bus, S.A.
   "^karo,.*":
     description: Ka-Ro electronics GmbH
   "^keithkoep,.*":

-- 
2.34.1


