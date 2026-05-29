Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7808426ECF;
	Fri, 29 May 2026 20:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780086733; cv=none; b=aDpuv0zdwfm5vylnsfC31+roHE3PLBn+F8dyp/BlJ9i2RtXVN9yNG6FOGNU1/MLFCkkMzuFibKttqKIsycpNAIhwhQg10d9niVtl5HkAt1h6pJl3s+OUJoVsx9K1smSkXW26gVWBWCzPKgG4gnAP8GJ32z4Ai7SR0JlH8/wJz+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780086733; c=relaxed/simple;
	bh=3QsUbMpVUkArcusVPY5UErnvHj9XVnkKMZ9qLaQv+ec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oA0OnJ366E7EfEw3lWO30OAd4kRlFuOvL4TQszBunpt/2qfGSrPJEcDHivVsOW8f9hoYXxHQIPKbtx8X6dpU+fkf7ZGtM0cJ22h7ixwK6Rb87IIkoPYBZptfYbmq78AMhSeOkg5CRUD6ZXTWHgXhw/RNS6gNWRIHIK+svuA3fqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ZUYZ4HwK; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ZUYZ4HwK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780086726;
	bh=3QsUbMpVUkArcusVPY5UErnvHj9XVnkKMZ9qLaQv+ec=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZUYZ4HwKdBPDloKDwUIuUqtWK46h579aQ1iG0VO40wAPg8nIJlQ0HW832gCJ/Ol+w
	 UP9/5ZWgUXG5zea3LqjvOfVRjcdmilYE9qViwLZTyCk05txHIl06PobzHcmONxxZVB
	 lpTiH+Br/j1wrxYyG6/DgVE8+Pg4ayOjvqDbRRso=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 29 May 2026 22:31:54 +0200
Subject: [PATCH 3/5] hwmon: (cros_ec) Split out
 cros_ec_hwmon_get_thermal_config()
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260529-cros_ec-hwmon-fan-curve-v1-3-da6792b3830f@weissschuh.net>
References: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
In-Reply-To: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780086726; l=1631;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=3QsUbMpVUkArcusVPY5UErnvHj9XVnkKMZ9qLaQv+ec=;
 b=hBk5vPotZsuEiZk110/iVOK7EQrmj929+wBI5/BxszFadaZ0liGYn8nHDSKxfVOoE5xmktH/W
 cjaE7fFQQl4DKZz55N2xrxKMP+zk8utw/pdeXW/YeWrG/uaBMdpAXtd
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Some upcoming changes require access to the raw
'struct ec_thermal_config'.

Split out the logic to get it from the EC into a new helper.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hwmon/cros_ec_hwmon.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 932e45caba9c..a6cc909e56b7 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -117,19 +117,31 @@ static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8
 	return 0;
 }
 
-static int cros_ec_hwmon_read_temp_threshold(struct cros_ec_device *cros_ec, u8 index,
-					     enum ec_temp_thresholds threshold, u32 *temp)
+static int cros_ec_hwmon_get_thermal_config(struct cros_ec_device *cros_ec, u8 index,
+					    struct ec_thermal_config *config)
 {
 	struct ec_params_thermal_get_threshold_v1 req = {};
-	struct ec_thermal_config resp;
 	int ret;
 
 	req.sensor_num = index;
 	ret = cros_ec_cmd(cros_ec, 1, EC_CMD_THERMAL_GET_THRESHOLD,
-			  &req, sizeof(req), &resp, sizeof(resp));
+			  &req, sizeof(req), config, sizeof(*config));
 	if (ret < 0)
 		return ret;
 
+	return 0;
+}
+
+static int cros_ec_hwmon_read_temp_threshold(struct cros_ec_device *cros_ec, u8 index,
+					     enum ec_temp_thresholds threshold, u32 *temp)
+{
+	struct ec_thermal_config resp;
+	int ret;
+
+	ret = cros_ec_hwmon_get_thermal_config(cros_ec, index, &resp);
+	if (ret)
+		return ret;
+
 	*temp = resp.temp_host[threshold];
 	return 0;
 }

-- 
2.54.0

