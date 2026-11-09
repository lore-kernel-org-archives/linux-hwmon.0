Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794263695;
	b=HKRsnFXvtU1ItR3/BiWwaAoO8h32oyRMsGOy/Jjr/IwhJnWC0K91pGAT+ItYX4ZAt0aE
	 p3YsOBuMu5Gg3kGifUMqLmXnLJgwQY/ckATlRu2zSSwcQCCNfAHOhvGhDomo0PWZ5W3R6
	 bH7E4ASYDj1c+Q0d7EmRbRTmBuvCNTFRHfrRkCxSE6iq1s8gQALJQ82kvcIufNsa62ZNI
	 ZbOScoforJtY4AKpFDwITMjRxPwHSNxzzJWBO5gVgepyKQWz29CKbSGDD+ZWqPU9+f9Nd
	 r6SeWb0aVWnyh3cXefkxdUYnKOzKj5jysF6Rtt43T2N1TB6o2VybKwsMEX93oykB1TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263695;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=D6844LC31L9zlOKuCcaoHPe7f6+6dn+GOw7C9drPaCA=;
	b=kUk9kv1JfwQzc3mKqnWlMVFABg1IOxoUgE+FpzIRQcsaChTVvaLDqw1Cxs5B+XRl9xbJ
	 zujs784cM0EAAV/01Qyce3I0hRGHiV29eFDViP66MMMB4m5ORPyJmSixuP/M79/q69LS+
	 7IbITNqMLCYqRgDTQTZOKb0gOOrbrgH8vwdr0XYLw8N9vMXgajiYT9NVA2WKRfQe8R9LD
	 BpXpgERXbBAWgsf+K4N/uu4lmm5+s8GJNQiim9WNAbW2opS7bEwXNS7+3U+m94FdS4cgk
	 vxLxcVE7/7DiGkkL/XXtilE015LAuS/eVMlGIKO3Vl5qAZ9I48fFHBDoNdUiXkWo0GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=lttgd1e4;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BFB606A325;
	Mon,  9 Nov 2026 22:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6BFB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=lttgd1e4
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jNl2s1bBwz8txj;
	Mon, 09 Nov 2026 23:34:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1794263685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D6844LC31L9zlOKuCcaoHPe7f6+6dn+GOw7C9drPaCA=;
	b=lttgd1e4nCdfLYYFwgMi/ZzAB1j6e1BCG+GnW+OouM9BP3ErUuAysgXmL/LO+qYGDXNuLd
	zzesMvdojdDSk6JvO3GFqlh0Qg83UnmsOokgcULZtmrHD/BztDbZtXLHxEaP6V2XDCj5xc
	6tWxMCdnZL+NNXosawg9nSwq1XOakc1+OgFPZADvMb550BNyS1thFd8Mw7KcI076cT2m0Z
	dTxrs9E0qcwI5sJ+Lrp0ZFk+zEAHN1R3eOOZWHVSCDC+UAyiraYNMrdwRMoicN8Y/P0+54
	tRQg5G8bwDPlyYvtNlDACyqSd9uBO6JzntF6MkdTCH8pGQacco97dFHrOP90cg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
From: Tomasz Bojanowski <tomasz@bojanowski.me>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Hamza Mahfooz <someguy@effective-light.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (nct6683) Factor out the NCT6687D-R fan configuration transaction
Date: Mon,  9 Nov 2026 23:34:41 +0100
Message-ID: <20261109223442.509238-2-tomasz@bojanowski.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109223442.509238-1-tomasz@bojanowski.me>
References: <20261109223442.509238-1-tomasz@bojanowski.me>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jNl2s1bBwz8txj

Move the configuration phase and its retries out of
nct6683_fan_ctrl_update() into a helper which calls back for the
register writes, so that the next patch can use it for writing the fan
curves.

No functional change: the EC accesses and the returned errors are the
same.

Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>
---
 drivers/hwmon/nct6683.c | 56 +++++++++++++++++++++++++++++++----------
 1 file changed, 43 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index de5b0194c256..ce22f1e06600 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -1025,28 +1025,22 @@ static int nct6687dr_fan_cfg_finish(struct nct6683_data *data)
 }
 
 /*
- * Select manual or automatic mode for a fan channel and, if cmd is not
- * negative, set its duty cycle for manual mode.
+ * Change fan configuration registers in a configuration phase. fn() is
+ * called once per attempt, with the phase open.
  */
-static int nct6683_fan_ctrl_update(struct nct6683_data *data, int ch,
-				   bool manual, int cmd)
+static int
+nct6687dr_fan_cfg_transaction(struct nct6683_data *data,
+			      void (*fn)(struct nct6683_data *data, void *ctx),
+			      void *ctx)
 {
-	u16 mode_reg = nct6683_mode_reg(ch);
-	u16 cmd_reg = nct6683_cmd_reg(ch);
-	u8 mask = BIT(ch % 8);
 	int attempt, err;
-	u8 mode;
 
 	for (attempt = 0; attempt < 3; attempt++) {
 		err = nct6687dr_fan_cfg_start(data);
 		if (err)
 			return err;
 
-		mode = nct6683_read(data, mode_reg);
-		if (cmd >= 0)
-			nct6683_write(data, cmd_reg, cmd);
-		nct6683_write(data, mode_reg,
-			      manual ? mode | mask : mode & ~mask);
+		fn(data, ctx);
 
 		/* Retry if the configuration phase was lost or rejected */
 		err = nct6687dr_fan_cfg_finish(data);
@@ -1057,6 +1051,42 @@ static int nct6683_fan_ctrl_update(struct nct6683_data *data, int ch,
 	return -EIO;
 }
 
+struct nct6683_fan_ctrl {
+	int ch;
+	bool manual;
+	int cmd;
+};
+
+static void nct6683_fan_ctrl_write(struct nct6683_data *data, void *ctx)
+{
+	const struct nct6683_fan_ctrl *fc = ctx;
+	u16 mode_reg = nct6683_mode_reg(fc->ch);
+	u8 mask = BIT(fc->ch % 8);
+	u8 mode;
+
+	mode = nct6683_read(data, mode_reg);
+	if (fc->cmd >= 0)
+		nct6683_write(data, nct6683_cmd_reg(fc->ch), fc->cmd);
+	nct6683_write(data, mode_reg,
+		      fc->manual ? mode | mask : mode & ~mask);
+}
+
+/*
+ * Select manual or automatic mode for a fan channel and, if cmd is not
+ * negative, set its duty cycle for manual mode.
+ */
+static int nct6683_fan_ctrl_update(struct nct6683_data *data, int ch,
+				   bool manual, int cmd)
+{
+	struct nct6683_fan_ctrl fc = {
+		.ch = ch,
+		.manual = manual,
+		.cmd = cmd,
+	};
+
+	return nct6687dr_fan_cfg_transaction(data, nct6683_fan_ctrl_write, &fc);
+}
+
 static int nct6683_set_pwm(struct nct6683_data *data, int ch, u8 val)
 {
 	int err;
-- 
2.56.0

