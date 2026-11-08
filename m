Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794167800;
	b=gn9QL1iKoR+VrkuQIbowT613TEwOLRAlokLbcQ05qE7Mo012giREKjV+1C73VQYBrbFd
	 P5ESz1pdZD6Ssm2iGK5ZAkNn++BlfDbqAPI0AwM0r+i8Z6j+yduc/ieCvpxNfwUvAMhFb
	 //r4zovGgXq7aq2MQBr0PJ0R0FKXhyDiUJeX8ouEzJiUr2tgW0MHaUgpsG2Qw+E+ZTZDe
	 x3Mfs6be0PPuIJlxp+kThr9/PJ29IUkRU4SRXO53Xq9Wb+aT60dDnbYWw5JZKjzocYvgr
	 iJgMWvBzrlyCjATdie83BVAAONIhw7D/32q/PN70WEg/JWCdFQxgqoUvbuiEXxQXIKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794167800;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XvnuaveuPNnKsJJ40AHHyBiKH4X322TVM9gBKsEt5lo=;
	b=zQ19gs/dr/BAoPUjSqy3QfAuRBJWyXE25KLr+DfbuevuUwoIGTKYbZGjRMvbtvemXXpy
	 zambddFVOVxlBausWh8EfNJjbgobdaBSN5wpSYNORfTn8a7yGIa/VOshIS9Ju9JRJMWgM
	 e6aVIBoupd14siEAbRrxdYyYO6sazfl9lmS4IVv0He1yC0P/E3wWz1Lv9AbJTKSXLraNp
	 4lp+EYJeSME0hCCWmPtmWkzitHA19KmM1RycQrahj6v06R4sq8zi/+XyMAC/kYGxTjL6l
	 g9pHcLuss+TAWd85onDvxqy0H8mWcZlqPPxkOW45gYvHy3i41JrkejkwnMH1AeNUTsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DrN6eXhW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD392606A31C;
	Sun,  8 Nov 2026 19:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DrN6eXhW
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794167799;
	b=T6DYIPvOmY/p5I8nkG7CO9Z12jK38V9W8OIQqJhGvV/U9wWbyoyR4iAgX63CAOR342F5
	 Oi9n8TogpHA4puVk240U6OB0dn0rrCkbqUqQBxaw6Ayl+IrRG4FgIJM+j6TwLX/LhyTIk
	 lv/IOYDjbA81Kuz+m6koJ3dbT/y2ksjUO51pU6jGfvRLWoH3bRU6R4AGwPJjSGHMpNSTB
	 14riyjFXt1yOfXbvauwm1h+MTzab/gR2xddRsIg2cvEI4n2wiRms/VF/kQuXkOMl8Kv70
	 I8rAdjiac3O1Rs9dSuXiOEziZVtyvX50/s+QMuSleBtwBNDjN747eC92BLo9NjsnaGQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794167799;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=XvnuaveuPNnKsJJ40AHHyBiKH4X322TVM9gBKsEt5lo=;
	b=B+2s5e4EsuFT5Gqq6wUITFZNc2LurQ6sprs6k3NJqKcNb2dloxhoPzOopNPo2EvgF/LD
	 fAQcnWA2LhBoWQDJUO8rh74WHTg7P7of/Z0eBr4OrBDisi6ilt7H5OR/JmLDG5D/MpQAD
	 UZUiBg138+hTQPJISK9fIV8gVKAAf8LLVIdMCXDx0V3AIi6Z3yRu15Y1U9CVPf0PAIUm0
	 UPSMVqmECzgmdTCiM5YpjByGKBaQ4toqPVMwjorG4Vlh31AxL52TCal2ZVMydvBYYr2ga
	 C+c70BmS7lJ7lZ+6FVJK/XUkzuELU2M8Ro2LaokAoQZ8qpUqlIprh49g5tD7UWCecsg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 38C431F008A2;
	Sun,  8 Nov 2026 19:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794167799;
	bh=XvnuaveuPNnKsJJ40AHHyBiKH4X322TVM9gBKsEt5lo=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=DrN6eXhWKbBo+EJvszknTv6lsBRZH5WT7YXBi34HhNTTCjkdJyUfgOazarN2M6gi/
	 on+LbR+1kueRyVIYNRvXF3npL+L667Cyrwp5JEXs0LLwRltFjFlj1FSHCvVQyMRr3G
	 oFGGyzvWRE9JAhb0GdvxIQzww/BANPm17pUiTWyKVDjSqX12VoboqNO8hZDqUC6grf
	 JCrVmUe2hpF9NCTyeyrmDILNJDHDJYdSaBJ/01CUdlmQEZfxiTn+4MrSdbOVZepLuD
	 S0gBZs5BYuKpsDrKxvjN1UYpA+nhXWQ4ta9gyy0ow26af0L1OyXCOKn+ciO+/XzLPv
	 +QZWHgITDy59g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9154048096;
	Sun,  8 Nov 2026 19:56:38 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Sun, 08 Nov 2026 20:56:36 +0100
