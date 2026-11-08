Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794159157;
	b=4h+J+oF+wQRFJAM+DYnu+P4st1gP/h2AhbI9kJd4jH43P0+dW/Y9v6HZWowTcbY7phlu
	 XgcACO52wrSI2Ifd0+YAy/IKSTfcuFmSYa0k3gMUbgkbPJhIH9cNaszA6S1e3hBzEAaCG
	 K4mcaj+eysKzC1uGaD0YMDNNuz5ShTtNS+kAb1kdgsOFi2VzmXK177sUxWv6fX84zjIRM
	 23meAtmZxcCGglUiJpA6ErirgIoHuXeFQk0cWZAipdVYQy13JzU6p4cye783gYZPaFaAU
	 YlPZbxXymJb1z1z99pY/2Ek/pTGbwNrY1Of0ZGr0YC8KLGpvMC9DSTj+maSa1hPSU2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794159157;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cagCFfTvM+9wVb3lPuXmm6+aD0IF0v6nyTxnGm3PL10=;
	b=kf0LjtJD+Fozn+wUV/KSlZF4yHyHnFY6mrjg+fq7NnaWJUUxQO3r8bRiwsxc/l6lX7gV
	 MrCw7Q5Sl+Dfi5zRTTsfD21Q6D1muKHZIjBUFrWxzj2A9Z2e4MF1UHD+w0Wxra/xtePMD
	 HnHCBtDvX5rRLhEpdYE2lCA2deO7blcj57Iz95YkivJ+EN8LECG5KQSh4O0946GJ0T+Ie
	 CkdL8LmYxoNDehlBzlo78P5jcGWb4rll5oD7ZlmF7OXgC/giHP3A5K++hvn5AAlXFl+2N
	 o5XKzUsjNcdOl70L4+G/PJglkx0Hb97k9xkKxbmiXWWPxwsH8HeSDaUA38vLvu+5hiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PqH0RjWq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E674E606A321;
	Sun,  8 Nov 2026 17:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PqH0RjWq
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794159156;
	b=xLGLBHMEAByRjS2ZirckltTtZdHjEmBOsNdqa2SkJolJBImastmMau3kpHvyV0m9GJ0N
	 SnFxARIjY/bAqZYX6fYlEt+gGlOfCeeoJqtCFjNDoKsJhiSVcEHTUa5/uwgksfFMCWHAa
	 vhSf48BHW+Ao+rgVucMp7ZsGLoFKnsp7/4H/yD5ZuVrNuEBVZKfjuL8D6MVIguv6wfbM5
	 ws9vGCO8NA72AMp9l6wwvynI2WC5aYePX83FWEjmWmFIBt7lD10236sCWGXJoDwuVm9IR
	 odrC01XAFWCDA4VHyyK7lWMv1Rt9zNDqmT0XRqs9CQgQrlCQMazk1BBLAMjuFBdDQiA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794159156;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=cagCFfTvM+9wVb3lPuXmm6+aD0IF0v6nyTxnGm3PL10=;
	b=ew8Q38f+bhGiv7yIxvYe64LMUy26EC0AZY0wM3pf0LSZorfZe+vK39Vj6Ef1WCp0+sSa
	 U7RzJLudO6aypNn6Gv/8en5pkz/splYpWmguM+JgYHrHMr1m6uY5JtVuJGsUlSM3VoZsU
	 jPj+7q+tT51fkXggYuoZwsT73alIp8U11ZtS+rI9W20A5/7W75toR0IxJ20e0H4huZ+9k
	 8r6hQ0LaIyIsGSEp4Qb/Z4xAeaN65mN3/S7xrvWtJ7xPTgVnPwaWNLq+QAIRiAbl6NRoG
	 c7IpnagfX3uOvCzG63OaGHpp81Cg8Tw1N8y2YsmQF4BtlpnltyFmpcU3SAugC5kp9XA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 04F101F0089F;
	Sun,  8 Nov 2026 17:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794159156;
	bh=cagCFfTvM+9wVb3lPuXmm6+aD0IF0v6nyTxnGm3PL10=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=PqH0RjWq7mju4E/NArDTC5aadcQdQv7fgMY4+LgtdVOWzIX8G7/PiJjExof0+hhVh
	 UEgNgmBw58QOcd2yO5kLK/Xzo3V0o1ZFMDjJFW8GVv0+r7ERSOq1hbqeiov8753UvZ
	 GIp46gEdRzbbq7Ch9C95vI9h8LtPhufTL3qB628gvUvFb0B3++ASIyYXt6zuSlawhw
	 mxBGNXa64Yh+xJlvRdvPRj/S7HbbYl2I7DYHMX3glSgeDfG7hrQRUoaQZlNv6RDMks
	 XlyD7GxHR/9GQE2j1xrpAqjqmre9Hb4i6e8xXsHftmwLxXs7mzDSWgrRjuKmYANs0+
	 d25hIH3XwwZwg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5A18A48003;
	Sun,  8 Nov 2026 17:32:35 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Sun, 08 Nov 2026 18:32:17 +0100
