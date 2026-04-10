Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC09231E827
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 01:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775784262; cv=none; b=P2dzSdI4VA1zb/QxsDANAX+CwTASIZECbRz3+lPBo7nccn1x1qQmkG1r8BHTvm8hr2LBXJJ75XGrjp/73MGusxTUuhZEOaxbIJ6lEdRB6C0O6NzNaiUOZXkhxBaikICOFc+kbxlBNtx/8L50+AMIKf80ybrTxuBFhTfN7/XlWhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775784262; c=relaxed/simple;
	bh=P7Rfdd3v65WAEECYwDtuZ0ZFYZOyNOp2eobTrOVzuk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SjESyP69yR+Ig1wIs9hjG7eFgCeZqESDPdI4EL7Ca7hIWpTI+Qk4DWZwsqrFSIteFk2r3Gtg9g6285VBUarzoBTHAkdaFiNhiYliEFvF1JS+fmC94TkNKQ0qsMZ5VjM5fp865cVvQaeTd9MAwBRne5Cg5+MIos9K5eB+73sw704=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=rRR7QcVN; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="rRR7QcVN"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id B68042C044C;
	Fri, 10 Apr 2026 13:24:17 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1775784257;
	bh=cUDm2OR8S8mFGHV98b1HoEngmd4f/lQ8mlBFT/AfBWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rRR7QcVNYpjA3lF4epcPywCOSnW6Op4tpMik3HHAJi1eAeOB+RcYeEb4WILnNOU7K
	 uy47GPYjr7q3I+vuH4a/USVIAml9cuYACUQYw+MlbsNesPt5laaFfH0aoO01EeM8sX
	 5IETDc4kdxz/gytOxcpBeBXYlSC3I3m2sh5BUgfCKcauNq4oVSBp99WYFOeiFkhA1J
	 sAS8pmgjYJyqu4fKRs7E3hwC08pzuvvDcazIPdC/CdbcZqZmMeEr+CojRQJ/4fAAWP
	 WH8amurbCp/4D6Boouum1zTsg+ycQqWWy/cUSoOiWveLpWU8KQJH826RIjBH/QcFHR
	 buHGvwqfC2GcA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B69d851410001>; Fri, 10 Apr 2026 13:24:17 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.12])
	by pat.atlnz.lc (Postfix) with ESMTP id 7CD8113EE7A;
	Fri, 10 Apr 2026 13:24:17 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 792C228024D; Fri, 10 Apr 2026 13:24:17 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v5 1/2] dt-bindings: trivial-devices: Add sony,aps-379
Date: Fri, 10 Apr 2026 13:24:11 +1200
Message-ID: <20260410012414.2818829-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410012414.2818829-1-chris.packham@alliedtelesis.co.nz>
References: <20260410012414.2818829-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=EcprQ+mC c=1 sm=1 tr=0 ts=69d85141 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=A5OVakUREuEA:10 a=EUspDBNiAAAA:8 a=CbD2gyqqR853AcFyMGIA:9 a=3ZKOabzyN94A:10
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

