Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD6D1F5EA
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 16:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777737953; cv=none; b=U976hMX3SNwv1G6Zqv0Wg4x80uvp3k0YbbhI51deRQY5Ks1krxP3AsG8QlxJK4J3rWTY5CC8H40SaqphlFWNw4hD5uhZaGQyAokxfus0M4ceC0g/oBpQV1hJzhfwzqsxo8utm8mqOG0iwSaALsCFLBZ+hVqPYCvPK9xPgefpmdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777737953; c=relaxed/simple;
	bh=A0O+AfYaXnVq6zwFu3qgCAKBc2o2KXAtW4ng6GO/oBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IbKmejue6wh2pDutHA/vrJpaKmyzgaEJTWyzdeqctisDAexEVNGcSEqiUV6U4+Y2IbqW3jAtv432HNGqMyYYOAweqM9bzMqjALZe4tf8Ze79JWm2Awmjf/BllWJ+ITaFo71SF4ZVJKbtO600lbNIeh2acsC6sKXD6xokipPD7bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=DL+s/Ous; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="DL+s/Ous"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777737943; x=1778342743;
	i=markus.stockhausen@gmx.de;
	bh=A0O+AfYaXnVq6zwFu3qgCAKBc2o2KXAtW4ng6GO/oBk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DL+s/OusQyHoztFYf6Da6eqvq/AzUUTs+JNfMEu7FbANq25uVJE8bfK7ueuhTokw
	 T1pITk2m3GDV5VTxeVrbV0OmxFFior7e8huSbi2zT/P8ARH9semUFjlfKuFJlcjMs
	 fUuQbd6Ev50lR6H2xdqhrZVBtojgPuaPEgiLMC/q+TdZd/2MXkKtkkh9Qd39fc91W
	 T6zAGcC0tdz7VwCZjSG6CtHOIssNP9wbP7mTJPFBRlBy8fy1NueXLJc3G1maxxygs
	 rsYU/0Mz4c3jXStp2zYPRZHTdq358/shGYy8uVne0p1fYWz348pe/JVmEC1NFT4A5
	 UsfNJSz+zlg/9B5mCw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbRfl-1vmd7W1gOP-00n1Ku; Sat, 02
 May 2026 18:05:43 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	wsa+renesas@sang-engineering.com,
	alkuor@gmail.com
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH v2 0/2] hwmon: (lm75) Fix AS6200 and config register handling
Date: Sat,  2 May 2026 18:05:31 +0200
Message-ID: <20260502160533.3527619-1-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:klsplxgKRtQSGhOBAt2NY1Sa8CLTdDqTlhkRYYzxPGNsvPPel5V
 R4bDc21wqdw+ON85zfuyjeVo/bLGPvgkSDfK6QIavBoL3qZqEMlYIgON/S+gxIhzVfjWpnS
 H43+Sa+oCPlQ7cAgNaOXFvDpfyYEI611kc2iGAJj9A8uNBhGLc4833huHNVK+ub6yMynxJ6
 /EGKjLQNF+3CVv9eCStXQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:38qlWFW8+fc=;QL35yEImFuf9e4rn3FSIIyYxAGw
 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
 S3ivKxsyU4djs74UfPYOmSSg==

This series fixes two issues in the LM75 driver.=20

1. The AMS AS6200 is not initialized as documented in the device-add-commi=
t.
2. The lm75_write_config() skips bits during initialization.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>

