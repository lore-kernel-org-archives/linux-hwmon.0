Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1AB238C15
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 10:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771757979; cv=none; b=aFxD9e2fx5xDXJCUEC/vsNqBw6y4TCUcx9YkUscr4C9aW5dP0PQg798E0sI1xc4huKI6AcUBogua+v5UwU/g89TNPClXizLcfxn/a+L95+ajUmiLxBR7SYCZU/QzHiyDXg7TPjrvB1i2UxQJTr8+MoiddbD1uI21dQzhDDA5iiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771757979; c=relaxed/simple;
	bh=GkZs8Pmow6ZIyGQQFd3kgooCkCk46+QckZmK5QoGQVo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t3k2AlInhKm19Hj/ZEz3/DayrBhUc0PCmNwdfQ6+C6kBSmi0au3A6YhU/MtsOjVltjBDIPhoK6auntbDl0Y9KUAHkDJ/Uwg16GObb/RKZnszovvjrvwhvy5W1gC8gAqe9BETjcDo/pHL7PT51Y5Aok4/IIySjEbbIXudCCZhbHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtA9kiPY; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtA9kiPY"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so1812338a91.0
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 02:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771757978; x=1772362778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwUCh1+c9vbdE3tzrM5tTx54gmrr1a6WUHu0qWZDt7g=;
        b=jtA9kiPYPTYm+72hZSuYjiGMTPVRaQjqxJppsznFNWIcaihTmqHxpPSAD+Kn0t9O4f
         mFkpiyJxAw8yyQTgwSANmjgY7Lq7uoALzuxMxWxGTUSTXCKpxcLJqRwDCPXNzrbjpv/5
         v59qEVfvxCM4Q+ITsxHN/FGL39WrWwL+XUvSdngWrq6X/Ukg70kovD2bbq86VLO/cDgr
         qwcU4ciXEj1W25OesBGNJR7HuzBb8ggP6uVHxa/lw+ql+Rh6wpogMNjRxXE1t9k/XhUF
         5g37cyDeUnqlfGXl1CWJPzfW/CXK/IRkSRd6LmvDJ4b896qIr7ShOOjYsaErKH6P0Exs
         gTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771757978; x=1772362778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NwUCh1+c9vbdE3tzrM5tTx54gmrr1a6WUHu0qWZDt7g=;
        b=Yl1MxFI92bbi3gRYBNS7hEpkqqrS5fUrW+OBRDe0KAz3ZAFfsa56+2dFokBjWGGB7J
         0PyZnp0o7df0+sSgQff7L1S1TdCPUKEBSALs2kuQy2SS+mffyCe2oNO5CANEA0pFA/SK
         mmKWW448RHZyzigIOWbSTmOzQdtmsq43iBGubsUBpkuGy2Ch7gWbG4MyfROZfif0lBK2
         YzJ+qpGUigYLFZ7GCbYuv0Cyi+g2ghnCl9tVdXsdMeFE9QGROhNCT29CUIA34ALGXVsj
         DBa0gEKDF8yu2B6nUKAWtvw5w4gu6hwChF+VCe8s93OLNAI39f+QlQrtBrT/T2ud2YhA
         1Q0A==
X-Forwarded-Encrypted: i=1; AJvYcCXq9vo4YLDDRndDmmO2celgYpWUzHnVlpArutK5HLqVCJkyAn//bxkJWXzoQOJRwBv6y6DO6//46AIpPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQgcq4cmW9Wn3UzmkVZW8CAh+86gbfSXIhZS5LYy+EyAbpmyIZ
	LLIyE8f9wh5rJnT99OJA5XGkV/DVWb2cGi7h6WOTK4hYnr44U4G2WKXp
