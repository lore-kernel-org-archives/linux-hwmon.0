Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793260090;
	b=zaxRXBmU2ABlfMgu89PyMuzF1jMqHOqFQG5mxatDFEAOLE/+anb1NgGraA7k35tkaBHQ
	 7++4bG03SsqGQPhX5K0Slhpb5zG3zeO8gTmUQe7Om0MnvxGpEVGumJUlvKhD7t3C0k2gZ
	 w/gy9YAr00UtMBkEJPoOJQBEn7eBOJqETrfD5FJ5iqO8cDiRmZFBbW7A9fYgyLva2JC5I
	 4CBKamm0Wgr4cLdvUJbYKDFxJlgm7uoOUcF890AsvdH6EJY8oMpatMPg2EmDqfiM79B4C
	 ym8bReg+8oVAiBtlHZ23iC3yskUiuBB2foS+k1th2Zc22B7tN6eNyhYFnA38LVTPJcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260090;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=Gbqjw6eFej6Wu2u2kOXe8fh2VRzTDqvSXr/mW0V0w/c=;
	b=HUn+T0hABAxJgjqepaU4j/9MHwwCAd3ALFt+oHExeOQwxzTVhJJksPoG3JSdm2YgLNoJ
	 t6SiJ0ZAhVyMbU+Wv1UKhEldjVbf9UPL2uTOwtf1TY3LlCMmCrQSq8JWZCt0YDTNiABRr
	 2dFMDCdNMvJp/y3b1D84goq3Fl0Vp34fHqtMR5AyGYwwXwVcxbyXbPWgYOHg9j4gjre1B
	 IuujSIWRaiDE5VwSve2pN5ZWudWqsWmwgxCR74Mz1wbDQ0DYIFNr0LHLXRFZky+5q4jIj
	 Y0F4JAJ500ETRiUBA79ak361Ol/pQVqNDCroESgjta+0bkEIhF4VL0P3spjEtBvdjSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UPXvyEM5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764EC606A31F;
	Thu, 29 Oct 2026 07:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UPXvyEM5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793260089;
	b=K595Bzl6eODethQ7eB/ZWRTbd2u7DM837FwgP8Iktfjxppdu4pd4Zm/+G4L60ClgGK1/
	 QlCsj5OnwRe5Er+o2b+cazWJiCIYBKCENzhYBewfAgYG/7sj2y66GA4aKiqxxiu1SFJLy
	 crmjkfq9KU1g6Mk/mpY7GWWzXz5EYJOjoKDeBIY8b/3XpmXlAYIrYZdhEs4keeZPG3gqi
	 003BKYbWzWa73yT45X4kz35DQireFmDBxs7x70jhQqjJxrXpR+P8QiA4WJtvCEm7Dh+El
	 3NzQp5ySqlnki76XQDua0x+Qnzon50n19fsGh3dPOAl2Lw514WTqbm5gPB71aojt7rQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793260089;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Gbqjw6eFej6Wu2u2kOXe8fh2VRzTDqvSXr/mW0V0w/c=;
	b=t0zZNT0HMshPKWzkRgAvd2Emn/D7IPO0MA8Rj4zyrAMQ3tFx7Ds6wrLNfjaaxNcJzSvZ
	 0rcHZggwPlVjRC5xnFMxDuMashIUx4VAc2KwA+spTovrml7VD6PxIyDbaGd5asDJH2JFs
	 lvJRPV7DfQ+oVz1pnNrBVftuIsoEqDFUclwMXOEYJs5gxJXz3FGAVwceBOaNM6MiHSGAg
	 GlOnYG+UjEvWpROfY2nGyQoElDOr9axBUDprRNVeSm+LwiWlUA0Q+i6jweFAqQlcdbRVd
	 6om48iQnoe+HkLh8W58BoTtCvP49R+Xyja/Pae3WHEjo4iS1lskCrdeaF6/r6flB8PQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 215FF1F01825;
	Thu, 29 Oct 2026 07:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793260089;
	bh=Gbqjw6eFej6Wu2u2kOXe8fh2VRzTDqvSXr/mW0V0w/c=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=UPXvyEM5As1zUtapZpVKco1BuUc61No225u2CeoHx4IgE/IbIxIhCv79JQtzQZAGn
	 DVRhVAY6X6zo2GQZTGxolgDub4oObTq44sNrhrVv6OH8p/x+HzyhpfEpAIahJjQAWg
	 bT8J+kNSKJsCaSaO4ZMZ1JbOuCIQFW/0MXlKbfAbWvpQuu4mddtyZjxU7QfBCTbfpZ
	 Yh54gfgWyb4PaC/MOu4R50k/twihh/NJMWXLyJnQSZUgWHZOGXY8m0HFtwT66Edye9
	 duJzeqUw3rcDH48QJAkxw5NjpTyQQ2n/YvSKhi07TX28vIQ8QYj9/0KzLoghh8Ss2l
	 r6c0Rb8AG5lxA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 74B464576F;
	Thu, 29 Oct 2026 07:48:08 +0000 (UTC)
