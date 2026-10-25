Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897600;
	b=xyegu9egIGPvajiOVMmxP2LsUtUc9GzZyoB9V3pgpSkiSfUkQgTE+BG1+HGOFayKGUHp
	 Ynz4dFi5Q3SL3541X5rhfqbgIoj3gqimA5NcjYXblIqQbrCewXLPP9XNtmSM77Zn2qPzE
	 7FrU5gRcnWryPAi0+zecsFeZyO4meHzCSoWIU9u5qokT+LTL4p1extiQdfQonjPV+ruHa
	 JZgJyvu5Sn6fDDEdRXkNCAcfwVlbXhLOCiUTwy7pGzXcz8Ry+8KdR1EMJ9/CfoJb/mG3j
	 hCVuieqN424V39oxOJN/y1NNd8kSGuYFt6JWUQbJI4JjTMum1sM+G2BUMJ7dwBC/x4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=S8wLBTM9/IEgUegL5oR1lik8LOtauiSAmwjN7IuU7Uc=;
	b=OdBoN+smgbKt1PKTRqCNapwPVcUsirC+vxQ/P4wJCc+vAs4DJgdrq1X6wWIidhwu59Nt
	 zGEOrRI/Kxo6hcnuxRUn4HFb8dVynULeg3yLVKVhLvxZshyOxtzEWVJGoRi0+y+O9ngeF
	 cc/4rr1QPqy2xMQkA0e20HgDK5/ri6vcOwV7RrRwQ+euzUs2ZuYq3riaM++c/BaG2tCoW
	 j2NWoPgqQEuE0/IwCnz+uWQBM+u1zY4q3GbCdKzrGqI8IWXuECHEzIj4n5ANDdGGGubfi
	 dfGnN8jZ0IVSHEe14nSxOCi5gzULvxxmVey9wL08+1qEDRrjF8RU+z+vdnEXn0Y6Xdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QYYua9Ul;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149A0606F5DE
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 149A0606F5DE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QYYua9Ul
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-369f33df08eso738067eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897599; x=1793502399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S8wLBTM9/IEgUegL5oR1lik8LOtauiSAmwjN7IuU7Uc=;
        b=QYYua9UlULATtIGaoQM3O03WRhcGFUnkL3lGEMAL6NsM9jaNjSnJvnBzMtDXHMdH7N
         ZKdm55UOq17CKXnWybphKg0UWWuQ0xBemW+cnyKUmn4e4L3ImomrNrdf3ePAR7mgy6vq
         Bw8epXvkZSMhlScxW5OP0NIXUU9TFw3OYF15zEgLtO0zHsoJch3jV7b2RtiOrU7+OayW
         UKcC1PCFTQbd66axrIPMQN+dx4xeZ6/tb30oa00FpPRYb4sXrMvVkY1W9KTbh7B0RFyX
         LcFYeFSdC1sjMqPTrrs75iLgRtvCr9FJpeipZImx0gnJHrzsI2H/25bApRfWIJsSm9IY
         JUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897599; x=1793502399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S8wLBTM9/IEgUegL5oR1lik8LOtauiSAmwjN7IuU7Uc=;
        b=nDPQeSx+/vNyIIx2AXT/gUWsAgDEhzku+6aPUYS+RgLXROiHelZbeYq47fqmF7gk+n
         79eadjFe6rKjdDbEInhPRge6KU5qX2Tz7j6oaiAk1UgfrXJMQCO5KDimHXXN6Qox4al2
         LgKZcFo+S4YZUW3BTwukWaeXHQo2lQC/vbI5rg9dvQSUq0bccC0b2ZAyqSen1H4D8AAh
         kB/BOR7O4iRaEcmS/VGMXQw8eiTD75K9qaKNTv13anKM1vQn0SrgJhhxwNxgeiHamG+3
         +MBZHakeEUmpZDnem1NWVP4jFJVzBKYzbYgM3z14+ALut7fN6dQRwU3IAkZ1AAgkMP8y
         R4yg==
X-Gm-Message-State: AFq9FYJAVjxvkZ4E4V6Cxc3NDL+hnv2ll3WVW08DYCGoPJNRow3rEwGx
	yh+mwMJSAIlm60RH95plImk0pJ92CSDjLrnQf/v7Tph3Ort8MUrdh2gt
X-Gm-Gg: AYBFou0UnBIkz05Cltu3r7y6NGSYGaoPMCDlrbp5LgdKml6wK8o6B59jtUG+2Dztf09
	aYNYncoIoE3djLx/7Rp8LIaln3mLp43gu+e31qJN177maEC5NKOh8stWc6Du0zZEhmRe5W6sK3C
	bXZmzJVfu2ifVU0OKLinl5Ahdjgak4Q/FL4O5Hwj2QI7pFt/gcPYWeVeYH9oQ9qDn+h/Zj48nhq
	H7OwninAWdDWnQKGLSNayZlX5IeTY+J8OySXBIw8zbBZlqbPYyJ/cjJNsVXR1Lg6yJrIAkvqX5E
	QcNAKKOAM6VU2E5BQY1kD6Vqee/HhZfF+LOAjMZuK2b1MI3kUD4s8jv8+/Iyq+F3+w8BR8Z661j
	CKObTHgWqU8BkQY4+SVdb2ETUMiIZvkzBhKV/bDlXesBAur82A+C9WCoVpJ9PBZ0eS183h56R4H
	vs7DgK4QheOMsQEabflh1wEhk1WGsQwq4hrLJwx8R131zjdqg8Fw//aw/kVqipgASf+JM8HsnO6
	3yKKItQ7jLMrOmQr8RrstvRL+u6wrb70JO7gwRJulToNTw12L22A3p1dFfLRD0W0tSoJvBqm3Rr
	CPzKP16UCnLnrHla8JFZLsmP8LsnaYJY6lrI7zpOOPU=
X-Received: by 2002:a05:693c:60d1:b0:35c:1567:7966 with SMTP id 5a478bee46e88-369e8645a90mr6116187eec.27.1792897599315;
        Sat, 24 Oct 2026 20:06:39 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:38 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:25 -0700
Subject: [PATCH 22/31] hwmon: (pmbus/mp5920) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-22-e81941ad0cd3@gmail.com>
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

Pass the size of the receive buffer to i2c_smbus_read_block_data() in
mp5920_probe().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/mp5920.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/mp5920.c b/drivers/hwmon/pmbus/mp5920.c
index b803f3ddf8ea..5c61b3c610d1 100644
--- a/drivers/hwmon/pmbus/mp5920.c
+++ b/drivers/hwmon/pmbus/mp5920.c
@@ -46,7 +46,8 @@ static int mp5920_probe(struct i2c_client *client)
 				     I2C_FUNC_SMBUS_READ_WORD_DATA))
 		return -ENODEV;
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					sizeof(buf), buf);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to read PMBUS_MFR_MODEL\n");
 

-- 
2.56.0.257.gf7497c7d27-goog

