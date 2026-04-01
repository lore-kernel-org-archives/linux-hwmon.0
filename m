Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3ED384246
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Apr 2026 19:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775072563; cv=none; b=gH0tG0GHr782lqvlNR07w9TnXZba6Cxeax3Xw0/CkQTqvG5oRY86hFJEF1Mpc+B/qBEtaswz/H8zHqZogTOmMFQvV6zeDMpq8ol4KzqXypwN4dmoY9VBMSFKKJS41pxJR901QuRS/99igFURwFmHF8O+RadXXSZy6oLCeLZlv9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775072563; c=relaxed/simple;
	bh=P7Rfdd3v65WAEECYwDtuZ0ZFYZOyNOp2eobTrOVzuk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fd0ZVwIeblmWdC/HzU8uDJs4VKFJUisr/iqhOQAlF7UigjLveHXyZD1Ukm37fFlsz4aj0B7lubpD7n7Ggwr8r3S0E5U0updH20xsRiLdz3Ewq0tzGFmE6suWLwlzQm+iLiQIl6dSGy7Y9CIBuYXlMjk5idwSKi43/mZW7CeTk74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=tAPkkXB0; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="tAPkkXB0"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id EAF2D2C04EA;
	Thu,  2 Apr 2026 08:42:37 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1775072557;
	bh=cUDm2OR8S8mFGHV98b1HoEngmd4f/lQ8mlBFT/AfBWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tAPkkXB0KHg8v8sowFHA8fSKXCSK3OYTsS1MjiAmif/Dk3g8w+uwr1pYsJHhn4VdS
	 jBTZUrRAcwEOBU3xtwPvYa80tE/M9AYJMUK22xCKxVDhhfID4F+H4FD+3pI+Vi6FVF
	 1WxRHSrG9NE4/aDS9x72tffR80Z0lK1qrkYrq/rrZhsBrLJhecS/oOEHCqooxkF3YO
	 I/PN/tj7QeGrx83TAMGdeH7/J8Fr0d636qvsBOTWzUA2SFHCTDlchEQVzXmG4ba0iu
	 xOt3h5RR92Dr+OZhZw65vyGq9OVTBJTPkv6BIG10/zJH92khsIF/DTCsWBv4ZYmUn6
	 LhdbQbY30LjSQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B69cd752d0001>; Thu, 02 Apr 2026 08:42:37 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.12])
	by pat.atlnz.lc (Postfix) with ESMTP id 24C3F13EE52;
	Thu,  2 Apr 2026 08:42:37 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 217B42804D2; Thu,  2 Apr 2026 08:42:37 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 1/2] dt-bindings: trivial-devices: Add sony,aps-379
Date: Thu,  2 Apr 2026 08:42:32 +1300
Message-ID: <20260401194235.2149796-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401194235.2149796-1-chris.packham@alliedtelesis.co.nz>
References: <20260401194235.2149796-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=EcprQ+mC c=1 sm=1 tr=0 ts=69cd752d a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=A5OVakUREuEA:10 a=EUspDBNiAAAA:8 a=CbD2gyqqR853AcFyMGIA:9 a=3ZKOabzyN94A:10
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

