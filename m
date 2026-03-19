Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CB62248B3;
	Thu, 19 Mar 2026 06:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773900396; cv=none; b=Cf0S9x2txt3Y821WzC0az0e1aEotEFSrobdi5culgONSHN2J9SHZWGoG4D0UXEfDjd5JKswXHjw6xkkwrBWEZ/8/FUqbKunZjUFaCJskyROJhWeDEfATvTlARq2WPaf+OsEooGdOVqVFHVBYs7u/tvpBkx0sXqGCPfeRp380okI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773900396; c=relaxed/simple;
	bh=C3Jk+havheEvSNjBbieXqRyaODbSdgXw2Er3e1mHqN0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OWdTIVd5esFg15z0OKkOeDsn38dFerkTlBskD0oarX2/xjvZJwsIa9vyBnotxLmIy9NkOGJAzOV8r7DS7VUbNbqwDhtL2v0mDHfP49dRRJmROmgzh7i8A3j4A0voLI6uxvQT1goqMGB/8uxIDtHaTy1GfKzUdpQYFaee3f8wQFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=oOMzNmsc; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="oOMzNmsc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=By
	Nh+ZVMLlFAwQU1VPxOfH5E1NoPZjDNDG4koGc6CSU=; b=oOMzNmsc6+3ytRa5I3
	laQOSaeN3P9QovumeNb1kNkdyp5ShcLJpaoLNuMbH4BkfrtxmA3HOpgq2vWgpu9C
	B31N00TmX1OAot2JHbDaNCuFW6STcUwxdxuuFuMH6m2Q96fow0XCQUIiYpQm+nnA
	s0cPj0xk0ATIi1f1s5W231qkY=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with UTF8SMTPA id Ms8vCgCXP9evkbtpNPn0Ag--.45701S2;
	Thu, 19 Mar 2026 14:03:28 +0800 (CST)
From: wenswang@yeah.net
To: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Wensheng Wang <wenswang@yeah.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: Add MPS mp2985
Date: Thu, 19 Mar 2026 14:03:17 +0800
Message-Id: <20260319060318.643572-1-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260319060118.643352-1-wenswang@yeah.net>
References: <20260319060118.643352-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Ms8vCgCXP9evkbtpNPn0Ag--.45701S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryrXrWxXr47WFW8WFy3Arb_yoWDurc_Cw
	4xZ3WDCrWkJFyfKan5AF4kGry5Ww17KrWUCw18t3WkXF9I9rW5CF9aq34YvryxGay7ur15
	urn2qrZ3XrnxWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKCzutUUUUU==
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiIhDZfmm7kbD-NgAA3v

From: Wensheng Wang <wenswang@yeah.net>

Add support for MPS mp2985 controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Wensheng Wang <wenswang@yeah.net>
---
v1 -> v2:
    1. add Krzysztof's Acked-by

 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a482aeadcd44..d61482269352 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -325,6 +325,8 @@ properties:
           - mps,mp29612
             # Monolithic Power Systems Inc. multi-phase controller mp29816
           - mps,mp29816
+            # Monolithic Power Systems Inc. multi-phase controller mp2985
+          - mps,mp2985
             # Monolithic Power Systems Inc. multi-phase controller mp2993
           - mps,mp2993
             # Monolithic Power Systems Inc. hot-swap protection device
-- 
2.25.1

