Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367F639447B;
	Tue,  3 Feb 2026 08:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770106535; cv=none; b=L7L0H1VDexckH6hUys+EnpHLpOFF1ojl6+XPOAgLsEEzm7HNp7w+m9XJmeShaMAxqK3+sSZedoxXuVrVrLApzyAwSKudwFuLBciFPVJrdVTAYbNtN5tI0mH/bdeeKEl+6xExhzLbQSPtx215bEtO8RZLmE1a0LWfS1BC2vHEPA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770106535; c=relaxed/simple;
	bh=Xr5vYxY9iSkC1jppDJsn54tbk0Zaw6BQx+OavRDXIhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SMiYf6Lme+b9tgD+pAcToLlF7WLDz/drCyvhtDmaMvu4Y9zdYCzqaLzGdfJDUvF9Vsw/XYy6yMA/xRmPFQIKjdgmSIuQ/ZUjY/3DUai5582+1ERRqpz6tRPXTodHLxuzTMQ9eRBUcDmccCT1GnngypDfC05fOU/dBCZyEEhwdnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ApQH2wnL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ApQH2wnL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 764DFC116D0;
	Tue,  3 Feb 2026 08:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770106534;
	bh=Xr5vYxY9iSkC1jppDJsn54tbk0Zaw6BQx+OavRDXIhM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ApQH2wnLywafZv3g+joqzWzgtax+pakez/p0PMuLX23O1J+rAhK3UQsFMWytvnL5Y
	 wSNtln64Bsr8kykOB42331GPNOarzUmcqr8ALgPoHFRbi/o2Bacq2j8fc+HOiLpviG
	 Tf2AIIdzpK2xagf9h59dZ97VcfDTDi6cYxN5wI5BTpksS9/KrLLQ1TSYOOBEwpS3rZ
	 Vox43tPQwIExnLdAoUoKQOJ7wmtvvf4u9gDUzd1g/28JZ31cgP8/tUM70yAbKIYdvA
	 qOfMH39Y/EAjuJvsaqBy8hMoGOi7EYMJBKhV/SLu2Cb/xEAGVo4TZcbELYUNYDasvT
	 y/kCr1cGXUg4g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6837AE83061;
	Tue,  3 Feb 2026 08:15:34 +0000 (UTC)
From: Carl Lee via B4 Relay <devnull+carl.lee.amd.com@kernel.org>
Date: Tue, 03 Feb 2026 16:15:18 +0800
Subject: [PATCH] dt-bindings: hwmon: pmbus: mpq8785: add MPQ8786 support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v1-1-67b041e2f762@amd.com>
X-B4-Tracking: v=1; b=H4sIAJWugWkC/y2Nyw6CMBAAf4Xs2U3aWrH6K8YD2AX20IddEBLCv
 9sYbzOXmR2ECpPAvdmh0IeFU6yiTw28pi6OhOyrg1GmVUad0c/Yc/QcR8FpDSliDv0iGPLbXd0
 FO+//3KIsOacy42CdsjdyVmuCWs6FBt5+18fzOL5zrGO9hQAAAA==
X-Change-ID: 20260203-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-f48049e8411e
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Charles Hsu <ythsu0511@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, carl.lee@amd.com, peter.shen@amd.com, 
 colin.huang2@amd.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770106533; l=1150;
 i=carl.lee@amd.com; s=20260203; h=from:subject:message-id;
 bh=m6rFz0ihAnzLuhISl1ijaSTJgrFoG6AoFOau5DfN0xY=;
 b=Q3T/THY9jMnJWZZUerK7LkVKjNZo9m6jjU16kd36W/fczr5Ft9LpqayK80e9Q0SCemSwp+8v7
 Nl/ODBKfYT8C6gYlXr6xmhbXjowUpfgPA+Y3gwI+mP8Ayy00GaidKSz
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

---
base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
change-id: 20260203-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-f48049e8411e

Best regards,
-- 
Carl Lee <carl.lee@amd.com>


