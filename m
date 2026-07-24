Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAEE29B781;
	Fri, 24 Jul 2026 04:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784868506; cv=none; b=mGEsKjIUe3Gx+nEs3heFBgS45afS8eF5M4amDI3f44xlnqeKzVKEiFHQGGWYSJ/0dqWT/nKrisE6WgVB36J5WNZ6XKaNTPQ7LNJtohyUWQBMPYGY2BJBPXxT5Ldd0uliQ5u77yUdXl2CyZfc0fGS3QC0VrfHbBl6jl06HzMfrUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784868506; c=relaxed/simple;
	bh=5+JhSO3lod5uW5SYQQlpIautAyctc/gyO6HhnlhirHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I9Jx3zrCQP3pdvqIaowMCVS9GoFNQ/lxNMGCBwRZeFRJUgYl10XpQjzbU4f0aXMaeyHlrlgXM+fCO0waVNXjQXVTuBmRaiqwSZQOlWFQbcQZUbkLnsytUdi5u2nuNmlfYToLl2SuyOxtl5gMf5kk8VxNdwwiFkxAp/lgRA3b+/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WZaX+Jzg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WZaX+Jzg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3E24C2BCF6;
	Fri, 24 Jul 2026 04:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784868506;
	bh=5+JhSO3lod5uW5SYQQlpIautAyctc/gyO6HhnlhirHU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WZaX+JzgkDGPxRIi96cRVEh3HtpsHwJv5X6yelS57v06vvfxNW+dXb6c0oXnp7yJE
	 F46Z8IScgYaxiXinkvZ3RcGeGDUxjzOeben7rMn6LCdlpQOerCAJa4qFGg5APKWoXP
	 wI0HdFx4tCbHsuuRihuk+aVZfxSryz4vXn1FDg9ODZ67aZp6ntV6VplkIILagB7hr5
	 PqPDku7d0MOttt1NPtbxAylfErHQpz0QMBqq1DCHJG//ilpELUjFuIQ+58K4s9Slqe
	 0Dp3pL2iT94Y9aKN0fmsLIaPhCtULbjASpCSLYwCOpM8JTH2h7updv/AJFyNObnuv5
	 bbLcvn3zvqmGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A1AC531C9;
	Fri, 24 Jul 2026 04:48:25 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Date: Fri, 24 Jul 2026 12:47:37 +0800
Subject: [PATCH v5 1/4] dt-bindings: Add vendor prefix for Kandou
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-kb9002-upstream-v5-1-9523c3ffe83a@amd.com>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
In-Reply-To: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Chung <andy.chung@amd.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784868474; l=775;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=q6TvzAvTe0szhLuDvDe9XDITXcBW5NjI89sOlniXt5M=;
 b=11G7/VUAkr34ZtgHlsoDDFb3idgC7ua5yzhFpeKzY2Huq5neZ63cBehfoZgKXIuzATU8AIsPz
 zbaXpf/WX/lCr+qunAyyLkb6LEhuc3N7McvpNQYUTsY8vFXT0nq4qtQ
X-Developer-Key: i=Andy.Chung@amd.com; a=ed25519;
 pk=X2gaHRnhU2q5hvMjkC6xmIcC03vKNvHY9CQRdsj9ecM=
X-Endpoint-Received: by B4 Relay for Andy.Chung@amd.com/20260327 with
 auth_id=696
X-Original-From: Andy Chung <Andy.Chung@amd.com>
Reply-To: Andy.Chung@amd.com

From: Andy Chung <Andy.Chung@amd.com>

Kandou AI is the vendor of the KB9002 PCIe retimer.

Signed-off-by: Andy Chung <Andy.Chung@amd.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..224b60686703 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -879,6 +879,8 @@ patternProperties:
     description: JuTouch Technology Co., Ltd.
   "^kam,.*":
     description: Kamstrup A/S
+  "^kandou,.*":
+    description: Kandou AI
   "^karo,.*":
     description: Ka-Ro electronics GmbH
   "^keithkoep,.*":

-- 
2.34.1