Subject: [PATCH v2] hwmon: (pmbus/core) Add a vout_command debugfs entry
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261108-for-upstream-pmbus-vout-command-debugfs-v1-v2-1-b19d6cd18aae@free.fr>
X-B4-Tracking: v=1; b=H4sIAPPT8GoC/52NQQ6CMBBFr0Jm7RimJKCuvIdh0ZYpdFFKppRoC
 He3cgSTv3lv8d8OicVzgke1g/Dmk49zAXWpwE56Hhn9UBhUrVqi+oYuCuYlrcI64BJMTrjFvKK
 NIeh5wIFNHl2RhK3jhq1qOkMayuEi7Pz7jL36wpNPa5TP2d7oZ//KlBHaTtdtw87cyT6dMF+dQ
 H8cxxeBJwe54gAAAA==
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794167798; l=3361;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=l2avR4NF3IpRrlXXb0U+qVa1eSKDj4CQ+L1XJurs3Eo=;
 b=eeN1x5TdQ+68WCPSGVGXgMj0rrMOCEq4uf81HD/9CPbNDeS4NLrmnjE5z2ItRrWBBknC8v5ZE
 tuImvQ2sl+dDF1rb6x5I3olYbuf8PaYAiO6CY7FtIrDsF1dXxAzn7Cb
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr
Content-Transfer-Encoding: 7bit

From: Vincent Jardin <vjardin@free.fr>

The vout hwmon attributes and the regulator get_voltage() callback
both report READ_VOUT.

On a regulator whose configuration applies a load line (droop),
READ_VOUT sits below the setpoint under load by design, so user space
cannot see what the regulator was actually set to.

max20730 already exposes a driver-specific vout_command entry. Add
vout<page>_command to the PMBus core debugfs, for every page with VOUT
and a readable VOUT_COMMAND, in millivolts like the in*_input attributes.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
Changes in v2:
- Use pmbus_vout_command_mv(), simpler (Guenter Roeck).
- Link to v1: https://lore.kernel.org/r/20261108-for-upstream-pmbus-vout-command-debugfs-v1-v1-1-c7a063efb91c@free.fr
---
 drivers/hwmon/pmbus/pmbus_core.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 37b650b85d1c..6fb91dc1c627 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3833,6 +3833,30 @@ static int pmbus_debugfs_get_status(void *data, u64 *val)
 DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops_status, pmbus_debugfs_get_status,
 			 NULL, "0x%04llx\n");
 
+static int pmbus_debugfs_get_vout_command(void *data, u64 *val)
+{
+	struct pmbus_debugfs_entry *entry = data;
+	struct i2c_client *client = entry->client;
+	struct pmbus_data *pdata = i2c_get_clientdata(client);
+	int rc;
+
+	guard(pmbus_lock)(client);
+
+	rc = _pmbus_read_word_data(client, entry->page, 0xff, entry->reg);
+	if (rc < 0)
+		return rc;
+
+	rc = pmbus_vout_command_mv(pdata, entry->page, rc);
+	if (rc < 0)
+		return rc;
+
+	*val = rc;
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops_vout_command,
+			 pmbus_debugfs_get_vout_command, NULL, "%llu\n");
+
 static ssize_t pmbus_debugfs_block_read(struct file *file, char __user *buf,
 					size_t count, loff_t *ppos)
 {
@@ -3940,11 +3964,11 @@ static void pmbus_init_debugfs(struct i2c_client *client,
 	 * device specific:
 	 *	ARRAY_SIZE(pmbus_debugfs_block_data) + 2
 	 * page specific:
-	 *	ARRAY_SIZE(pmbus_debugfs_status_data) + 1
+	 *	ARRAY_SIZE(pmbus_debugfs_status_data) + 2
 	 */
 	entries = devm_kcalloc(data->dev,
 			       ARRAY_SIZE(pmbus_debugfs_block_data) + 2 +
-			       data->info->pages * (ARRAY_SIZE(pmbus_debugfs_status_data) + 1),
+			       data->info->pages * (ARRAY_SIZE(pmbus_debugfs_status_data) + 2),
 			       sizeof(*entries), GFP_KERNEL);
 	if (!entries)
 		return;
@@ -4013,6 +4037,17 @@ static void pmbus_init_debugfs(struct i2c_client *client,
 						    &pmbus_debugfs_ops);
 			}
 		}
+
+		if ((data->info->func[page] & PMBUS_HAVE_VOUT) &&
+		    pmbus_check_word_register(client, page, PMBUS_VOUT_COMMAND)) {
+			entries[idx].client = client;
+			entries[idx].page = page;
+			entries[idx].reg = PMBUS_VOUT_COMMAND;
+			scnprintf(name, PMBUS_NAME_SIZE, "vout%d_command", page);
+			debugfs_create_file(name, 0444, debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops_vout_command);
+		}
 	}
 }
 

---
base-commit: d4193d2a0ffa407478bce4a094e1ae085ceb38ec
change-id: 20261108-for-upstream-pmbus-vout-command-debugfs-v1-6fe3ec237b1a

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


