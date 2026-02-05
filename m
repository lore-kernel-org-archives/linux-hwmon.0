Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0577738B7BF;
	Thu,  5 Feb 2026 10:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770285702; cv=none; b=Uh7pIOtdHJz6Vzoshjm4DUazV72OmPEZzaSH6FFFklj/b72cHu2R7t7ktie2MOMXNyJj3N8/ko6Jgm7UhFk9HJuMWOYEO8JNylI++R8BrLlxxCKMwidnf24ZbCEVM2qbLhm0wUgDvtvDnLsQAba9+ndY7VhLiA6M1VuJCredYoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770285702; c=relaxed/simple;
	bh=o0ItWJn4Gc69vs+y1KGlWH+HnTAkK6kWITna6jXpUxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nunpMK2eosRhTCoj5F+lC1EVJgb7oI8wJIMnFo2mhJRxc+QF7AoWJyIez25anrllkWbT73jonRVFdBvN07RyGJhNhIAOQZFjwbirsyJUf+IkZm3iHyUdX6AaiZ68XGcy8nxzXMyB1ex5+tk8d/qx0VHIbBwUKP7ffY6Ci9XqwpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NX6Ewovs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NX6Ewovs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3FD9C16AAE;
	Thu,  5 Feb 2026 10:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770285701;
	bh=o0ItWJn4Gc69vs+y1KGlWH+HnTAkK6kWITna6jXpUxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NX6Ewovs4wr37a4lxHnW+fAyFZ4+mkxiOZx41D06lZLmmA2SvmqJHykqMi2WQ82vR
	 CvCSllCpiKRv08hyovNE7llDE9e1A9t3vsO/FrQFNabmmNBNIQRpIaNPQKDNR9y2Gc
	 NRZ92DOQpw9alz+ZWicN5igXVaHEuIbepOYtFAgdNSeu5d4zaRTxjTY2vMU42rMuBs
	 mW5R+djtgWTExIaEcHROz5TbnaWt0ASWN4ZjO51lb2HwY6ungoWL+JW2QSntlhLLQo
	 qsBEcD9zm2oR0MFRgsj+oIKbGzzgCYHYpWqXc7O9txGg4k785T9jcWzKrxKh6hA/5t
	 icQlZ0AZP0Yag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DD1EC1E89;
	Thu,  5 Feb 2026 10:01:41 +0000 (UTC)
From: Carl Lee via B4 Relay <devnull+carl.lee.amd.com@kernel.org>
Date: Thu, 05 Feb 2026 18:01:39 +0800
Subject: [PATCH v2 3/3] hwmon: pmbus: mpq8785: force direct mode for VID
 VOUT on MPQ8785/MPQ8786
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-3-3744cd9b2850@amd.com>
References: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-0-3744cd9b2850@amd.com>
In-Reply-To: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-0-3744cd9b2850@amd.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Charles Hsu <ythsu0511@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, carl.lee@amd.com, peter.shen@amd.com, 
 colin.huang2@amd.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770285700; l=1342;
 i=carl.lee@amd.com; s=20260203; h=from:subject:message-id;
 bh=uUNryTHUDVRGoinkT8aURxtPAS6L7bejWtD4269H63g=;
 b=VMo06GX712048wIeOdsmJHxqW1d72ofM4/Su0TefhhhZh/xVTQ+GAhGcD0mngmW/xyROVEt0v
 aEm3zNh7TOVA700szOjV37xENr3f/GOV7qHJT9GV4Z0mIlSBF2u/XAb
X-Developer-Key: i=carl.lee@amd.com; a=ed25519;
 pk=pyq7QaQvoxMg806KVkRwpCbiah+7ncWr4MBpK1AEyjA=
X-Endpoint-Received: by B4 Relay for carl.lee@amd.com/20260203 with
 auth_id=623
X-Original-From: Carl Lee <carl.lee@amd.com>
Reply-To: carl.lee@amd.com

From: Carl Lee <carl.lee@amd.com>

According to MPQ8785/MPQ8786 datasheet, VID mode configuration is
the same as direct mode configuration. Therefore, when VOUT is
reported in VID mode, it must be forced to use direct format.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
 drivers/hwmon/pmbus/mpq8785.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
index f35534836cb8..d6624af076c3 100644
--- a/drivers/hwmon/pmbus/mpq8785.c
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -48,6 +48,25 @@ static int mpq8785_identify(struct i2c_client *client,
 	return 0;
 };
 
+static int mpq8785_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VOUT_MODE:
+		ret = pmbus_read_byte_data(client, page, reg);
+		if (ret < 0)
+			return ret;
+
+		if ((ret >> 5) == 1)
+			return PB_VOUT_MODE_DIRECT;
+	default:
+		return -ENODATA;
+	}
+
+	return ret;
+}
+
 static int mpm82504_read_word_data(struct i2c_client *client, int page,
 				   int phase, int reg)
 {
@@ -133,6 +152,7 @@ static int mpq8785_probe(struct i2c_client *client)
 	case mpq8785:
 	case mpq8786:
 		info->identify = mpq8785_identify;
+		info->read_byte_data = mpq8785_read_byte_data;
 		break;
 	default:
 		return -ENODEV;

-- 
2.34.1


