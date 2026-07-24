Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA7629B228;
	Fri, 24 Jul 2026 04:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784868506; cv=none; b=ckzPsOrQFdM0P4mzm+DsrEaJ6tqssfl/as/2oujHGhF+yVp0BriiCpRE9lDSLxQXHGJwO+53B2snGitjwlpcYZtnP8+YtY1S6XfWQjeSofT0EW6IWTKTwVa6a9FFu0xiyKsVNHo6AX/BnmGO1PBUcsPPIVFY2OFVQ+Cotr6sXmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784868506; c=relaxed/simple;
	bh=QtvNGTmJu3wnH3/EKrsVJTh7dhIcj6i73e0+4O4P2eA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rcOhNLrmP6CIqZx0MlCqeSt8VBrvuNu51b1jaKaFHpqZb6oAYOClqRPsAkj3vsHkKAuyDslsnkMp0ebAl47CQJV5CT4Y0GzHuuPmwahgIBpX3HvxLxsDMztneTeBVBFpMKV7XBKSKNmo+IAS+JrcyzWnHtJ1kifzmQBu/E4Sca8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5UBuLof; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5UBuLof"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AD6EC2BCF7;
	Fri, 24 Jul 2026 04:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784868506;
	bh=QtvNGTmJu3wnH3/EKrsVJTh7dhIcj6i73e0+4O4P2eA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=S5UBuLoflPQYa0Dm21p7zVQYcdLkb6+Uvj6KhUI50KRPKqEJ6WbPkUK0178E7ADV8
	 cLlOay7m1jZapEz+ZTIhPrieIK0ThayGs08QlXAb/6OqbNENSMtVQEX0EM3lfvHJWQ
	 tZECLb5lyUJVNcToIl10Eeyqv55MeWbrzEif6ZwWpB7Fgq4slq0tfEjHraP24t+m61
	 ZPxVxK8qFagVcnLipcWfaglaeCEmtN+9eBgXChPqvwXy5OPze6dgR6X8oVNKtTpCPj
	 J5+SAoWWaVtmQ27gbLByWi2XabqbX0xHIZCSjjKCOBlGjYb3V/y3FSv7Rc2CRG7D+u
	 dVt1UQCLiBH/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F02C53200;
	Fri, 24 Jul 2026 04:48:25 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Date: Fri, 24 Jul 2026 12:47:38 +0800
Subject: [PATCH v5 2/4] dt-bindings: trivial-devices: Add Kandou KB9002
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-kb9002-upstream-v5-2-9523c3ffe83a@amd.com>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
In-Reply-To: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Chung <andy.chung@amd.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784868474; l=1062;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=TfOP3I9AnbSWPiG1JcCS6En65Z1EONrNQPwWXvx4lew=;
 b=fJmuMEykS6vLWiDtBpkZW2fAtJpHVJIT71Mr3ZgGp1vp8HjL28vKRzgprw0GueLumyxRa1FAr
 E93lYkDygZNDoglXLVobKapTQ8/ENOWHNIXb+F3XxVEKDz9M78y2ob4
X-Developer-Key: i=Andy.Chung@amd.com; a=ed25519;
 pk=X2gaHRnhU2q5hvMjkC6xmIcC03vKNvHY9CQRdsj9ecM=
X-Endpoint-Received: by B4 Relay for Andy.Chung@amd.com/20260327 with
 auth_id=696
X-Original-From: Andy Chung <Andy.Chung@amd.com>
Reply-To: Andy.Chung@amd.com

From: Andy Chung <Andy.Chung@amd.com>

The Kandou KB9002 is an 8-lane PCIe 5.0 retimer exposing an SMBus target
that reports an aggregated die temperature. It needs no device-specific
device tree properties beyond its address, so add it to trivial-devices.

Signed-off-by: Andy Chung <Andy.Chung@amd.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 435c4baab436..d93d4caa8ab1 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -196,6 +196,8 @@ properties:
           - isil,isl76682
             # JEDEC JESD300 (SPD5118) Hub and Serial Presence Detect
           - jedec,spd5118
+            # Kandou KB9002 PCIe 5.0 retimer
+          - kandou,kb9002
             # Linear Technology LTC2488
           - lineartechnology,ltc2488
             # Regulated 12V, 860W, Digital DC/DC Power Module

-- 
2.34.1


