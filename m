Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE89938758B;
	Sat,  2 May 2026 19:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777748662; cv=none; b=G3Ek+QL/ZelUlgLwmPq+86FGb0b8EQrFRXekh8rexcN9ni0TUxPR89zXfQar+gIkXmnoN70RgQJ7IUjRIW1j5Bgq5OhJbu96EbFJDc3MF7pROboOha/xd/3bLuYRLqciAtRXyXBbBJRH2fd5QF56NzFiIAj1toTadY4pV3oZNnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777748662; c=relaxed/simple;
	bh=Zuw1y+XK0Y+ckAYeITz31T9MIPPRI0wiOk5RT/5LNOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XPlgsuh/JsaNw5h65zLpTIL3dQ3CFjhZoHs/RDEuHjtdiqqKXrUltkUzY79QK6tjxuYOUXl3/MpLV6UIbkFdDnz/SaIorHQR5ZhLeuQl5/jNnXEmw/bSmV+c/58RzYYcwuWQMVC+pyaxFxUlYJfDzLT5Kv26xBG0TgUsSPWE18g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=tJu2qBVq; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="tJu2qBVq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777748659; x=1778353459;
	i=markus.stockhausen@gmx.de;
	bh=Zuw1y+XK0Y+ckAYeITz31T9MIPPRI0wiOk5RT/5LNOM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tJu2qBVqO9gcLA/RWSHZUnvzwn9iCKS2zlrMcvvcAGJgy9oYzzdHd6otB4v0tDLb
	 eDHX0ZXv56eEa93S4uLrxtL1q0ZkKzK2Z4ROEk1vSVy9sNg/eZqhDiWpAsy6aNoOL
	 +okjbdY9gOzN17+iP7JCmRjJktTrPfEVLoocJU/g3PgFwbLQ9IKSmGDA1JYfmiCwY
	 CnwdvLqkJo2BjLAslGrCXFXXy3fTDHdLL0Dmht2JzsTbqru6vIR1ovlfPj67ZgIHx
	 nRC+fgeCRC1BfK+6bWf8hOtdiVJ+GiBqfCn5GkQFJZHNiUbX4vfOJ1n2c9YQHwH9M
	 clq86eSbQMlU7PpopA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpDJX-1vXrWH3svn-00aQB7; Sat, 02
 May 2026 21:04:19 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH v2 0/2] Support active-high alert polarity for LM75
Date: Sat,  2 May 2026 21:04:06 +0200
Message-ID: <20260502190408.3577731-1-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:a0wdPPArZ+BnhgPApxtbkAxsfjApU1Hrz3MfLc/sX0cGePL5Pg6
 Cn6QIrMW7+kVZm0rUv9CZHpbXM0KFaHqbYHv4Mvi46raSSMc4dTdn7M74jYNxpkSMnHeEGP
 yF3xDHb1SAGMSbCEijMXB4cdKH4XEBr8TGD8Jb1SpQC/9N8ayZ4mYFetLfodvFbr0P8hVhz
 KMt2HITlki6uYRJTFe5Yg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:poqgwcpI3f0=;CbXx/3bT5AfhJfqIcnxEqSgfcS3
 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
 3tsXbDv4DWK4nCL8qdamF6BiSySV4sfCQQyI=

The LM75 configuration register allows to switch the alert polarity.
In default mode the alert output pin is active-low. There are hardware
designs that use this alert output for an hardware assisted automatic
fan speed control. E.g. the D-Link DGS-1250 implements

- temperature below Tmax threshold -> alert pin low -> fan slow speed
- temperature above Tmax threshold -> alert pin high -> fan high speed

Provide a devicetree configuration option and a driver enhancement to
support these hardware designs.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>

---

Changes in v2
- Carve out AS6200 polarity fix into separate series
- Rename devicetree prefix from lm75 to ti

