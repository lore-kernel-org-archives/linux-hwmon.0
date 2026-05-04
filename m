Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049B53AC0CD;
	Mon,  4 May 2026 15:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777907451; cv=none; b=fnLWIm4pbl9s3Bu/u8WPuVQSH3KbnXG7taQ7Tmr8yHsIyoNDZv2kFnAiHoVxZumHMksU0fxuxrNbkXQa75afA2xiOtS/sKxK/5opAF8PTlSxzyKWNenx9cG3bJXueUxmB6UQHiqCedRpcJsImc02qWE03wmSZ53XL8j569woBO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777907451; c=relaxed/simple;
	bh=oTH215Y27kkMLfyk0gWsCjzg9N5bmZwvxAMfhSn0qKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MPlImuaIIhvUfia/5n6vHyw56dEc2z1Fn0M8oTUueYJMMCLy7WaO9YC5PFo7RlLQr/lBLueYdLzMV0MNP3waeAM46WLB6qnGjuZYbGTlW22+G3Li3XY9LhBHEFCgOO69MtW+YWUXpsgUdo7Sw3B5cRIyDrYbRFVUjiGtmF78B2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=RdGdeXHG; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="RdGdeXHG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777907430; x=1778512230;
	i=markus.stockhausen@gmx.de;
	bh=KB0RSTHw0nFm/PBSyCv8CmVsDZZJTFFLPokobkwXy1Y=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RdGdeXHGO6sdw7aVrFchbzEng+/5/brG8waI2RdzV2Inpzghh15PCiQo/iQ3OhzN
	 5lmgTM0qcCLRidJs3jkhj7kAesGdbmlgdSdVoPxOlmejOolW17H9pahv53l8ZKT5l
	 w7fXiQDYuQ1RkCI0yasj/SUQSnVTt4PCPC1UkBaDyWUJkrR7Y78HKlRR+Q2wdJ/QR
	 MLFOd0eijfk3JDCQjcCBRji4s0ofZmJZJzeTVAHVmoU86CKkdsKJgBzVJABXyRXXx
	 3m5KXJofKWvXtfu5qIr8tyA8uUw/9EdGCstfWmRq7xdbTKlAmJ68RiCEHK9om04Qe
	 K34Ss9a/s3WdQm/6Wg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfHEJ-1venV71o3X-00kOqY; Mon, 04
 May 2026 17:10:30 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH v3 0/2] Support active-high alert polarity for LM75
Date: Mon,  4 May 2026 17:10:18 +0200
Message-ID: <20260504151020.462342-1-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YQQfhizPS/Y9R5+USevjBWLfvREaiexz6i/50+glyuf825BtcDn
 ADeVR1U+Ab6x8+fx0RQMkrtdAPTesaLAHuGIAr4E/MK96Pcj4s0v0g1Ek74UXXhLvK7ZHku
 5vu/02twYfbM6sH4gLvlEtm7e/+zPU1fR+d2rrgCnvjnRxL1ZoGU5072nWBPmfJntrPY8rv
 7q6hzRRWcACwmYJSd1S1w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2hspoE7Jj9s=;t2T3FCO/WN4ilvxBQP9zQ75lt+7
 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
 HFoURB7sroKSVNA==

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

Changes in v3
- Add Acked-by from Conor Dooley for devicetree commit
- Use device_property_read_bool()
- Match documentation and always overwrite clr_mask during setup
  to enforce default polarity active-low

Changes in v2
- Carve out AS6200 polarity fix into separate series
- Rename devicetree prefix from lm75 to ti

