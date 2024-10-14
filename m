Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1DF1CCEE4
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Oct 2024 20:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728936271; cv=none; b=fAy5qCiqF878SMiEPBl3p5xLH43DOfbCo4L/uSVMaNSxzSmE8Zik6uPpzI+LLd5pvQqP1OyfDQfg9KMGdqdKzqfb0XfTGHA2kEX9EdjAmJTwIcdM249de4GABsFpsYnWmIakAQpN7qVkM5LfcMuZwMrKQKyYMcVUusR+t/VAj5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728936271; c=relaxed/simple;
	bh=n5kQDTOtjV4bRJuKdnxR4z9JhIAXeZU5Kw6v9Te+9rA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EhbEOAOvEzD7f96W6t3+KqxVxsBa78DEz2PNVhGWJw5TH2pMserSiH+hTnrl9WGhg43oHlxzglanSNTCI9BWjlJ+bMkaUEekr9dWlYdWM9quaQk6X9JJTC7xyPtFxo9GzCfFevJ8dHTdo7YoIWzbVU0E48x/JN2f0a6sR4bceRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SHec/Lcl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0QVVkFdp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SHec/Lcl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0QVVkFdp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SHec/Lcl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0QVVkFdp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SHec/Lcl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0QVVkFdp"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 91DA721C22;
	Mon, 14 Oct 2024 20:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728936267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0Akt2LRzQjsC5EBqYOtlVEfIUKcfKx8VKE4Sk2oMQDU=;
	b=SHec/Lclj4RIijrsaU+JQWkmgoOC5Cv+ZO1ormxocNGK7tDtP+4e/La8hbl8lFqbdvDb1E
	UXWCy7L5xoPVEaXSBKnDNp2x6PWESBrjzWi0wxXCbBjA9cMEPfE8sD3VyHfPfilzhpzou7
	Ntf/jNa6PlkmmLRWyLzF68z1qQDGOTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728936267;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0Akt2LRzQjsC5EBqYOtlVEfIUKcfKx8VKE4Sk2oMQDU=;
	b=0QVVkFdpDSRZAkCvN+tsf2q8/C3ysaUca8lMeklQw3hcemAtFB6OyRMsYCL9c7PJTAc4dY
	QxFm5+nL+9wylYAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728936267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0Akt2LRzQjsC5EBqYOtlVEfIUKcfKx8VKE4Sk2oMQDU=;
	b=SHec/Lclj4RIijrsaU+JQWkmgoOC5Cv+ZO1ormxocNGK7tDtP+4e/La8hbl8lFqbdvDb1E
	UXWCy7L5xoPVEaXSBKnDNp2x6PWESBrjzWi0wxXCbBjA9cMEPfE8sD3VyHfPfilzhpzou7
	Ntf/jNa6PlkmmLRWyLzF68z1qQDGOTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728936267;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0Akt2LRzQjsC5EBqYOtlVEfIUKcfKx8VKE4Sk2oMQDU=;
	b=0QVVkFdpDSRZAkCvN+tsf2q8/C3ysaUca8lMeklQw3hcemAtFB6OyRMsYCL9c7PJTAc4dY
	QxFm5+nL+9wylYAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6779213A51;
	Mon, 14 Oct 2024 20:04:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eYPYFkt5DWdhSwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Mon, 14 Oct 2024 20:04:27 +0000
Date: Mon, 14 Oct 2024 22:04:26 +0200
From: Jean Delvare <jdelvare@suse.de>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH} hwmon: (jc42) Properly detect TSE2004-compliant devices
 again
Message-ID: <20241014220426.0c8f4d9c@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,endymion.delvare:mid,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Spam-Score: -4.30
X-Spam-Flag: NO

Commit b3e992f69c23 ("hwmon: (jc42)  Strengthen detect function")
attempted to make the detect function more robust for
TSE2004-compliant devices by checking capability bits which, according
to the JEDEC 21-C specification, should always be set. Unfortunately,
not all real-world implementations fully adhere to this specification,
so this change caused a regression.

Stop testing bit 7 (EVSD) of the Capabilities register, as it was
found to be 0 on one real-world device.

Also stop testing bits 0 (EVENT) and 2 (RANGE) as vendor datasheets
(Renesas TSE2004GB2B0, ST STTS2004) suggest that they may not always
be set either.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Message-ID: <20241014141204.026f4641@endymion.delvare>
Fixes: b3e992f69c23 ("hwmon: (jc42)  Strengthen detect function")
---
 drivers/hwmon/jc42.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-6.11.orig/drivers/hwmon/jc42.c
+++ linux-6.11/drivers/hwmon/jc42.c
@@ -417,7 +417,7 @@ static int jc42_detect(struct i2c_client
 		return -ENODEV;
 
 	if ((devid & TSE2004_DEVID_MASK) == TSE2004_DEVID &&
-	    (cap & 0x00e7) != 0x00e7)
+	    (cap & 0x0062) != 0x0062)
 		return -ENODEV;
 
 	for (i = 0; i < ARRAY_SIZE(jc42_chips); i++) {


-- 
Jean Delvare
SUSE L3 Support
