Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A86364E84
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 06:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782713299; cv=none; b=r/3wpE9lxndhcHcYEf42wBm5Ssc8CwGquYWe3ZBIQWtRN5OIn0NSBgKf2/KPYUuBc+YCH1zEs81U4UOrA/9vJWatxiYNGLRMHETplKqJw61HuliPFrtnngaEfsVgCa7aJ2mEVfWZ9db9G0q5j9YSemuFFs6eaK6QoPsMF1Ace78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782713299; c=relaxed/simple;
	bh=eVp+pVUkSP+j5p/tYR9FHc2+9Yyjku5dejK4SQpsg4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L0aAHaVDk2r0+AjEdDxziAvf7J+FWGNVn5E7ilIzD/8JjyV1PKcv2zi98t4IlrgDNQkckVmioz/m6mEip7OYC5BsYbpGk216Fl+bQl7e0pDB8bdCu5W51rLlopp21t8hXNe7X4Pw25dG/+1ScSXvIOcXCejdgBtnjJdTpJ5K0NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 937F472F0A;
	Mon, 29 Jun 2026 06:08:16 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A8D0779A8;
	Mon, 29 Jun 2026 06:08:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7x+KGNALQmr/EwAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 29 Jun 2026 06:08:16 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 29/32] hwmon: Stop using 32-bit MSR interfaces
Date: Mon, 29 Jun 2026 08:05:20 +0200
Message-ID: <20260629060526.3638272-30-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629060526.3638272-1-jgross@suse.com>
References: <20260629060526.3638272-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 937F472F0A
X-Rspamd-Action: no action

The 32-bit MSR interface rdmsr() is planned to be removed. Use the
related 64-bit variant instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/hwmon/hwmon-vid.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/hwmon-vid.c b/drivers/hwmon/hwmon-vid.c
index 2df4956296ed..dee42c163d92 100644
--- a/drivers/hwmon/hwmon-vid.c
+++ b/drivers/hwmon/hwmon-vid.c
@@ -237,16 +237,17 @@ static struct vrm_model vrm_models[] = {
  */
 static u8 get_via_model_d_vrm(void)
 {
-	unsigned int vid, brand, __maybe_unused dummy;
+	u64 msr;
+	unsigned int vid, brand;
 	static const char *brands[4] = {
 		"C7-M", "C7", "Eden", "C7-D"
 	};
 
-	rdmsr(0x198, dummy, vid);
-	vid &= 0xff;
+	rdmsrq(0x198, msr);
+	vid = (msr >> 32) & 0xff;
 
-	rdmsr(0x1154, brand, dummy);
-	brand = ((brand >> 4) ^ (brand >> 2)) & 0x03;
+	rdmsrq(0x1154, msr);
+	brand = ((msr >> 4) ^ (msr >> 2)) & 0x03;
 
 	if (vid > 0x3f) {
 		pr_info("Using %d-bit VID table for VIA %s CPU\n",
-- 
2.54.0

