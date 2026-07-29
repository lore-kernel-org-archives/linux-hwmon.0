Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C659B42B31D;
	Wed, 29 Jul 2026 21:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785361918; cv=none; b=NfKYR1veI8vkEjRX6+Bw8mnd2MHyICPkpPVUOfXYo5uWT67xiF37YgfoQrC7EvWL73ASl0Ejx0PPuO8lYjaAsmV0Ob3Y27GD8GMxDTeMQx4hPIObCoEpajbECuHfsIKwZbFt9dK615cX0jx7TSOcvPs1wmOPso7K9MaBdeebeOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785361918; c=relaxed/simple;
	bh=vsJv0AIc2NxCjVR9QInhzmvZIgG6Q2KWoa5GBvNgGNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r1bVWwZHK/qEyoX3NRdTb4noy5xLEgR1TWXOfOVfwPrICdxbFa3lEMI5EyqEopKc5xiNM9XkX9fr+JPgen2Fj4tt5tx3q+BLRdSopJb8iZMrDJoh2pSbyEqVG9O+t4dyxjfQ0VWeOpQsESSnFr081nFEwTEfQbKxUneEIhmD/8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=REAr5y41; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="REAr5y41"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADBFAC2BCFA;
	Wed, 29 Jul 2026 21:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785361915;
	bh=vsJv0AIc2NxCjVR9QInhzmvZIgG6Q2KWoa5GBvNgGNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=REAr5y41/93f0iCynAnLkz2rY2qcQgB6Sv1hFtSFMtZSkUTDaiPl1voFE07uyaa2x
	 6AosWAsGxgaUVa18MKxRuQg+GNeRvjfa+JzFcVtUsy7goqs8uZTLMu61jtljm7KBDt
	 fk9J+nqKZRPSdqX2OiA+eLq2GKeHsFARAQycje+Uno3BL55uUNM3w20T0OZdami+5R
	 HI1QK4Ue993tqgh4/RZba7lnF6aFkDsDha/orl7rHjT75VhpkKWxy+CZ3Y5GJnxQGf
	 aNo7XfF55f8DVquRIcs8GNyabsqeRJ0n6NFwFtqrxmbDux+vqZa/Wu+vIjKe+Ezfix
	 +ajvuQTqkRXyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90321C54FCD;
	Wed, 29 Jul 2026 21:51:55 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Wed, 29 Jul 2026 23:51:44 +0200
Subject: [PATCH v6 2/4] dt-bindings: hwmon: pmbus: add MPS MPQ8646
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-mpq8646_v0-v6-2-98848151cdb4@free.fr>
References: <20260729-mpq8646_v0-v6-0-98848151cdb4@free.fr>
In-Reply-To: <20260729-mpq8646_v0-v6-0-98848151cdb4@free.fr>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Charles Hsu <ythsu0511@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785361913; l=1162;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=a+CG730JpK5wjHqaq0LPgcAJ+BdTq/WBHRpNWo3nNgc=;
 b=MYRpbPFiZjEfz0aiYNXo33QLMHbk+1lqVG+S4xMbqEkdsylJ6q+KFTwCEhIev443iX7z2jkVS
 N0PsZTEX3JnAiCZiyXL1ImqksbKR0GQbReOtoA2dEkSWH0LTSYOSssk
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

The MPS MPQ8646 PMBus step-down converter uses the same
mps,vout-fb-divider-ratio-permille property with the same constraints
(maximum 2047, default 706) as the mps,mpq8785, so add its compatible
to the existing schema.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
index 90970a0433e9..d7a32fb3b7af 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
@@ -18,6 +18,7 @@ properties:
       - mps,mpm3695
       - mps,mpm3695-25
       - mps,mpm82504
+      - mps,mpq8646
       - mps,mpq8785
 
   reg:
@@ -52,7 +53,9 @@ allOf:
   - if:
       properties:
         compatible:
-          const: mps,mpq8785
+          enum:
+            - mps,mpq8646
+            - mps,mpq8785
     then:
       properties:
         mps,vout-fb-divider-ratio-permille:

-- 
2.43.0


