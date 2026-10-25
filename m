Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897581;
	b=VcD6CMhI57wpKctLJmaiqH3iiQj897Lhqz70y5YCJVe7uNbIB5Kc79XkXnh8fibPOWj0
	 IB9C6x1Fh41wLpzNA5r6AAeB1zUr+8ATsUbfuX1BqeSuwNwlfM7x2esqs0UD8oiPAuV3P
	 3Q/GNang1RorQGZHQWLXGDx3XCQw3nSG/X21vUYPbVhBvMK2zCuSf6lzIpz1pDe7+w0ye
	 UGaMpxPTxQrQNjw4MvIHHrPzP0RmvAOsXhrq/XhkI8VXfzgLCb5iLp0Je4KhCFPQ7SFbL
	 tmudOJWheTd+w2ebUITZYfeB/DFqe0tnp62REfphwNjgIK9Ry+A1ZgfiL729k5alNkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=C0Kh3cbLaLA7blFbrHjQxFvQc6Tdt4901e8b+a4UrO0=;
	b=a5+vDxy4vBUEbeq/+QeWcEJP/nTF7hU69j1dSTHUo8LZDQ5urF9L4oZLOmqqA3TvEu60
	 gqoInGQewjVvKPCSsr84vFDb/ffOrJmz1l0VE1EkXE5Mo6a8OWlAZv7IVyKEwwUPDPdMT
	 EjV2v+mfQh0BBIbr6LlKZMJJq6xWlQ35w+5ezOFNJftMKtN7Lae90fNrcGRj7zlqoqk29
	 1Elpw6Pnx6tnJMn6/VZesjWewKNmpgo7kNifl2QWbIeAPuF0+YmsACJkXaAgIoobVNOVz
	 yOEKMz0eml9j/vTO0CIVRzKJJ8rbBpcS5mqERKmWyhsYar44QNKtF5NSxdJmzr13x8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XS0yfbx3;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E02606A32F
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0E02606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XS0yfbx3
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so3291182eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897580; x=1793502380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C0Kh3cbLaLA7blFbrHjQxFvQc6Tdt4901e8b+a4UrO0=;
        b=XS0yfbx35V88oYru9gjbGZKUkrWyabEIWBbg8svWUp0e6DhWJ76Kt4KnnEjnhA6lML
         G3eJU1mxvoK5clt0MwrEujB/Z4tnjGkvo2EAzGU877nZQTHNDfsOOHjVqRBiOzBdKFRB
         RDfDtbtob7KehnypHvdYETJNDg+Vko4qJL8Fwh73U8cHvNQCZXoYMMzbnrLrgKRUttu8
         Zvj8TqnF+DcHGyT6RvKiYOdPK53j7JMQ+1F+aN3tnFmYOH0ensKd2fXoDuCH+uWUjlDG
         awfjQT4rq+HAAKiXidlAA5n2TCNM5DFX7Fbw0p1/XvBW0sxniA0ScCYpoeguvbU8ghm7
         /SjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897580; x=1793502380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0Kh3cbLaLA7blFbrHjQxFvQc6Tdt4901e8b+a4UrO0=;
        b=KEaSSOdtC6+tTSGYaWrTiLltCDABXudDCJoZ16jhUKkiWqPlmhaqiUg6wbAhvQYdqK
         /CABwonTBEdHFtRHDXYSD3SW2lIapLPyJK0YaT3BVoePPIg/aEINM1rQUHstIJ7ClWsl
         1zfHo/aO43yIG/svfknPwSaSMMU9Y5AQjr5/XwK2VwNdxbRfxXA+MfvHYrjY6FH/CvO6
         PY+m+/fYd0FHal065PXjCvHgoRjmdX0XVUCqszxD/WaR+i5FQFSAwbXBnoWvf6dF2UEt
         /eXsRZoEnCQ1nIEa1iHgWYZyHzGNuAMtPhK/UD/u0a32N76m44ra2ETMWIKWIAyVLXil
         ouTg==
X-Gm-Message-State: AFq9FYLwUqZGUAETivHFQUGR/EHBjBFD2Yz6k0UWYRd1cEI0I9F3H3UY
	5b8yLUaZKB9AuAYohRrul8ChLm3Z7eSVVH85OQ/nFrqA/hKoKt7lRGiM
X-Gm-Gg: AYBFou1fDLBlAZ1c4NvgDuv/2Ouljd7aZG85ZSeGFuvvqRtj5u9hueRbf4okzSN238R
	VHr68DTPHqj3TQmG88qNPMJj81bi5sjILzCVIhnsYiGB9B5YidqnjtGla0+1EoKcoLRiejrjLSO
	RSBNYB5uqPzfXtpqPV1YlpHDAmfiBuga6OWC0dQS3o/gxKrcADLwUImcfXgtfl4KzyU8l3nB9t3
	9J+DMgYAwrOkEsSneBxPjNTdhn8nd+VyKONitJ5DgczK2ESUcgdgFINCAluxRcPkDeDxVVKu6Xg
	IUxufN3lfb6qIjrjr9aIs11x7k3YZxkCnvvplLi4UQdRnDrfdb5dF77nGM3iewNSulvsuCu1aeO
	WIuAPDjLY91fAner5Uue/hcCPgZtx6oqSeN6RjdmwdifriZQ+KriQ0pMYNwDv//AMEQrlKcN5TO
	kaINKrn9f4of7JTGGCq5eUk5210xlNkbrWiakLRsYz6w8/mYx6scvkmOliAz/Lw0YxtkZRZqq58
	AmEozf9Wxx1UkFYWsFZbRegMMCiMedgTjnDJij6WCCq0W50wdcpDYdTqL9LWMkC1+Vm72EX/lYw
	y6j8IhV+XxT/3jLBywdHJfo1VF50g9PYyYnh7uKvig9t
X-Received: by 2002:a05:693c:88cd:20b0:360:d4c5:7243 with SMTP id 5a478bee46e88-369e845a18dmr4890429eec.11.1792897579757;
        Sat, 24 Oct 2026 20:06:19 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:19 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:11 -0700
Subject: [PATCH 08/31] hwmon: (pmbus/bpa-rs600) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-8-e81941ad0cd3@gmail.com>
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
i2c_smbus_read_block_data(), and ensure the buffer is NUL-terminated
before model name comparison.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/bpa-rs600.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/bpa-rs600.c b/drivers/hwmon/pmbus/bpa-rs600.c
index e364dcb59dd4..b562e1ea7ac5 100644
--- a/drivers/hwmon/pmbus/bpa-rs600.c
+++ b/drivers/hwmon/pmbus/bpa-rs600.c
@@ -166,18 +166,19 @@ static int bpa_rs600_probe(struct i2c_client *client)
 				     | I2C_FUNC_SMBUS_READ_BLOCK_DATA))
 		return -ENODEV;
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(dev, "Failed to read Manufacturer Model\n");
 		return ret;
 	}
 
+	buf[ret] = '\0';
 	for (mid = bpa_rs600_id; mid->name[0]; mid++) {
 		if (!strncasecmp(buf, mid->name, strlen(mid->name)))
 			break;
 	}
 	if (!mid->name[0]) {
-		buf[ret] = '\0';
 		dev_err(dev, "Unsupported Manufacturer Model '%s'\n", buf);
 		return -ENODEV;
 	}

-- 
2.56.0.257.gf7497c7d27-goog

