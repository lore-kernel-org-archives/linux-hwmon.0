Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897607;
	b=Xxu3BxtCWEFwvP386GBtVw5UKOXr2403MvfZKp8i9IhtV6YzdpLg+3Ca+YNW8O9hUSLB
	 VA1wU2cSy64rdg9ul1zxBOUCedprLvzCZ1gMBgpzCWvL03yGFbfMNFSWi6QUA0IQQpDfo
	 Zv4IZdq+lhfdJK3WviwnMbHNthF6E5Mt+ZfQNh37/mn/6jCtB9tC4fky9zBcXmBco+QnZ
	 IXI65p3PeJisHEnZ4T/S/NJ6qYa0jUoaTl72HwgmKnBfMPEZIpJvy52CpfbN/+xLhXUiX
	 C70vqWHaLQv0lN1ZoveYfOHeFEJps5Pn8/gIdQIVZglI+zf+Vb/F4yYGE0B8yPLReoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=qs00o1EWp7RXAZ6uortmy61vywYTOn5HTBBb0nXYHEs=;
	b=1vhIwBSEGyS1Is1ObDi+eOl+etOsEbQu2agioT6ZAuhgwGWMZAiGF4e4OaUeLZP+q47H
	 lk0F1HZNyPViqsZUaFenrUZKxwpqGAZlCRK+sDn9l3wqshW+qLzEXfQVWynuu78g2hqeq
	 lWfCRML3vj60SSDmBiLh97nwmNS1tPrYAZ/TTvNygpgYGK5JcMLHYoBLSyvo5BftaIrAW
	 tXeENrW52Plt+R+h2fcg0HcINlbUZ1VLPl2WP+LKMlKT7NsUeH9OmWXnXRxIQkHzM641N
	 nbpMuu87oMJYXPO8dZvNeWt422gQTeI9PVkxBZ88KtO8qadrg1yzx9oj5s1bCm0K6/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S0p3pZGF;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D551606AA6C
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D551606AA6C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S0p3pZGF
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-354ba08cfd1so3595762eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897607; x=1793502407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qs00o1EWp7RXAZ6uortmy61vywYTOn5HTBBb0nXYHEs=;
        b=S0p3pZGFiBa2BNSHyR+uVRvpQ/yPzCTtCUTzvQeeLBIX6nUjemZsCZr7BxncHpUYYT
         6RVNSouPhUYMbKpxte+X0WFUtpVpN3POqUdepglNyOup2qI7HfrkcMsjenVHiB9lWtUw
         +77mzMnN4AWTZdyJKC4dYhJkiCSltXz3BkE9rYdzZ8yMPxav09QyJl7j0tAbkeJwcgRJ
         SfQovq5LWS0zDRi9ut96/aenSD5Np2mZsiINRTOO1+C3TkxEBx0jGnvD55ivrqeRZj+3
         8+yAtngG6YIhYK3sXOIHHdEhwFnLc+YjJVSxcCt8m7K3YTnnSxgI1QGOiQ4a/TRj6ikI
         KoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897607; x=1793502407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qs00o1EWp7RXAZ6uortmy61vywYTOn5HTBBb0nXYHEs=;
        b=rMrLtI7KVEUSwR8b7pplTuBU0rK4memtCzjOrkbTe4VOqNNnQ59hEQCxwKMf9/c/uY
         2wtbk711va7KKpBmpj8Rj+bDvD0P2szyNxD/W3Ls0v96WlUWxyV9XdXFpob3jK+Yh31R
         fUonTFrWs4ARKBXRwyOcDSTWzGowbbT6spbObOgbEDl+UYfMNCWbU1xcLQaBPUK83az7
         xI0G4Bbh/lpk0g6T7qk2cg0szNBrl171GxANMLnuSFhoqflfAK4kwPk1SNRfYeppiw/A
         dE+Js6O+wCvuMZZUoeKYV8Ohg2WV3itD/tMJMjyExQxqP+uM41v+g1/7dkCQtz1LvD5S
         kQuA==
X-Gm-Message-State: AFq9FYJ8E3CF85V1tY25bRtvL45id3YhaUS8zBrWgyqigFjB+SW0yRa0
	dXA+o3h4HmW+ZZg/fSOAptXPs2VNTuhQ3aTzxVYoGBxxDr49O4mDk25L
X-Gm-Gg: AYBFou1N+bcTr1cn+HrWshQf8uIdKyiyEh6Yo5nmqbu/+0whsKayfU81HT5a5L9VeAI
	yfngh9uH7hBg9lmW4B1Qx9W4x8DG6cva3qWZldSIgI+/Me5cGSuwDtOSHMmIxBW/07xVURY7GK4
	IhSAQEhqAaw0zOQUe7/il9aiyhrbMWeKIy6+iN5Vykj19il7vhlw65ODSi4YkNnHcMXgv8l2TYl
	cY5MsBOsFUJ3We/rQFneobBxhrlPzkLHKoEd5wFaA+W1o+OcozxJCbjm0ALnmqY3WeAIqaI/Vkn
	+ox8KReonzqxf/mHEWDXSjsJ7l0JJBnyKpriJRDF677R6YOuFnLSy+7VCyye0DSlFQ1YkCQZcQr
	UZy84nm1QykPrtFmCwkkMLNY0IZU0b0eVM2j5G2nXqKkzy+cFTSs+YVTeekErS8PfooOFqdysEe
	6s5p4DjhX6AiBWngyP+6+kJmhL76gmntv5i0n6XWqA6Tj1UikaYmqp7ebJTLGyJ32XutQo53MMl
	PNPtTjoSggkxFVAeQejGe996uawRntKlh0FUcmpa758RSCJiQJnCfjiJiS471kmTSW/jZS6OTXM
	MhTdwjHC9uZ8imUy+WC8kSXKkRYaoEBGFABV0N/XcPEPIcGTN+N6jFIoF7nkOEcG
X-Received: by 2002:a05:7301:3d10:b0:35d:ea6f:b85e with SMTP id 5a478bee46e88-369e8358affmr7506744eec.1.1792897606521;
        Sat, 24 Oct 2026 20:06:46 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:45 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:30 -0700
Subject: [PATCH 27/31] hwmon: (pmbus/stpddc60) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-27-e81941ad0cd3@gmail.com>
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
stpddc60_probe() to leave room for the NUL terminator, and ensure the
buffer is NUL-terminated before string comparisons.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/stpddc60.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/stpddc60.c b/drivers/hwmon/pmbus/stpddc60.c
index b5ce7f975eea..9118517eabe8 100644
--- a/drivers/hwmon/pmbus/stpddc60.c
+++ b/drivers/hwmon/pmbus/stpddc60.c
@@ -205,11 +205,13 @@ static int stpddc60_probe(struct i2c_client *client)
 				     | I2C_FUNC_SMBUS_BLOCK_DATA))
 		return -ENODEV;
 
-	status = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, device_id);
+	status = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					   sizeof(device_id) - 1, device_id);
 	if (status < 0) {
 		dev_err(&client->dev, "Failed to read Manufacturer Model\n");
 		return status;
 	}
+	device_id[status] = '\0';
 	for (mid = stpddc60_id; mid->name[0]; mid++) {
 		if (!strncasecmp(mid->name, device_id, strlen(mid->name)))
 			break;

-- 
2.56.0.257.gf7497c7d27-goog

