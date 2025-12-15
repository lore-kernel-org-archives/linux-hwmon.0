Received: from mail.monolithicpower.com (unknown [12.33.0.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDA318C2C;
	Mon, 15 Dec 2025 01:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=12.33.0.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765762898; cv=none; b=RTiRXPYlDGN4gHm3DVzsLNbzyXHDTQG3fV2Fy/4SGTNeNwh+ZLMRzckMdTRCuvM06hpkqdjt47e/beHZfJbv8j4SKa5mKYdroCeQQJ/gtab2gpXQys/TDdYukh1IUXKjdfpm9x+n5xgTnkRYnfDgQHy14AzIa6D0gErGJ+06Zrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765762898; c=relaxed/simple;
	bh=bL4J/1MC0f6IgvRrU3E11SbBwtlUY01btldktjXiVtg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=af8R06h0QQz1N/fjGug0UoFkn4oSX1oRWvhFWTDh0n7qCUVmfSNqxbEajVzBppek29CeJEwnF2dU5Ew4f9+iJUhZDiQULz3C3ZABiSi9SCbUweN9Tqe3GjVpQebGrWBFNTuhjATrJu+CiPJZqNeDJcT59G31c//6E6w56hE9OPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com; spf=pass smtp.mailfrom=monolithicpower.com; arc=none smtp.client-ip=12.33.0.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=monolithicpower.com
Received: from CD-MSH04.monolithicpower.com (10.10.70.213) by
 mps-mslbn03.monolithicpower.com (10.10.10.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Sun, 14 Dec 2025 17:41:29 -0800
Received: from HZ-200D-C0727.monolithicpower.com (10.53.66.137) by
 CD-MSH04.monolithicpower.com (10.10.70.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 15 Dec 2025 09:41:24 +0800
From: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
To: <Yuxi.Wang@monolithicpower.com>
CC: <wyx137120466@gmail.com>, <linux-hwmon@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: Add mps mp5926 driver bindings
Date: Mon, 15 Dec 2025 09:40:51 +0800
Message-ID: <20251215014052.1215-2-Yuxi.Wang@monolithicpower.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20251215014052.1215-1-Yuxi.Wang@monolithicpower.com>
References: <20251215014052.1215-1-Yuxi.Wang@monolithicpower.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CD-MSLBN02.monolithicpower.com (192.168.86.32) To
 CD-MSH04.monolithicpower.com (10.10.70.213)

Add a device tree bindings for mp5926 device.

Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index d0f7dbf15d6f..df3f74b9dd28 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -319,6 +319,8 @@ properties:
           - mps,mp5023
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5920
           - mps,mp5920
+            # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5926
+          - mps,mp5926
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5990
           - mps,mp5990
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5998
-- 
2.39.2

