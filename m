Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C73568FA8
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 17:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999270; cv=none; b=Lq4sfu11xqvIR4QgtWJW4KEvHuaeUfy28HiWu6X9ItJkSZb70VyrhxdFDweK1WS+lHaPyrsyURWd9dZUrpBbWFnu3hzcBPlfdNNj5Ef+7JdYIS69DlvNBDe4krwk+HjHEK579KNQSoYNJnuWBnopioEdYNmRwFU5zH8nHCYT0L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999270; c=relaxed/simple;
	bh=fIqA33wSyUtbRcCcYiczdNv6wVti+pGWaArnAAC/2uc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=czZozuhopiAz4MYf+JCm9nV++hUVLLiQ8tzAfbkrqD9l1y9AAZl6PQuksplYoiswYzgAHY+oFFxbUnI+nqZvg6DjJDpkbXNaaqltO5YHQhvzbdrbJvGRun9sNTcw/BrXrQeLeZX2Fidyyp1oa7Pkuxz3elWqgRWbcQR0b8ceAXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRgkEyzF; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRgkEyzF"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c350db5a761so573634266b.1
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 10:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791999265; x=1792604065; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bK91X2SdwuCyQyEfLGRdQUCBBXpE80vPU5AmtR26wN0=;
        b=nRgkEyzFJ02Z1m7gFpmVV2z7oYmCwZt3aIUHuAxF7lPS+ROaLZW+lA1JidWm2NQYgT
         796jHY5tRGyywfxrRNGEhiTy3HUxUZN+RM7Hu/zTbxWD/sXws/Lchd5zns9b6fEynGS0
         UMLN4IFrQvJS5tAQn84EEU8wsKat/MNonna9QA2L6/x99nbrlfyQpDLjd8iJxJnPxzdC
         Tcwk+hW7lu+oxipDil8RHrwzpmmGGils8nveJ6CCm9ZZhlRpyQPyFOqmKTkXcW/V47bq
         gWUQ/qOMt3s1xdI7+vRjI45NyMPTvZobi7YUCsxODYNmSKbWSkS0VMIs8RF13vMmHVKd
         C7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999265; x=1792604065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bK91X2SdwuCyQyEfLGRdQUCBBXpE80vPU5AmtR26wN0=;
        b=xZaFP01Z+yU2+IXDlE7ajqrYT43USiWx4hoQ829XgCjp00kGlOq0fKAuE11npJwYY1
         wZBOPM5zyEQr5mtqLhfbAx2gdf/ZhxWuUYHXG54LEhKkEoBKz5slOlEqmj6EGVCUJUs3
         YpWu5irDFBGrgo487pSXwZLF6xZZbkNN2ir7h5gZplHb56Xqg7+SMQxCru7CBafygl5S
         YYQxqOxcajgz8XoSdO+oI9UIdXdsECQ74PYrV6khX3jxHhKlzO0xBO1qjmFz/sAaEotc
         yCd1xXjYPSwuB6KNfcybOJHNtN3p4/3LAaXCRiPzGQztz9ugYnpj+kULY022Ub1jx4/s
         0/NA==
X-Gm-Message-State: AFq9FYJzKby1gsqADQa57XVvc4XJDLHOFA4M5IzPiFn3ZZW75SQeMiYL
	ky7/jW2r1TVWq72tmLdp2tYyfoqLhhQSyBEe7KVuuUMDlgR8yieQk2TY
X-Gm-Gg: AYBFou3EwSLSv1io5jGGG9XgTxdjMhiqAMaZejVOH8YUUd0G4b3YxQNUvoQbcCmQy6C
	1WFMQgSWx5Y3rCZQ8m7HzumLPb7LAUH+K+QMZrcPyYEjPBqMNjkzzG6jBjyUQk1IByQQFDm4D1+
	jPK+RTm8p3K8pR33+9svlHrtPf9kwKe7BDFaVjb+nOO/5NuwKKGTlsaTLb4/do1UBlltg/Iq6xj
	vUyfK/uKomV2RmhxT5AnrRUXhh+oEKb5oR34JGKcbhjigaH3NnVDr9yHM1O1lrosrawyBoM/GYY
	bdFuEhqRNp1nd11e2CvilzS606IicGpdNjBWK/QA9cnTZs2Y/2hwppJc4LQOiN7GUZVmGdh5lua
	LAcIfGznSuqZ12sE+/e2hefNPtj10yY5G5DR/+E4PEpU7PUlRwPGcrA1/tPrjhXs9W8x/C+MaqW
	dyHLAaNSOJlkNzZ8MTcE9gWseYunQ0WqE11XRK5fZzkPnMRNbWL1fzdpofne+69MxAaBmQqFSVO
	HV2BXAVz2/LXsreDCB3qikd3Zk=
X-Received: by 2002:a17:907:9686:b0:c1f:983f:d8a with SMTP id a640c23a62f3a-c31aa017261mr1685459966b.24.1791999264715;
        Wed, 14 Oct 2026 10:34:24 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:148:f08c:65a8:f8e5:f310:5a71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963cecesm9381366b.21.2026.10.14.10.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:34:24 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 14 Oct 2026 19:34:06 +0200
Subject: [PATCH v3 07/11] hwmon: chipcap2: enable IRQ processing when
 regulator is already enabled
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-chipcap2_locks-v3-7-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
In-Reply-To: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791999252; l=1283;
 i=javier.carrasco.cruz@gmail.com; s=20260924; h=from:subject:message-id;
 bh=fIqA33wSyUtbRcCcYiczdNv6wVti+pGWaArnAAC/2uc=;
 b=wGwEIFvv57yZEZRHNLCnr5pHFMdGHny3xsVW76RPyioM1t8Hqj03BSfwk9UChXIEm0Sf6Hlt8
 TJldbe/ES8UByswF2ukfIfMUIQQgn+r0EIUg0837081JqI2pn8heN00
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=VV+hcMoOj1Sx6xSiY0W/FZNAskGZe2AagSMVj0PsmAs=

cc2_enable() returns early when the regulator is already enabled.
This can happen if a previous regulator_disable() failed or if the
regulator was configured as always-on.

In this case, process_irqs remains false, causing the ready interrupt
to be ignored. Subsequent operations waiting for the ready completion
then time out.

Set process_irqs before returning when the regulator is already
enabled, so that the driver continues to process ready interrupts.

Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
Cc: stable@vger.kernel.org
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/hwmon/chipcap2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index 654f6420da7a..837b1830f2e4 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -120,8 +120,10 @@ static int cc2_enable(struct cc2_data *data)
 	int ret;
 
 	/* exclusive regulator, check in case a disable failed */
-	if (regulator_is_enabled(data->regulator))
+	if (regulator_is_enabled(data->regulator)) {
+		data->process_irqs = true;
 		return 0;
+	}
 
 	/* clear any pending completion */
 	try_wait_for_completion(&data->complete);

-- 
2.43.0

