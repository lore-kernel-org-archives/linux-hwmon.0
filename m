Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D022F6920
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 18:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790534271; cv=none; b=NPEbdzIIE6JN87OeuXiVH54tH4JQgEXvoUXboY2kcoWv2KZ9d0c9gQSmvjr6z5JTqijWz383qJg6PD10KfQqFud4Wht6gQVpA63CcxiPZMgdQ7BEunAadENlZofv6ZvEpahNiDDfmFN/u8Niw+0Kg5G5ba8DWS+4GlR/ihz3gp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790534271; c=relaxed/simple;
	bh=UNFThLNzlgQn3xGsJH+W8fOTAc4yA9tzNHzeyyZNtG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O9WAeRWPIBkP8xvXfFS5wgmeXOifPwuc7vWa0O64QR3nVy4L4oJaYTD5iGruI6T3alB9B0TmIXIpbJlmoL8LY+Qna6fclkSn9DVtUbhaKYM61e9ltaiU+jj54MXdEIZRr63J2+TC1f1xqpzdF8uQnhQ2YaHWsdF1z8c8mNG0yro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc; spf=pass smtp.mailfrom=vasily.cc; dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b=CJJnVOGl; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vasily.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b="CJJnVOGl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vasily.cc;
	s=protonmail2; t=1790534255; x=1790793455;
	bh=4tZj5Jn525QkA17zwkfjXmztpwCqZhcxjdiG+hyLmBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=CJJnVOGl2MLTBW2Ba4MEsSzCifGfbExR6XI2L40tpufHiu3h/nEZojTeSjqoJvkpN
	 A+1hNzzPc5qdQnf8dxVdjZqByBtvmpEcEfK2xH8f/xuZFY5pO3HKGeuzcm2Xo7bUBc
	 Gf5SZv8LjnQPU7B9SXI2ErDd4LOnCF9f/GagZK3ZqM9A4O906nClWvfw8ZrwaqtDlZ
	 5kR10u2/aXeqSYJvcE+fQgTBr6ml6nN1LMpWTZgyDHnQiYrS7XYTOwH591EjpkkEF8
	 ZSk/6lUbhSKipPo7sJBoTmeWrHiKbBmlNQWrfJZ5uUw/Kv4D34G2jevG/XTEfSwPAh
	 AhkTjI+gEqUmw==
X-Pm-Submission-Id: 4htCq020Mwz1DFG2
From: Vas Zayarskiy <contact@vasily.cc>
To: linux@roeck-us.net,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Jack Doan <me@jackdoan.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v4 2/5] hwmon: (aquacomputer_d5next) Expire the initial sensor cache
Date: Sun, 27 Sep 2026 21:37:20 +0300
Message-ID: <20260927183723.4078226-3-contact@vasily.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927183723.4078226-1-contact@vasily.cc>
References: <20260927183723.4078226-1-contact@vasily.cc>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The initial update timestamp makes the cache expire at the current
jiffy. Since aqc_read() uses time_after(), a read in that same jiffy can
expose zero-initialized data or skip the first legacy report request.

Initialize the timestamp one tick earlier so the cache starts expired
for every supported device.

Assisted-by: LLM sparse
Signed-off-by: Vas Zayarskiy <contact@vasily.cc>
---
 drivers/hwmon/aquacomputer_d5next.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index 9178ac4cb..b58f5b5c9 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -1531,7 +1531,7 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	priv->hdev = hdev;
 	hid_set_drvdata(hdev, priv);
 
-	priv->updated = jiffies - STATUS_UPDATE_INTERVAL;
+	priv->updated = jiffies - STATUS_UPDATE_INTERVAL - 1;
 
 	ret = hid_parse(hdev);
 	if (ret)
