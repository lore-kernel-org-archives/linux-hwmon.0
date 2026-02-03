Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A35729BDBA;
	Tue,  3 Feb 2026 08:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770108201; cv=none; b=uUydRw/5QEDGbuV9u+ZsegxTjxYJZ4ASzTO/PhE5z415E4TTaORVNOww3nox0Cyc3d8kufLRPJ4MLRdi5yQpBivjE4i6GyC2yZ9ABeRaGQ5UmK4BYQbreJxCcvrI1XE3sb8AWp4Ce2ltYPI41pkgGJ6moccLtUahRDRkHRBinGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770108201; c=relaxed/simple;
	bh=hV/ruXO7UDFq1C/AfF42iwnnxPKhJd1hDbMI3qPFY2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fUrI6KjU65VBCnBwWOsssQiefhXU5q1D9kaJ+fho8Y8bRnNOLJubtvBEl9wEwIaoxPPfYaEKGHOiQyVJnm8AJ8JA6wGacVMOiLR2s7ctTBiupw5e2cvmx5l0IWiPMBeQcPd9RHQdOv+mK3eMH6ynfUXS4SAW/3QJTL4c1jpjg6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNMpFlXi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNMpFlXi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BFF5C116D0;
	Tue,  3 Feb 2026 08:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770108201;
	bh=hV/ruXO7UDFq1C/AfF42iwnnxPKhJd1hDbMI3qPFY2g=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=HNMpFlXi626HBEfHhN/FmLuIFbBREWixMW8MQcl0CUYhF02R2ckqtWz/rAUfvmsMj
	 vscK5rxRgMe2ulQePnCO/mvNdVGc20+SI3rOxZuggNhrYHfvkAk/UpwnX4As+lLHKH
	 9kNb/695CpxfNt8KI/ozflIBZ0GYJ0Pzs+C+uibfhB72MqFBwHLrZuPpMjr+jhK6Rq
	 8TqHf+36sGJZ6zBqWcLTL38EBoRVT5O/loxyK4vP5LccMpqZcX66DPAWv9edbc0nsK
	 e5jG9/xgjCpPzEQ8dJMQcHHEUpnRysT0a4tKPL02PlckV6++FChjzbZA9/MsKxZwoV
	 FBKeNlt6iSrjw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0404E8305D;
	Tue,  3 Feb 2026 08:43:20 +0000 (UTC)
From: Carl Lee via B4 Relay <devnull+carl.lee.amd.com@kernel.org>
Date: Tue, 03 Feb 2026 16:42:58 +0800
Subject: [PATCH] hwmon: pmbus: mpq8785: add support for MPQ8786
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-hwmon-pmbus-mpq8785-add-support-for-mpq8786-v1-1-9ff8c7c50242@amd.com>
X-B4-Tracking: v=1; b=H4sIABG1gWkC/y2NQQ7CIBAAv9Ls2U0opFD9ivHQlsVyAFbWqknTv
 0uMx5nDzA5CNZLApduh0itKLLlBf+pgWad8J4y+MWilrdLK4PpOJSOneRNM/BjdOODkPcrGXOo
 TQ6l/b3EgZxZ3tnPoDbQiVwrx87tdb8fxBYEl4UV9AAAA
X-Change-ID: 20260203-hwmon-pmbus-mpq8785-add-support-for-mpq8786-5e73c796bf13
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 carl.lee@amd.com, peter.shen@amd.com, colin.huang2@amd.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770108199; l=3052;
 i=carl.lee@amd.com; s=20260203; h=from:subject:message-id;
 bh=+PacOTgLkW0YQft+ipYSb3SkImmHU2R/2tpMwxSBWcI=;
 b=Yd7JCbyvZZMcmdLFPfzl/4O8EFB4TwLDrohyaFVZSwFABjGUoyqWynWW9RheKLDA61zIxDfC6
 9QbRfn67CNzAP/D9FOWXiTut46X8g4qZloJPjrNhBkgPZDbKrh6o7Km
