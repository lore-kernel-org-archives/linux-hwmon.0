Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897593;
	b=Q726Ub+mM587U1KSSPhFbaqGXz7vm6uAY3skJrgFXxifdDqe8JLZ1JvI7EVVt5HjkFAU
	 PWFgt4HhX1E/ljCBtBWqb20EihZrT7hGp+xML05BakNhirtnVhs/vWu7hMav+M22/FMlU
	 45jKiOA552eIu3a4EmYQnnwlfTlFnxca0acBRRGCxgScTHsAwoJ4yRJFsreKsbmmN0/ff
	 bsZ9clFQbQoyC0hZw7X8lIVSFyCIXXEWll91SjwxzkWCxLyQiIyM8OAARrbLGFi5xYVQN
	 1wDwtVNlq5sktBm2+gmohYn4BWYqQJm1IUMlxGOsVQE162zTkkuAPECTrGEI6Qhfwjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZR6Ph4oDU6p5rGy+Nt5WsR/zak2RyO4JkRE8Gwl+1MA=;
	b=owOCZTM8orbuVYazqpgwvj+rD6gSeeQoq1Ehx/pndG9KAtxJjwtq3TbjKZTGIHhT8ktA
	 WKB5vJ4B4GfYnRAcPoNKQOotbRf3TFIfdmlBohvehDUiVls9yGmvRaz4U4N0DXt0/jMXB
	 4+fivySuPNjBOBa31oc++zh/x6KtJK7bAsHmK0hgi6WL6/TdnoHwpZ4B6z0raiA14RBZI
	 Y9jQd0NEPw+xBwpJWMaHsOvjz38L9Qwt1iKStAnfOoGwxuzBUaoFxrwyM0nUuvaiqnFjn
	 lvxoHMeXaTGybih1GCuMkJakk0//UcGVin5s+ZTJbrBDqzyJWGI7vJrdRIKSl9WIByw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="s/0fLdBt";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E32260A6F55
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E32260A6F55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s/0fLdBt
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36681e85e87so1519964eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897592; x=1793502392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZR6Ph4oDU6p5rGy+Nt5WsR/zak2RyO4JkRE8Gwl+1MA=;
        b=s/0fLdBtM+o1/t/QTvZDL+0QnBCTbu18PSvh+EBSgpSoEW1Nl+H+qywlmcKoCmSKBB
         6bqItptYtAAIDElFpn7edI1iDrS9hJ4VnYVoJqTt//8ylcuXTrrVrfWoA60zZ+RwajZR
         e21IZgBlLc4P8xtezVUxOFEiPn+zuKTHlNeRZbSF4Id3nMo3wHBtPhFfixVKffbVliFX
         WcEOcBkHQr1Bt+FzajKIpF/+EMFRXxEFerOvFHo/0Qv36kSP4vwP1x0imhSQD4kCG8L6
         HFzJvlob1zmLhnrqkXiuZdM1RQUzzYn5mvDPUNMABtECkBXag1FN4LxJ998e7nHUs+vz
         QCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897592; x=1793502392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZR6Ph4oDU6p5rGy+Nt5WsR/zak2RyO4JkRE8Gwl+1MA=;
        b=cHibb0resUP2nAFnRQpMaVGaO1e7FmEUCUnOc0BCWCO6qujZk4gF3MQ3GtIpsfZo90
         VdsZQUciB1OPcwskXfN+q6KYxcehJm4kYx1PFN+yO6qqHEF0ydFbzXlNgEFqWxzDHheT
         dy241A1AT7qf0Qe/QdytnxE55RK9KLxeMGt0aa3YBcywHeUvt1cJ1QLjrCGZFAOTNRq7
         XsYbtqgcbuVXSwyt7AZj/1v4zlFRYe7wsjrAOWjLe3Y0LEL0WYLRCM79YTut2Bpw0DAB
         cmKaRz49pWHElsntWUIeToakusX8Y3WaL9/tAp34u+DjkXgnH1yzBTX5lCNlRhYZuZd1
         e1/Q==
