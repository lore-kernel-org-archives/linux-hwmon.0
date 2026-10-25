Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897596;
	b=R78xGuxYb0fcTodnfNcMc6613IqkG+X2eGZBZKlnDcMM9fXXedneOyjB7riedF3CAyXE
	 bO0NzYMv9oslumiTjpAaI8gnhCVqB8AXMQzM0qLtl56C6BqMUCB1xm24KWlOKRTLQ2q09
	 9knSWuOYxAaqWk7wz1+HqwJQtu8iMhQHQfQUS0EEO9kmzE3xLWLAkF8buJW2/wdRQCEdz
	 rAgPu7I8J6rgWS4IoaAFfeMQQaDs8acH83ilrbSgJWAP/N1dr7URMr9KAf0jjnI94HEry
	 WaFxxtWnQqkIdXUoWPiuUaGxc4+lzzRmnxfhlRhzXuHO/WbZzjYI88Ps3vuGybaoz4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=6SXnGGT+S1u/Tci1iHCHBbJVT/uMFMIlwVrJt1Bm2Og=;
	b=PD0myfKnUoclc+4WCXvStwEW+ZAdKPNFPhRWkgiHhiZitlWaLepGdJ3SOsBKNjvN6Gsm
	 kclzfY4UG5aSAcUaiY1qaLDiOCdqpTVd5pHY+74doJLSMgHA9lHYOd03v3bnvtB0goj/Y
	 SwMg/6IWQ/u8MzB310mouB7RNf0BCUJRvXBtXtXtV3sCYnFGygTWlx3a8ggDrzOrVQoyR
	 RbTDsU9QGVTnuLnjm+mN6k02YYWW5okhbY4UHiNZVrxrG/vW1i0gYW+gb5EPLykLmBmdX
	 IiABAmLsPAZ6oVMCDgVzc0QwLunojCwHylIih8PBpi35FzVxqMwD/0FrOXx94JArJ4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ird0BPJh;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA22360A6F6D
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA22360A6F6D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ird0BPJh
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so3402425c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897595; x=1793502395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6SXnGGT+S1u/Tci1iHCHBbJVT/uMFMIlwVrJt1Bm2Og=;
        b=Ird0BPJh7rr6EwoYVgvMVsxqjsuvSjGHXvqoYfGwCSykDRJasSbt4XSGVvwHZQNN7V
         hXu5SLw03VQYY0NiFPPxgx3pkZ/A74og5bQ7OSWUSF8uzadMdMm1Fv7G/3OegUQ9qOxn
         XPdg86jXtTroGkto1Azn4LL93FcnsSg7DpxcXCPQM3NBNQ3sIh2MHNq9H4jaoP6AD3qa
         6B8ib3vITOb4m4ukv9YjXOwB4HafMaBrndTJrh/s9wbitNF270k0MkdeuRFy3MnbqzW1
         dAQj9hzLwHjuAsQp3ifFwj+wpqAJTrCb1w5R8C4ytUsTfeJyH8X4CZDV++chGI9kwwYu
         MTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897595; x=1793502395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SXnGGT+S1u/Tci1iHCHBbJVT/uMFMIlwVrJt1Bm2Og=;
        b=k8/SX3J20oBNbYQcB+antA9Yt4BLXbnKO+dnVelauYSf8BHguoGuuPlDgGVPcwnAi+
         4MItq6N22c4LXj1VnRVvKFPda75xWPSV+rVFlgAxClN5afk55+RLKWSIncoKvzXWfSn5
         AISH+Mc3UTUy5XDXymf4dLv//HGIoqCktqGLeDcI3+LmtvMsxTqifG9q5uroeP9Y7xM2
         s9EezTIGkQ4hUcDMxDb84QDuaoU39dC2L7ryEFdcASCQ+AE3yE153QNEcjIpwXGCP2qp
         IpYp3IojgPLCD4v0gkh2+MF/arGsyqQ4trae0+3Yp//28btUiy4g9MV2WC2hCFBsMN7+
         OibA==
X-Gm-Message-State: AFq9FYJNFS4w/0f0b9T0qyWu/+O/3Qii2I8RJz/U3d2m3JO+6EcxxX3r
	RGE+y9+9QXyTcDDS3HSjgd3OvGQrSY/vBdCsU1PlBvf9SXlpdww7j2wi
X-Gm-Gg: AYBFou2YfY7lLkvCxouOY3XGANubsbjkO5t7S+JkDpKM/fkcEht9ESRWFig8Ht1lKrP
	A4lESlRf1EpkLvYB2xIzsTsOBL6f9yyxZ9mowUKcSMp/Tw+r7byzQScAv0aDYPrbcVU95xu5vrr
	ZSWEAyMuQPhC6/3TwOcszT0lfqSKwzZ3giOccwUlxXUU2ng65hL2KafDSmOvboFmHEzLergULBH
	XJXuKhU0+jLjk+C8zgUD73JxVjz+ylVg5kxoe8aIgn+ZzayuB1xrqCDm3w9WCx+6iMExBcCL7fx
	oUiJinBm8jUfTDxAxzqkZlsH/Vl6L9r5CISibkU9MBurdA6/bK23gX2GF7QSY2j9rRO6k/68nad
	910vsclAvaQMz6TYKku9f7V55XDbXr4nU3x8sFksOh8KYOWDHSu8zrzroybfkdVEkeJXSdxNSpK
	mPrFwjTO3o1wh1O4h6u80gTMhravF29nWRy8z0scADKEoapo/GlHLMbyMD2BhfQUYXJO5iQ8RXY
	wSl9VRhbJ1BhsF+gw8HLZAkI0E1176b23E5wtY+Y8Y4ELpbzDDLv0szMV1Ai4Wy6Bu/7S9sHKTu
	wAbuwibWqH8Z5Od7k5VvQoV7OforgCUWLv61jsOhsDg=
X-Received: by 2002:a05:7300:8aa0:b0:35c:ceb0:8bf9 with SMTP id 5a478bee46e88-369e84e00acmr4754011eec.38.1792897595016;
        Sat, 24 Oct 2026 20:06:35 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:34 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:22 -0700
Subject: [PATCH 19/31] hwmon: (pmbus/max15301) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-19-e81941ad0cd3@gmail.com>
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

Pass the buffer capacity reserving space for a trailing NUL byte to
i2c_smbus_read_block_data(), and ensure the device ID buffer is
NUL-terminated before comparison.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/max15301.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/max15301.c b/drivers/hwmon/pmbus/max15301.c
index 4c36f1ea27ee..4db35453e432 100644
--- a/drivers/hwmon/pmbus/max15301.c
+++ b/drivers/hwmon/pmbus/max15301.c
@@ -66,11 +66,13 @@ static int max15301_probe(struct i2c_client *client)
 				     | I2C_FUNC_SMBUS_BLOCK_DATA))
 		return -ENODEV;
 
-	status = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, device_id);
+	status = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID,
+					   sizeof(device_id) - 1, device_id);
 	if (status < 0) {
 		dev_err(&client->dev, "Failed to read Device Id\n");
 		return status;
 	}
+	device_id[status] = '\0';
 	for (mid = max15301_id; mid->name[0]; mid++) {
 		if (!strncasecmp(mid->name, device_id, strlen(mid->name)))
 			break;

-- 
2.56.0.257.gf7497c7d27-goog

