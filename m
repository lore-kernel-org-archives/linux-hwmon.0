Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0115C38758C
	for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 17:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787507958; cv=none; b=AKM4JI3RF7CzkXqjNHCBnnmTg6ztsZqUh6I8w503qBz/LBWUkFcFCLTvDh1MQFiqHWkCHjwDr7v475pANexUpPrHeCyyUwsmm8qm3kOUgssKOUJSLXE0cudCyPrGYx0slQcXhA7TYLindV3c+/8Kn1nak1LjK14bapUdP73XSQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787507958; c=relaxed/simple;
	bh=jbfRCvEVo3PuhpBjVfzgqvGIah0vGZmzLa1w2pHljmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZoX1afHlSDwHJ1XjqUQpszBtB9EePl3tmf48CYV1mdPn9jqOgU7M1n2Q2KlwnIeUK5T6AapGfPsbVb41ds8v+7f+6Yw7Z4uVR1ehU0DG9gBOQVl8/kr4aurADwb+e2SQ9abMB0WN4TBKTS/lGoytcBGh06nVeJLrr0J2RXRcKvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ToSssXnG; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ToSssXnG"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6983d3dae7aso6137634a12.0
        for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 10:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787507953; x=1788112753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XaxU4abLJpeHOJBbZvBLa6ziYwQVZqgnY4S91187WoU=;
        b=ToSssXnG0mCLd+DAZaIjQ7mA1+ADwbshb61Y2uZNZ++SPJ2hee56NmYUGbezaAaiWL
         dJ6nakiZiBeUuTzTUENt5BZSQKYkXetqoiz6+wsYsUPrbwUCHQUI5KpJ1cFXQdMuFBVK
         gcjZTHH1YR6BEiC9L98+lxhQa7VbHNyIdsuzlQms+g4GBCuwUfwxdgqn3dOwJE7nVIT0
         sichXPr4YJ/+RUep35To4YcZJl6tekPPDVvet4TYy8yL6RPp1qjvs8BaGPCpei7jD/uL
         t4goqf6EQNDaQiFP2iTo7gZ3Iwf0cHNQB0fKlPE7GVbEgZyoFm4Bo1ZkpIJsrmFn2dl0
         RXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787507953; x=1788112753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XaxU4abLJpeHOJBbZvBLa6ziYwQVZqgnY4S91187WoU=;
        b=HdYJRn3PuJNciQ4xijI233j50bNzzWKSrwgeGucoX+pT8pywlASXX0n8NU/d+zogwe
         bWiwHrbkctNkSZe2kqhbL+8pYEMDUvzoQN3YLaCwvC6J0B/iHUAbHKawG65VR9yTOM1C
         kKE/NdrmLBu11blGk5Sn96sO3EXPaJac14Pc6I6ZtlNjhcqzkDx/eEdoE3EtpIjx3q1+
         4LObNbPn3/jXOPKw8CDMRveD3mUXtPr6t1e+007oxHJmHB639hKIl9UPKRs8kI+GJm+a
         Hv5yYatlJwmyPy3flKszxXtevwMXRvM1EWmTDMJM2c8Kt+KNt99bCLN1kPDYBOETLB9k
         Jj0w==
X-Gm-Message-State: AFuF++lKS1mECW9/tEjj8KN463psMQckwZyem3nEsNDb9nwDupokDs9v
	5TgNA3IuGWzifDT/dhCRiOZ+lvQtGgQKoBLYfIm6vzYIKVureAl9gGhC
X-Gm-Gg: AR+sD1221AxBcjcUFRIHcdyTgyoo/RlGdsAeOT4TouJh4C2jh5i7AmSY2/I2UicTV2z
	4Pp0CYPQBGFZFcV+lgE+0Xv/bYKBOlLryal0mYpJdInrGLZr45xBpWvsUqXZub8oxOFFEwBIlXJ
	0KuxV2G49sLmjqhgtp0rBvQ7kNdTTJgo9o0gYKJHF3yDG82xN4Uy9gUPo63ShHv9g39OtWivK8Y
	Qynt087YlM/3Yjn9k4TJg7ABowiU2uH3eOMA4C0uSJWz01J6QTKe5Qte042BFCfy4EWzFaTMxJW
	5JnxvmtvNHYdLXG4Tjqc/FpI63NB3D6Jpu4t3TwdRrQHq+xBEqdzNwSc8sASUPu/LDTcyoXrT74
	15tmu5VjXHzQ+wx/nb2Hfh8603W8f/SfRhjC2NJ5JN7P14I2AizH/xG1H05JaAZED9CyFHbpPBM
	ykVkBV0iCESruER2gP0/QOViHKx1JcM/NssbzLl4nONlQNjfjzC+NtbH+7xHBQXdkyMOTnbl5Ma
	c8Amv02BgMYxyED
X-Received: by 2002:a05:6402:321b:b0:69f:c929:b88 with SMTP id 4fb4d7f45d1cf-6a430debb60mr20778691a12.5.1787507952817;
        Sun, 23 Aug 2026 10:59:12 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:148:9afb:38d7:b606:f380:289e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e199cb8sm4153933a12.16.2026.08.23.10.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 10:59:11 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sun, 23 Aug 2026 19:59:03 +0200
Subject: [PATCH v2 3/4] hwmon: chipcap2: enable IRQ processing when
 regulator is already enabled
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-chipcap2_locks-v2-3-6a26c8e9e2fc@gmail.com>
References: <20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com>
In-Reply-To: <20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787507945; l=1283;
 i=javier.carrasco.cruz@gmail.com; s=20260111; h=from:subject:message-id;
 bh=jbfRCvEVo3PuhpBjVfzgqvGIah0vGZmzLa1w2pHljmU=;
 b=kwvqnY0uG0GB80exLrAofUbi7prlQZmWnSwEK59YHfIqnudHlnvBDtNFttK/K2rgEvp1vUqjj
 8Vfg7za3iyuCxZ4rwuKc4797TshpHKEyMmCTfORZwH1Jg7EMC/yJzQq
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=Lge8w8xidNSf/INy7JAIbAW+Hezkp3nsBh2OjKL7lLU=

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
index 15630d1dd90a..57d22d65612c 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -119,8 +119,10 @@ static int cc2_enable(struct cc2_data *data)
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

