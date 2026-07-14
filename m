Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201DA3FA5FC;
	Tue, 14 Jul 2026 08:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017273; cv=none; b=U8fE540jyCqTKh3VoliwDA5cBCPPbuvfwxA4SX+OwH+Jsu0NLs5DtH+HFhOmKmEIkq4mG69Wmvv6OoSVJ0JEzqsUrtU074aAJF0HFImrN8eI+/EcIij9SekB2mS3ZWM81pf/M79jfLZNZo0qeTL0KCO1NiWV9K7Gm6Wr4g6PhLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017273; c=relaxed/simple;
	bh=Bn+mjHD2IEppmCcxLbMdGRfdadYeLoPUhKh/DKeDdwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qvjTuJLjm5upMQijWEZ74YOXLVpGFx6TQL3RByTSwqJbk8u+Oo1nbzPTEEPNrdgEYw4WCKo/ClB2wLExlPfYWGsJSkpAh6mHsGCVeMXeyDPc3YZI2Y07OpHwVolFUhUQBJwZURLxfwev327GhoeJnpj1oCn1gjFiXg0TSos/lc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IhJd0FKM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IhJd0FKM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B463C2BCB9;
	Tue, 14 Jul 2026 08:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784017271;
	bh=Bn+mjHD2IEppmCcxLbMdGRfdadYeLoPUhKh/DKeDdwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IhJd0FKM3FL/B+CbLNplQdswpf0SyBf127ByKKMShgIg92hk0sSBBI82VZdMPQqCN
	 J4s8Z1t/6RM8/r9/AErUYHF8p+mRzjJuhkO+Okl5OrrU8+IT06x3pvNm0OWbqhep2f
	 qc4Qkx87jo5ZM8cSQRqqvPEUPuVUfbwJ5cJqFDxR6EcKhXCjGPO2Wzwfr7EZY0Z8Vu
	 QZpDB+G66PNQSaoUvQdomxbydOPJQjk2/qnm2FAF1zXI4QXwIIuHMyFMuyPypUHsQ9
	 FTHUYQxl9CaYad0L7GyfhBHahiHy9GdDjiQ0TTO9DUSISI3PNirZ2c8zSpkBFJdf7+
	 TZUbXyJfj+6zw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3F4C44507;
	Tue, 14 Jul 2026 08:21:11 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Date: Tue, 14 Jul 2026 16:19:32 +0800
Subject: [PATCH 1/4] dt-bindings: Add vendor prefix for Kandou
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-kb9002-upstream-v1-1-8fd2f0b135d8@amd.com>
References: <20260714-kb9002-upstream-v1-0-8fd2f0b135d8@amd.com>
In-Reply-To: <20260714-kb9002-upstream-v1-0-8fd2f0b135d8@amd.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Chung <andy.chung@amd.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784017234; l=789;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=3lNslbOQdXYZMYDoyDnFtx7x1pZDPtfgEkyZivjTfbY=;
 b=DAYkBBYEDXnUK2/4byzLT1GlXs00Btu812tTfAxJa+4Ximd6TRRy44i+u2B75SMEkL9y3s0Hj
 KPZwTibzPuZCtD3lroDFhfIUrFWmcYeJYLAg75MyrN6HSBzh4enLfAP
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


