Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1BC31A565;
	Thu,  5 Feb 2026 10:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770285702; cv=none; b=iFBQiBxvagOfxwzwGbhURE5Q4LKyPbp+KLaPB+SDrAnM7SUllHDDp+soTud9whrVp4+N4+/vQlJ4ExWriQ9M5Nlcqws2Y/Z5sQORNMs0QHtgqKe25Gwk09S9jppef+LhozLpFJSlC6IMJvCslGE4/9aYFo3H7kE0C/sA8T2Xj7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770285702; c=relaxed/simple;
	bh=G57zK63vvGtgsDfzaPgCE/xYaH1Z2/holtmBYCABzvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CmiITNZ0v22cUpQxQnwSlxPcFmjvNPFODpvbtZIQoOqidqqiflBE5Y6RPs/fVugS52kQdFNFgNgWUYgTqS6C5AAvC3+XKgtWR6UfNmd8CkZECBLmPfYFM0dowULEKA5BUDGzCvg7n+n2Va709wB5MJ1M0YRp+A/4saagwyDB4Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bU3AtEK+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bU3AtEK+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF4F0C19425;
	Thu,  5 Feb 2026 10:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770285701;
	bh=G57zK63vvGtgsDfzaPgCE/xYaH1Z2/holtmBYCABzvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bU3AtEK+CGn+Ir4NdI6BiIzU3K/pMnWlKtghZEM3yScgQyqBinmqc3jx9HWeIYl2F
	 JpRH3crrs9z/NXSX7c9JU6S3D0+e/ntLyOh4YvKlbAlUWWLh6+17tuXTOn4o/LQZ47
	 JUDnQNH6a047X/DrKI9JM9qLR/DK7PkHAtP5FtUHwIiDDq0i4hdEhq0yTuXvsEgYeo
	 +TglLqxkY3Y5iTt4oC3kH+pBblHF6OoFl8QNOwmrMfx2AjrDNke7LWMXLncfr0EiR8
	 3A45PZw+Wu2yAowc263DwLGpHCrYfZb3ZN44RCHws5+M9u+J4AsGAmvlp4VPiZ0Y6K
	 LHtA+iGYu9Q2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C4CEC1E91;
	Thu,  5 Feb 2026 10:01:41 +0000 (UTC)
From: Carl Lee via B4 Relay <devnull+carl.lee.amd.com@kernel.org>
Date: Thu, 05 Feb 2026 18:01:38 +0800
Subject: [PATCH v2 2/3] hwmon: pmbus: mpq8785: add support for MPQ8786
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-2-3744cd9b2850@amd.com>
References: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-0-3744cd9b2850@amd.com>
In-Reply-To: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-0-3744cd9b2850@amd.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Charles Hsu <ythsu0511@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, carl.lee@amd.com, peter.shen@amd.com, 
 colin.huang2@amd.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770285700; l=2876;
 i=carl.lee@amd.com; s=20260203; h=from:subject:message-id;
 bh=RJRo1UlIAD5Na+x5KlUjzgyX3K81PgptdiZZtQGDLQg=;
 b=Moi4leam1a/lz1BX25DF2RYSxY3ZhMmuotWye7pZWpalDxga6mMrmJEVZ1CwbhoaThEZ6V9ve
 VC7TINzKVbOCYYsObg46wq9Dys29d88t4e0AS7ohgsu9sNM+2piUWYa
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

-- 
2.34.1


