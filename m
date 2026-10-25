Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897601;
	b=zY16bIxbiVap9xnm5N2miSSgwQvnFCmuSzmn3qVGENxKyOi1kdAxjA8ExDBKqX1Z4tKH
	 6MApywarPogyOgKbYYez7gdFTr3NN/OthzrlMfjv8odATerit3GzNZliNAK8KaaTUbcix
	 1/fFrkKK2CEMMoRZIQJf9Q0vkaP8g0jWu8pBaMea6+TYs8fPwoJqW7oc2ZEPEw6qRwfIX
	 80gGFYGP/KpISbNncjqosBtDqzvD7JGo9RC+QoZTGogBQ3XIPJAhp+PACdcm42h4Qk4UT
	 H2B7K6vgXb5L0LO4OaTqkk8FV6TDrpCoAzTtP/5DSxb8HLLcLEs/Z7n03tYZJlGn/xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=8/bj1I5+8Ds5SsfUFlF9atJ0KblL+C2h4CW5CNDZOnc=;
	b=tJKYCn8L0gQhaKMkE07yAAjuasXv5kveZgMf4nLT2aueldrVQxzP49ArVTufu9UvCdII
	 fNm5OYZwF4nS7K9MwfpHqQwsY16+LQhQa2lxU9HAiJWzTQg4chKKGJkLmLmW4+OC1L9Qv
	 6HMFsaskYBAYZzueTUg7FicrJVvgX3WH9LlAqFhL/VN/3dIAvi1VnKlsH7IbljaRkLvFu
	 EBKaQ6nSZCYY9LlE0cFYs6ihD+ZjCEwuwtw8rlZlwEWHoJeuAPaMzCYaNSzgTvYN1PocD
	 3uQ+srNTcDJy65fh4m6rJEuxNE+iduO6Z2rafcrBqITpZqZI3SYgaJfeXaRuF31kTzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fLUwIUzq;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D48606F5F8
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90D48606F5F8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fLUwIUzq
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33fb4680717so3257272eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897601; x=1793502401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/bj1I5+8Ds5SsfUFlF9atJ0KblL+C2h4CW5CNDZOnc=;
        b=fLUwIUzqK3Z45xydi9dSrkmmJeqxNm3QHbUHO7p4p859IgldDZLSDjrCOKt4GH4M5e
         Zk9AXcQsSxHuQqngg5XZW5KL3UYgIFVCUchKPo9WSyDBlPt6KiLRJNGanaIKWn28ibip
         dPo526Z2yL0+h5IS+sD2gvHgTg9P9hS1K/Tui60MULuoFko+OvtO/eKDv03WICURXz8H
         yEN5VsPOjrifKhwzwITkr24MEP84zlb+1kCEJQVBFiQUg44DzrgYYZTu+3orRVlaibyZ
         D7IRQ9HWBM50YTYb5lGzIOep72gkaPHXAHwtfH0tYNzXtzoAIP3IPdm72K/y2g2OsECf
         2vrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897601; x=1793502401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/bj1I5+8Ds5SsfUFlF9atJ0KblL+C2h4CW5CNDZOnc=;
        b=lG12UsiI7SWI42pxxA/J4DIRKIbnlALFcxIFuSiQilSR6cVi/saWU8QchJBdyRLS0e
         m1DY2mJXc611vd+QyNwrjwjYxKxsI6jzdyTg+h2kPRVqcxBH3NU4sBQGCL0e/E9a6qs2
         XEyroVvG4tojGvap4/Xs38tJqxHRa6VAcQuIo/J7TWpn2O28HrmZbLitrZncqif/3DEk
         PJVVxChwO372aTItCwP+T69+TqBp0uPb2kETjjk4lwW95I1jPBUgeSkPAWDxPTnAwnfG
         P0h7i54xhdNRjawWQB+TNXdKaKf03c8pb3UwqkCVN0F26cLmMR7aSYUUlolOWuU4cxxR
         yr5A==
X-Gm-Message-State: AFq9FYKkt3RyqVGMf1CQ2zP7K0xuewu6ciLZVP7+gsmiKmbMFVsGbCNZ
	Bad3q9ukRanO7k5jJ7FAAcbbxKjpRxjX+U+Z05K2w2/O91veaSzMYxb8
X-Gm-Gg: AYBFou1APBOgnSr31CdvcryfUl9dX3NbwDH/BDPWCCUP28Cn7oE4zJHocMasR0HdQly
	wBh42t4hFXzcmAXdRBnehoBVYXm0nTe+U+5r5uXXEzGOY9uE5yEKoPq3UgZL2srseIvkx0X1PSi
	CwObyXF7uzq4pX3J4rHLil5GTKBslLQnr0OrOiTzHBWdolG6VHt010vzBvUUEwuapoysvKFx+SQ
	SdXG59AatuK8eNecEHiQ66zhLqtrSHuEtmgZNG3IL2LmAa3FC5ZScEzd3cgnl6mZBSYtr/ksCqL
	JRane8dQ1iN0vQlydv5p1J3V6ujKLZ23vY0HaCMonA3R3rTKmYLtnuRx1MwwEXUOkbvHmgLC44x
	uBfr6gO+v0GjukWmmc1BGrc+ydIWD8oHwPT68WUR7gJA/2Cg1meUxLTfVWiMuSfN3nOEIwRcVef
	MipmwcdhgjP9oEuInRLAUXo5iZC4IgGtSyOV007e+nrrba8nQPngAmcBKgamsxrD4/qQ4j/t7/K
	u013hsF8XMK9aoKlhpfbSAoYSTdSlBoW7AeEMQGx53q30d182f2CGott21WVSj60v3TR68ljJIT
	uyAsP2a/nhW1YzSoN81yCR5bqnn8Q7Y2xGBlB/1D/y4=
X-Received: by 2002:a05:7301:dd8f:b0:368:4c93:544e with SMTP id 5a478bee46e88-369e836b28amr5517833eec.1.1792897600725;
        Sat, 24 Oct 2026 20:06:40 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:40 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:26 -0700
Subject: [PATCH 23/31] hwmon: (pmbus/pim4328) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-23-e81941ad0cd3@gmail.com>
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

Pass sizeof(device_id) - 1 to i2c_smbus_read_block_data() in
pim4328_probe() to leave room for the NUL terminator, and ensure the
buffer is NUL-terminated before string comparisons.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/pim4328.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pim4328.c b/drivers/hwmon/pmbus/pim4328.c
index 9056dc387e87..2216f8db7ccb 100644
--- a/drivers/hwmon/pmbus/pim4328.c
+++ b/drivers/hwmon/pmbus/pim4328.c
@@ -150,11 +150,13 @@ static int pim4328_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
-	status = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, device_id);
+	status = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					   sizeof(device_id) - 1, device_id);
 	if (status < 0) {
 		dev_err(&client->dev, "Failed to read Manufacturer Model\n");
 		return status;
 	}
+	device_id[status] = '\0';
 	for (mid = pim4328_id; mid->name[0]; mid++) {
 		if (!strncasecmp(mid->name, device_id, strlen(mid->name)))
 			break;

-- 
2.56.0.257.gf7497c7d27-goog

