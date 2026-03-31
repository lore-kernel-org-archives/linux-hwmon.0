Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB1A3D3002
	for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 23:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774999171; cv=none; b=iXIC1p30uXs3SPoVpu9mBbMFc3e8rUYLAva2e0SMeE5Ezohb31spb2XC4fum85mzNLa6IH1cGwB+ll6m5MaGCBGRvjIHQnLu+VkLjYmqD474mkFm/OnIaGTRwn/T6vcR0J0D/OAW8Q74fqUvZ4KfdhUWOSu1cuMn+31nWd0fIls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774999171; c=relaxed/simple;
	bh=fGwz0GHXzRDxEnfbge/u5CFlJKG/w9TUvuItYHvn7GU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eLQhjmEe3qpsRjvoM3DGEvM5KS6Syqq7hRu6h6FCR5dEKnoOvxaev887Qf3Z/L4rZvH6SC5GwkY050B9dU7nKPeShtdDMFqbN1WQoUUCIHjn/KAmHKizw95OHVidwd4fpP2NYYGm0q8XetaapABEaF6zXJs5Bf/G8pMsGjzofIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=gmieSBgD; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="gmieSBgD"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E1B7B2C04CF;
	Wed,  1 Apr 2026 12:19:25 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1774999165;
	bh=YFHnOpD3OIp6daU6D2uz3JcBHiWAJCFU8QhF6kEpoWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gmieSBgDAqq7cFhJjBHnvKu4eDsSBFXM0vF+jk4wMOCWvRwZzzAt5a7GL6BpAtCVf
	 NabNkcfyKRnCsYP1MqV/EZQLeSUZZXjqIABdXeyLt4y51dGL99GU/bVXQN7hmIEp71
	 x2IqQ+8SHQCsJnZjlxzTl5kak0aknTyuQs5ThDzthYhJQoGurBp+kVi8WNkAjPiVvy
	 1rBLc3fM9zNnwhzBWzjLt+/jA6JqteyU+2BogeY6D52ytXBqxQoMBanmWwVJSnH2Ob
	 sQsm6V44OcanJPTLEWZUW/tnnHP/oS/pmyrcj/TzkCQcAqX95vWAlVN2CSnxrWqmtG
	 E+72zdu40zYGQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B69cc567d0001>; Wed, 01 Apr 2026 12:19:25 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.12])
	by pat.atlnz.lc (Postfix) with ESMTP id 8A7C413EE52;
	Wed,  1 Apr 2026 12:19:25 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 84B812801D3; Wed,  1 Apr 2026 12:19:25 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 1/2] dt-bindings: trivial-devices: Add sony,aps-379
Date: Wed,  1 Apr 2026 12:19:12 +1300
Message-ID: <20260331231916.94662-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331231916.94662-1-chris.packham@alliedtelesis.co.nz>
References: <20260331231916.94662-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=EcprQ+mC c=1 sm=1 tr=0 ts=69cc567d a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=A5OVakUREuEA:10 a=jfe4B9wozX6hrU8P5YcA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add the compatible string for the sony,aps-379. This is a simple PMBus
(I2C) device that requires no additional attributes.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
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