Subject: [PATCH] hwmon: (pmbus/core) Add a vout_command debugfs entry
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
Message-Id: <20261108-for-upstream-pmbus-vout-command-debugfs-v1-v1-1-c7a063efb91c@free.fr>
X-B4-Tracking: v=1; b=H4sIACCy8GoC/x2NSQrDMAwAvxJ0riByIC39SunBi5z64AUpDoWQv
 9f0OHOYOUFZEis8pxOEj6SplgF0m8B/bNkYUxgMZjYr0fzAWAV7013YZmzZdcWj9h19zdmWgIF
 d3+KQhGvkhb1Z7o4sjGATjun7n73e1/UDWSKhhHwAAAA=
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794159154; l=3250;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=dfNk0v5rH84dOXRM4vSF3mXu/2YsTYVFhl+RaSVniq0=;
 b=2jjtGHQUZBJrA/BT9ZSY4zAJkL7F6wkTkWtgmZkX0UaFri1AsKdo/iiPX4KAP62+8UhCe/Nfe
 4RnFr/UTfemBjeD99mYedkXgjvj0B9/wDryA0XDbCWEgD1EoaqkMvRW
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
 drivers/hwmon/pmbus/pmbus_core.c | 42 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 37b650b85d1c..1ad5523a9624 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3833,6 +3833,33 @@ static int pmbus_debugfs_get_status(void *data, u64 *val)
 DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops_status, pmbus_debugfs_get_status,
 			 NULL, "0x%04llx\n");
 
+static int pmbus_debugfs_get_vout_command(void *data, u64 *val)
+{
+	struct pmbus_debugfs_entry *entry = data;
+	struct i2c_client *client = entry->client;
+	struct pmbus_data *pdata = i2c_get_clientdata(client);
+	struct pmbus_sensor s = {
+		.page = entry->page,
+		.reg = entry->reg,
+		.class = PSC_VOLTAGE_OUT,
+		.convert = true,
+	};
+	int rc;
+
+	guard(pmbus_lock)(client);
+
+	rc = _pmbus_read_word_data(client, entry->page, 0xff, entry->reg);
+	if (rc < 0)
+		return rc;
+
+	s.data = rc;
+	*val = pmbus_reg2data(pdata, &s);
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops_vout_command,
+			 pmbus_debugfs_get_vout_command, NULL, "%lld\n");
+
 static ssize_t pmbus_debugfs_block_read(struct file *file, char __user *buf,
 					size_t count, loff_t *ppos)
 {
@@ -3940,11 +3967,11 @@ static void pmbus_init_debugfs(struct i2c_client *client,
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
@@ -4013,6 +4040,17 @@ static void pmbus_init_debugfs(struct i2c_client *client,
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


