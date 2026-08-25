Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1BE3F0A92
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 09:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787649959; cv=none; b=D2jwqVRCXiZXKJWYktHUMhk6kEwbw9Ud5+FoVDtFZhB8AA2wNcKyAO2zpHJrEcCkLgNfiRCvwqmVTMr0UlUpclIBDDRAF84Q+ogI8e0GdABlJe/W8RCMUp6WUtsZW5OsI7/EHrbUOpH/LRg2Fx7/gTLQw1noOm1qSOKwnMq4msQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787649959; c=relaxed/simple;
	bh=l76oCLpiCkP1+fv2wQD3Bwww2nvMdP8ddihNpJ7IhJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+DDnAdt43bi3x5TLZrNguvjiQvbY3hcpf7yXbdZCFL3t6w5zv9rqB25lfMM4X3hWCUbJakqeQvfgONg6YVkEM0yCg+JRmYTtHbkRtONfRyWk6TX3mafhcZS+W7iXlQO+wBGg1sleK/CnMs8xwhRc2dOd+zZPko/GEamhYbyv6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C608NQAP; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C608NQAP"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15f020a223so663406866b.1
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 02:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787649956; x=1788254756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WmqhkbstVUIAv6coMLpxvuSdMjsljUC7sCwH3KLVIHQ=;
        b=C608NQAPpsG6CnsVQnrIxgNLkrYlDwVqGAKujI7sO3Jxqaek/Bl6+qG0UTAuhv9EhS
         ubkZyRGWOqeB2HjNcljiSszo3KwtkWZu3CRyep7kPiBpYdu4Q1iSzdJ3ROHXuBKM8rTD
         LZIEJheDtIw+q8ONPn/ejMsvK2h+elcna/Fnu6RtQ342NrjlRiDlgOLwH37QFs/J86py
         tj8kulgGk1vtQoByXwhI4jyTKvxWa1wyO36b2+uV+GXqtpY3GrdvXDVfdU4Z4ywrnvtP
         mVEozZTftDWuF1w2PjkD5Z75W6Z8NDJHrX5pJa9glP7UVmWrIhKO7lmYPdEEUj5ggoBR
         0gPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787649956; x=1788254756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WmqhkbstVUIAv6coMLpxvuSdMjsljUC7sCwH3KLVIHQ=;
        b=ay45CmvnRtmhzQEzjlMIhtTKm+Vu0x32WWvdTluCvkiVfkbcJQU44l62HZcByDVydJ
         uyCYma8jVaDqm0y2hgQKY7h5TzJItLlMLSbeTGI79Ad/bFiXPvUBlNGIlmCUuggl3iti
         ZT/G0W728JZIRuokHhdTxgGCCkcVRmBHVt+VzuigSSJNz5G3OigSv2HeVzRtEIf+/3UD
         jp7gf7Qr6FiYsRy/jv1zEDEU/oCTPteJWBe+hVhUABjWnUlfgagAmH6u+kOMpP2o/j0x
         c8pwMSiM8KHHJMzVY6920YXx/we8aAnga5I5J/ELIQ65we+epsgwCsAOeBEAPMrojZxT
         M10A==
X-Gm-Message-State: AFuF++noRXnTJvF1iv4pE/7f+7lDDdveZjAOLdEYplGTVHKvoPBl3spt
	giLNxHpyTXUEjHWtlxqXkFTBBzeNClicfLTjGNuf4M3Cq3QfItauIQQH
X-Gm-Gg: AR+sD12LIbRd/zJyZ8pGMwoBxin6oXsry4p513u4EPKx2kai6sLrvYznz+z+P9jxpBl
	5TAvnkzoNGzEVCWJ6UinXBhWq943B+C9LEE7oWUbrlnbKB3W8vc0jf9ZTLh0z4uF1HqjC5PIICP
	nYC7lCVGqOEmhlxVRp+kebQe0SAI+BmtslhPyqhASNvzhPU/wVQQUH0Hq7RpLVBrTU+9kvR/DXr
	FEdROa3ILVVhk281Cye+GqRNNSdcoT/2T/Khr3eNM/Wo5D4kvSTcvUHXfzwJ1j3MgiXGqgSLzKr
	5XMXivPU/DjCj5L6ebySMwOdr9+9ZPyojGLcfDjS0vUuiYE1XfniEfc6qnJrTPBYn5fc3maDDl3
	L93Zwx8kqhHjmTFwYiz8nj+t3EEzfIWiaEIPEC8dIDWtMXiRJ8skrX4x8esAHija1oD4I9TORHQ
	Dmvcm4O/2/RC1chVigaCnx5C0IIItYjlKqc9DY55zNtatI/YmIW1h0cpSdPzT6T7uTFFd+H0+RD
	rJ0x+6Vk6M8KW1QI8kaMwkbRAm7+2cxx5YFku17SK2ecBgYc8gWAUjYhUuF63hOvZWBpqO12Vph
	uVkkw+WgSSh0Wx9z35A73WI=