X-Gm-Gg: AZuq6aIRpCGZRzWJ7lDPxxm/2YVOqY23G/O0w7Mlvi692SEqS7Yu23x8jqEFH5lZNsi
	Oj3pazgl/CVjv4ETgQg5+Cp4NRvvs6pFcO2l6RGQiMWQx6ImUmo06Jp/n3Z/mupgc92TxaW4+vk
	0Sy6muG1S9zRlIQk7+/s61k13yDRahkcvAr/3OKuW7lUqrafgO06CHjbsmCpZI+jWP1VwxnKbbC
	38Iv7nhpHnJnWtvFMVvd3FzVj8LkMXSlU1zNZ/4yPyU8OFYHROK09ASN9iTwE9tkOOUqBdFK5d6
	5LQPp8e5PZZ1b5rUnBUFrBuzwnxK6ceu5Atiy2aWiHVKco1kppYHHAdGE7EyBETLUCJ8QXEDnrF
	p9KNBo5ZOW4SlDra4bEaCGTxI10+EharUveKhHa0aMxJzlpUGLrY8r8rAl3BpE01CUcsvC4vzaD
	BKaR3V98Qpgg1In/Py
X-Received: by 2002:a17:90b:4ecd:b0:356:5cf2:eb77 with SMTP id 98e67ed59e1d1-358ae7ba886mr4445120a91.2.1771757977862;
        Sun, 22 Feb 2026 02:59:37 -0800 (PST)
Received: from yu.. ([120.242.225.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358a1b1f84fsm3705278a91.2.2026.02.22.02.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 02:59:37 -0800 (PST)
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
Subject: [PATCH 2/2] hwmon: (aht10) Fix initialization commands and add DT support
Date: Sun, 22 Feb 2026 18:58:31 +0800
Message-Id: <20260222105831.7360-3-haoyufine@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260222105831.7360-1-haoyufine@gmail.com>
References: <20260222105831.7360-1-haoyufine@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct AHT20 initialization command sequence and
change DHT20 command format to 0bxxxxx notation.

Tested on rk3566_lckfb board with aht20 sensor connected at i2c-2 port.

Signed-off-by: Hao Yu <haoyufine@gmail.com>
---
 drivers/hwmon/aht10.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
index 007befdba977..c18332cc48ba 100644
--- a/drivers/hwmon/aht10.c
+++ b/drivers/hwmon/aht10.c
@@ -37,7 +37,9 @@
 #define AHT10_CMD_MEAS	0b10101100
 #define AHT10_CMD_RST	0b10111010
 
-#define DHT20_CMD_INIT	0x71
+#define AHT20_CMD_INIT 0b10111110
+
+#define DHT20_CMD_INIT	0b01110001
 
 /*
  * Flags in the answer byte/command
@@ -60,6 +62,15 @@ static const struct i2c_device_id aht10_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, aht10_id);
 
+static const struct of_device_id aht10_of_match[] = {
+	{ .compatible = "aosong,aht10", .data = (void *)aht10 },
+	{ .compatible = "aosong,aht20", .data = (void *)aht20 },
+	{ .compatible = "aosong,dht20", .data = (void *)dht20 },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, aht10_of_match);
+
 /**
  *   struct aht10_data - All the data required to operate an AHT10/AHT20 chip
  *   @client: the i2c client associated with the AHT10/AHT20
@@ -341,7 +352,7 @@ static int aht10_probe(struct i2c_client *client)
 		data->meas_size = AHT20_MEAS_SIZE;
 		data->crc8 = true;
 		crc8_populate_msb(crc8_table, AHT20_CRC8_POLY);
-		data->init_cmd = AHT10_CMD_INIT;
+		data->init_cmd = AHT20_CMD_INIT;
 		break;
 	case dht20:
 		data->meas_size = AHT20_MEAS_SIZE;
@@ -375,6 +386,7 @@ static int aht10_probe(struct i2c_client *client)
 static struct i2c_driver aht10_driver = {
 	.driver = {
 		.name = "aht10",
+		.of_match_table = aht10_of_match,
 	},
 	.probe      = aht10_probe,
 	.id_table   = aht10_id,
-- 
2.34.1

