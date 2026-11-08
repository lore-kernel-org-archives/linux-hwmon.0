Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794125702;
	b=ulH1KkIvB41gvnaeO5n9tJLs6TVeZ0UtN57FXI44Dbq7DcEGaLMz0aJPyyk27EWdlXbc
	 5QthjN/+XThr15WpiIbZFocW3XDg4HDLpHSpiyOl5cu6TG7Qe/LRc86Vi7upOb28t/ehk
	 4x/1g/SUJXNFnDLJX+c/s6i0iBhlJZ0XiykbZT2srI26GBbn4jyaJyZF8LMZCpgk36HRI
	 2Dp7pAdVC7ic/J0siQuCtB4G0S3U9mXpWfG7ItLrq8vxXpRIZBj2jiu4O9ydwflsGz9PK
	 wjd/zeM/I46OJZPAP8DZy3Gstt5A0aDA4Teq2k0rvmLw4EzjyYpqieLVOvxaOkbgqEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794125702;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=YmeEiSEcdn8EwHpM34NbxLVkxxcZ/wCgYZ8mwnwdZ9s=;
	b=YQMXPrQiT/4jNfBMEHnRrltxAIC/f4qyNCaWXHl5JgxUi4b/E0/LMv4/NSSj4BpBN3af
	 hZQS/MlADZJmnqCe1Nrt/BZelJWdg6qmr/VHQGxhWPQS6w+WiNZAzuPYkmqxF7GAyT/dl
	 cRNgpIl75wG/4CiUUBg2wnWcGjTePT6lcq3wcYPn6E6hZ4dJPYsM/YtL+pjerMsABnKU6
	 J+iQI2kwbMM2DLTnpaUhS2PxIBBKds9M/ZKoOKsQcYbz0k6TO3VLIOQ6DYcbjrO/ygPVT
	 87l25c0MyItAi2tOjpUVbNTkwWTu4DvDPixVxxnV8XGvihBjzx0VQSMiq+hEfHBT+3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=PpQLaHJW;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE67C606A333
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 08:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE67C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=PpQLaHJW
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jMm171qn8z8txp;
	Sun, 08 Nov 2026 09:14:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1794125691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YmeEiSEcdn8EwHpM34NbxLVkxxcZ/wCgYZ8mwnwdZ9s=;
	b=PpQLaHJWOWOpT7XZkoZt05xrXXtpFfsdh5VlqXOIkw9XWRvmABIRKaYNa8iNG+9mCIVzj1
	5+egjPpDR1lq31wl2VArqqL6gaceNDkmJ/I082LlMKhoKqKoe1fdJWFX/2k9iaC8sf7Xlg
	hTG2Ddh+Dz/ChnqG7bLU+pl/VdI6imZZ5CjD3QoZL7BO02a9ksfCNgTpOQrCwuSl97gHfy
	zqrol2v3aWixzVuYJIhkkzItqqkqhf0V+ju/TxOnHj/bsSrc7MgDQ4WqixZFOKDLWORlTn
	02Zexbro6B223cv8s6eG4U0wVVMgt809ls3ibQlfbUHUlyqKUvEe6JbULniIFg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
From: Tomasz Bojanowski <tomasz@bojanowski.me>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 0/4] hwmon: (msi_mystic_light) Add support for additional MSI motherboards
Date: Sun,  8 Nov 2026 09:14:50 +0100
Message-ID: <20261108081450.8218-1-tomasz@bojanowski.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108000131.1249664-1-linux@roeck-us.net>
References: <20261108000131.1249664-1-linux@roeck-us.net>
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
X-Rspamd-Queue-Id: 4jMm171qn8z8txp

Hi Guenter,

Tested on the MS-7E61 with the series applied on top of hwmon-next.
The readings are the same as before.

Tested-by: Tomasz Bojanowski <tomasz@bojanowski.me> # MS-7E61

This was my first driver, and working on it with you was a very
pleasant experience. Thank you for the reviews and for adding
support for the older boards so quickly.

Thanks,
Tomasz
