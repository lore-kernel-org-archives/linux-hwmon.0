Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897603;
	b=NbeDboZX22lZRnhTlbyYTs5VGoPLR0uCgpelvi+2r6hgY2E17KGaZWsnea3k+J3kIxEp
	 2X9JNIMG/4oqzzVjI6UYEFoyqRjPljaBlij6xw9aXZF+mIw95cW+ieoMSUXfWyb6YIIr3
	 tR6GslhpHnP2tGgcxFHVSAhqUBbUZ14ZFezbaZq0zTV/GEUVfc9iwHUSJeR8SUAWdwjAb
	 B40hSCzOdIG5bZOUm9NxAYhCzssVNhBAdoPNUnTOCH8T9bxUm9K02wdUD39QBhwQJxSqZ
	 O8x6MPgzY6nedKq/ZK3GSKjBIiT9Bl3oXGpgSfzFyTytUDLh+wAduOs7bI1uXHi87/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=zJDnNzHO9o7StmHm3ycv3aSA866AOYrReznkEIoOrl4=;
	b=0JxFpSvHOGy3QDLf8N7aJ7/rdSsgp5JJOO4BYJXAGjuj6CRXP/Yt6l7Qsk2TgWaN89ze
	 KzlD04pT5UCWBWlEwBjvW2hvV6WsCTizIr10BbyVx3ag1IFczGdmPd3jiBzEZxVPduDse
	 +yFJ9xxPUCA4jEqCK9QmIbtZ2dAVGO+NblBwuV11g5txgdflZ5Zl+BOK4x5/a4/pOviz3
	 QowEYD6zDK89TpXKU7PdxUCOHj5EnBY+tOfqGSRXR7FvsKhUaPjH/ycaTAHoQ1qdnJ9P7
	 N6gdTpQe6KtuCz+MP85gmGT3CTRjA/iVOBOY8SpimFcqnywdo62UjfikX4OMm0vfhIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sGPuJMyK;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82C060A3815
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D82C060A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sGPuJMyK
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35943f55c06so2684434eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897602; x=1793502402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zJDnNzHO9o7StmHm3ycv3aSA866AOYrReznkEIoOrl4=;
        b=sGPuJMyKiB6IvmvNHhnY/tgtxQieardVtoAV/RFV/+yaLRQz1cIolPya71+BkNv4z8
         pBADPoKpmauPxEL7Kv/Koq15GceChLInZBzVXdLtmTlazN8mMHAQC7QFGvn/Sq98X9IA
         xpXxpUJdeuT5bntmTgjcPddJXVK7Sk5BdGOE5P8OzN+VklJxBMeGMiRLMrhW6X/VQllh
         7WqRxPrfB6xF1IitcLX0tuP8cmeNzZhu51q7xoZS2FG4oZio1/mgvdR3+muNnNgBOjXe
         Uo/g7NR13mcHt7+Dnl8AfEQiDIqZrLWZ0z+pB9jBLEdgDYHpys3GJAjw0lXH0MIfdpMi
         6eYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897602; x=1793502402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zJDnNzHO9o7StmHm3ycv3aSA866AOYrReznkEIoOrl4=;
        b=zaqXkvc8mdXZ/g+RKhpe70vpOiF9ZZJZ26rLQv96mwdnqxtvSzbgrXBfzTY+lP5cdm
         55oIQoY9ulMnACnSSV/4MKIgp/b5E2DaJfaYSEBmtu3nyCbzzR3xH1kCNykXV4fwPFCw
         wd40BObsE1J3ncZ+yU3RIKA9gTq35hdrOH0snTorRrFVbz0f+Ao4rYMC8ErQ/0MibXaU
         ShjJraQJupe8hp18OcA50rwDwu9WNWbuBz7xV05vXHf8/06f3QEObquNIGWMZ+eVK5PP
         UwNr2Uebxh4NwG+3M0Pn1m75O6X8eRhw41quXNowHM42WJNMMEbaPMWwkH6ykYPtGIqL
         0spg==
X-Gm-Message-State: AFq9FYIOlqjgFu/T12T2p/TpuzfBcx0oyPiCWKdP0Vw3E8sRiUhq8UQY
	yHl7I0Zhj2wCtHtSVAM1IFwoZutvQcCsMkb3deG3S/vFu6v+uABUZwrs
X-Gm-Gg: AYBFou2cnvJ3ItQhPmL/XvKUVgLTVU78rVnrp3fOPSPR0u8uiES2prXWfAeVo2WRjBh
	RAIzHHPaJ0qWa0xbmnO+/U9rFDcWlhDldpTSi/oolFZq5Cy5o4BO0TppRhf0KJicA+OKCGwOelk
	iuxAjMTxPfyNs5kHHCuBxfg7AISZh9Yjqj8/6JRiZ3WZWDT5foka5ViVFaID7fmDDXmkXIn/NV3
	RtFOV8S5/O2+I00HGhjF6/o8ZmUwBkwWQnCct2Z8wpnZhnLJV7jtC5oNqHLyH7QjLacD9wjvUPh
	MCYvsdEe5xokCK1lwypRtOE1sV9MH3GFaTxlH6rxesju2JHdpVbI+7k0tlS/FXkBmwU2gIdbhc0
	j4crWQ08e/xD/Av4HVxXlA3obfInUvVWpoAzXXWjeg5IyvrG38oXl2k1WAadNQyNq3tmRLe5a/f
	4oACj5lgC2loQrLDpbDx/9J521dNH5VR/q1CVlmQVGSeP4EX3JktzeFuqSALFdiXdlOkjQVYoYS
	8YM8HvREVUXPbTuuCgSDpDdJolPTx5sXuKRDpB5yLH1LEIQqMumrh7QsfmrONBfMensRTd100AM
	PBiGEeSOthXYiZIGkzvhLOeJvBmhsaYhTBfUoD1+/yc=
X-Received: by 2002:a05:7301:d187:b0:35a:dbe8:ccb5 with SMTP id 5a478bee46e88-369e87cd7c5mr4525783eec.13.1792897602043;
        Sat, 24 Oct 2026 20:06:42 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:41 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:27 -0700
Subject: [PATCH 24/31] hwmon: (pmbus) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-24-e81941ad0cd3@gmail.com>
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

Pass I2C_SMBUS_BLOCK_MAX to i2c_smbus_read_block_data() in
pmbus_read_smbus_i2c_block_data().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 369a3bed8c87..0f49eb41efcc 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -560,7 +560,8 @@ int pmbus_read_smbus_i2c_block_data(struct i2c_client *client, u8 reg, char *dat
 	if (i2c_check_functionality(client->adapter,
 				    I2C_FUNC_SMBUS_READ_BLOCK_DATA)) {
 		pmbus_wait(client);
-		ret = i2c_smbus_read_block_data(client, reg, data_buf);
+		ret = i2c_smbus_read_block_data(client, reg,
+						I2C_SMBUS_BLOCK_MAX, data_buf);
 		pmbus_update_ts(client, 0);
 		return ret;
 	}

-- 
2.56.0.257.gf7497c7d27-goog