From: Remy Demangeot via B4 Relay <devnull+remy.demangeot.net@kernel.org>
Subject: [PATCH v2 0/2] ACPI: EC / hwmon: (asus-ec-sensors) use ec.c for
 the MAXIMUS IX EXTREME second EC
Date: Thu, 29 Oct 2026 08:48:01 +0100
Message-Id: <20261029-m9e-ec2-v2-0-e9c4e2ba8415@demangeot.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADH64moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzNDAyNL3VzLVN3UZCNdM4u0xBSLZAOLFNNEJaDqgqLUtMwKsEnRsbW1AAc
 o8PtZAAAA
X-Change-ID: 20261029-m9e-ec2-68fad8c08d5a
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Eugene Shalygin <eugene.shalygin@gmail.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Remy Demangeot <remy@demangeot.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793260087; l=2311;
 i=remy@demangeot.net; s=20261015; h=from:subject:message-id;
 bh=z+w564HyFM1lLPV34H4icOPYBFIvAz6TuRX2u+dKWfU=;
 b=aWrCl5x543W+pi92xTuPxHgyNVsc7khzeafqzXyDMClsGaoTgttfZh5kCWvPQjHsakxdKVYwG
 1l07sVkAwtUDr+Jz4jmLqS0nQHtgb5i4NJW44FZLOT2XlXr01giSvI3
X-Developer-Key: i=remy@demangeot.net; a=ed25519;
 pk=h/s5N2ZlgZ0m+8FpMhSaCNJt0jvb9whRBAdJwpC+VAo=
X-Endpoint-Received: by B4 Relay for remy@demangeot.net/20261015 with
 auth_id=1194
X-Original-From: Remy Demangeot <remy@demangeot.net>
Reply-To: remy@demangeot.net

This replaces patch 3/3 of the series "hwmon: (asus-ec-sensors) more
MAXIMUS IX EXTREME sensors" [1]. Patches 1/3 and 2/3 of that series
only use the main EC and are unchanged.

Eugene asked to operate the second EC through drivers/acpi/ec.c rather
than re-implementing the EC protocol in the driver [2]. Patch 1 adds a
small API to ec.c for an EC that is not described in the ACPI tables:
acpi_ec_create_polled() / acpi_ec_destroy_polled() and byte accessors.
Such an EC only uses busy polling: no GPE, no IRQ, no query events and
no address space handler. Patch 2 uses it in asus-ec-sensors.

To answer Armin's question [3]: no, this EC is not described in the
ACPI tables of this board (BIOS 1501). There is no PNP0C09 device for
it; only the WMI method \_SB.AMW0.WLDF writes to ports 0x68/0x6c
directly, without taking any lock. The other PNP0C09 device, H_EC, is
a reference-code stub whose _STA returns 0.

Guenter, please drop v1 3/3: it sorted the sensor banks as signed
values, so the second EC bank came first, the second EC was never set
up, and no sensor of the board could be read anymore. This is fixed in
patch 2 and was found while testing this series.

Both patches were tested on a MAXIMUS IX EXTREME with Secure Boot
enabled: the four water temperatures read correctly, 300
consecutive reads gave no error, and the I/O ports are released and
requested again when the module is reloaded.

Patch 1 needs an ack from the ACPI side; patch 2 depends on it.

[1] https://lore.kernel.org/r/20261026-b4-m9e-ext-sensors-v1-0-644d389b2de1@demangeot.net
[2] https://lore.kernel.org/r/CAB95QAQaogxV6KO5kpv9RBpzhhmH_N3Dvvy=nqWHOG6qAQB_aw@mail.gmail.com
[3] Armin Wolf, reply to v1 3/3, 28 Oct 2026

---
Remy Demangeot (2):
      ACPI: EC: allow drivers to create a polled EC
      hwmon: (asus-ec-sensors) add water temperatures for MAXIMUS IX EXTREME

 drivers/acpi/ec.c               |  89 ++++++++++++++++++++++++++++++++-
 drivers/hwmon/asus-ec-sensors.c | 108 ++++++++++++++++++++++++++++++++++------
 include/linux/acpi.h            |   8 +++
 3 files changed, 189 insertions(+), 16 deletions(-)
---
base-commit: b27578907b9dd74db5e9b397bf063c43719c162b
change-id: 20261029-m9e-ec2-68fad8c08d5a

Best regards,
-- 
Remy Demangeot <remy@demangeot.net>


