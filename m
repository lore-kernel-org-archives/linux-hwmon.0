Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8084778F3A;
	Mon, 13 Jul 2026 21:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783976875; cv=none; b=hiGBgPYnU2UZD40E23B0RD4+0d//cFTmpZVpny4t5IClHQPPp5gwETP+xnXwfuPD5cvq2rZmJEBtVeydrIVCdbsrgB8wqIlx9fxNFZ3jzYymycTwfhHkydbVnOOGbNXD8odQJaSRfpdCgPVFcDJ0e1nDKNpCeHZgfPvsXZqU3EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783976875; c=relaxed/simple;
	bh=VDWmE7Fa1F2vT3xKe0ocMykZFpmZprSW0/qbwJAKmeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=p8GbW4oOe+qM9zavQhknNeNPhb7SSskQxloOQYB/Zg4XNvdFOgJfM8GYDXJHIKDtwZqHGKR7d7jMd9bN0ONy+WkB/h53hGmPmAwGFhJtMiEF+xr6QTYM1nIfNXlcH3sPMA74NYzXGiextTOjq6Dd+VJ6SQElWigExJl5/cCZ5F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKMjxLdX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKMjxLdX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1074EC2BCB8;
	Mon, 13 Jul 2026 21:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783976875;
	bh=VDWmE7Fa1F2vT3xKe0ocMykZFpmZprSW0/qbwJAKmeY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=XKMjxLdXz4HIerjr1kRkjM/TePHTFEbpzajccga5ewkQIC9rEvpTkz9I7APG3LtHK
	 O1K7yLtLQQrYxlLSkqipNTJ7eFsp4UOKH8CUAlICNSkY9x9tQs5E4d2tsFtiYAAKwx
	 TuhTg9hHR4MAAjCWnM1GCrTe4CRUPrssdUuaTF3skb+uyn9gWljaYXPTr8MQOjtWCy
	 KlPs9SEfurxZgZaw3/edudix0FWZDcCw/naWLy5gI+PUPJnLnARYNbin/TJNXUPJO9
	 H6RAMXtDkvFOv6V1HK42D0BfOPpli/cD8el3Nl461K+nlKRFG1jMozmJbbM0u4fMyZ
	 Cfx8bE6bXU2HA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0740C43458;
	Mon, 13 Jul 2026 21:07:54 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 13 Jul 2026 23:07:54 +0200
Subject: [PATCH] hwmon: (tmp401) register with thermal subsystem
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-for-upstream-hwmon-tmp401-register-tz-v1-1-47315d8617bc@free.fr>
X-B4-Tracking: v=1; b=H4sIAKlTVWoC/x2NywqDQAwAf0VybiCrpWJ/pfSgNWoO+yBZtVT89
 257HBhmDjBWYYN7dYDyJiYxFHCXCl5LH2ZGGQtDTfWNWtfgFBXXZFm597jsPgbMPl3JofIsllk
 xf3D8uTR0AzcEpZWUJ3n/P4/neX4BN85exXcAAAA=
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783976874; l=1435;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=KjziWIi0OltnNwCWGxqiR9hdiO69mfw90Ja+vvlTw18=;
 b=PDafruWlxKd+Zk51eUp/TVu8YihLTuQ1OXVy5lEYlD4EGX56l8xI9Rc7l+XmakcCc4uzGaSOD
 6QfYJZ+60K1BsFQzdVXe3DW1b6luC+aK8F+ix0TKYXJNGLduKOoiTnI
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

tmp401 is missing HWMON_C_REGISTER_TZ. So a devicetree thermal
zone referencing a such sensor ('thermal-sensors = <&tmp411 N>')
fails to register it. Then its cooling-maps is not set, which means
that the fans are not managed.

Same as lm90 or jc42, set HWMON_C_REGISTER_TZ.
Boards without the property into the DT keep the same behavior.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
It was checked on a LX2160A board that uses a TMP411 for the chassis ambient
input of a fan thermal zone.
Without this patch the zone silently never registers.
With this patch, the zone registers and the cooling-map drives the EMC2305
fans.
---
 drivers/hwmon/tmp401.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
index ca0ff525ea29..83aafe4bd3e7 100644
--- a/drivers/hwmon/tmp401.c
+++ b/drivers/hwmon/tmp401.c
@@ -695,7 +695,7 @@ static int tmp401_probe(struct i2c_client *client)
 	info->type = hwmon_chip;
 	info->config = data->chip_channel_config;
 
-	data->chip_channel_config[0] = HWMON_C_UPDATE_INTERVAL;
+	data->chip_channel_config[0] = HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL;
 
 	info = &data->temp_info;
 	info->type = hwmon_temp;

---
base-commit: ca078d004cf58137bcf8cb24a8b271397431ba58
change-id: 20260713-for-upstream-hwmon-tmp401-register-tz-d07130b9be30

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