X-Gm-Message-State: AFq9FYK+dOKCMbfrQoKSYUQQW6gHB/JNDPk8putoUs9o/oHbRfOTvu0z
	tqAJN0pRFBzyY6CIqtLjHUwgN+nkC6WY1Bshin4FkIGu/7xDVdqyqTJ4
X-Gm-Gg: AYBFou07MdA/Y3ODDiXvs61+aYHg/jCyOWkSpTY9jxJp1nADvJCJKxFI7mZ4KgFzmqN
	03GaUTjsEqApxLx74/se2iCdSAjuIVOEN/rCiS/NU1BOcPEc13yaBBIOFJ9UZCDYH6ZIk3l/wKQ
	ZUYk67OUpre1VVu2SOXODjzbqVzMz8dAbvAyNMCBO4WN5OX2r7QPEoccZp3ei0uwjtiqs+b62Rb
	MMgLRLidiDi2XEXrv92DQN46a0HUjmej2qqn7B+EbS8Vk+E8D4tz5oNDghIB7waTPBtG5CwDS5R
	ZC23i/V+50rT9DuPv96ZzSggMi0Mf4Ol3hthIf8IdtdDB9KWETtZ9WTlrv4MxKtFMvtakI0CTH8
	Etbc7LEMnJBmY9UJuESRuHj+b9dZhYkrACrKPnhkduO54Kg0+hmBBfnNsXHLxHG6KTUOnt8tzXt
	qWFiota8gLD5oZ0KttnK1r1OzExa8uGAyJO457DKB96h9fGmWto+q2cmMG6OagrkK7sLh2kgEUh
	+2kzPXjCndnD/baBv1qKc70cJdMt2rg4l1G8FeqtRjRQu5JYB77C7ypEjxXrRTLyxeR8aO5lui7
	0NWGOSamLvILqysk0F2gzMpN+r0g0JlUQ8n6nHRJiH4=
X-Received: by 2002:a05:693c:6010:b0:369:f3e3:4277 with SMTP id 5a478bee46e88-369f3e3453cmr2562582eec.38.1792897592392;
        Sat, 24 Oct 2026 20:06:32 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:31 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:20 -0700
Subject: [PATCH 17/31] hwmon: (pmbus/ltc4286) use 4-argument
 i2c_smbus_read_block_data()
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-17-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Andy Chung <andy.chung@amd.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Robert Marko <robert.marko@sartura.hr>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Daniel Nilsson <daniel.nilsson@flex.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Pass sizeof(block_buffer) - 1 to i2c_smbus_read_block_data() in
ltc4286_probe() to leave room for the NUL terminator, and explicitly
terminate the buffer before comparing model strings.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/ltc4286.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/ltc4286.c b/drivers/hwmon/pmbus/ltc4286.c
index 8190706d1beb..530eace926ae 100644
--- a/drivers/hwmon/pmbus/ltc4286.c
+++ b/drivers/hwmon/pmbus/ltc4286.c
@@ -155,7 +155,8 @@ static int ltc4286_probe(struct i2c_client *client)
 	u32 rsense;
 	int vrange_nval, vrange_oval;
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, block_buffer);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
+					sizeof(block_buffer) - 1, block_buffer);
 	if (ret < 0) {
 		return dev_err_probe(&client->dev, ret,
 				     "Failed to read manufacturer id\n");
@@ -171,12 +172,15 @@ static int ltc4286_probe(struct i2c_client *client)
 				     "Manufacturer id mismatch\n");
 	}
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					sizeof(block_buffer) - 1, block_buffer);
 	if (ret < 0) {
 		return dev_err_probe(&client->dev, ret,
 				     "Failed to read manufacturer model\n");
 	}
 
+	block_buffer[ret] = '\0';
+
 	for (mid = ltc4286_id; mid->name[0]; mid++) {
 		if (!strncasecmp(mid->name, block_buffer, strlen(mid->name)))
 			break;

-- 
2.56.0.257.gf7497c7d27-goog

