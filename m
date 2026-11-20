Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795142664;
	b=EkyeEeTK7Ae5h/xQ5UptPnan50xBek6uWdf/BPrUfhN3i36xzd3YxicURyEs8NQgdJkc
	 vUk1kpzCPNzmsHnu5LL39iEbKBwkO1RF8YDfinA6BoulTzdF81XcoIf7IMJN7d7DOe6zf
	 +VVijK2K6fLLTjIkjJDgSBxT53D9qElk1yYh4grHlztYo8Eg0RkG/5x/mVfCU/qYMy53l
	 G/PO2HDDdMeTzt3s8Kvm8VR2ohl40uAil3rfeBqGtkvBxy0auiaw0rq3tPfqwcOGBkYZ2
	 riUUDdmRZKvHLhW47p2loPRLcSiWQWMiPOtmzgclrCUVrbxC4l5U+2O0w1MfthXCd4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795142664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=FqAwkj/RgVbeEeWB+OVqnE+d236GoP0AK0b8fYCl970=;
	b=n1pSxnZ/kqrx/hXz7mFO/jgZ9+dURF71T2j0JpkMV/FSWU3Z0JFFNsAXSWCSzIIezvIt
	 F9kCFcP6gzJIiqxfBs9q7s1E6KpAHjNLF60BE4awJtrarXdN6rSMPhXQBt12WAuTVK85O
	 u8sUCUAIzkoWXAYAL5lhHXECy33KpvG8y7ExXiuf5OFLqPBpKwydaebVvMCDxyxX924BV
	 vOR/g2cL3UazWiUKy1ArCIDGDCtZMzjRKbpmh0AIIt2aeijXkZsnm3Gp8oD/slrKSnE/R
	 2xOV+DHTZUBkmAMRBH5QFYiLr+hxedMbh0XTy/uslD5oK4g+TeX98b1GGlzDN/8aK4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--akorn.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K3ps3kCj;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14F8606A326
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Nov 2026 02:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E14F8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--akorn.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K3ps3kCj
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so457332a91.2
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 18:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795142663; x=1795747463; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FqAwkj/RgVbeEeWB+OVqnE+d236GoP0AK0b8fYCl970=;
        b=K3ps3kCjFoNyQsEPKIrqkA25PXTWmPoCohdlMH+cgnWa+ww2d5P0GoV7m58wKd4wHK
         rt/c0FY9n6kMaoquQG3fPBl/i54b9KCwn9NnSP5eUW7UqpGVmE6oGS7YBQsF3w3lCaB9
         +Yeoxl4vA0qOmEAJe9zRZB1KbIGRua0H9Lp/AYPL6fu7kxHVoXQKuSsA6CgBSrhH1Kky
         1rUQcNdFmBdEpDoKkPykTKjHPBWdMUlAfbS4ultqqNW2nfgToWg5Mh9rL7RXzoVDw139
         +h+HieMBc0cNKLNtSsBtaTNpIAORGSopsIOQD2mrZXfP0CTQjCb7Q8cJU3W5xUI+cTqg
         TGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795142663; x=1795747463;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FqAwkj/RgVbeEeWB+OVqnE+d236GoP0AK0b8fYCl970=;
        b=MY4Or6z4ji3JFVlcxGlEXQ0+EdsEdMKvc62O8m1pw8G7LH187Q25yW5We2NQCNcf/l
         getxe4KSnyn19Bp85rpf/nKEkwt8A0Bfg+Cy08p/szKimQc7UeAfmTbs3fV/AmjW7kps
         m8+g+WaOR1DEYmXYmVLNoInJvm8JeeaoBbD8Jqf749k42z5bKNBvu6ZqXJvjMVqwbfuZ
         Fy/0qwj7aVw79vh8fEQJW2VETonnHBrnj+yFlfN5PXzmHKgymLpvDy2Q+9pN2k94QwrV
         B9hPdUOikqISm5ZAgjCfpKEbmbqq4ngODEfmQbtTTs1YwH8UUTfTFpDa1IkHRRIh0H2W
         QfqQ==
