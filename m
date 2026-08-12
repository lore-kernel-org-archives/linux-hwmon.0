Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C993345CC0;
	Wed, 12 Aug 2026 19:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786561839; cv=none; b=l4qSAlS46DbwDtdutDMoE9c6POf6wZjyziAjJOcbBk4ZolmZoRFPm1L98R/X7Upp4IMcwXK+nn/K0ENobaAYPcd6xpjb2tQbMWKk3sdfwaP92bo3YCxdsH+tkKXMopDHzeZeeAPxQWNr8pbzsPaPQvhXwNWDIhg40Kxnjzag/SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786561839; c=relaxed/simple;
	bh=rSCou8NH9VLcR0MF4sIBWh7qoFxKcf1htaP1G66cA6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m15lul3rMhPEBO6bgC0n/znJgXmds8tq1rb6+UuouVb2HsB+99bY5vFyKzesCkIAl3DU3BVmRJV7AVG/IGfS+tXHOT9wswWiIRtbndivjll/A2aSaXS7d1B7hHoprLQKfh3lc2OA9EqpGmpP0u/zhQtnzBMCTXjt02uWRW2/294=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=jemnTuDX; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="jemnTuDX"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B07B611BDD5;
	Wed, 12 Aug 2026 21:10:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786561831; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=3GkE953iVOQ0yb+2rt2C7WyK8bpUX4ZBAxUpH/lRf/s=;
	b=jemnTuDXOcwk4CB92SrUeMsosd2O7JXsfDvpcrGnBIqpDK3RL+vS9j/qs89CkY3dNXwLcY
	0N+hzOOY0/xozMbJFZF614eByZjAvBzQV/n2PkQATz3rGzdiXhAr2v6EPBkABsOMPDgyaL
	DjmWWGUBr+t27sIp3VItDhLzkMly2hbkoh/1N8AYSmnYRg8rXDvxPpoTx48XR0rgQcE774
	orsPHVkkN0SzP2lV67fGJ+wPtbKO2zJlCfMopUUBXavA/xtJsDB3mPTHVxDHwhC9sMcAIW
	twoLnPyNztwEvw8GWyP4Anagg2kWIbkmcDiShcYTglIUZXube6As2v1Z7ihsoA==
From: Marek Vasut <marex@nabladev.com>
To: linux-hwmon@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (tmp102) Add TMP110 device ID
Date: Wed, 12 Aug 2026 21:09:45 +0200
Message-ID: <20260812191021.65304-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812191021.65304-1-marex@nabladev.com>
References: <20260812191021.65304-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The TMP110 is register compatible with TMP102, add non-DT I2C device ID.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/hwmon/tmp102.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 95fb912a1f7ed..26c461e95175b 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -396,6 +396,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(tmp102_dev_pm_ops, tmp102_suspend, tmp102_resume
 
 static const struct i2c_device_id tmp102_id[] = {
 	{ .name = "tmp102" },
+	{ .name = "tmp110" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tmp102_id);
-- 
2.53.0

