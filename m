Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26FF30C147;
	Thu,  1 Oct 2026 21:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790891896; cv=none; b=UewQWtSifS72i8TB927V5t2Y2LsipdmtpV+kuGBO0oIz7XvVxqMuuqBw2/qysFM9QJRQYULDcAlUypDPfKXv0SUQguWZKnTGhzNgS4NmUlwdCLQaOq+Nl5a08v/ZU8gDE561aYBaZxzeX1B7uKhyJMLwxRXVnuzNpGT+D8cV80c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790891896; c=relaxed/simple;
	bh=ZZfa4SIN+PSF1Rrn3m8d7MZfagkknuPMHuc8cUaAr38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=go4hSJDUSzrq0sD/QuK8R4CjwQqlNJq8NYllXLcHYgS+iUPz8IhU9LO8dMLYNFkIgecRoOPPhGsaOxd3/AjZ9X1wearS8/b79RfomFvrc/WPkPYekdVp5hlKP922XqsCQdFVZHMa+i7rLdj6FMk3m4DnwcZGpGbcYuStZMkpEJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EUA8tVkm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EUA8tVkm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59388C2BCC7;
	Thu,  1 Oct 2026 21:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790891895;
	bh=ZZfa4SIN+PSF1Rrn3m8d7MZfagkknuPMHuc8cUaAr38=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=EUA8tVkm9cUG8PYCzTEp81YqGlAvLWlGlLBOOLQoWa+eWHoCfibowOcxhbV09LoEo
	 a7viTeKjcWzxLWQ8IAjPdVOjyu4+pAD3rBOdnjBExw/kc43b+ORNmt9q2m1jhQDMC9
	 yQgacdRjHT4Cf52k0Kt+pWQwpl/a+zR7ywUQzK2SeFaOdl8SfynVJSzb0OjqBCYDq0
	 epXE1N+umF0ipOopvd19T67hgO90stZx10uObsk3d1+uSecegibqBNejs5k25QbHsp
	 AwqUMc1G39AjOFeMj732FkqSgC7uAEyRG/zOpHyK5XR+2ZFZVEnfGyow/SpAQieWSO
	 28IiHmj/LDjpw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35460CA5FCE;
	Thu,  1 Oct 2026 21:58:15 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Thu, 01 Oct 2026 23:58:14 +0200
Subject: [PATCH v2] dt-bindings: hwmon: jedec,jc42: add
 #thermal-sensor-cells
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-for-upstream-dt-jc42-thermal-sensor-cells-v2-1-6edd30b082f3@free.fr>
X-B4-Tracking: v=1; b=H4sIAHXXvmoC/52NSwrCMBRFt1Iy9kmS2oCO3Id0ENIbG+lH3otFK
 d27sUtweO6Fc1Yl4ARRl2pVjCVJmqcC9lCp0PvpDkpdYWW1dfpca4oz0+spmeFH6jI9wslS7sG
 jH0gwSfkDhkHIdyZAN8Y5E1TxPRkxvffWrS3cJ8kzf/b0Yn7rP5XFkCFEV7smeNga18jAMbJqt
 237AgxynOHgAAAA
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790891894; l=1440;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=8mjDlcGI3Cj4EQONFKljx6GXc0o6W4X1o0EOPy1FmU4=;
 b=tKsE662/gABLgXKroy1YEXHqY5YCQC7VXTP/I3yUuywSdQriE/UBFNhmEBRoVb/pKmW/i2UfI
 orl/JKz0dw/BoIgFBXa8GdxIaJ5qVpRoS27HfBG/mQeH0AWhgOv6S62
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

Since commit 032c1623c9de ("hwmon: (jc42) add HWMON_C_TZ_REGISTER") the
driver sets HWMON_C_REGISTER_TZ, so the hwmon core calls
devm_thermal_of_zone_register() for its temperature channel and the
device can be referenced as a thermal sensor.

The chip has a single temperature channel, registered as sensor 0, so
no cell is needed.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
Changes in v2:
- fix sentence format (Krzysztof)
- record Krzysztof's Reviewed-by
- Link to v1: https://lore.kernel.org/r/20260930-for-upstream-dt-jc42-thermal-sensor-cells-v1-1-ef6365cae23e@free.fr
---
 Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml b/Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml
index bf3332153ad8..d835664a926b 100644
--- a/Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml
+++ b/Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml
@@ -59,6 +59,9 @@ properties:
       supported on all chips.
     type: boolean
 
+  "#thermal-sensor-cells":
+    const: 0
+
 required:
   - compatible
   - reg

---
base-commit: 4781ca52761e666cf18b591e6bb0478396c90320
change-id: 20260930-for-upstream-dt-jc42-thermal-sensor-cells-ad1ce051661c

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