X-Gm-Message-State: APuU4Z8K2//qPJGgPJwviLeCk7e29QYuCvhOAJu5RRSZBVbxGjIs8R0b
	XFK/xUo8WoeHv9CzLj/s63D3h//bQrcFhQbtGAsDtEKGFra4dEGFYesgIVbVN5gn5pwPh9S1c7O
	x1A==
X-Received: from pjq3.prod.google.com ([2002:a17:90b:5603:b0:3ae:c401:753])
 (user=akorn job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b8f:b0:3b3:b36e:8c3d
 with SMTP id 98e67ed59e1d1-3b41cb466f4mr1155511a91.62.1795142663097; Thu, 19
 Nov 2026 18:44:23 -0800 (PST)
Date: Fri, 20 Nov 2026 02:44:15 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120024416.338876-1-akorn@google.com>
Subject: [PATCH v3 1/2] hwmon: (pmbus/max16601) Support byte data writes on
 VSA rail
From: Arthur Korn <akorn@google.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arthur Korn <akorn@google.com>
Content-Type: text/plain; charset="UTF-8"

MAX16601 exposes the secondary VSA rail on virtual PMBus page 2 backed
by a separate I2C client (data->vsa), while page 1 is a read-only
virtual page for VCORE input current and power telemetry. Although the
driver routes byte reads on page 2 to data->vsa via max16601_read_byte()
and PMBUS_CLEAR_FAULTS byte writes via max16601_write_byte(), it does
not implement write_byte_data(), and max16601_write_byte() falls through
to -ENODATA on virtual page 1.

As a result, PMBus 1.2+ byte-data status writes from pmbus_core (such as
clearing individual status bits in pmbus_get_boolean() or clearing
STATUS_CML faults during probe) on page 2 are sent to the primary VCORE
client instead of data->vsa, and byte writes on virtual page 1 fall
through to page 0.

Implement max16601_write_byte_data() mirroring max16601_read_byte() to
forward page 2 byte-data writes to data->vsa and reject virtual page 1
with -EOPNOTSUPP, and reject virtual page 1 in max16601_write_byte() as
well.

Fixes: 2138f8853a00 ("hwmon: (pmbus) Driver for Maxim MAX16601")
Signed-off-by: Arthur Korn <akorn@google.com>
---
Changes in v3:
- New preparatory patch to route MAX16601 page 2 (VSA) byte-data writes
  to data->vsa and reject virtual page 1 byte/byte-data writes.

 drivers/hwmon/pmbus/max16601.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/max16601.c b/drivers/hwmon/pmbus/max16601.c
index 2eca7525..f9138fc0 100644
--- a/drivers/hwmon/pmbus/max16601.c
+++ b/drivers/hwmon/pmbus/max16601.c
@@ -153,14 +153,28 @@ static int max16601_write_byte(struct i2c_client *client, int page, u8 reg)
 	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
 	struct max16601_data *data = to_max16601_data(info);
 
-	if (page == 2) {
-		if (reg == PMBUS_CLEAR_FAULTS)
+	if (page > 0) {
+		if (page == 2 && reg == PMBUS_CLEAR_FAULTS)
 			return i2c_smbus_write_byte(data->vsa, reg);
 		return -EOPNOTSUPP;
 	}
 	return -ENODATA;
 }
 
+static int max16601_write_byte_data(struct i2c_client *client, int page,
+				    int reg, u8 value)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct max16601_data *data = to_max16601_data(info);
+
+	if (page > 0) {
+		if (page == 2)	/* VSA */
+			return i2c_smbus_write_byte_data(data->vsa, reg, value);
+		return -EOPNOTSUPP;
+	}
+	return -ENODATA;
+}
+
 static int max16601_write_word(struct i2c_client *client, int page, int reg,
 			       u16 value)
 {
@@ -252,6 +266,7 @@ static struct pmbus_driver_info max16601_info = {
 	.read_byte_data = max16601_read_byte,
 	.read_word_data = max16601_read_word,
 	.write_byte = max16601_write_byte,
+	.write_byte_data = max16601_write_byte_data,
 	.write_word_data = max16601_write_word,
 };
 
-- 
2.56.1.703.gf848ed807c-goog

