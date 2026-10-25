Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897612;
	b=k4YoGd+2l7SiCxzKFH6+BbEok+vjlM6deARedS/X9nwHnHJF81UGVsbH6tAqex2kMqRm
	 zoIDUS/X3kwlJ4klYHw8SCnJDaxG3HqDnRptjv2hWd+SekWF3yhgWD2+zWRIocK6fRObW
	 yAfB59mzjMzN71c2Ry9tDcrl9qBZqVpWVDzovvSch+wH5IGtOL/Jcb4xMlGAlHgKp2Shy
	 bW9+tLXyPVhyzhhmpFntivfsgYwEsz8+t1XjRlAn52yQ1cpan8iMS6gkhF0JiEmjNCLif
	 orQzS7IC+gGBb/o3A8kId9XEVtxtHRctZlzg40+TkBtSIQRpJAlYgKdOkL5Tl43RLaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=YpWj7AiIuB6xaQ0oaBCycNsZPeJVRg9R37QQkrbo70Y=;
	b=tqHM88Su1RnwkrGCfMSfKD1kYlSMfmnTOvfX2xraAz/KdbqRG7CfbsY8FDyCL3aHKiVU
	 3o6tr3fvOpThpPagvFcR/U93Zmy2eT6rZY0ie3uZUrM+GF/PYyAnPTcP/yY5RuI+6phZC
	 h2XLvfzT3CYe7fqrEuHC4dnpdiWm3fWUQhIjWaaVDyVBffNKHxCNh4xeROiY4CUsuawBP
	 Lb1ggTTKdlyZUb0P11EX1YTy/LPyuyEhIHUMOYSL7Ig0TG/AMLzMPO8i3p/s5kPbFTxZm
	 ZJOBb4vNYpjDZdWOHus/ouZ16HMeNYIvn/SZjXYlQy0yZLea2IfCENua6PxBa5rHCPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H3souHxQ;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CA360A383C
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02CA360A383C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H3souHxQ
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3550c917fd3so3031377eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897611; x=1793502411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YpWj7AiIuB6xaQ0oaBCycNsZPeJVRg9R37QQkrbo70Y=;
        b=H3souHxQGe4kFOrBdklHTue/lqFIuDpuSLodKSEu/2daF7hhs/HPTqhCELZfUFgSNe
         /GvNx1038e18RY2ezOga7h8PxaC/uGhurd2Gt+F+usWwaanzDl/DFG0I3l8zTR2Jl5Jl
         xowM2d1QPoxmXp+ZL8zQPq5UByu5lxO0NrJp2BiG5uqpoCnE+rpNU8Lsu5fWhZvMm8AL
         VNflWShpA0fUM98g0AoremcPtDLd1FADzacNI144DSN1IP/SkUjJyzPB9lsazBthrWFe
         KCShUPzwhCchMG/YjHBSzmTDX9Jm96/GCSJL2KqMH0RTxdA736q0a6fykttkYi0dWrGi
         OH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897611; x=1793502411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YpWj7AiIuB6xaQ0oaBCycNsZPeJVRg9R37QQkrbo70Y=;
        b=oXDbv6GiOGUt/xj4kQ6QXZdx/NEkdrNn/USwur9ibk1RfdkWguPWBErskrYxQHJSOQ
         qSn9tb3pdi/ef5XDV1EDEw6ZQwmqB8dsrmaLX7E4s+dJJ195plNvsFsbzFqkDIaZhNbQ
         E1oGpsv1T4jNSOBWdWn/YEWCtIFnpwbuiAbGv3kNEkJ+ciVmRYHhNjrU2xgzoq+6iRKn
         kiPDVbXQUiBypVTbikiNCQgmKmT1lGn9wiamgBv5498ki9Ge/76tsTy/eHVVclNZC6R3
         656j9HoKoKRc6+a57BNyc36k3k7b3NaCbRwmhZ7NOSi2JjPsFlVaZofVGj6sriK2no+8
         oUqQ==
X-Gm-Message-State: AFq9FYJ8HUb3fWeJt7+OPdyOLrqYzzGuucxn6CZV7kyHf+dI/Hyo3b6y
	mdz8nwaMlugFhS4yucNGBVjcawo+m1cOVgE0fWEaqc1AfNfrprhKhIct
X-Gm-Gg: AYBFou16QS5KCAqLqqdT3GR2ZK1iWtcNyvWREV2Jb82sVBbWc85g0IRLnMnaOSWF5F5
	vLRrLt7qYWylBRJQIL7rTUJqNz6+nmDr2GvcaexpWw5DowmPo6iyoXxJdsnb0znhGNcSp/yR1KM
	jUE9flwE30SwhA+/Cm5GXxcWq93eFubLw5mzexOAJ5Pi7D165qAEJ8y0s8SYegZnSjR3CesyVMM
	3JfUhwaSrr9ke2gG4YEA76Rd3XfOjOeHE0HNozOAyA0C0jT+PO5P3E1F6hoic8snQwLKZk7/dJj
	/+n3g+sf694zRhmDXfBakJEFQS2hcic58tkmRbfZOGH6ZdNFRcit1nlc991nr8ssQNTYbjPtiBN
	Dp+sRCMqWZGhjyc/MEXVyBqhwBi6YAdQ8KESUth3nowJXivB08ZaIErD188Mju1e8c/rfLQKonn
	k5bFcz7VAd3pKQ8JALTs3oT8Q2ax4w90gM1yNrxMLCBQr/tWMrDGDmeRO//JJWDthAEI7zHC23F
	m8Ppa8XmjzLpJBkp/SLCZWhdzIoV2h/zI2qtsh1DfaE9b0Z7JoxQ4hnpS1DXUs6nSK6c5AL8ERM
	W6Xv/BZ8RhYkh3nimrxSKUERg4MIWDOGiH6oUZtkAuw=
X-Received: by 2002:a05:693c:68c1:b0:369:f2d6:4108 with SMTP id 5a478bee46e88-369f2d66dc0mr2292304eec.10.1792897611019;
        Sat, 24 Oct 2026 20:06:51 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:50 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:33 -0700
Subject: [PATCH 30/31] hwmon: (pmbus/ucd9200) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-30-e81941ad0cd3@gmail.com>
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

Pass sizeof(block_buffer) - 1 to i2c_smbus_read_block_data() in
ucd9200_probe() to leave space for the NUL terminator.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/ucd9200.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/ucd9200.c b/drivers/hwmon/pmbus/ucd9200.c
index 5e07bba111a1..08bb91e095bb 100644
--- a/drivers/hwmon/pmbus/ucd9200.c
+++ b/drivers/hwmon/pmbus/ucd9200.c
@@ -85,7 +85,7 @@ static int ucd9200_probe(struct i2c_client *client)
 		return -ENODEV;
 
 	ret = i2c_smbus_read_block_data(client, UCD9200_DEVICE_ID,
-					block_buffer);
+					sizeof(block_buffer) - 1, block_buffer);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read device ID\n");
 		return ret;
@@ -118,7 +118,7 @@ static int ucd9200_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	ret = i2c_smbus_read_block_data(client, UCD9200_PHASE_INFO,
-					block_buffer);
+					sizeof(block_buffer) - 1, block_buffer);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read phase information\n");
 		return ret;

-- 
2.56.0.257.gf7497c7d27-goog

