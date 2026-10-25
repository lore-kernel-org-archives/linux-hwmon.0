Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897604;
	b=kvbMrarVAV9lYYRlO8moGmh9q2OL7ddtafBO8+PoKN5WJjeCr1VcIJLd51yDU1Ogv+sT
	 oDw0vUNWTRR+Mjq6IuIAYbToXKZ0uogTGjNQcUc7D1QePDEVP+1sKsqxK0v7TFHRrDGr7
	 UpLLB4poD/PKz4pzMP7I4Fmv+ZiJrWvK+gT93OOsquqixrnusVOD1cylkg9zh/A2HdS/o
	 26MNkKnCdT7HADKrpYjY4C/3qeNMPgBVBmnS3SvfjitPK39ynwfnQCVsdFKsNu/UZW+8D
	 AKdixcO1K6qGg0TE1R9HTMPjdlJPQTyYdKY8cvThUjV+dzfkJAEGvmg1ARBywidaYzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=fBYi8O4QA07VQKy3pEcvXZ8VFsZZf+PXW/6Hkw6BDHM=;
	b=ws+7xisXkQTcBa0rMJ2RoOkWaVSi65irR8S6u2F7pbYAobTgxxbY3DkCPn2qK9Kn6ClU
	 uyYYSIg3cBKqBhHPMWxfkA3dT56iJkCibV73JrzGyTHjjhg71MuLmRZ3RraEUcCavbVLZ
	 iYLXMX/DQ5OLhrwr05LudvFRhmcDSuONYnIScEESjQI+IHD1vhwuQuE7IFIVdziRsv5E4
	 rEgwsFvxXmGpdjQk35nYWniPvm/VOkm3IUF4se1CGSyGaAJMv0eLkKz7PreU+FY2bXQLN
	 U3YlO+BvPIfzlMGIFoMwxI0sZ5B4tYkXTWjjy2PgO37JQTGh15pqp8XAjoIzouqHp6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AsbqCkTK;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EF860A3828
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49EF860A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AsbqCkTK
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-353804b591eso3604414eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897603; x=1793502403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fBYi8O4QA07VQKy3pEcvXZ8VFsZZf+PXW/6Hkw6BDHM=;
        b=AsbqCkTK17jaZVsh76plonbQ06LU6YmOCPtpEi7BEl27mBMCwRRyi8hxLNdx7gbiiC
         n7FygJCLaYepeeORElpOfDNHDDZRxPuu1pJZdKuIjNdQpR4wgjLiLL2qc/zuzL85AdAh
         C0D0uGtZThFuE0+/51tq/EIuaduGsdgjR800KLxsgkTmF/BVZMIRo+kfu6eKVq6nj3l8
         dv89X2BP96zqd8/XmxZkJEyVvx7Is+48f7NYabHnBNWRr3+F9nZu8N5DVzWZ4zwwACEl
         0GYP4wGGs+/8FalQ9xA9lH4+BLJ/q96n5VkjW0UopI0rJwA0QziCTRhmpn1RQkwPCKeW
         S42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897603; x=1793502403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fBYi8O4QA07VQKy3pEcvXZ8VFsZZf+PXW/6Hkw6BDHM=;
        b=gFSFivviaUgVDFhbzRAWd0Xb5XpocrEzPdUV8Kdc+Xq3XSFe62WqzQKuU9OYstRS6Y
         HhzNuSht+8JdEdpwng358U5S8VI/pEPiO4NapvXEVF58iY8zJ6BGU2cRjYKuUQPzeD99
         hkTWMR5uUoBv4PxWlgQhG2smvCHGsRrum5LjO5Jeg/ygDjo7iDUJxojjxlWBfoTslKss
         qTjMBwkIezhpMQxqk7jFu0r2arEMO/jjgmp/tVfc5od2GiS/zxEXMAp/JoO6PF3FPEFq
         O9pFvTR1vkG2WF/Aho9YFzWAzHha6nsKa6PHjzYfpZH4WlaXJRpnWsmOtq1hg2fYlCVN
         hgVw==
X-Gm-Message-State: AFq9FYJb/lSqVy8hAEWMfDYmGAVhqFaUNrGdxM6f5mF07xA7QchGXXp1
	Uo/QaaIFkiE7eqgaE58ycugKJ9aog2Geq8dcslNzsmcUWpJ4yejAL2OS
X-Gm-Gg: AYBFou2WajDXVswntu7u3yvy3h46Ehk1Iokf3qku6I18iqUnZzEfp5bi6bXLdC6T7yv
	awZBUsqSlk7T6E3bZx7KDEa1/OuF1e6olpDWH6UTg2zLy0o6ak+VokWpNzgNhOFmJm2kXbF6PF5
	Z93MRcfMhpsMeTXuu1e8JdiK/aHZXr/w2JmX8EPX6+eW/bokbnuXbVugSjz9Tk+mG1PSOXXFQQJ
	yWprq43lj0F+97EgoccjBV144rEMW8A/BLbMml0qgcyqiAV9QIeRP35sXkmqs/3TB5S0UQ6oYRY
	F8QyHj3l5Cd94n60MTWVmdVwLzWHLxuHGvPK8oQRxmtPxDMf9cVs54ids+OAbbmk+GB2NPPH5Au
	446D+PMdDN+JCCnYLPVLMJzBF9P+pGP3lvwVaW+EiaWd7XrrsI4hmpcmjKndLZmocJV4W98BfZe
	dQLA0MHe4jZGGwVZu2+yDatHFSo2z7Ax24hNw8OAqOWTKJnylL+vSmUzEvW4wrCmI9+FF/Zp3de
	3SdZqalTS7vbmUJOncmTJ4Sm7uoxM0LjHWTH6wdTAqT98NxzvZOP9UqI+UzyohdShd2jnVpU6He
	4PfClBTdxJxVp8boouBv6BcvtmrBQ1Sle37HSrw8uGU=
X-Received: by 2002:a05:7301:d183:b0:369:d8e1:7bb6 with SMTP id 5a478bee46e88-369e84dd32fmr5875884eec.25.1792897603370;
        Sat, 24 Oct 2026 20:06:43 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:42 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:28 -0700
Subject: [PATCH 25/31] hwmon: (pmbus/pxe1610) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-25-e81941ad0cd3@gmail.com>
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
pxe1610_probe().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/pxe1610.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pxe1610.c b/drivers/hwmon/pmbus/pxe1610.c
index 6ba2b3e0e565..6c1d362661ad 100644
--- a/drivers/hwmon/pmbus/pxe1610.c
+++ b/drivers/hwmon/pmbus/pxe1610.c
@@ -110,7 +110,7 @@ static int pxe1610_probe(struct i2c_client *client)
 				     "Failed to set page 0\n");
 
 	/* Read Manufacturer id */
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, sizeof(buf), buf);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read PMBUS_MFR_ID\n");
 		return ret;

-- 
2.56.0.257.gf7497c7d27-goog

