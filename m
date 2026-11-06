Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976200;
	b=3LKLgLC0RPx80VDFmbXnpXiQm/DbZypZJ+42/CtDtyImzfsO5/GgiER3tnI4Nech533Z
	 tEQKd+/QePzQL57lh5N/ABxqbHa/Z9jDG+zrkqSmq0kRWAYMWLyJMVJOX++MNg7CZ6xms
	 5aSANXu5e3BrDDmIKYOJokLbKiYrPJkYX7K6gmQs7MMKJi5H7D94rBAhATm1aR8OXtCHK
	 vsGnKHZd1iCD/HfTKZNLpKkFbV13SBLwgeoUz4k17FHPFPY7Eqjk8EFsXuj3P8ork39Io
	 hTngcLmRuQoaAQdj2GStcC1chR6hPrkG92oVKaNehx4L0zm/PcePycSY8YdeI01N0vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976200;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=PIXvqTLthi+TW5QMnh9QGSkJaQvwP3Krn3zx1RpC6GA=;
	b=Ogz+b0fN0srnFDJwGAV2P9r8b3i14MZpcRQr/B7UHZuXfRXx8d2Tazm2SwfBtK+bV9is
	 4OFarifL/OLUWqX4B/x75ljvjLl9pOE4MVLHW1gk5bO2TpsfXViy42Q5nm6tcQDCyrWvq
	 jlb/nTPmH2YcCGzH+WMlWbOTBnAD8NWerghnOgZLVYPcnRqNjWau9Qr3AqRrSIAyNXQRP
	 N4xuc6wAgwiTqFwe53GHThj/H7lUnV4ZFLzeb1cTMu6Ar4m87LRCWaI1REZmRPAuC26Q3
	 yDjmgl9kxOn1JualRFpOh++SNq8ZXFiMBB3ry94NsPdzssj0k5tSWtIR2ETUl4OZCVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=MstbhqoV;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB738606D827
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Nov 2026 14:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB738606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=MstbhqoV
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jLhkD32KkzKnBt;
	Fri, 06 Nov 2026 15:43:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1793976196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PIXvqTLthi+TW5QMnh9QGSkJaQvwP3Krn3zx1RpC6GA=;
	b=MstbhqoV0BN1clSkxja/u4k7T8XoHsCJOcWGqNDPx0COXM4m+WZBndhKgnpM+BqbknEXEW
	gca6Js1m0dACk+KtCyVtP3mcjT/KdrQSTdDzD6lJXTeMVpXwvXYLv8El6Um7IXnR8UiGw6
	cglCqQbK2LEZVbsxXpIk1Cn8pTYk2CfNV/jPvbQe7+E19nz288QNGcc0n5xy5qLeupzTY+
	ewM06B/829hhpfL631JhWOpcH49pMVrip5QaI026RaWFotFhYIfOl4ryaN47ZDOvzS4yry
	J4gIZjc3xn8EH3NZkiKIp0KPBlzx0Zf0H3VYxol3lEjurD34CGfSrRqiEb6YSA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
From: Tomasz Bojanowski <tomasz@bojanowski.me>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Hamza Mahfooz <someguy@effective-light.com>
Subject: hwmon: (nct6683) in_from_reg() never applies the 32 mV scale
Date: Fri,  6 Nov 2026 15:42:47 +0100
Message-ID: <20261106144247.30507-1-tomasz@bojanowski.me>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jLhkD32KkzKnBt

Hi Guenter,

in_from_reg() uses a 32 mV LSB for the VCC, VSB, AVSB and VBAT
sources, but show_in_reg() (drivers/hwmon/nct6683.c:704 in
hwmon-next) passes it the monitor channel instead of the source:

  int index = sattr->index;
  int nr = sattr->nr;
  ...
  in_from_reg(data->in[index][nr], data->in_index[index])

Here index is the attribute (input, min, max) and nr the sensor
number, so the second argument should presumably be data->in_src[nr].
data->in_index[] holds monitor channel numbers (0-31), which never
match the 0x60-0x64 source codes, so all voltages are scaled by
16 mV. The code has been like this since the driver was added in
commit 41082d66bfd6 ("hwmon: Driver for NCT6683D").

On an MSI MAG B850M MORTAR WIFI (MS-7E61, customer ID 0x20d, EC
firmware build 03/10/25) the current 16 mV scaling gives plausible
values for these sources:

  in8   VCC    3.31 V
  in9   VSB    3.34 V
  in10  AVSB   3.34 V
  in12  VBAT   3.10 V

With the argument fixed, they would read about 6.6 V, 6.7 V, 6.7 V
and 6.2 V, so on this firmware the 32 mV scale does not apply.

What is the correct scale on the Intel and Mitac boards the driver
was written for? If it is 16 mV there as well, the 32 mV case could
be removed. Otherwise the argument could be fixed, with an exception
for the MSI customer IDs. Which would you prefer?

Separately: I have worked out the format of the fan curves in the EC
on these MSI boards. Each fan channel has a 7-point temperature/duty
curve, a bitmap selecting its temperature source, and a mode register
(duty cycle or RPM target). Would support for
pwmN_auto_point[1-7]_{temp,pwm} and pwmN_auto_channels_temp for
customer ID 0x20d be of interest, as a follow-up to Hamza's fan
control series?

Thanks,
Tomasz
