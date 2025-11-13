Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B882D73B4;
	Thu, 13 Nov 2025 23:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763075473; cv=none; b=X1fMcaaiPuPBqsJV8OBQVhlfPlvYd1rRThi4XqgqadbOV7sPo5XJL0AEG9xF26QD9zMCTsXdYLwibqsP0B0S2cPzu2CxLNxbNJ3TD8vsCbtth1UQVNgEYJnyTTT/5LwxoZCRa1Gkwg0ighhC4t3Fyocs1LDVZHtVYU/19+9ZgoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763075473; c=relaxed/simple;
	bh=ESJOVsvQMV+Nlbwka+JA47fsy0mxjuf5UFlf+q4arIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X3mFr5ffPqCt8f9+BVkfEMcusG5Q3LLMmV+PKMAuQ+ZUYeVtZWoYLi7EgX5s/M1fTWVkFQV98xS6vdlRF+mFkhv35UIkgffX3MOaR/O+hnF2eqIxeLSZjMpCB20SJQQQG6mDcGIa9Zp6oW8o/defQVVWo1IiefJDkjW5y1SGqi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=IRBjYX2s; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="IRBjYX2s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:In-Reply-To:References:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=H3aN2Oz9OTCWDSvMMZ8cu+gOgAg+yIuIQU/GOb23lKk=; b=IRBjYX2seZiJs6O12rYz+gcefU
	frcj2C4x3j73W9HhqEefjxmwNpzrNkfbzSr1qSF2s7tkpQq4zoWIhL7xwH0CffTCVqwBiXK6QZDtv
	2FY1N0VHSDq/bEdvXloR0A0TxXN4rRY7jpoGtoWzQMunFx9fWkiQZxGLW0+3hYk5rpI9dYv9ci6BS
	8VjQ0e9BH8mgjOJ+X09z9/ilnz21XuPVY17PEyKxCq59//AD69K01IS+CWxz5oQtYvma0aTO0Kwzf
	knbMHVV2zJYeU+opaHtYzFHXr2vJ8zr3en3Cm8x7TDxHPmDO6WEufQ0HPVo5O3uTr3vViLzs5+xra
	pHVIl4iQ==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Fri, 14 Nov 2025 00:06:41 +0100
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Fitipower
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-fp9931-submit-v2-1-cd6998932c4c@kemnade.info>
References: <20251114-fp9931-submit-v2-0-cd6998932c4c@kemnade.info>
In-Reply-To: <20251114-fp9931-submit-v2-0-cd6998932c4c@kemnade.info>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=818; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=ESJOVsvQMV+Nlbwka+JA47fsy0mxjuf5UFlf+q4arIU=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJliKWd3fUg3nzjTxXCv+fYqSUcRm4Qpt+NWNXs9PFbUy
 fDM8uX8jlIWBjEuBlkxRZZf1gpun1Se5QZPjbCHmcPKBDKEgYtTACai2crIsGuj/+ftMqaubC6i
 fT4SvIe0j67Nit7+2XWimuKiF5tulzH8z322Zu72/MKIb2qBiUoHbr16zve0KPW6zqS69GD9GRK
 NzAA=
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Add Fitipower Integrated Technology Inc. to the vendor prefixes.

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

