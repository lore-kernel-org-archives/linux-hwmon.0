Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC72E13AD26;
	Mon,  9 Mar 2026 09:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773046989; cv=none; b=KZswmpYFlNmuoeXvU087020tZq9I7OTbgWbzfZwkVNDkxPCbrrg9g5cZLjpG+sftOiywiepKUZfAJYPZDYqJUK7E60Cmeb2N+mIJ9SRF+2rIp3kMufQEEQcLmfZGPi4yo/4RFICmX0CDOc6MwlST1+akpHlBVEvIpyFrMcVFybs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773046989; c=relaxed/simple;
	bh=9c00j73zKk6jHD/M67G4Xp9ItnJTUP4x5RhnzVGtPkQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BNi2Pm0v9e7LZIQ831n71oPehQMRUeWfjz7UynfG09kFLYYzaZmnbKbyOrFijXihLodLR4y3wpt63JqpTqxMgxCjuKsZMgHZccVvA3F6H+nIl61ct7WsPbTRL1iSjI5Zk1yLdAsGJs/zP3h/MHXBMnVPVp29W7IkGsiLWmDmfhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=HmnYyAhf; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="HmnYyAhf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Wl
	cu9Y4AVM/AEdaiKXC0S2Xj02cI1TN0ia5YYYG0aB0=; b=HmnYyAhfN/4zJCSArV
	FsnZQfdZ6iNllBAviPljswGk6tv1Vv6aKES5brGWGd/c2Rb/2gQXD+Zw4qpxLI2E
	9gI2+1VaEjhL90huy90X/v8jpl/UBTYeCWAAD1/ebpawrmRAUqNTRr+riwCLv18Q
	6BTYFdcXjJmZFvWUoDPsqI3Ww=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with UTF8SMTPA id Ms8vCgDHb9eajK5pzBdoAg--.49039S2;
	Mon, 09 Mar 2026 17:02:19 +0800 (CST)
From: wenswang@yeah.net
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Wensheng Wang <wenswang@yeah.net>
Subject: [PATCH 1/2] dt-bindings: hwmon: Add MPS mp2985
Date: Mon,  9 Mar 2026 17:02:14 +0800
Message-Id: <20260309090215.453396-1-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260309090041.452957-1-wenswang@yeah.net>
References: <20260309090041.452957-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Ms8vCgDHb9eajK5pzBdoAg--.49039S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryrXrWkGryUWFWfWFy7Awb_yoWfuFc_uw
	4xZ3WDCrWkJF1xKanYyr48Gr15Ww17Kr4UCw18tF1kXr9agay5GF9aq34avryxGay7ur15
	urn2qrZ3XrnxWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKCzutUUUUU==
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiNxtP82mujJvKyQAA3D

From: Wensheng Wang <wenswang@yeah.net>

Add support for MPS mp2985 controller.

Signed-off-by: Wensheng Wang <wenswang@yeah.net>
---
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

