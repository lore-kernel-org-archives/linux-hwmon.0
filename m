Received: from mail.monolithicpower.com (unknown [12.33.0.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9022F23373D;
	Mon,  8 Dec 2025 07:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=12.33.0.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765178283; cv=none; b=YQgNHvaUGKLJoI3bsNBrvG81HyL1Zd6uspt/8wvJEmtVac0GG/asxsFzb/kqfyNq6CI1Sd8LewWAzq6JCXy9oani2Z6stOwvvEJAEkc9tnT26zjbrWCZKtf5KXHKgC5bi9hJIfrAfmWgl0uRBKoorYq3QcJ/0QafxJ860D+pYLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765178283; c=relaxed/simple;
	bh=IMGiFNwDqwShM9f74TyX1WPWMyew9FC6Vz9Y2Zo813c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZkV4wkx+xga6jpPn1nWW9WnN5OJRF1btk53FoX72Mri+WV1JRSr4qFtqZyeSlYzkvSH3xQwO/CC9lXWNAM7CslBfI97K6Vdia6SzTROUt4qSimhSTQYEGmbUsJua93LLuz9R96+p9dwupBFWJ69yRAVCSMUNHGot1eSZzWbAXB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com; spf=pass smtp.mailfrom=monolithicpower.com; arc=none smtp.client-ip=12.33.0.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=monolithicpower.com
Received: from CD-MSH04.monolithicpower.com (10.10.70.213) by
 mps-mslbn03.monolithicpower.com (10.10.10.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Sun, 7 Dec 2025 23:17:52 -0800
Received: from HZ-200D-C0727.monolithicpower.com (10.53.66.137) by
 CD-MSH04.monolithicpower.com (10.10.70.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 8 Dec 2025 15:17:47 +0800
From: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
To: <Yuxi.Wang@monolithicpower.com>, <linux@roeck-us.net>, <corbet@lwn.net>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <wyx137120466@gmail.com>, <linux-hwmon@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: hwmon: Add MPS mp5926
Date: Mon, 8 Dec 2025 15:16:58 +0800
Message-ID: <20251208071659.1157-2-Yuxi.Wang@monolithicpower.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20251208071659.1157-1-Yuxi.Wang@monolithicpower.com>
References: <20251208071659.1157-1-Yuxi.Wang@monolithicpower.com>
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

Add support for MPS mp5926 controller.
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

