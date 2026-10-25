Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897592;
	b=VGSOCLY3cYg/Fp7c46LcGqr2A+giLxvdbf4c88JwvtBJlC66jeniS6F5ZvkwteafT74k
	 2MfbemrOXpnqSy06uRziyWlP9B/Z9oW8pUWL80V9EKkptpirIb6daema3BYPudUNfJbRc
	 Sw/k0GKiuaAyzm4F6OT6eKTRshcuQcZCfFkAHpQC7ixQZQQcJZ+KksQifLYOBaFdeWNhL
	 qLNEmBXF5iH7EioxiY69XSZwyE4PhtmkbgsyoMBWe4PdiwMerEAxmd87xdV7AxtB/wWNG
	 cRsgqiYb8hctGi7fh+yi/a3LqW3kwO4WW8cmttZJrFfIGzoUMogjz10FU5nwlLnfHXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=yLFtKfRKUa5NMVUposjY6SESfjzfDXCtgm5eFydYkqY=;
	b=b2I99PTWDdc7KD7WHiV8U6tbLG1+txC+xLWEvDAZ+qc3tu3Yb363YAYgnbkESD7Pg8Tf
	 0DaTbeN6JRIhWsRR5KDBG7rfayNPEY9L9nDM1ApuvK/neZQ+Cgpb3TY3RDj+1mIiJ8iGl
	 zQTdAZValYVFY8xsZ8OS0x8oIZcZI8r0LbVGGx6OwcX0trm2IoClKoJ+Mzx/ej2Ma0QSc
	 Wb+imuWCbQDK6sFqSsW+WBZSFlY6q9m89ygEWav3lDXurXYpzb54HaPja2EjtO4qKsA4i
	 715QGdKb7L3N4OCIbsOO+j8GRfrp5FlImV0Pd6a/DK4ty+/mdi00P2ZNdHfyh4wvPWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ClBqXB9M;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA9160A2601
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDA9160A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ClBqXB9M
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35f1f76ea84so3393059eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897591; x=1793502391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLFtKfRKUa5NMVUposjY6SESfjzfDXCtgm5eFydYkqY=;
        b=ClBqXB9MYBWkO6TVr6UmKBsGVwvf31Kg0xY5fWInnmrJu/uJwCUPmzJSSraHZSYoSd
         iZTfSuw8TvrVWYsV999KJIykHgd3SbNEi+wt9JPT+tGNgH6ISLPkvSFiD2KWtqblZ7vE
         l7L2zFmlIIFCBClJ11z4jFdM1aSG4dAk0LpiHpdLbAFOMji18ncNGrtduR6Sq31f2Cza
         e6VtzqITOOBiF8WL4rzW4jvcjEkDY7Nr37NW8mIdO6uBsmrUV1lfDj4fgPcCZhTMhLLC
         zHPcKRQcbu9HfIE9Pjby4AVDK+S59vsnai/FuhJcAip/0Hk78QvSqWJwnk0XRTRteOAl
         wjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897591; x=1793502391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLFtKfRKUa5NMVUposjY6SESfjzfDXCtgm5eFydYkqY=;
        b=kz/MSILEkoxuJcGK3Pej/gQ8WMLPq5pjUKvPAkJ6NNomXwa4gllUDL148Prrc/B1hf
         G3hB479apfU4hY94RMZsYZKv4HSfDVs35zldNsNSTIEaF5eJj3ak1gBz5blekZ707Ill
         hvDYkhcS4xg+SsWGYVWWVjfldCfvf55EJzWcqbzG2lg9V63zm10w52A7+5Ekg4MdOLI9
         ObOAinmRf+OAJvateKBksD/RwM0ebXRLykgyWpvADPpODat6Lp+lwvKh0OVp61GV/zwh
         CDoJVqUAmbJCXuEqu9G5jhQxOV4O/kmM9v/ZYWBMvc+MxRnspJCPPm0o1ROTtkqp2EsL
         o6TA==
X-Gm-Message-State: AFq9FYLQLPPJQjoiKw5LuXHuHN0vK/RRk9ZJL7LZesgKwvALLbgi8tTl
	8ma0HmXnP7c6k+XvHVaFPDCuDF6ymHegGrgBjGuxIksyY32t4Wfi7i98
X-Gm-Gg: AYBFou0veDDDe7FpeEkGmFSBte0/Fg6nCz3uSH1gUmVmk7Fx3lxzNP/5SSZ6SU+Ddau
	kKdduIWpvSCJF7bJmfvd3+hPtD6Ip6AbDJmUdBQ/955ltPfNv/1TbK9uBG6wT5ehfMOp+d6Vj6K
	wTjCbZUxIRwOFelNSd2tdKLUie9y7EUn9Hiq/tTvaLRo5q3YlassejZvdGFM+gIhQfsewJqJCC1
	XKwQ1oVaML5WgJFK9mscU1ohJkQLiIh4Qh0lEhG8zqxeyxMN9M6PxcUmlFkeo1iIleg1qEtshaU
	QnmpzQmrK176D/kgxiQk2tqxM77neFt7ukTzx8cHDMibZtvrQGR1byAr4bdLTsx4ttYtUyfvt8G
	0wjF8dg2tYn2wUCAYIgTKbPJQgwUXUjqLGNp61z3dzGk25m8hkU8brFOfblBwkTi4QSEqqt+RVS
	Q4pU7tYkngr/rEe0xsJFCn0z3Skv2rovfFYCe1YQxusWiSRW5gvPIPcVTPp6XyI/oG9gPA28m5T
	bb8ETC3Rp5Srxlg151etnQzpWUzG+kKNbhyxGBjDZt4ffbSWTfvEvcmXxwDYnl7sEgQtqfztClY
	+C2xrDz+a7/6uTB5rTCfLWsd3s76ykBL9noV7GZ62Ic=
X-Received: by 2002:a05:693c:41ce:10b0:369:e8fa:62e6 with SMTP id 5a478bee46e88-369e8fa6628mr4607131eec.13.1792897590943;
        Sat, 24 Oct 2026 20:06:30 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:30 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:19 -0700
Subject: [PATCH 16/31] hwmon: (pmbus/lt7182s) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-16-e81941ad0cd3@gmail.com>
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

Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() in lt7182s_probe()
to leave space for the NUL terminator.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/lt7182s.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/lt7182s.c b/drivers/hwmon/pmbus/lt7182s.c
index f8971a786f25..62e180dd5dbf 100644
--- a/drivers/hwmon/pmbus/lt7182s.c
+++ b/drivers/hwmon/pmbus/lt7182s.c
@@ -113,7 +113,8 @@ static int lt7182s_probe(struct i2c_client *client)
 				     I2C_FUNC_SMBUS_READ_BLOCK_DATA))
 		return -ENODEV;
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(dev, "Failed to read PMBUS_MFR_ID\n");
 		return ret;
@@ -124,7 +125,8 @@ static int lt7182s_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(dev, "Failed to read PMBUS_MFR_MODEL\n");
 		return ret;

-- 
2.56.0.257.gf7497c7d27-goog

