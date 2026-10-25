Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897585;
	b=p/B4GhBdmsk97k0z7tP405XA0l7dzEU/dC7BKV2wo3L43AKInBTQq9Qdn3cwg7biywrK
	 VcxLKNvXbWgka4XMyDiOo7ycixL1clkkkzj0VRlRV0uIb8dQWk12M9MPLOqaLe6ciCJE0
	 fY/rWrsa/ftUV/j501N0mNZSKIH66PPL4LRSnSMggX4sFucWsCEZQTc+SPY+NSDIKUHwV
	 NwFCEbTMLTGh/x+Z0Cde0uul0zoQO8FWxBFm/VYl1jAn/SxS1bh6AFZoytRDhPnHxfjXz
	 m6Tfj5o53uwpJrjLrCzGAr0WbLaqZrRN6aJrm4xOMXHmSpgmmoaZpPjA36XD6fB7G/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=s8ijpeWG9F9tf3Qp5MwZtZwDcNML0+WlIyWXigQhgYE=;
	b=aiAPheQ2pRN3b4dTKwNfjRyf3azBRI8gciWADb7Jk4cWutHImWSK/zHc8/xsSqcagpDd
	 DRNeH1j0i76dNSHemLQArMsJkDohNfwN2+i7Lm0JNdqRQ2PEN7o78lCJmqiZd4gmMkTmV
	 RuX6ldZ7jU+ARfwpev5fNJvOTUfxHQY3Tbof+/42EIhRhSrAAojvnpzQHcsksBMO1IhE2
	 XhnzA8R1NAPYRPSTEx8jX9ZGyRYLg8OT7Fr1Xhv72CPAbSG5kJS3dKz7sRTv4eL+BP1kG
	 lH9rXEknqDJbELxtZPmGgN8/sU3QjZMiCY7o05PTyAyyW0sRy7c1wCTAisUbWyiXB/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RXuXv7RM;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B499560A2614
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B499560A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RXuXv7RM
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36681e85e87so1519769eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897584; x=1793502384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8ijpeWG9F9tf3Qp5MwZtZwDcNML0+WlIyWXigQhgYE=;
        b=RXuXv7RMEUB/YmVbaoavTEmt4PecUl8tcQCW+a5iCg0HriEb99qoj17We/+5ZSasFu
         23aiWJWG0pE5kcxjCELSFELtQ+77if6SXil2IeiXaNDOUyUr5zhOyWuGEkEjBusjVT18
         wGmpsptxlSmAP6sb2GD/Fdu217sSRnb0q1lvLEI4c9K7DHisEsbXXwBmr1hrV540rAZQ
         sxLCuIcrlwshzFEdmKICBe9rC3UvBxgFj49A/FQ3iHUnOAr25RXMJiaNKL8vCrn3UVmN
         ePMdGeNoiLHLat52SNQr/JXNrwCvwPZtDGXMmjzpn2xHgaJXMrhzndc286BMJcEAfL1h
         xnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897584; x=1793502384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s8ijpeWG9F9tf3Qp5MwZtZwDcNML0+WlIyWXigQhgYE=;
        b=kVV9uyLAGJxIa0rHhAM0W+E79rPrIO70FOx7Le5ybJEeQVIRgncQkXXn7WKQZ6Fl/k
         QPMc+yyuAbwdGPUDJEOnFN6FKjy5eonLJMpxmruNacZWCQPQpO2VDzoNznmqv+xKb2W6
         bDOl2p8k2w3eZ5d5FWTg+vpbqit+GKyLasJl9uJeXrcxoFRkTfDH5CTPDVWzs+SLDSHz
         StcZRCtLd17I8poD4ToYimjyFhPio30Mw7lP/37DXUnwPpgyQXrfuJvYQFY6V4qVaXuX
         pcUsCTyT38k528FI6m+EIdehbQt8rSAnmCkWeMpMWkfMro4U0zBGehRucmPe43hJW3+H
         4VfQ==
X-Gm-Message-State: AFq9FYLK7Wk3xf4qRtvNlzigGF9DQkBolkgVAlAqRx79WIhOuTTUL8dd
	4xgAYF/h0D1GKKVN/pRKlie+OfsArL2cx4t1m1x0fcnfDWujEOo2RKRa
X-Gm-Gg: AYBFou3grJPjyXrv1957uyLLFJ/l5FIxjMlhq2cMXAwb881LIKXRVJE4ADQydV5r/Z1
	p52fVd1Lc0lCDh05/qIt5q00v63s9M3hWhvyllkOfHo9E+G9sFuoYGzhWl3xm2gT0uzEmzG4TTI
	xDgnuvwvChAHIi3InYKUYiKFPVY+FOz0hYXjw+82Yob2En02ryOXi0wIWtL+/EjkNQUGNpPGVLZ
	3WDjMrEYXehdCwB53BTDQvb6oGiTI3nZVBD1MjcdtjG39Dp5zCK7aVKVPyBNkef3dbXOSmuuy83
	NanziGLsyKWD3dWaTaleY/aqeDuNnmQ4Oru854b1cwA8doOAot57WnpQDn/MGpu/q4IpycSZtDo
	q9has8jJ7Bm/PoqlJgKlZGYq2kNGdh4QKHe8LsClxAM/fk192qzxddzn++37apvsCgrbreMJBoa
	JcktV76LEsTbxAyzpghpjqicEZf2UU+hcToiEqsGzx+GfHjIcsLdb+hCp6bJ/ejuXSQGE1+o1pl
	xCNyn7yRr4QDp+onz6OhXXki7DZPGOJotmqZI58C0yLnyolqjOmHBza5j3jncMbcsxNHSc43hIk
	6metB9XC8q0k0Xy2/8E8eNhTtIzN/CXf01ubtTVLCc8iFHvT5TDVG4BIav8BQ9G0
X-Received: by 2002:a05:7301:2284:b0:369:1084:8ee3 with SMTP id 5a478bee46e88-369e848c506mr6912678eec.23.1792897583849;
        Sat, 24 Oct 2026 20:06:23 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:23 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:14 -0700
Subject: [PATCH 11/31] hwmon: (pmbus/dps920ab) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-11-e81941ad0cd3@gmail.com>
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

Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() in dps920ab_probe()
to leave space for the NUL terminator.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/dps920ab.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/dps920ab.c b/drivers/hwmon/pmbus/dps920ab.c
index 0d2901c314c2..694b5f386df5 100644
--- a/drivers/hwmon/pmbus/dps920ab.c
+++ b/drivers/hwmon/pmbus/dps920ab.c
@@ -143,7 +143,8 @@ static int dps920ab_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
 		return ret;
@@ -159,7 +160,8 @@ static int dps920ab_probe(struct i2c_client *client)
 	if (!data->mfr_id)
 		return -ENOMEM;
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read Manufacturer Model\n");
 		return ret;

-- 
2.56.0.257.gf7497c7d27-goog

