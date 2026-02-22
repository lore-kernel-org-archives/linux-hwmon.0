Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13BE1A267
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 17:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771779827; cv=none; b=jVp4SeazZivhnj7Z/lCYnvVIsNxZHqMJYTNTh4XSBypOFQ2DoksTQ83fIFZCYSQkJ1uE0n45BKVOTzwa/VXcA9SjtQwrXC+jZy3Q1grqZVCL7af07rIgCJPMt4MwJ15Cen23buN+tlGpEONZ1MaIgFMfb3bXpl/aA9JfMnRbmPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771779827; c=relaxed/simple;
	bh=haLmVgyaV6W8hTOWkulToi9+xkU1RIIZzub9gf0bEwY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NOxgJAHJMR3oODm1ggV4D2CcBAA5JXUxUv0Un+GnbjXutNeFXlkysjdWzv9UIonbj3Ol82ZyX9QGYqoKNfpu8PLK/stmIeHFOTjvDWj8+AL+CIlNA/ytEJa94zAzcPoZWlmjPekk0Ba2ze/l5w/eMdyKV2iNowK+LcM9SkqZnqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DcqU23/u; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcqU23/u"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-35640ad94d3so2908074a91.1
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 09:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771779825; x=1772384625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RUQ8aOslaSvzIq+ti9JbdHNa1xuS295v1ngsLhUPWs=;
        b=DcqU23/ulosJEn1ZfHV2xyVMz4Ht4rflg61wCW6S17m5y5TjGbmU3+gYSNhymEImQx
         5lOxRVqyj1W2+/331gVx6qKUIId5pde0B/Fc/L9w1yGbnJ1EAnrhnB9EFHM2QqJLpVUm
         R44Y/0STKR0fQ5GFyfkVjRa+1EKgSnodQot8yqNblkfWVL1L2KdfVy0avX9perfc+GsT
         9RG+hJCfPoQj/41o5mr0BBd9V1+GWPlldZk3u6Ola1wJzrgMQ8iontD6OPPmH/4lSlH4
         wPvXOFAKHx8K/UG180Gaz6XwLxLN0zo8v0OiDHLnwAbzZm+IiIdHguju3EnXmNLSfvyM
         tB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771779825; x=1772384625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2RUQ8aOslaSvzIq+ti9JbdHNa1xuS295v1ngsLhUPWs=;
        b=MYlROHhiZMqYS8NHjLwDDfJ27aBk7PdtKo0Y0PigVk9knANE3mZWeAgjmOoNF0lCKi
         m0nZ2P+1I31rMMYh21z4AY8vK769/YHy0Cv3iCTqCwib8OiZUczW0KJ8g6NQpqpZZUVh
         XFFd+KVR+ndGZuZ+Wq1mvv0HVi6yJuIRnjVZEVjJjK443x8Hb8/wez+0lVDxYawpTUcv
         FX9MPRyDrBTw/2uajfyotbZ1y8fori1bgmMpzBy02dFKaPyBgZ2aSxX/QkoeIgQ3TNe+
         0VGK20uw6vJJuwpS+7bEtduxNg+eD/XACO6jKJoROblB03Txs2KXPDT+o9tQQoiCwCM9
         4q0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnthYUmK+DIh3nlqMF2dvEH6ZghfHI9xtvohumMd05vvQpoZ4cuiTgDNok9Z3Z9qxv5cPcf+edSOIyGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMhfH+5eLlGxyIj5FTi4q0dI2qvIdHaUb4AQMn7GRQAheqSzey
	MJXxMqapjBKjYyAifBaCMy+COy91ceIwqvycn+9W/livansJZdAzDMk4
X-Gm-Gg: AZuq6aITFh0cFvessgUlv7Fkp5q/jM3iy0RK3cIe1kUryf7rASdJCtQ+yDDrFrE95wM
	oJPEgQqbBGBSGzURs7buRPoJBeRZfpHmnHw1xvhousUloJ6ettAHTQKC43W7YrFICd+a9lPwNc4
	lCBEp+8snBS8RBw5KdRSvhKFe7rvDyZn49FUkGNg7Mh9o+u9eJO3hRbzCvw7QBDWKCe5H4QB142
	ckxZxDVPHbCIHucxGX9FEiyiTCK9E+sNUVkS0WYPYuVBcOo4i1uWL0xNNamfxckt9IcHobQloYQ
	WJbzt6pGSuLyE5bg8Cto0M5eMZVBpzMcJaXn0rrR5TdsZBDBjDjrskJ4/DnbF1oFFRFyNBMohvB
	Vy9XDJikWzgpQm/uKqHHeNUDFaALCliO0fgrahFhVosiSxk1JHd5HYxPnOpp6fgm0YScJGSNQzd
	bULrpE5YTx6hsgTEj2
X-Received: by 2002:a17:90b:1d82:b0:354:c7f8:6d7b with SMTP id 98e67ed59e1d1-358ae8d0700mr5253625a91.27.1771779825178;
        Sun, 22 Feb 2026 09:03:45 -0800 (PST)
Received: from yu.. ([120.242.225.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358bf39ba25sm1555688a91.2.2026.02.22.09.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 09:03:44 -0800 (PST)
From: Hao Yu <haoyufine@gmail.com>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jcdra1@gmail.com,
	akhilesh@ee.iitb.ac.in,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hao Yu <haoyufine@gmail.com>
Subject: [PATCH v2 2/3] hwmon: (aht10) Fix initialization commands for AHT20
Date: Mon, 23 Feb 2026 01:03:31 +0800
Message-Id: <20260222170332.1616-3-haoyufine@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260222170332.1616-1-haoyufine@gmail.com>
References: <20260222170332.1616-1-haoyufine@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the AHT20 datasheet (updated to V1.0 after the 2023.09
version), the initialization command for AHT20 is 0b10111110 (0xBE).
The previous sequence (0xE1) used in earlier versions is no longer
compatible with newer AHT20 sensors. Update the initialization
command to ensure the sensor is properly initialized.

Fixes: d2abcb5cc885 ("hwmon: (aht10) Add support for compatible aht20")
Signed-off-by: Hao Yu <haoyufine@gmail.com>
---
 drivers/hwmon/aht10.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
index 007befdba977..4ce019d2cc80 100644
--- a/drivers/hwmon/aht10.c
+++ b/drivers/hwmon/aht10.c
@@ -37,7 +37,9 @@
 #define AHT10_CMD_MEAS	0b10101100
 #define AHT10_CMD_RST	0b10111010
 
-#define DHT20_CMD_INIT	0x71
+#define AHT20_CMD_INIT	0b10111110
+
+#define DHT20_CMD_INIT	0b01110001
 
 /*
  * Flags in the answer byte/command
@@ -341,7 +343,7 @@ static int aht10_probe(struct i2c_client *client)
 		data->meas_size = AHT20_MEAS_SIZE;
 		data->crc8 = true;
 		crc8_populate_msb(crc8_table, AHT20_CRC8_POLY);
-		data->init_cmd = AHT10_CMD_INIT;
+		data->init_cmd = AHT20_CMD_INIT;
 		break;
 	case dht20:
 		data->meas_size = AHT20_MEAS_SIZE;
-- 
2.34.1

