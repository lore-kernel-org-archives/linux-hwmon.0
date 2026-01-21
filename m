Received: from fra-out-003.esa.eu-central-1.outbound.mail-perimeter.amazon.com (fra-out-003.esa.eu-central-1.outbound.mail-perimeter.amazon.com [3.72.182.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64C3315D33;
	Wed, 21 Jan 2026 15:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=3.72.182.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769008818; cv=none; b=WGz+C65q6bWV7HA6CrLgQCTLglULNTVurZDtLTr1ISWwnP1qNFh1tbhJzsUaKsHMhtCl7Tq0EzscmGp/22m1wxQYUL4C6h8e6HaF6ElrfvtadDS/4iFGjHSj0HOl5vRFu4fozvyWVMaod3KrRfhEguMKMJmLf+9TVc3FEKKuucc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769008818; c=relaxed/simple;
	bh=+SbmgMmVum9XSbJIKf/AxivKorcImnU8EHgEdooZs0Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GkLcshm0zVRQhShE/3ryR9Jj4k+M3znwh/Nnxj1GubEc7zErVp3D9vHKqOVS0P4U8PgSeUSOzHYVPGQyCTa4z3fP3cazVG3APzffH1ZBrFibMgPyi+j1xa0nTWr7tUA0/i1TGAksF+/ozSo7uh3vDQJCkrFClMuzbzRaWUltveI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=diXNSY/k; arc=none smtp.client-ip=3.72.182.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="diXNSY/k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1769008816; x=1800544816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2hVXaLMhD7VhTtzESPV+Av42+eCg/k9S4Zfl5fPqZZg=;
  b=diXNSY/kfMJkfeOQCJ044erz9OOlAvsChodUB9v082yEM85Van0tSYgI
   6yiNIQqifDE/W5a3caF1QPjOStHs+ABJ/ZhtAVlEp66IOKhAz4sN3pnHR
   Rr94rEhDJiEE3vD/Ui5apIB2/cNZkgGhN2ESXQVLBAh2Ap3/aPOFPWyhM
   s4M19AyoRi6ZoAroaYsfiPgqbYnQc+AOZG0/ON8sSNbwzHkvW+oldPvS7
   iUghBZEO7J1y3Ubk0Mpd9GoSFVDpp19u5UmIT0nymltzkwMFETD20KXWV
   59i0RM6r6UmOP4Vn1ubNj9j+o8PVA8l2vzazrWB90bUhTkAnJ9cIZgeNb
   Q==;
X-CSE-ConnectionGUID: zcFyLJDTRGyL6X+ZX95k2w==
X-CSE-MsgGUID: Tj+WbDShRwGRr5UjeOIHuA==
X-IronPort-AV: E=Sophos;i="6.21,242,1763424000"; 
   d="scan'208";a="8237904"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-003.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 15:19:58 +0000
Received: from EX19MTAEUA001.ant.amazon.com [54.240.197.233:16851]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.37.86:2525] with esmtp (Farcaster)
 id 83ca86c5-b17c-4159-9515-c900dd846a3d; Wed, 21 Jan 2026 15:19:58 +0000 (UTC)
X-Farcaster-Flow-ID: 83ca86c5-b17c-4159-9515-c900dd846a3d
Received: from EX19D003EUB004.ant.amazon.com (10.252.51.121) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Wed, 21 Jan 2026 15:19:57 +0000
Received: from dev-dsk-almogbs-1b-998410db.eu-west-1.amazon.com
 (172.19.74.107) by EX19D003EUB004.ant.amazon.com (10.252.51.121) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35; Wed, 21 Jan 2026
 15:19:54 +0000
From: Almog Ben Shaul <almogbs@amazon.com>
To: <linux-hwmon@vger.kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <itamark@amazon.com>, <talel@amazon.com>,
	<farbere@amazon.com>, <ayalstei@amazon.com>, <dwmw@amazon.com>,
	<almogbs@amazon.com>
Subject: [PATCH 1/2] dt-bindings: trivial-devices: Add jedec,pmic50x0
Date: Wed, 21 Jan 2026 15:19:46 +0000
Message-ID: <20260121151947.37719-2-almogbs@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121151947.37719-1-almogbs@amazon.com>
References: <20260121151947.37719-1-almogbs@amazon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D044UWA002.ant.amazon.com (10.13.139.11) To
 EX19D003EUB004.ant.amazon.com (10.252.51.121)

Add devicetree binding for JEDEC PMIC50x0 compliant I2C DDR5 PMICs.
https://www.jedec.org/standards-documents/docs/jesd301-1a03

Signed-off-by: Almog Ben Shaul <almogbs@amazon.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index d0f7dbf15d6f..fb16bd91c76c 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -171,6 +171,8 @@ properties:
           - isil,isl76682
             # JEDEC JESD300 (SPD5118) Hub and Serial Presence Detect
           - jedec,spd5118
+            # JEDEC PMIC50X0 DDR5 Power Management ICs
+          - jedec,pmic50x0
             # Linear Technology LTC2488
           - lineartechnology,ltc2488
             # 5 Bit Programmable, Pulse-Width Modulator
-- 
2.47.3

