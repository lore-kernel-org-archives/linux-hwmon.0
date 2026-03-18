Received: from e242-8.smtp-out.us-west-1.amazonses.com (e242-8.smtp-out.us-west-1.amazonses.com [23.251.242.8])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B66F3B7B86;
	Wed, 18 Mar 2026 09:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.242.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827272; cv=none; b=gLkyXY/ReNRC3kQ4YnIBQSavo93IbcnYFKes+ZULtDcPRVZBZX+B6bLp+3VNpJbzC6tt2bf9eV7nDiKs7nLqUZxWC5vkr3qMakC/ri8hY2C59e+RS2N8B/ujjoyNN5XXhoHApP7GtmPKsz1HWHI46FKGhmI0n3AhS8dI/rlexPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827272; c=relaxed/simple;
	bh=7zewBI86x50kHE6VnVVTOOkyF0H+8PeuJzCleskEe9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sc4F6PLk99iWVTzAdO9xuYLS738NVsAfNsJ2zsFK3oqhg4ethZ0uN63nI9pSz+IMZfahRfKZFd14IXbQsW0zVvj7N6fNir5E6yknl0kbAEN1LULWGPba1TFw3BWp2LcYy9KNGaW4t9K6vMS6NpNN9GB6DM2g5s7JQ7afyo8iXLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com; spf=pass smtp.mailfrom=mail-mps-ses.monolithicpower.com; dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b=odfbtm/a; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=1eEe4AwT; arc=none smtp.client-ip=23.251.242.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail-mps-ses.monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b="odfbtm/a";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="1eEe4AwT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rodjp4ft5fg4rp24cb2ntayvghblvgrq; d=monolithicpower.com;
	t=1773827265;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=7zewBI86x50kHE6VnVVTOOkyF0H+8PeuJzCleskEe9Q=;
	b=odfbtm/aaavMHZ0DmchObLG0eJgcdAvqiiFyU1WSHAAdol49yP28w4I3lPAlhweP
	TEcEIM3tyr44t+1EyXdHbRK2/LQX6TKWwmiRAr43rTBO3bEEJ0KTW8C0N7WpVLidJJk
	1TGWIzYPd+gdx6CyuS5WOfa9+lN7cUr1tOkSXKCJ0Ppfky5lhbnzRLjnFGbOSMWR3dI
	inqqqrwebBPfEWkmFgNt801dus6uZBQdfCiAI9BGxWVM58a9ICApp9u1BKHZT/3va5+
	0cpf6tI3kPF1OJ2qwxqkuzX5Jqdp015sHnUVBdtuaPDppR6zIK2ggBmNmD9uA8YDqT2
	LMnsNJwU8w==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=voqdhibj3ww47nmt5hkqcrgg7xiynmza; d=amazonses.com; t=1773827265;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=7zewBI86x50kHE6VnVVTOOkyF0H+8PeuJzCleskEe9Q=;
	b=1eEe4AwTDXvpBP+ISdjRY0pfisPgqsU1GUCcdycjz/4dsaDQXJViT2T8vixiSlhv
	idLSRx49J7oPAmf8GgJ6Fjy4bXeuk7kVLP4fNx7Lo+L3JJTCZkb4X4gT60BAMdst9G9
	dLF/ystFA4oAQNZoMiqt26GNk8WHrt+s3ekw3nOw=
From: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
To: Yuxi.Wang@monolithicpower.com, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, paweldembicki@gmail.com, 
	carl.lee@amd.com, ythsu0511@gmail.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, wyx137120466@gmail.com
Subject: [PATCH 1/2] dt-bindings: hwmon: pmbus: mpq8785: add mpm3695-20 and mpm3690s-15 support
Date: Wed, 18 Mar 2026 09:47:45 +0000
Message-ID: <0111019d00581351-82f8e649-34b4-4f57-b08c-cebf9d486454-000000@us-west-1.amazonses.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20260318094635.1873-1-Yuxi.Wang@monolithicpower.com>
References: <20260318094635.1873-1-Yuxi.Wang@monolithicpower.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: :1.us-west-1.CVpA5H5M7EMrIGr0u6+8nP6wkCH59pkYLxtNQh1UjuczBtN1WmV60RtUapmzBbQ7+P+SiHg5vbyEpY0uRvudPF12wRQI7xDHNKjWPMJN/yd9hVbV9UslJ09o7rVZZCRhPDXT8kPM9Nch5RQcZE90uz62B8giHS2hgInWMbQKX5A=:1.us-west-1.yP6/L6iaxFc47BvsTr22yvAX3nKjbzwVEN8jceuJEpw=:AmazonSES
X-SES-Outgoing: 2026.03.18-23.251.242.8

Add device type support for mpm3695-20 and mpm3690s-15.

Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
---
 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
index 90970a0433e9..86e979cf0a00 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
@@ -19,6 +19,8 @@ properties:
       - mps,mpm3695-25
       - mps,mpm82504
       - mps,mpq8785
+      - mps,mpm3695-20
+      - mps,mpm3690s-15
 
   reg:
     maxItems: 1
-- 
2.39.2

