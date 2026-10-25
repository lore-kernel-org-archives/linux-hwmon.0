Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897586;
	b=QtDQk2Vsc0TovZi5aY6lDSYXiVVrUnl72RzqxmRrJeeytwxPyQhaDgUDAc2dgFYm4qmy
	 wXF/hJTmHSjrYmulAiW/1gyr8KThLvs9Yx2f8gKzASDeRI7AXTalMVIa3QyaU/FzJ/eXe
	 FwmLfGOBu2RMYXn+z7w366WqjQsDmMAG/nfOxpL+NQj3+ibvK9Yq86xWo0SIiRJA1Ww+c
	 a6oQCAJ3R3xSV4CD7Elxnm/cd6pUMzwa2kgllsvuH2r4v7tBWk4nLQZ4PeEeZk3boXFeX
	 QYyEpMt/e44AHw4PI8+7hVb0vJcH9rA9b/JMyBOzkzf3rpt78UP7BJd9ThyMkN8A9lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=osyCBuMlFwaJ7pCpXIldLLNCTTzeyf5KJ+XpIin8lLU=;
	b=nUq6kE8f4zvgVKUh4nVtGKSut1zyVJyEeBgiuvUCbOPlWQHS1hhaUTn6/0lxjYpI4uy8
	 bYbhrFco2XTf3e8OQJnEp/eSWrmeGjn98PoyUhCIC7VndGtxR1aOJvqX7naeXnn1tk0o4
	 InukGwXdRZm5kgYFUR5fIebI5zrlKMWjpVHO1UB5bm8L0J/kRLczUhb9prRPhzfaUHwtd
	 faGVkSZS9D04D+GhDgZBwkLL0P1awFuxpZA5//4DpTiXHXQJgxQlep/e3kio1kOOPtTly
	 uUvIYNffbrZgu2zRQpjfTtgRBEdSVkko8wxK3gSiDcJwpUlaNOxHurk1pz+SVqYYgAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f3FPvKUA;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4595160A3830
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4595160A3830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f3FPvKUA
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-369f33df08eso737855eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897585; x=1793502385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=osyCBuMlFwaJ7pCpXIldLLNCTTzeyf5KJ+XpIin8lLU=;
        b=f3FPvKUA3FwLxyTVNlpoN/PVAzJWJqqU64XCci9jEONr0TiI7pON/EQ9f/+ple1kzG
         lFMvf54IAfBFfZ64s05j2WQSaEzbJ6HIXxwfK/YDZm+HiWEy7Mh3XR3HuM/2ymdY/NdM
         FNPSneSMqDFvpXbaHObqEHOyNsvNtmaNjQ/1857G9BUYeg2foYxPxTCzAb94yY8UjZfP
         Yv5jvw0K8acvXEYFM+9sva/TdhffwOxL+4o6K7V55pstQaOKEDcglfp+KhM/f9wReb7X
         /Se5X1tfZoM+LWODjS3tZh14Ktn/InWj0LUJ5dj0DRL6W2v+Rr0qnC3cHulGACYjmYPS
         V9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897585; x=1793502385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=osyCBuMlFwaJ7pCpXIldLLNCTTzeyf5KJ+XpIin8lLU=;
        b=d0IwiuG8kcN57YqzU/6vdzLuy0jCRDRNsCfjoN60EbfO3+ATpMPLasRiCUl66si1Pk
         TYjW9/5hDMYLDuUwoU4WjU/9udmZGJezxh0pvOQpCW+ES4EG9V17WI6NS7ef7amdqazv
         sUdRQIz/SMfxYqd7a6qyaEpbzGlvvsF7OLAMV3z7J0xtDFDPB21E+mw9j1rXvSkliHYP
         U0Vy1sDOrDia29SAt5c1eVq++T+eOcYElxWz8pckg2uaDPNEuVvvP+AGm83yiCHomMgH
         LppZLOU6iOnPQlxv1/T4a/YigI27V383n19AIKKVwQTpbxN97NVxrPPjKPAtGZgDIYuu
         VgmQ==
X-Gm-Message-State: AFq9FYKxrGSdxQxWCYA8HDgdxyqKlg9ipGIutpKT3U3hqGN0czWKq7xH
	a8pFJF0BBVm+KIiMnhO4boftU2cpszBlj2XUoyWwieMZJ3pMrLWNRVk9
X-Gm-Gg: AYBFou1S/fh86szUjk014QMcsxtQGI+/5LEb/3TuQEgciCfViJazDyAh8uNpYqgj8I2
	ACk4BglGDpCkihEbWzYHRD8qmQsXTGp6hBA9IR/2YP8d1d8nE+S5SxCI4otQhu0cDNEc86Sk1uV
	mlHRyOdW2OZnW3M1Tbw45O1ZLuEgm0TcLhR2Op/zjuSBWSAOaENiDdrKOXPC74Nd3xw3L0scGql
	YYoNKfJoyvKBYZwS0dYrHgTmlfQZ/+CPqdDBuyBN1GYxUgY1NRJ5UzPhD51SFLGb3CAqogtNe/e
	OcmfyFK1i2YeH4EHPmMv21gGF1TdJZ/I5lnFy8Crlx5N1qGX7wdKiNy2AmiHFqg1YaneHwOPzUf
	H5Q9N3liPXjvzwwXedjVBgH1cpsTJzpOWEPxX0E1V1+XtjE+4rTqGThOY2+ct8X3MyJBGDIME5R
	flrBr0Iw5vZ9o9Z8UN+Nww6mPZleoTLJ1hUn8Ku9TckErcj4uKoTN1W5ZHxmPTBRoEmOeP7kafv
	N63Ds33ivIhGQD9Oi/i/S6umoD4eHpgjGchcpQyTfpTV5XNW29wcXgj7Zk44u0SZa86p+ZrrgA/
	jYuHdnLQ4b4keOBBohTRPrjF7jcBGzvlsTA6jbr0lPg=
X-Received: by 2002:a05:7301:7bc4:b0:360:51af:3146 with SMTP id 5a478bee46e88-369e861475bmr7532937eec.14.1792897585448;
        Sat, 24 Oct 2026 20:06:25 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:24 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:15 -0700
Subject: [PATCH 12/31] hwmon: (pmbus/fsp-3y) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-12-e81941ad0cd3@gmail.com>
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

Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() in fsp3y_detect()
to leave room for the NUL terminator.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/fsp-3y.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/fsp-3y.c b/drivers/hwmon/pmbus/fsp-3y.c
index 44cf2db9364b..c59a58001c48 100644
--- a/drivers/hwmon/pmbus/fsp-3y.c
+++ b/drivers/hwmon/pmbus/fsp-3y.c
@@ -205,7 +205,8 @@ static int fsp3y_detect(struct i2c_client *client)
 	int rv;
 	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
 
-	rv = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	rv = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					sizeof(buf) - 1, buf);
 	if (rv < 0)
 		return rv;
 

-- 
2.56.0.257.gf7497c7d27-goog

