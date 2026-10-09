Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C7D4E9C31
	for <linux-hwmon@vger.kernel.org>; Fri,  9 Oct 2026 15:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560374; cv=none; b=WzT+y2phLqHCg+FzCU4guDdyGX9BbJ6h8rslc6nllcR0Sq2OCCyCwrSCUmBGetBzaow1F5By+LgJ10mQ6B7YKTKaprYQbtu8juG3GqRPiaA038452bIyWOhKwA9QQFDoyQEbV4RvdeXCu5XKrXFltj3duiGYEBjWMyMCWvULWc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560374; c=relaxed/simple;
	bh=+Rw07kfriWEyCGpVzJxK6mSgxAao1ypqtfUdivitgpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UEiKp8v5GV0fE0PHVaXmkjeJ20kSzuwhoFkQ0TUfAGSqJIgnWtPdMdd4197jLMqCak7F/bX16Y97VBFwTkuYGzYdnInHE3J4QvGv0HgPLkCi+ey9juEIX+RWyWnSSCI0wjVjq0SpYaPmaBRvkoSE1rYLSWYgpFGM75JQI1+N34A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qkD6dK5C; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qkD6dK5C"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e86dce4510so305535ad.3
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Oct 2026 08:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791560372; x=1792165172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkPwa+ResHmZ7LdsIwsHxXNe9JhyIG2QiRNQ9+4WsYI=;
        b=qkD6dK5CqiajjH+cih8ryDb+XaCKwwrAumNBtP56dIXaxKWFmT2j97sqXX8ImhIKu/
         7i5PoNROuRZh5d1k41NkGkWCEWDU0r4qfeCzdd5k+LhDjOzuEF2MFRzvjAiGaZAhwqvI
         rAV54LqxEKUjwRPich55UQUAmPtdgAuqwONC6sWg+QA5umSJS1i40RB6HeT1Qgm6Fm6p
         KUygi+L4o6Jhk2GBCUgl7onvauDxGKM1a3sHGvH9Rt/pfFGau02fIZZBAyNcnnROdUBW
         BnZRLl0y+5OqZghCjjWxw9N4jE9CRSsbwkGSJxSOuEeG0QoryXPrQLFZS2EeEuzlM09i
         x+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791560372; x=1792165172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PkPwa+ResHmZ7LdsIwsHxXNe9JhyIG2QiRNQ9+4WsYI=;
        b=OcrmzyjI7tyi6EpjWgfob+PVlswkKDoRRNm1kk1hJNkta3UE4usbfC5Ws5L83kWjym
         Gw73bl6X1E4LIlD5J4CnmETfOvfHocFyoEdQl+rpZ+YV3eSR2aOzHrOVK+gXX0FljKMX
         hsbBrwgHDjnjhb8PDDy3ln6je4/UdogPqHb6SoDERq0HIqwpiqgTaEU36bhKKplBUxbh
         teo+6swW0p2cUzP2GIYPGeMZ9uJiJLCLBeyTkKQBSw6ukvv2H6tHDtAfSIMhxDLGlk1v
         RY30iUBmP9wLZCCbvy2pvk3os4PlYOchgTfgk24gZLbU6krvexUPzGAiT5AX9d2QQPn7
         mtug==
X-Forwarded-Encrypted: i=1; AKwUvByNafrEhKzHIB7goTKpc6PgVry590Xek8M+NqrQJfylyIRqFp2VMWF6cOLxszJ7hvYI+5o4CHaapA2gEQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK2GQH0ln2njCPA2EF2MJUuu0SHOFxLrtCif2S+NnvVwAcRtCva
	SPj47v/iCNqtyIZbxFHuE/TC8WsN7S5ZMqAnLRLtcftfpb98Eks14ql+
X-Gm-Gg: AYBFou2bm5OtIQ3FCsi11UKWxCQao2NtyJzKmuvePo7IHHO0cw4sdEOqvYcQ5PHiP6N
	tja+KzPCY2fr7vC+Amm817cgdMkIwEwjj0FezRl1DtnP6veGQ0QXqz9WsbeP6OW9XnxadmyUhXU
	4ALXvE4fTcxyNqYjE4hVhitSLWQWMVv6SlkxZGVnBfS703n0ty9VvpDPfK/mAhlYivv9/UFD9v/
	8Oq53lLMwVHoL1flNSinnKGTiuH0qcK0bYUehpWEpm8yC1bYNwc8jAlykyDfSGsJfymp5RQMCpm
	PpVgJ5668+tYgSY8ZWm7wUVRBJvnB847GYgPGryCIrfgzb1dpIVWQIVka7FgeBfovWG0JavAOKo
	xckAVxsmHiWgnAbFjBKfqXEzQ50/DBEzZBgtrG1gpVl5DQe9YX6YUUUqQZHImMem1We7X9zp6vY
	Y3LE68ksSgi4zDjkVAqae2ValQcRQCuLLbI1Y8CXaay6pSG5wGUORrKqVwZlBe/WMEBryi8g==
X-Received: by 2002:a17:903:41c1:b0:2dd:c053:82f3 with SMTP id d9443c01a7336-2e842ce20a2mr18707215ad.42.1791560367626;
        Fri, 09 Oct 2026 08:39:27 -0700 (PDT)
Received: from mincom1 ([14.67.155.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421ae999sm11847705ad.31.2026.10.09.08.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 08:39:27 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] hwmon: Reject truncated attribute names
Date: Sat, 10 Oct 2026 00:38:43 +0900
Message-ID: <c9a2e5f5a8bf08545a999c6ab70aa058eae947dc.1791559095.git.hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1791531025.git.hurryman2212@gmail.com>
References: <cover.1791531025.git.hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Large channel numbers can produce truncated or conflicting attribute
names. Return -EOVERFLOW if a generated name does not fit its buffer.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: Jihong Min <hurryman2212@gmail.com>
---
 drivers/hwmon/hwmon.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index bed16cfd4f1c..288f356980e4 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -553,8 +553,12 @@ static const struct attribute *hwmon_genattr(const void *drvdata,
 	if (type == hwmon_chip) {
 		name = template;
 	} else {
-		scnprintf(hattr->name, sizeof(hattr->name), template,
-			  index + hwmon_attr_base(type));
+		if (snprintf(hattr->name, sizeof(hattr->name), template,
+			     index + hwmon_attr_base(type)) >=
+		    sizeof(hattr->name)) {
+			kfree(hattr);
+			return ERR_PTR(-EOVERFLOW);
+		}
 		name = hattr->name;
 	}
 
