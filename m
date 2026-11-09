Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794268090;
	b=XnvtT8L4qRHsMEoYYKgE6bEX6Aw50IAMILYypfJgKdFvQ+PcUvkw5gf+U7BUuax/TivG
	 nn2NzerT2Db2znru9WFInPkH63lREF1QG5/FaxvBIoMuSb/TvR6tc4jDrLkK5irNlD5Nv
	 MXm3yIT4C6/sbbxS8jzW4N4vgoQzN3cIrLlPtepD/nSNkn8QVv1EItmrjknAke6qfKxsj
	 QNiZkVymQRR5xAKxXyu6e10m6hpR6iF26hyLLC1AuqkwDY7QUYYEQXQMwdB4z6f8aY+sE
	 +Lg1CUFaywSuZtUYfysbbErjl7ZaWNFj4qczenfUqhPgtPEXBw2EazGoIiEMrmmAPQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268090;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=r/s7nbQdksHktoJTgJZCq4IA437X0Zsh6izfilxtMXs=;
	b=vUeI4PQ5RhARWS/7+WU29ylT/fk3UZDoexoEqZckOrNkDQPQl1cm/B3XJ6SX1ut186Ba
	 s9UyLAbhliu4qfriLWDMYaTODCQAD4JAzSXo0QabxVOQ6uATIzK4BSxt2ENy5r7Y8RahR
	 mFeIVGiQwe60M4PSB6MYF5fEQ1zgZtNP3UJeUimNbqUnXLISq8jjJs/MllG6rh5afQEZc
	 4Xjs/HZmL9ynaQvnCmiLdW0MSLDJgD/RTFc/Dz9y3ElBtrCg7XP5JBMqu/MRCS81Mb6uV
	 Bn52Gnb2KD9cfAxTHNPgSrtaAldAhlALMNYoUwQrqKxYT6KWlY6ZhpRV85SNb2vhDCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W0bqKhkf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EF0606A31C;
	Mon,  9 Nov 2026 23:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W0bqKhkf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794268089;
	b=soTmE42lB7GCd2IP9TcAdWG+faIVAK+PVD7dv7Esm/WqSeSZZGjsBv1mutQsR3WvD9NJ
	 kqU1nmDU9HMUZyLzF1mfsLznVG+s/XHF7of6bH20T5SgYBLfVH9AuA0GJBioTgENXwFSJ
	 ex2RiZcZp33111iV8iN/1zaKWpLCXol5YqVGE+Z/zylCLbLgjfWiVu7bzZ7CDrj1KJevi
	 /lI3tWL6K/612Wyc3QU7ekqSP7kBDHC9E586Afb288qiDGmtaF8aciDCRCO2NfCwcq0GD
	 kqUyJcni/BxB0UYObxfgCf3vElZA3xMtQZEEB6MXBnvHMUzESHJqI2nVFaOWNDeepgw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794268089;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=r/s7nbQdksHktoJTgJZCq4IA437X0Zsh6izfilxtMXs=;
	b=KIVm5ITpcNZlAsGtse1oqbqYVkzV4298V+4ck823fThCk0A5/ApzujWaZjCjF2Pd1Lx5
	 UlDEWQK4K7tLRt0TwYi9Df1u/VvDfTz7Q/HZuc4TPEgVPVsFfBrpp+9DfRz4MDU25as5z
	 GxKIZSv3eZsm20xJw3bNik5bRY2O2j3eqPCKnmSioxyeY2etVA22z0Wd3jlgYWdS1x89e
	 277BoUrKbEq4gVedxBmMuKhzsKglNCim2/Qp62463nYl7rU3/uJlvQ6KK+13IniNIzj9o
	 P6msvdXUjsUK3sCABhoLXrmh32DZbHczJhXwBk3rlrG7Y17w22MzU+mHMguOm5xlQZA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ACA6C1F0089F;
	Mon,  9 Nov 2026 23:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794268089;
	bh=r/s7nbQdksHktoJTgJZCq4IA437X0Zsh6izfilxtMXs=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=W0bqKhkfr5WgxopbaN3WlTIEepaF8GvU6BJAeXWgvXJxijV+kSdgNIa35olX3nrFN
	 V2JVBKUJgHSaYTPlliURoMJXh3a7LEMuHQVQYh31AWdgP3LUlyy9e4cWwsF9hEGkkG
	 mnlMzZj/C8JtYzDj5sCSiQnD+FkMTUTqO3YS02f0GhlDjrIMbc/IHeO5euV4URWxdA
	 LtUSEiGbhodx61CpzQjo9jbOMR02atKM0CMMPoBF9GNJV9gxICvcDLm43F5MJdVJ24
	 4cIfJVQGKwkPWFmtnWs9mbfCpyL7ETZB1W+1I+uHdi+yAmW05GJE/AN8SogLjImLiM
	 0pHeWlxRy3wGA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0E4C2486F4;
	Mon,  9 Nov 2026 23:48:08 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Tue, 10 Nov 2026 00:48:05 +0100
