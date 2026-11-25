Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609010;
	b=nXJclpR9zCZvUN+zfObhleQ/ybLOdQDHcQr4q4Q9/irEPToDz79uthTUGCqOZ7jAP+NA
	 EGes6q3gWuIApnj7CVNe4SOpfrxCXCV7Ia32G2USdwusvChpOrNL5slz353kZmTzM3hlh
	 7l7xOVOfeGo5DiSBcpMKb6zZVA/UTTCmgqgSrBhr7wA2+lpGoo1+gaWdes9mATwVmAFAW
	 TGnLmzL2YsMfuhf5XCyU0D2mYPdXZgJgg01N9dvIVE/YVJlOu5cUWSCP3k6DwfwBqEeVC
	 2/5WJqhHlCs68xcVZHaQd+LP2cIj/wgvAYEAHerNNwcT1BJmVvE2ixrP7RhS+0E8xQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609010;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:X-Spamd-Result:
	 X-Spam-Score;
	bh=TgLmG1OM/Uj0A4/q2U5JZv4Ccoqc8HxLVYG2JiF1hMA=;
	b=Wqa+vCsSTZ0TZFw8YOqY1RrU6k4CpPc4LzzjOvK+IfXKx7lu/JCl0ULsvcPD8gqpVaJo
	 lURC1/lv0GTBEDCaItuG8AAZPHrLJPmGa1VUlCwaVtcIrGgzSGFzSyn6oMvlGaJV9OJxT
	 MJrOx49KU+e1NDbJNGgYBSK8ii1sfiYVsAhmTmoFAUSRkRm7ZgsGPXk3tQV26WK9+wrwm
	 EUKl/TECkCdvs9AZ3zYoYcXg9uBPDQ2AypHE8qSqk6RWbp+It+1PpxSR2wxuMTSh+Rrw3
	 aXcpVErFNQHgajA6JJ6YEGCJz+Db7MknrBCqGSRBD44RsoiB5UQwO1iPyZuwgkGkakg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=gmS2Zc8w;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=gmS2Zc8w;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF5A606A31E;
	Wed, 25 Nov 2026 12:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFF5A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=gmS2Zc8w;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=gmS2Zc8w
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B50691F7E1;
	Wed, 25 Nov 2026 12:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1795609007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TgLmG1OM/Uj0A4/q2U5JZv4Ccoqc8HxLVYG2JiF1hMA=;
	b=gmS2Zc8wGpGeqTHypn0ASBd85woa3TX2y3CgHE92l+SdkjxdJD0EPREztBa3GWiX87sY0n
	vN4y2UvmWF99m6Q44aAPwXW0m78t/u9nxXXpbZvOgBTXkgi3BU6NVJxcNiQgXMKhcFWz2b
	f/QEIaare1AtzfHglwRoAG6AxehZuv8=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1795609007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TgLmG1OM/Uj0A4/q2U5JZv4Ccoqc8HxLVYG2JiF1hMA=;
	b=gmS2Zc8wGpGeqTHypn0ASBd85woa3TX2y3CgHE92l+SdkjxdJD0EPREztBa3GWiX87sY0n
	vN4y2UvmWF99m6Q44aAPwXW0m78t/u9nxXXpbZvOgBTXkgi3BU6NVJxcNiQgXMKhcFWz2b
	f/QEIaare1AtzfHglwRoAG6AxehZuv8=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 46840134CA;
	Wed, 25 Nov 2026 12:16:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id B86mB6/RBmsaWgAAD6G6ig
	(envelope-from <jgross@suse.com>); Wed, 25 Nov 2026 12:16:47 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Asaf Nuri Bertizlioglu <asafbertizlioglu@gmail.com>
Subject: [PATCH] drivers/hwmon: Remove wrong comment
Date: Wed, 25 Nov 2026 13:16:43 +0100
Message-ID: <20261125121643.25427-1-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,roeck-us.net,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -11.80

In drivers/hwmon/coretemp.c drop mentioning rdmsr/wrmsr in a comment,
as it was incorrect in this regard.

Suggested-by: Asaf Nuri Bertizlioglu <asafbertizlioglu@gmail.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
To be applied on top of current core/msr branch of the tip tree.
---
 drivers/hwmon/coretemp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 96d57fe12de6..ad5e8f40ad0c 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -66,8 +66,7 @@ enum coretemp_attr_index {
  *		IA32_TEMPERATURE_TARGET MSR.
  * @last_updated: The time when the current temperature value was updated
  *		earlier (in jiffies).
- * @cpu_core_id: The CPU Core from which temperature values should be read
- *		This value is passed as "id" field to rdmsr/wrmsr functions.
+ * @cpu_core_id: The CPU Core from which temperature values should be read.
  * @status_reg: One of IA32_THERM_STATUS or IA32_PACKAGE_THERM_STATUS,
  *		from where the temperature values should be read.
  * @attr_size:  Number of sysfs attributes in this temperature data group.
-- 
2.56.0