X-Developer-Key: i=carl.lee@amd.com; a=ed25519;
 pk=pyq7QaQvoxMg806KVkRwpCbiah+7ncWr4MBpK1AEyjA=
X-Endpoint-Received: by B4 Relay for carl.lee@amd.com/20260203 with
 auth_id=623
X-Original-From: Carl Lee <carl.lee@amd.com>
Reply-To: carl.lee@amd.com

From: Carl Lee <carl.lee@amd.com>

Add support for the Monolithic Power Systems MPQ8786 digital voltage
regulator.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
 Documentation/hwmon/mpq8785.rst | 7 +++++++
 drivers/hwmon/pmbus/mpq8785.c   | 6 +++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/mpq8785.rst b/Documentation/hwmon/mpq8785.rst
index 198d5dfd7c30..39306033990f 100644
--- a/Documentation/hwmon/mpq8785.rst
+++ b/Documentation/hwmon/mpq8785.rst
@@ -8,6 +8,7 @@ Supported chips:
   * MPS MPM3695 family
   * MPS MPM82504
   * MPS MPQ8785
+  * MPS MPQ8786
 
     Prefix: 'mpq8785'
 
@@ -38,6 +39,12 @@ buck converter. The MPQ8785 offers a very compact solution that achieves up to
 wide input supply range. The MPQ8785 operates at high efficiency over a wide
 output current load range.
 
+The MPQ8786 is a fully integrated, PMBus-compatible, high-frequency, synchronous
+buck converter. The device shares the same PMBus interface and register behavior
+as the MPQ8785, but provides a lower output current capability of up to 25A per
+phase. It offers excellent load and line regulation over a wide input supply
+range and operates at high efficiency over a wide output current load range.
+
 The PMBus interface provides converter configurations and key parameters
 monitoring.
 
diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
index 1f56aaf4dde8..f35534836cb8 100644
--- a/drivers/hwmon/pmbus/mpq8785.c
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -12,13 +12,14 @@
 
 #define MPM82504_READ_TEMPERATURE_1_SIGN_POS	9
 
-enum chips { mpm3695, mpm3695_25, mpm82504, mpq8785 };
+enum chips { mpm3695, mpm3695_25, mpm82504, mpq8785, mpq8786 };
 
 static u16 voltage_scale_loop_max_val[] = {
 	[mpm3695] = GENMASK(9, 0),
 	[mpm3695_25] = GENMASK(11, 0),
 	[mpm82504] = GENMASK(9, 0),
 	[mpq8785] = GENMASK(10, 0),
+	[mpq8786] = GENMASK(10, 0),
 };
 
 static int mpq8785_identify(struct i2c_client *client,
@@ -87,6 +88,7 @@ static const struct i2c_device_id mpq8785_id[] = {
 	{ "mpm3695-25", mpm3695_25 },
 	{ "mpm82504", mpm82504 },
 	{ "mpq8785", mpq8785 },
+	{ "mpq8786", mpq8786 },
 	{ },
 };
 MODULE_DEVICE_TABLE(i2c, mpq8785_id);
@@ -96,6 +98,7 @@ static const struct of_device_id __maybe_unused mpq8785_of_match[] = {
 	{ .compatible = "mps,mpm3695-25", .data = (void *)mpm3695_25 },
 	{ .compatible = "mps,mpm82504", .data = (void *)mpm82504 },
 	{ .compatible = "mps,mpq8785", .data = (void *)mpq8785 },
+	{ .compatible = "mps,mpq8786", .data = (void *)mpq8786 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mpq8785_of_match);
@@ -128,6 +131,7 @@ static int mpq8785_probe(struct i2c_client *client)
 		info->read_word_data = mpm82504_read_word_data;
 		break;
 	case mpq8785:
+	case mpq8786:
 		info->identify = mpq8785_identify;
 		break;
 	default:

---
base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
change-id: 20260203-hwmon-pmbus-mpq8785-add-support-for-mpq8786-5e73c796bf13

Best regards,
-- 
Carl Lee <carl.lee@amd.com>


