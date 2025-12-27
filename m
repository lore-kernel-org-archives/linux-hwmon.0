Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED8825485A;
	Sat, 27 Dec 2025 10:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766830867; cv=none; b=WTmZyPY+0d50fuHZQUc3QOIE8x74GsvoxQrENkdLpUw/GMPfTsOQCcb0l253V+6aBcOlEHUXR7HNRKtBND9glt/0ObcAVHU83GBkKWCPz337mI/uMNg89O9kPyAtDFoFp7gh+zUVE20C9eGvDT8rC+LseZIVJU7GVeMx9VMj9ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766830867; c=relaxed/simple;
	bh=Z3QhD5rU3P/E6TmLSSpC5jmHDFg3IKXzlzT5DypHh1U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c5SHY+/4QO5OFrcPVPwLgLx4UQT2yPa5BlCA639duaxLtz1ld93M+OnPsSOQLOKDb2eos0p+2zpSjI5Sto8HHWaWIcvWgdSCKuqD17xiafPFf1jF7npJHJasIpG1le3eXRz5uBWpMjdkg12r61iAwev6HHIByPAZHLHxoinc6wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=fws1qhu+; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="fws1qhu+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=+9rV82BB7dYDqbuPdhn5vSD2BWQelnOvugCWsc9ZvXM=; b=fws1qhu+imH2SiPDMDmQC6+qlJ
	yr34ESt/jG3PQoZjGoiAsIz2U/p1maKWmZpi/T6Jdv0GIjf7QrzZddqytBEDNumLEK0gYOnhO2xUn
	EZJmAdbWv6rR1KDXPDBXbxj450nx8D4pgkFDBbvl3X5pe5W/h8S+30nDxASKJ0Bl4uzngKoV/ya12
	s2FR+T7aDh5cBi3D0gjzbSops0MtU0iaBxfj2Ys8Qg5Eg39CUBYOVncbx1gpnIq5hPEEBwE4XYnDI
	6BYoME4I+3vn4yVPEOlJmzgMbRYhnh1SH4njQA1trmPCylB8/5jII7j4kFrgbSK5Eefr1uUFUddGE
	FSCOhJUA==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 0/2] regulator: Add TPS65185
Date: Sat, 27 Dec 2025 11:20:35 +0100
Message-Id: <20251227-tps65185-submit-v2-0-1882024b8f33@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPOyT2kC/3WNQQ6CMBBFr0JmbU07UkBW3sOwgHaQiaElLRIN6
 d2t7F2+l/z3d4gUmCK0xQ6BNo7sXQY8FWCm3j1IsM0MKFErRBTrEiutGi3ia5h5FVijMbWuSPY
 W8moJNPL7KN67zBPH1YfPcbCpn/3f2pSQ4lJem2rQsrR6vD1pdr2lM7vRQ5dS+gJUUehRsQAAA
 A==
X-Change-ID: 20251222-tps65185-submit-272cc756e0ad
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1316; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=Z3QhD5rU3P/E6TmLSSpC5jmHDFg3IKXzlzT5DypHh1U=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJn+mxl383mYfq+b0H5ghpaAmfqEpMs/kx9PkaptO2m6u
 HyZ1KTzHaUsDGJcDLJiiiy/rBXcPqk8yw2eGmEPM4eVCWQIAxenAEzkoizDH37zyXuOccaE8r1Z
 GyGjec/AR6Vq+5GfQqmyBqZxS5pWdDL8FWX6J2p2ykF719r7HmtCV1T/7phxVNhPMTH/CdduD87
 ZPAA=
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Add a driver for the TPS65185 regulator which provides the
comparatively high voltages needed for electronic paper displays.

Datasheet for the TPS65185 is at https://www.ti.com/lit/gpn/tps65185

To simplify things, include the hwmon part directly which is only
one temperature sensor and there are no other functions besides regulators
in this chip.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v2:
- try to find a more common subject line for bindings patch
- align pwr-good name to pin name
- remove runtime pm
- make vin supply non-optional
- use more standard regulator ops
- Link to v1: https://patch.msgid.link/20251222-tps65185-submit-v1-0-34986b504d5f@kemnade.info

---
Andreas Kemnade (2):
      dt-bindings: regulator: Document TI TPS65185
      regulator: Add TPS65185 driver

 .../devicetree/bindings/regulator/ti,tps65185.yaml |  99 +++++
 drivers/regulator/Kconfig                          |  11 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/tps65185.c                       | 454 +++++++++++++++++++++
 4 files changed, 565 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251222-tps65185-submit-272cc756e0ad

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>

