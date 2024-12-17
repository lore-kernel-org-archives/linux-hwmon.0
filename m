Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67E61E8836
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Dec 2024 12:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734436996; cv=none; b=g4bAFm29pg9KfeEUbn/PkRjqMFhHFaQX3eQiUkrw6QJkndTeUacbFXeoryjWOkZmdjndjIt/aiVQgm3uE+zsG3DQcnxllPijvdmeZpEzaC1WqnzNgypFOfuereIPLJU2Hxze3gtmwD+L2nAG+pKWc2zS4Swhyvgx9hKeRC0x5yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734436996; c=relaxed/simple;
	bh=N5cFFKSr/txK1TdI8TLl8Bd7Wl1ejCx9xqKSPAN/Tng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hTSh6dfg+1rsiZpmg3PfSBVv6DM1du7EKfmehWEkY3nF+2WnGSUGQeEiVsHojrjFyBZprwbXHBC8F5Nhet+Y9cmQ8z/VCAviHh0neqOe7rVyKutxwy5YIAnNgBEBf570hR8wUdZrTLiyclssf2ceXf4cI6VqOPaTmQjIrOQDItk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Yoo99FzL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Yoo99FzL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=yhfYE0+8K1mKqIuE4CrpXGvasbwUifyf63a/7MmfBfM=; b=Yoo99F
	zLJQbHmpeD7aRjJ65NuD0K531VvD2HQopE4/FM+ycBDA+eM7hsyhfhjtPszH6yOW
	m8PKk8JpCRITBUGggiH3SHuHw9v1dap8//vbZD7bH+UkaXtO0hZ1t8gvfEMNQWll
	UTIdDoosfZPDfnglcFecFX81egRaj5+47fAEaAkiLBA+T5pt+jCulVLY7ZYrqZqg
	K2SLmXJAJ83dpZQMiOgx20OoNUFGg8G7sbX6cZZeiWHShqvQA5H2NZUujPXhsobN
	8wfP1hBbCy5k1ssbPXM+fgH+XnxfeNOhPFhlKKVloEQmpXlXfzxA0/kC26FLkx0+
	aopl2xBybrlZKXkg==
Received: (qmail 4062922 invoked from network); 17 Dec 2024 13:03:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Dec 2024 13:03:09 +0100
X-UD-Smtp-Session: l3s3148p1@n9GlFHYpXuQgAwDPXwAQAA/MfjDm1Sk8
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: hwmon: lm75: Add NXP P3T1755 sensor
Date: Tue, 17 Dec 2024 13:03:05 +0100
Message-ID: <20241217120304.32950-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217120304.32950-4-wsa+renesas@sang-engineering.com>
References: <20241217120304.32950-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/devicetree/bindings/hwmon/lm75.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Documentation/devicetree/bindings/hwmon/lm75.yaml
index 29bd7460cc26..c38255243f57 100644
--- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
@@ -28,6 +28,7 @@ properties:
       - maxim,max31725
       - maxim,max31726
       - maxim,mcp980x
+      - nxp,p3t1755
       - nxp,pct2075
       - st,stds75
       - st,stlm75
-- 
2.45.2

