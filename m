Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C45C3C13F9;
	Tue, 14 Apr 2026 09:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159022; cv=none; b=dhYYjzWIEYLHjRfWSrWHtrRKMzuFg4QJ+psua94U76J2Cg0a4ZaKceCmF6LgKnIE9wUsj6gtwJRE/n3WXNc76BL1U46dg6VU1KjvaweWNDEFqf8K2bBQnQrg6gEGlxurFRob6bbtgWg+02LknlL4J1dInN4ZDIElTSTZAbvarfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159022; c=relaxed/simple;
	bh=C3Jk+havheEvSNjBbieXqRyaODbSdgXw2Er3e1mHqN0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gz99/u30yEWCHDJ5LybcMW3Y2KMEsaNVgPYxXgj38neUTtT9P3Jw1Ac2uvd87zpCXxtgTPHtdwCjcizhV9Z+XVl3iY9Yf/QJ6UoRsEL2QdCzrfOa1/Uh8Z5iX4ndr1yUnsH4/uID5EQOJhminyZsNQGqLPz5CeNcyZcnB1b2dO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=W82Qj4wx; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="W82Qj4wx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=By
	Nh+ZVMLlFAwQU1VPxOfH5E1NoPZjDNDG4koGc6CSU=; b=W82Qj4wxB84pMk/lMJ
	1lwJTBuwdLsXpM7dGTm75smUtIAly3qKWX/Tb3XE/26WkxJbMGSFS4/Pj94zVMGl
	dGdBAAmXYEfnMQAKfAGaR4u9XH3gsjYeye2irwbPtSuZV5YfWufg4/KUFke5jjAW
	975zYGLJkmqryF9EUTFH6Dy50=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with UTF8SMTPA id M88vCgD33wnzCN5p0_VbAQ--.56718S2;
	Tue, 14 Apr 2026 17:29:24 +0800 (CST)
From: wenswang@yeah.net
To: robh@kernel.org,
	krzk+dt@kernel.org,
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
Subject: [PATCH v4 1/2] dt-bindings: hwmon: Add MPS mp2985
Date: Tue, 14 Apr 2026 17:29:20 +0800
Message-Id: <20260414092921.1067735-1-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260414092801.1067470-1-wenswang@yeah.net>
References: <20260414092801.1067470-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgD33wnzCN5p0_VbAQ--.56718S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryrXrWxXr47WFW8WFy3Arb_yoWDurc_Cw
	4xZ3WDCrWkJFyfKan5AF4kGry5Ww17KrWUCw18t3WkXF9I9rW5CF9aq34YvryxGay7ur15
	urn2qrZ3XrnxWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRNL0eJUUUUU==
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiIRRR9WneCPQnFwAA3q

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