X-Received: by 2002:a17:906:fe48:b0:c15:fc59:cdf3 with SMTP id a640c23a62f3a-c24b3ebee48mr2064957566b.12.1787649955545;
        Tue, 25 Aug 2026 02:25:55 -0700 (PDT)
Received: from fractal.tuxedo-gray.ts.net (c-78-82-25-228.bbcust.telenor.se. [78.82.25.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606bd05sm1612570866b.2.2026.08.25.02.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:25:55 -0700 (PDT)
From: Johan Dahlin <jdahlin@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Dahlin <jdahlin@gmail.com>
Subject: [PATCH 1/5] hwmon: (nct6683) Retry pwm writes until they take effect
Date: Tue, 25 Aug 2026 11:25:42 +0200
Message-ID: <20260825092546.669450-2-jdahlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260825092546.669450-1-jdahlin@gmail.com>
References: <20260825092546.669450-1-jdahlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

store_pwm() waits a fixed 1-2 ms for the EC to hand over the fan
configuration registers before writing. That delay dates back to
commit 91918d13eb17 ("hwmon: (nct6683) Add basic support for NCT6683 on
Mitac boards") and, pwm being read-only elsewhere, has never been
exercised against other firmware.

It is too short for at least one of them: on an ASRock B850 Steel Legend
WiFi (NCT6686D), two of six consecutive pwm writes were silently discarded,
leaving the fan on its previous setting.

Read the value back and repeat the sequence when it did not stick, waiting
longer each time and reporting -EIO if it never does. Raising the delay for
everyone would penalise boards that work today, while a write that succeeds
first time issues the same register sequence as before.

Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
---
 drivers/hwmon/nct6683.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index e1c36c95affb..b524a45b1471 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -934,18 +934,29 @@ store_pwm(struct device *dev, struct device_attribute *attr, const char *buf,
 	struct nct6683_data *data = dev_get_drvdata(dev);
 	int index = sattr->index;
 	unsigned long val;
+	int tries;
 
 	if (kstrtoul(buf, 10, &val) || val > 255)
 		return -EINVAL;
 
+	/*
+	 * The EC does not always release the fan configuration registers
+	 * within the settling delay, and a write issued before it does is
+	 * silently discarded. Repeat the sequence until the value sticks.
+	 */
 	mutex_lock(&data->update_lock);
-	nct6683_write(data, NCT6683_REG_FAN_CFG_CTRL, NCT6683_FAN_CFG_REQ);
-	usleep_range(1000, 2000);
-	nct6683_write(data, NCT6683_REG_PWM_WRITE(index), val);
-	nct6683_write(data, NCT6683_REG_FAN_CFG_CTRL, NCT6683_FAN_CFG_DONE);
+	for (tries = 0; tries < 3; tries++) {
+		nct6683_write(data, NCT6683_REG_FAN_CFG_CTRL, NCT6683_FAN_CFG_REQ);
+		/* A failed attempt means the EC needed longer than we waited */
+		usleep_range(1000 * (tries + 1), 2000 * (tries + 1));
+		nct6683_write(data, NCT6683_REG_PWM_WRITE(index), val);
+		nct6683_write(data, NCT6683_REG_FAN_CFG_CTRL, NCT6683_FAN_CFG_DONE);
+		if (nct6683_read(data, NCT6683_REG_PWM_WRITE(index)) == val)
+			break;
+	}
 	mutex_unlock(&data->update_lock);
 
-	return count;
+	return tries == 3 ? -EIO : count;
 }
 
 SENSOR_TEMPLATE(pwm, "pwm%d", S_IRUGO, show_pwm, store_pwm, 0);
-- 
2.53.0

