Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F61C3806BD;
	Thu, 30 Jul 2026 15:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785426246; cv=none; b=q0YTtWzp7Icmr7Ko2QcYLA9zDi6AlXwLo3Ko7sOvPxiJby6P1I+HE3lDV5liXLfX+dALVR9qAaUXwq4yEbpOtljQ0Qbk4+Oaic6YGs/zia9tew2WnuhOS8y8ZyQYVlglUu1m80lIxnJydSqrLSWOT2gBIElqpq0EEskBnRCtubc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785426246; c=relaxed/simple;
	bh=vsJv0AIc2NxCjVR9QInhzmvZIgG6Q2KWoa5GBvNgGNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s68LzBw5sNORx8fl8FRgCpgoElPJz3u4FnASyFLeZk8jQiwfbwCQutb72RuV1twXjI55bZxSNNRtQp+ykql3NgdhCeahrwDQ2w4wXiec9JNN+oNqTnQQVM+oGTBXwNErJgqU4iXUjQu/KBcfyU1ZlEd1o7tTSDuV5oxZM/iUuu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s20jxeBF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s20jxeBF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56533C2BCF7;
	Thu, 30 Jul 2026 15:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785426246;
	bh=vsJv0AIc2NxCjVR9QInhzmvZIgG6Q2KWoa5GBvNgGNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s20jxeBFIbcCk7a35pA7e9ysVXSjOtXh8ZicwYXXc8vgF33Lyza8sAAJ0VHZDUkz5
	 Xp9wM7vDR4MT3G91nNxndApDVjXG1ggLI8dVIZa19B/Tc36f+naVIj9kAleJdSzdos
	 YKwpsmCorG1aFeccq882mtuTNXPGHmmGiln6I18Op1Y05+gq++ysxlBAc7y7grXilp
	 m9yfCrQ95+4kAhj+FwJAz2wnO9mVbHcd8lwWffwlwfGlkvdptXONz8KzzddqlIqw0z
	 lV17BR3S+BeBa+2rYs+vymDHiuibsagbn2x12yTCM5CxIfbbUU3QcWxVL8/YlGrfUG
	 gjwI7kOXJ2NGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35597C55162;
	Thu, 30 Jul 2026 15:44:06 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Thu, 30 Jul 2026 17:44:00 +0200
Subject: [PATCH v7 2/4] dt-bindings: hwmon: pmbus: add MPS MPQ8646
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-mpq8646_v0-v7-2-e7c7ad768d5d@free.fr>
References: <20260730-mpq8646_v0-v7-0-e7c7ad768d5d@free.fr>
In-Reply-To: <20260730-mpq8646_v0-v7-0-e7c7ad768d5d@free.fr>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Charles Hsu <ythsu0511@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785426244; l=1162;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=a+CG730JpK5wjHqaq0LPgcAJ+BdTq/WBHRpNWo3nNgc=;
 b=F9eBJPPQYOAn4J0eH/jsZSLORdY9h58TCERiIR/DzpQEvXw9v15wJKQTYFxWBpyJ0942F1q9D
 KM17Ssfxr5zDLmCAoBRm2ky4pDMkT3mHBRNI2eDJ7mwQYHGS+jTfwRE
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