Subject: [PATCH v3] hwmon: (pmbus/core) Add a vout_command debugfs entry
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
Message-Id: <20261110-for-upstream-pmbus-vout-command-debugfs-v1-v3-1-e3a261fe4342@free.fr>
X-B4-Tracking: v=1; b=H4sIALRb8moC/52NOw6DMBAFr4JcZyPWSAZS5R5RCn/W4MIY2WAlQ
 tw9hiY90mvmFTMbSxQdJfaoNhYpu+TCVKC5VUyPchoInCnMeM0FYt2BDRHWOS2RpIfZqzVBDus
 COngvJwOG1DrYciIISw1p3rQKJSvCOZJ1nzP2ehceXVpC/J7tjMd7KVOGoFtZi4as6lE/bSS62
 8iOSObXxbyIFfZGaIOdlPQX7/v+AxldQM87AQAA
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794268087; l=3565;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=2p/itRLjC3fhkJ7j832/F1RjibHZstzgI7xkcvdHOdg=;
 b=1/y6A3KWu1uBRwEljcagbu6Yh91gnL3RsZ0DJhQMs3H4OTXQ/bvT+5gmaQUF2n2TcumxLa2Vr
 tg4XKjryLHPD5NcLEZHMCizPAilKz/X8swt4KUvmpwZwLCEGrovFbP0
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
Changes in v3:
- Rebase for hwmon-next (Guenter Roeck).
- Link to v2: https://lore.kernel.org/r/20261108-for-upstream-pmbus-vout-command-debugfs-v1-v2-1-b19d6cd18aae@free.fr

Changes in v2:
- Use pmbus_vout_command_mv(), simpler (Guenter Roeck).
- Link to v1: https://lore.kernel.org/r/20261108-for-upstream-pmbus-vout-command-debugfs-v1-v1-1-c7a063efb91c@free.fr
---
 drivers/hwmon/pmbus/pmbus_core.c | 41 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 7ce8be840565..b3aa7f1ac479 100644
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
@@ -3940,10 +3964,12 @@ static void pmbus_init_debugfs(struct i2c_client *client,
 	 * device specific:
 	 *	ARRAY_SIZE(pmbus_debugfs_block_data) + 2
 	 * page specific:
-	 *	ARRAY_SIZE(pmbus_debugfs_status_data) + 1
+	 *	ARRAY_SIZE(pmbus_debugfs_status_data) + 2
 	 */
 	entries = devm_kzalloc_objs(data->dev, *entries,
-				    ARRAY_SIZE(pmbus_debugfs_block_data) + 2 + data->info->pages * (ARRAY_SIZE(pmbus_debugfs_status_data) + 1));
+				    ARRAY_SIZE(pmbus_debugfs_block_data) + 2 +
+				    data->info->pages *
+				    (ARRAY_SIZE(pmbus_debugfs_status_data) + 2));
 	if (!entries)
 		return;
 
@@ -4011,6 +4037,17 @@ static void pmbus_init_debugfs(struct i2c_client *client,
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
base-commit: e0fdadf444800610828d01b299743f79ae3bd27f
change-id: 20261108-for-upstream-pmbus-vout-command-debugfs-v1-6fe3ec237b1a

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


