Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AD336A029;
	Wed,  4 Mar 2026 10:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772619430; cv=none; b=R3/2/amNKih8DBctYfi69gmbTGEPZZySBDVLpMoMQVuS8uj7BMj/iqk55hO6FeDaYh8RrN42ZRLslslkrSaiwwLWBHBHZAuiOf3l0ccY+VASUXO5vF14ObVS5KdT+3jp66RoQgvKIYjjb+qt0sPPYMdbY+9dWqxk7+eEqf8YfbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772619430; c=relaxed/simple;
	bh=Oy7ryrZDnPvluOVj01dEpy0ZZDiJCTqPr/cX/fkZcP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ly7rzK3bB5c6UUMkn7GO2/Yp6agHetkhdLLaRYanIWN6y0vEjuVSIUUqWGzglCqBgNfyohvWABy1n8ibnIMXIs5w4bUIQQtAryQTJz90g5nQ8cLy+6IPxZ5Hv/kxvmRfVzACYd5cCIW59b7qnOMhWfPqPs0GJBdQ4mcjzDH/K6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfL65dmM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfL65dmM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9031CC19425;
	Wed,  4 Mar 2026 10:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772619430;
	bh=Oy7ryrZDnPvluOVj01dEpy0ZZDiJCTqPr/cX/fkZcP0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lfL65dmMjh0cLf/2SneU0q/hRoSTvkCUVh416xMlIGhqimBqcjSS0Kq0ze6Dlf5Hh
	 rUJY512GQn6y+LuZCORzErefaAy/ue3sqVreKoKszSUrK7WzfD5IVU9+6/oOhNLvkE
	 B2jt4Svbrr+rcc8mjZu428oFfhZ3PxSAw0mvoJiW4LIYCImdDlUfyKfflKtFeAIiOR
	 DKyiOwMXD5l3sWqNd+76sQfVGmD25jPPCp4SgWhlrvOKpYZYQ1+7hVI5DcVzaSdkay
	 0fkfo9qs/Ur3E+OfkczEOYz5zBCznyeOci4rzcwPWeFK9b7xsx9wqXmL1mbtTQHbaI
	 orcuPZoxDns9A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85BA7EB7EB9;
	Wed,  4 Mar 2026 10:17:10 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Wed, 04 Mar 2026 10:17:48 +0000
Subject: [PATCH 2/2] hwmon: (ltc4282) Add default rsense value
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-hwmon-ltc4282-minor-improvs-v1-2-344622924d3a@analog.com>
References: <20260304-hwmon-ltc4282-minor-improvs-v1-0-344622924d3a@analog.com>
In-Reply-To: <20260304-hwmon-ltc4282-minor-improvs-v1-0-344622924d3a@analog.com>
To: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772619475; l=1381;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=1K80NKgB8MIVoZ4myHTgOKtZ/0xG3qVAlLQ5ld8hUek=;
 b=kxY5Ss5sCb/V23P159h1ab5UWHaWON3Zq3/b4JhCG6EoFGlTeOk2QyxcreQdMgYqJN3qdFQy8
 rS5MQbuZGJfB6zQQgtTDjtTNfR+lmtvqpTyVVe6Ke9vh1CSihFp4yHy
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

Instead of failing probe when the "adi,rsense-nano-ohms" firmware
property is not provided, default rsense to 1 * MICRO. This allows
the device to probe without requiring firmware properties, which
might be useful for some high level testing.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/hwmon/ltc4282.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
index db6534e67991..53dbf904a172 100644
--- a/drivers/hwmon/ltc4282.c
+++ b/drivers/hwmon/ltc4282.c
@@ -1328,15 +1328,16 @@ static int ltc4282_setup(struct ltc4282_state *st, struct device *dev)
 	if (ret)
 		return ret;
 
+	/* default to 1 micro ohm so we can probe without FW properties */
+	st->rsense = 1 * MICRO;
 	ret = device_property_read_u32(dev, "adi,rsense-nano-ohms",
 				       &st->rsense);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to read adi,rsense-nano-ohms\n");
-	if (st->rsense < CENTI)
-		return dev_err_probe(dev, -EINVAL,
-				     "adi,rsense-nano-ohms too small (< %lu)\n",
-				     CENTI);
+	if (!ret) {
+		if (st->rsense < CENTI)
+			return dev_err_probe(dev, -EINVAL,
+					     "adi,rsense-nano-ohms too small (< %lu)\n",
+					     CENTI);
+	}
 
 	/*
 	 * The resolution for rsense is tenths of micro (eg: 62.5 uOhm) which

-- 
2.53.0


