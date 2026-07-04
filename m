Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C19339061C;
	Sat,  4 Jul 2026 08:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783153381; cv=none; b=AXTLpOtbtUlZ/cEolSWPuQaqIRyxlEkS6tCy540j2vzc1HXU4+ow7ff/JNOCJ97yzwvcRvi1+/Av0yjrZWmOmxKonqX0Mvy4NtRAjga40+PNbAVjJbCcBocjYrYC0CQc5zTzPrmsiWGJ1u9W1baA8ynSljAx460CCh4AoOAnAVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783153381; c=relaxed/simple;
	bh=cRn7m7brK78nGuXGnSYGpDMbZJ5hnbiW6pjZObSP6sM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rmSktW2hmBQjykyVU3v95X1DGMn7Q5mTpq+SX3+RHJA7KBau4Ll41XoWEH7Jm/QBgZgSUoEVIicQZUsoU5Mk2mCOmEDuvLCvVDod+OvmGuAPaxkkd3N2kjD8SbF1eQxpvukoeia4UwLnzo76O58qwDGsaPzuh7WvXDzIZl8lLpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=oN3HF1WB; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="oN3HF1WB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=F8
	7PwsKShk0cL752xeSe+Mho3WGWHLs8rWeZWmjsF2E=; b=oN3HF1WBPzCg79vsTO
	w+KMtadumlsr522WyclWT13/WTzALLxoOQS7lKHqUC4npLzI+HKn5aiSw7ywy+Uv
	DtggskyD6FQmYk3rsooNhQw27PhAB8icckI/1snql2zYVJ8+xPJ1hOoK7b3UyLC5
	TBj4CwpH7Q/kI702ShfNFqViU=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with UTF8SMTPA id Ms8vCgD3308rwkhqyJoLAQ--.13660S2;
	Sat, 04 Jul 2026 16:19:55 +0800 (CST)
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
	Wensheng Wang <wenswang@yeah.net>
Subject: [PATCH 1/2] dt-bindings: hwmon: Add MPS mpq82d00
Date: Sat,  4 Jul 2026 16:19:51 +0800
Message-Id: <20260704081952.1701914-1-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260704081810.1701587-1-wenswang@yeah.net>
References: <20260704081810.1701587-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Ms8vCgD3308rwkhqyJoLAQ--.13660S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryrXrWkGryUWFWfWFy7Awb_yoWfCFg_Cw
	1xZw4qkrykJF1Sy3WYkr4kJF1UZ3W2kF4UCw1ktF1kZ34S9FZ0gFyvq343J34xWF47ur15
	urnaqrZ5XrnrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiIgxoDWpIwixbhgAA3a

From: Wensheng Wang <wenswang@yeah.net>

Add support for MPS mpq82d00 controller.

Signed-off-by: Wensheng Wang <wenswang@yeah.net>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 435c4baab436..8116f21bf8be 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -362,6 +362,8 @@ properties:
           - mps,mp9941
             # Monolithic Power Systems Inc. digital step-down converter mp9945
           - mps,mp9945
+            # Monolithic Power Systems Inc. digital step-down converter mpq82d00
+          - mps,mpq82d00
             # Murata D1U74T-W power supply unit
           - murata,d1u74t
             # Temperature sensor with integrated fan control
-- 
2.25.1

