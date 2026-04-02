Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B31337BBD
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Apr 2026 02:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775097673; cv=none; b=PZqFmbzIO3IIl5kafBor9/rVvG79fjqsISDbh3DYPLTRkeYQ7s5zfvOn1Pl7Rj8CnVRX0ZQz3sXZnc0uuatS52WbruLV2/bw/yvfQSJEiwdlOwpVV7ABy8NLCKID9Db5HivrZLurFyrNqHxMoZqvLccpFCBaMnV8CqNKRpQoh88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775097673; c=relaxed/simple;
	bh=P7Rfdd3v65WAEECYwDtuZ0ZFYZOyNOp2eobTrOVzuk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sp+m3wnMUYOaoDDABrHx1zi4Oix9uAvfYYuenKU8yr2Fw4gCd3OE6StcwKrqoZBANqIGcqSJuDI/3/nJ+7JKoi1HDJvgR5UrDVLcvPCW1O+mQOwN6nqDNEbuqQsi+KFTWnD+phW+jmXVEX0BS1dRlFLRrXZityAtO6j3ZZ2rTZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=K+KmhAzz; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="K+KmhAzz"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CCAED2C04EA;
	Thu,  2 Apr 2026 15:41:07 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1775097667;
	bh=cUDm2OR8S8mFGHV98b1HoEngmd4f/lQ8mlBFT/AfBWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K+KmhAzzW9cHaUvKpNciGiU3fnVa97NM2C31C+aa/et3SKH9eqXCiKhS0BODeFtT1
	 h6enQHcZ8D5Je96SRkkYyiW5IU+9tZ6vG7r7YVrx1auYn2VzvrFV1zQ+MX7KiNZ/5Z
	 2OLVS13U525YVXHMoB54CputNFMvkVNRmZzBXMoPQzgIHmB3iTKH1LES32gb0P5DJR
	 VwlIokuvrcAeq1TRE5XdUsgvvzKXBCnE1b25Oa1aqGlL8N8QnPGUtwSEZtrt5DkaFs
	 4q9dz8rvkWQE+fuaAfs/DJfE0wljd7r7edPEbxAh+7Nky9226ZowkAy7qDCGOVneBh
	 /io6j9Q1XoX1g==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B69cdd7430001>; Thu, 02 Apr 2026 15:41:07 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.12])
	by pat.atlnz.lc (Postfix) with ESMTP id 7E16C13EE52;
	Thu,  2 Apr 2026 15:41:07 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 77E412803E8; Thu,  2 Apr 2026 15:41:07 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 1/2] dt-bindings: trivial-devices: Add sony,aps-379
Date: Thu,  2 Apr 2026 15:40:59 +1300
Message-ID: <20260402024101.4136697-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402024101.4136697-1-chris.packham@alliedtelesis.co.nz>
References: <20260402024101.4136697-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=EcprQ+mC c=1 sm=1 tr=0 ts=69cdd743 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=A5OVakUREuEA:10 a=EUspDBNiAAAA:8 a=CbD2gyqqR853AcFyMGIA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add the compatible string for the sony,aps-379. This is a simple PMBus
(I2C) device that requires no additional attributes.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Notes:
    Changes in v3:
    - Collect Ack from Krysztof

 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Doc=
umentation/devicetree/bindings/trivial-devices.yaml
index a482aeadcd44..0a559beff878 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -430,6 +430,8 @@ properties:
           - smsc,emc6d103s
             # Socionext Uniphier SMP control registers
           - socionext,uniphier-smpctrl
+            # Sony APS-379 Power Supply
+          - sony,aps-379
             # SparkFun Qwiic Joystick (COM-15168) with i2c interface
           - sparkfun,qwiic-joystick
             # STMicroelectronics Hot-swap controller stef48h28
--=20
2.53.0

