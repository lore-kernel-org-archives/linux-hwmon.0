Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2D13644D2;
	Thu,  5 Feb 2026 10:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770285702; cv=none; b=BKKb4/9NbIMIXZ5OyQ8ZR11X4gJyPxRUyqzBBk9uAbUkfpWXCqPi64MdbNhFflYsKjKu/y6EQ+2yIey/9oO3x4K4VFNfSytHvSrz9gCcd3k8a5YqcfaMqc6sUFJ+499hUHpd/FCihEw1BSIiZv7U/yj9ok2xE/dbjzK/rZd+zf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770285702; c=relaxed/simple;
	bh=devR7VJmr/xn8ktgzpu6/1ed8rMHKTcaVA5kSFwJ7Jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fi3WdS5Ckbo9g6bav6eANNO1PiYVOphcEnEjuz7IPWCV1zdfeohAkbdarVZujtD5DDdYTJ/EZcL+Hh1l8ZYOrmZ7W04IG+NMYD7scpIR0Qvp88HGqMfodXwyBYYXVdw0Np1A2jr1biLuV1rdnuw+Q/VYDjHjWXdxOAftYmRPsZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ffpYEEa3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ffpYEEa3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB626C19423;
	Thu,  5 Feb 2026 10:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770285701;
	bh=devR7VJmr/xn8ktgzpu6/1ed8rMHKTcaVA5kSFwJ7Jk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ffpYEEa3r2u8D8tBKxCo/Tv4wF2Di/1EhYPTBO5FwUNHZN5pf+q5xFUp5PNoenwQ6
	 k7UshnU02nbyTFdTRw3LkDlhHERxcf81I21zQ/PCn76rzMCwwBqdmWR5rPaneQJEKZ
	 3ymTnfO7OghaNIbcdgU2Ui3bJUjLYpXORaW0JS4BYF0CBg6O/gD8eD4Nvqfb83gn6S
	 d+kkDjWu9rh9EVJ7292uk0Jssl0kXcwLZXJJmZ7AQ9Jpdh78rOBf5XlnR2fMGlsB7E
	 RQWi+JY38ABXAg0a8cz/cf7Y0IVEq9DsZiC/AMgOOQu/79A5CQ+ZwRsBpyFA7HZmEv
	 fKcAZwdOxJLeQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99485EC1E8F;
	Thu,  5 Feb 2026 10:01:41 +0000 (UTC)
From: Carl Lee via B4 Relay <devnull+carl.lee.amd.com@kernel.org>
Date: Thu, 05 Feb 2026 18:01:37 +0800
Subject: [PATCH v2 1/3] dt-bindings: hwmon: pmbus: mpq8785: add MPQ8786
 support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-1-3744cd9b2850@amd.com>
References: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-0-3744cd9b2850@amd.com>
In-Reply-To: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-0-3744cd9b2850@amd.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Charles Hsu <ythsu0511@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, carl.lee@amd.com, peter.shen@amd.com, 
 colin.huang2@amd.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770285700; l=966;
 i=carl.lee@amd.com; s=20260203; h=from:subject:message-id;
 bh=4VP7aSutSEVwewHFNXv1YMwo/Z3h/7GGV0DuOQPQ1hM=;
 b=4jLL+R19hP5vpToXhZfcy/anjN+etq253OapCqYxfFxIg0yFgaN2yMvQAHo8pIGdG+N8k2G9/
 VWaukCD/QVTBm3hbpYicZPWu/IWKXSHi2dAlk7hTqT3ZRTsGTRcuLXo
X-Developer-Key: i=carl.lee@amd.com; a=ed25519;
 pk=pyq7QaQvoxMg806KVkRwpCbiah+7ncWr4MBpK1AEyjA=
X-Endpoint-Received: by B4 Relay for carl.lee@amd.com/20260203 with
 auth_id=623
X-Original-From: Carl Lee <carl.lee@amd.com>
Reply-To: carl.lee@amd.com

From: Carl Lee <carl.lee@amd.com>

Add device type support for MPQ8786

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
index 90970a0433e9..aec7397a29f9 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
@@ -19,6 +19,7 @@ properties:
       - mps,mpm3695-25
       - mps,mpm82504
       - mps,mpq8785
+      - mps,mpq8786
 
   reg:
     maxItems: 1
@@ -52,7 +53,9 @@ allOf:
   - if:
       properties:
         compatible:
-          const: mps,mpq8785
+          enum:
+            - mps,mpq8785
+            - mps,mpq8786
     then:
       properties:
         mps,vout-fb-divider-ratio-permille:

-- 
2.34.1


