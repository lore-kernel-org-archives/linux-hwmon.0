Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2546A233924
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 00:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785891451; cv=none; b=FneHksS602vZ2lb5yHp5t6jtZJ0f1BS0vnOtWch9d7gVMDAVEliKUOHiTZAOW/RQZRPPNSd8YqEbAlGU7zxRUksUk+my1q/GeQTSdnpkut3YxyogNC4Md4Mnt/8Eu0DUMajyNoxsjbafMs7OLwplusjXGdx3U7GLad7quF7AT9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785891451; c=relaxed/simple;
	bh=Quh2PrlOEhOfiE6AWOooNP3mVszfenGH1kVkU4VUWVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AX3FeytonHVRnZ5iZqnlByuLEbWB6Piasx89N8HlVduMJrci/jsW+oyQeY7jojugufWd7Er3p/y2MhR9h5jPbU/NSBE/yCppuTodZ9htZL5UwzzomXxNQpKK5CSxdhFLektgp6sH31+6OY/BcNhm3Mva07C9UKrgQa7n+3KOBkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFoM2JR8; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFoM2JR8"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso274964a12.2
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Aug 2026 17:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785891449; x=1786496249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UL71KglVlSv4L0guw4KmKAa9BKK3sLHuCwvWbQXlCL0=;
        b=QFoM2JR8vyP6Am+COKjq6ZHnNBmTGB0WMwGqlJP9xsXh3A+Bab1n6EsHCGrBlNttep
         5xCMad9TVZSmmoKnkeInm3m9dVQRaI/dT1EACj9UZKxyjNxy2eSDiy49vaM4rFzqzSAi
         h1vJ3HVUNvIpo99xq3FepGqCUehhx0JIUy0nnjpY7EJXhboXsHiCkDDkVUbNFSSpCnBe
         DWRel5BEt1MdCTwEjT1ayIocmFoR9+ZgNDMl6HEzolLc6TQl8iXbk1as22OSUrPoucCs
         Oqbx77562m103pEjXH6mkEeAfpHGqCTHh0jguDvO5ILID6ubS+BVvhxojEgCoKs/Kjf1
         d5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785891449; x=1786496249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UL71KglVlSv4L0guw4KmKAa9BKK3sLHuCwvWbQXlCL0=;
        b=FrjTybasytGXVXmNFJMBAR+/OTj/9kHwrL56WHqr2LtNAatz5JGAOVOWzZDYi9xuS1
         FUbRb1bCtc+Yc+ifrsjV3SspZsY3UWWD5HbYMNxA3fKR6t2Nn6+XU6uRTLBir+4K6OXx
         3U/ib7fgrg/dr8FaSFDsv1DMUFWv8JEZ8+5yGF54bPo6f77e9uKUPfTWCcxa0Jef95Z2
         lYRpC9svFpEpWXY9jqReBfGXwMqMtMWLO529H6vAT7cEAeo0IKL/8nzi4SKq272ZSIuc
         ZhOpWi5rKvnv6eGvjrfnEzNWfW+t3yhUA34ByfKxU/fmPZaPdFy+3HzNd03RMupkXSAa
         OuuA==
X-Gm-Message-State: AOJu0YxPIxGouIo3nwNd0VRBMleO68VJ1vXv/GW95bIrlyRSpOl8QGAa
	qBL8zOhcrNhA3e03hP4Gkxhn3U0uNhKx0PyRm6zeHhqKRB8+u0SYpBsYyllAqQ==
X-Gm-Gg: AR+sD11np7ayLAM7OJ7WPd8kQRJgFGI6KdDwXVcjaxWwWB67DEAdNHW5tY7WNyHRPUB
	/+8dqiRY5MFVK4zoANlf6A/CgUNR4P0OQHixP60XAnzM3GPSG7tselCYJYsB4mHosQkZMIlOgxZ
	zAFb7br7sq40BXb1NxVzjB7fZ2QaX3wYVdq9PbfR9ZDcu2AEnElfed21yu5qTa6mrR1+MtAtw9g
	549cq83Oi2pWIJBOsk3AgypWiLcEepT1XMUDhNgCF3xqsqWwQxBevqsTelPA+gBMi4OYtr1aCUL
	2p9xPNHnTBr+6TvLcIB8wIFfbGnftBNUecoAtHX29b9+OW/0UVY1RMC+CH1wTSoO3MBkCvdcj6b
	n0qWgQR/jGAZ3nQc++1F9TuvQXbPL8cegfq0HXGFbf8fOFjcAMP//8we55n2ftwCEQDUEy2y5bR
	cRjHjCqIYILyJjFFsdh2tYVtIhH1gjMwu5bQOl/rAktm6WlXo8ybbcmSdgYTcsFN9y8ectqjPgF
	g==
X-Received: by 2002:a05:6a20:1441:b0:3b3:1c7b:ffb with SMTP id adf61e73a8af0-3cb85f4e1b0mr3352749637.34.1785891449557;
        Tue, 04 Aug 2026 17:57:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158644a195sm8855403eec.13.2026.08.04.17.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 17:57:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Nuno Sa <nuno.sa@analog.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 3/3] hwmon: (ltc4282) Fix parsing adi,current-limit-sense-microvolt
Date: Tue,  4 Aug 2026 17:57:21 -0700
Message-ID: <20260805005721.1566034-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260805005721.1566034-1-linux@roeck-us.net>
References: <20260805005721.1566034-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ltc4282_parse_dt() evaluates the wrong variable when parsing the current
limit.

When the adi,current-limit-sense-microvolt property is parsed into
st->vsense_max, the subsequent switch statement evaluates the unrelated
val variable instead of st->vsense_max:

drivers/hwmon/ltc4282.c:ltc4282_parse_dt() {
    ...
        ret = device_property_read_u32(dev, "adi,current-limit-sense-microvolt",
                                       &st->vsense_max);
        if (!ret) {
                int reg_val;

                switch (val) {
                case 12500:
                        reg_val = 0;
                        break;
    ...
}

Because val holds a small integer representing vin_mode (from 0 to 3), it
never matches any of the valid current limit cases.

This causes it to always fall through to the default error case, return
-EINVAL, and aborts probe initialization for any device tree using this
property.

Validate st->vsense_max instead to fix the problem.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: cbc29538dbf7d ("hwmon: Add driver for LTC4282")
Cc: Nuno Sa <nuno.sa@analog.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ltc4282.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
index bb1bcb369016..b1675dc5b3c7 100644
--- a/drivers/hwmon/ltc4282.c
+++ b/drivers/hwmon/ltc4282.c
@@ -1394,7 +1394,7 @@ static int ltc4282_setup(struct ltc4282_state *st, struct device *dev)
 	if (!ret) {
 		int reg_val;
 
-		switch (val) {
+		switch (st->vsense_max) {
 		case 12500:
 			reg_val = 0;
 			break;
-- 
2.45.2

