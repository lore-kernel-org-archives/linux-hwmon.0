Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37EB3C3448;
	Fri,  8 May 2026 09:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233495; cv=none; b=Z+eoQD/KfHxA2/3K9IhflB/LSKDDXlv83lpSoI8D9kt17FyUtXXjJC8xZffe0+Z6ZX9/iUNq3uTL96o09VnPl97ExTRCJNtFbFV/fJzwmvQNJUi6OsEEpysvp/oJJjAh2pKZJGtBWd+Q+/eQBK6v9J4gKF062dLkG+PS1WZQEvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233495; c=relaxed/simple;
	bh=69uCJbJDhXR/OPD1TZDfMzCPxTti/NCrOtrj0qifp4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XXrcQsqa628EiLsHjPOSJsQzscGPsy26FXebG9RN26T5vs5G0wZ0DVJvHmm8nFzX5fQ8SWi30UHeUyloVm3kOhVS9a2J4ieEZ+zUi/vb3k4EAiJvye2HN4IMVJg7Yq4PTUMaNX5/YIOBHbCL9WodPx4KqfpIjWNdfsbbzQ/i5gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KpzPGxid; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KpzPGxid"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D899C2BCC7;
	Fri,  8 May 2026 09:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778233495;
	bh=69uCJbJDhXR/OPD1TZDfMzCPxTti/NCrOtrj0qifp4A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KpzPGxidGJ8yhtFtXssi1HeVtjb1aUcczYnShd5VgiN1O18H2petzPn1TO7MOHW/M
	 zt/lYkORNg5IY7sgdEWuludYNgR+rNqLu3GeFBgJ/n2UGYflX8oqRBU2YZmhtIb2vm
	 7Cm5jMZImxxPa2Na/803kTN4koDxGM8PkKHtt87Zqrtcd2BIVPhoSnXaqlO6JeiFWi
	 6kXobpzxFDL9gD396fg4uaZ94dE0ZX7WIX+LTAPxzSR0StR7DUunUphPwHef14xHgE
	 O6uLqNdP5SpFwkutrdG4XzvwV1j629tU0deXTwiaylf3FSPIT0rcUZ4PJmbBiHvwuO
	 JjkVjyB5a8dUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E313CD3436;
	Fri,  8 May 2026 09:44:55 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Fri, 08 May 2026 17:44:28 +0800
Subject: [PATCH v5 1/3] dt-bindings: trivial-devices: Add Delta E50SN12051
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-add-e50sn12051-v5-1-abebdcc29665@gmail.com>
References: <20260508-add-e50sn12051-v5-0-abebdcc29665@gmail.com>
In-Reply-To: <20260508-add-e50sn12051-v5-0-abebdcc29665@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Chang <kevin.chang2@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778233493; l=932;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=BgW8zMkOvHttDiEUcHy6hcle9cw258caoKT/SxPSyTQ=;
 b=iRPEGRysd4om3K5MrlI4SC9yjHp6mCWLURk8RNI1PDDNDFy6QUtA4FEWe5K6otfEDC6rJ7FTW
 9jK7hKlWhosDYzK2xar7/VlDksyRC/v3zN4r5BGTCJRDhuLWO2F6oaZ
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Colin Huang <u8813345@gmail.com>

Add 600W Non-isolated 1/8th Brick DC/DC Power Modules, E50SN12051.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 23fd4513933a..0f10368a1386 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -100,6 +100,8 @@ properties:
             # Delta Electronics DPS920AB 920W 54V Power Supply
           - delta,dps920ab
             # 1/4 Brick DC/DC Regulated Power Module
+          - delta,e50sn12051
+            # 600W Non-isolated 1/8th Brick DC/DC Power Modules
           - delta,q54sj108a2
             # 1300W 1/4 Brick DC/DC Regulated Power Module
           - delta,q54sn120a1

-- 
2.34.1


