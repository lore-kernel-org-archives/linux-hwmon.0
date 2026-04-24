Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5679E23370F
	for <linux-hwmon@vger.kernel.org>; Fri, 24 Apr 2026 13:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777038674; cv=none; b=uqqsPQ5W2dele6o/FRrf0nHrVnXUIOL6c6iCpQImqKOlXBkgXHVUvLlvji/CI2r/fT2LGNxBp6dqZb1ztWnhtclpaKFugH+TWEC6ZiLbSmIEQx0pXZ23YFSQl70H3pyNv12ZZOmvhVH+tT2i5n4VLLpXRNG1RM6sWjfBYQlN3uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777038674; c=relaxed/simple;
	bh=858P5mFpF+TrKrI6ZyGiotk5+CzcEz31qN54eKosWAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j/8eguy9pyvvmU7OFLLvIhf3ExQiyNdqlHaio5ohZNwTa3Mm0Z6UkfK9rrCCJqFiol4Pf2b1XCyx1R6SAoSPjfGzEayH5z1bPVYAvpG5/RX7We1STJoAdw24b8tLN6ubc38t1pUD4o30A1tkQ7CiVWzfDSEXxLPLoF2lqrsbCsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cznsQXEE; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cznsQXEE"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-83177129e28so817768b3a.1
        for <linux-hwmon@vger.kernel.org>; Fri, 24 Apr 2026 06:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777038673; x=1777643473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5BzP7d1QHnmFXYW9OV542PaMIY/QnoUuc/2j7D+PjyI=;
        b=cznsQXEEMwHAveO4Uxx/xWl5VJxSOL/au8OU9oKdR2sDP31241rakHs8I5v9EYqZMu
         lPlPRII2yJcuXxNBX6WNvCXErWyTpBNBlTFHBtg0FahHT2iNydo4OSc9UCgqwIIFXA/J
         qlPX7279SnHS91aBK/b94W5mdp/kQb0uCVW0RkDjpJ7RqSfDa97tFuSjluu/8B98iO3c
         /THZp7Lov3MY7x8sUV9KjGnPuNkGNmC4xHhRmKAGPChrxYC2D70KWQnlOiE3eXsBox8J
         OWhIU59W28hjeeD69vjxneHcvlh593UWOc2kkzJSBBxSgsa9W6k0rAyKv2kJmXp1fOYy
         N7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038673; x=1777643473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BzP7d1QHnmFXYW9OV542PaMIY/QnoUuc/2j7D+PjyI=;
        b=bwnkpFVyhfZbDtcgOXaonnhWZHudL2W4XQoxVVx4THN+rQ8hldwYycEkIWYV1DMgxd
         Uba9Lb3lpoSmZ1zze8h4Obh/MDZ/li3PfDlV/B0kgfWfRjE8lMSiPVciT5m6/h+vU1/D
         bnaC++6t/04IhqDSFyc3m5SivNyvZ2Z82fw7b5bUHeNeC9ZcPXfV4Ffc0IWfjvOOrZBN
         2aAa+UYDr1g26Nq6nKouY4zPaZ1S8D9suQTa2FQwI8+2/ZZ7jDH6J730PDf/BijCdzdd
         j+ncwT+q0hu2x/Ws+z9pyz9RekoMMS7tPRJC0PL2THNkEsVz7ghSx3m/Uzye4xGOzgSk
         46eQ==
X-Gm-Message-State: AOJu0Ywl/aRgBU+HVnnt6YHKUmJvn/OlJ1axaW8SbL8Gv/5maVBgvq2z
	85uRSty0141VCGbRctp88gzuyEYp1MjO8Cj+8BiLcsxiQAiKErjwIz8=
X-Gm-Gg: AeBDieuI3BSLHm0XXDZqqtpstjtY/BZIZTLHeprHmuX7xMcv1mp7GeRxg4KtEpob0C0
	oOE3AmaJdIQo+iuH2xaZxK0Nfpn0YcVzKWp3aDJc5nOlxbqJ6r6WSVQqqB5Vxbuu2u+8P1gPauO
	rLA4olC7qvrjXpHwBMXlj1iLZsLq65jCBfyswI1CYxdOb9hR6v/LXTf7dx8T7Wt+C5oB06Jf1uW
	ga/ZjsPZ4o/k71cVpYhDLC3Vo2/W7495a0PZMwWnPyF0LEo4UpQAfwezVQh36O0ePLfl77uiB6n
	h45RTyK23itfZs8ABJBOPqlDoJ0dNiKslW1MocLFUciF3WhKp9sGQExzYojx3cmYuNGpM+cwqF3
	nQ0pqTH6wuYHf/GBEwrtB1+1Hy8fCjJBxvZWtRLzDbYlQPMISVGFaT97fQZQGE8xHZaJ3xhuPJy
	arvZDQwZolkZqB46qBjCTGXZftDnt0+8EORnKnfaX/oaoHau8mAuG6oFdXi8zKteHR4rTrjgHqn
	pC2MnZ+p6B1N5A=
X-Received: by 2002:a05:6a00:1307:b0:827:3b1b:43e6 with SMTP id d2e1a72fcca58-82f8c83bf5dmr31712297b3a.21.1777038672699;
        Fri, 24 Apr 2026 06:51:12 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb28sm22402386b3a.13.2026.04.24.06.51.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 24 Apr 2026 06:51:12 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>
Subject: [PATCH] hwmon: (corsair-psu) Close HID device on probe errors
Date: Fri, 24 Apr 2026 22:50:51 +0900
Message-ID: <20260424135107.13720-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

corsairpsu_probe() opens the HID device before sending the device init
and firmware-info commands. If either command fails, the error path jumps
directly to fail_and_stop and skips hid_hw_close().

Use the existing fail_and_close label for those post-open failures so the
open count and low-level close callback are balanced before hid_hw_stop().

Fixes: d115b51e0e56 ("hwmon: add Corsair PSU HID controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/hwmon/corsair-psu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index dddbd2463f..76f3e1da68 100644
--- a/drivers/hwmon/corsair-psu.c
+++ b/drivers/hwmon/corsair-psu.c
@@ -796,13 +796,13 @@ static int corsairpsu_probe(struct hid_device *hdev, const struct hid_device_id
 	ret = corsairpsu_init(priv);
 	if (ret < 0) {
 		dev_err(&hdev->dev, "unable to initialize device (%d)\n", ret);
-		goto fail_and_stop;
+		goto fail_and_close;
 	}
 
 	ret = corsairpsu_fwinfo(priv);
 	if (ret < 0) {
 		dev_err(&hdev->dev, "unable to query firmware (%d)\n", ret);
-		goto fail_and_stop;
+		goto fail_and_close;
 	}
 
 	corsairpsu_get_criticals(priv);
-- 
2.50.1

