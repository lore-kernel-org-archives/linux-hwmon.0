Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445F619D08F
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706155; cv=none; b=gEp/iDZ7kLO/dDuCKGoK8qeMMzPrjrEOUXSvkeBHtzBGkd6dYukLeVxz1vSmkeimm0sIgGJoaGVC1VM9eWUoBX6zffsUz34zNuIRZ3A0I8s9m02uGzO1mJvgtnxRPOdTBwQg44Kib3edKJFW/GdqKgehj6UsMgukpjsGGvzIkUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706155; c=relaxed/simple;
	bh=PEPGIPgt5nrKmcN2eX/OCWCNbyxtI/aZTPTgjRqAaSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TjKoLGTo8gPF+n69lWHEHGpqWodPEOyqucDmx+5HOmn/HCZYK3g3ZmSEunpzUuJ45pxIwsxyDGWnDm3ns7cOEauxj4ECXQa1U+DnCZNzoCGywR3XAoGhwNA9TWuNeIzC9tqGOuJucKu5XEr6Ay4N69bXKyCbpF9Kp8uDTdIfEJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGM3SYKW; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGM3SYKW"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-33ba38ed94eso2105969a91.1
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706153; x=1761310953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTdWBFhj/ju+csN55rcuqogVEAK0tSusxJRREcyyvv8=;
        b=hGM3SYKWOevSSv6GfB3sL10atYYqeTJGbEzcIIO5YTVBmBAr3i6uiMUrQp5j++Xeoo
         158GGtiNnKl3r1Se15MDxBO9pNuaBfHSgy7reN6HBDSc+for3X08qdzBA3RG63hCZHpS
         61goQWczRZR7/M6c2M7rjdW3QUAhGmNHuVkwcdgJajBvEYJryqk06qyOaq/JCvF9/mEZ
         vpDOkSOzULidd61XlU9ENgXli+2zFTQl3A/RJ3JiubeoCZ0E5f7yKyjVSAWP4AvfUFR5
         qdo45oJWUMnBEYaRACYDzYCa9jn9664cEucKVh1uB0G3KvA/IlykNTfKwiVZl3dM/foy
         PuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706153; x=1761310953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xTdWBFhj/ju+csN55rcuqogVEAK0tSusxJRREcyyvv8=;
        b=eaqSxcC/E9NxHaJuAPkC9iYq6xXGNNgMVvNdeyyteeHskrDLeTx5X/ZPx84ACd7mVL
         1Vxkul+spXXE5tJ3nAmDUs4mXQY+7aB+dgn3k4+APN/D7Oy5tjgPdOc1r51fJf5d8+vL
         pW6M9tSRhCqWGY11nJwlQ66G8fgdKkopWS8YFJBNZb5++vapd9cxk+A4b+xfV8JVd7s+
         Y+kx/Y4cc7wQQxR9lsrCavmWR3jsHMGhrhjjUDo2UGblKaUb1HPCxMWJpG6eX3XISNt0
         J11vTInzY73auqhPbukRcHJ4oi19LuDJg/DajkB3VDfNRCF4cvuepryR/8iTlVkicZ9c
         S99w==
X-Gm-Message-State: AOJu0Yz47ds3QbylH++A2zD6Fz8Qw1hSxHXXeAXDnr0BIFoVAAXVhTsU
	H8qdQYnBGWeroZu2UI/3VjWnajgf3iPkzfeYJQd88znRt+RJS1xLXtLr2UDRtg==
X-Gm-Gg: ASbGnctOmgJ9OYg3nihrZy4AY3njqsvFlmCAoZpdV/yPRo6uj5pX7YR1kUd6ocrTQlY
	orIEcSWmqbsozHzVp51rpG2x6ErK9q8LYPdYG7AM88NIjS8z+xhgY9oc/dHDGLUFdwYsFbjMPil
	HRtfvR63KLFftLxETx9ckcsdJ1fDk82w+26gHX3pFNGbVE45MVpJ/Nw8aKtG2j5Q9+zhL/+d1o2
	Z6lAEppMCDUCAaZpLqls2NqHCIiHIl25IzBYknzatji7/EiEFlvU9KaZhnRdzupnS9/rdzOm8Jg
	c9J5H47W1U/N7DkDcLGfPslL4M0omkG/PrGH8s3F3GPCUmcJje4HvBHRDFEgjiXIBE/RqEZCXaT
	FN6+Jg3ePw9RVI+8WZd/xtPjBUR51hhZZMsrr0nQfyqa16D+eY7venfN5AtkWSq3z7buzYKjbci
	odv+JEzLYfBhiozQBBwT6Lfio=
X-Google-Smtp-Source: AGHT+IHOE95z01Mv+xLjbRaCxIHsCWtp41xmEVaIKZFtgsxMouJLr86JywcZe3MakJRQXXtFP4R6Cg==
X-Received: by 2002:a17:90b:4c12:b0:33b:b0f7:fdb1 with SMTP id 98e67ed59e1d1-33bcf8fe0famr4188954a91.28.1760706151068;
        Fri, 17 Oct 2025 06:02:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bb65222a6sm5497154a91.4.2025.10.17.06.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:02:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 01/29] hwmon: (max127) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:01:53 -0700
Message-ID: <20251017130221.1823453-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017130221.1823453-1-linux@roeck-us.net>
References: <20251017130221.1823453-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking in the driver code is no longer necessary. Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max127.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/hwmon/max127.c b/drivers/hwmon/max127.c
index a9aab8862f5e..5102d86d2619 100644
--- a/drivers/hwmon/max127.c
+++ b/drivers/hwmon/max127.c
@@ -45,7 +45,6 @@
 #define MAX127_SIGN_BIT		BIT(11)
 
 struct max127_data {
-	struct mutex lock;
 	struct i2c_client *client;
 	u8 ctrl_byte[MAX127_NUM_CHANNELS];
 };
@@ -121,21 +120,16 @@ static int max127_read_input(struct max127_data *data, int channel, long *val)
 	struct i2c_client *client = data->client;
 	u8 ctrl_byte = data->ctrl_byte[channel];
 
-	mutex_lock(&data->lock);
-
 	status = max127_select_channel(client, ctrl_byte);
 	if (status)
-		goto exit;
+		return status;
 
 	status = max127_read_channel(client, &raw);
 	if (status)
-		goto exit;
+		return status;
 
 	*val = max127_process_raw(ctrl_byte, raw);
-
-exit:
-	mutex_unlock(&data->lock);
-	return status;
+	return 0;
 }
 
 static int max127_read_min(struct max127_data *data, int channel, long *val)
@@ -170,8 +164,6 @@ static int max127_write_min(struct max127_data *data, int channel, long val)
 {
 	u8 ctrl;
 
-	mutex_lock(&data->lock);
-
 	ctrl = data->ctrl_byte[channel];
 	if (val <= -MAX127_FULL_RANGE) {
 		ctrl |= (MAX127_CTRL_RNG | MAX127_CTRL_BIP);
@@ -182,23 +174,15 @@ static int max127_write_min(struct max127_data *data, int channel, long val)
 		ctrl &= ~MAX127_CTRL_BIP;
 	}
 	data->ctrl_byte[channel] = ctrl;
-
-	mutex_unlock(&data->lock);
-
 	return 0;
 }
 
 static int max127_write_max(struct max127_data *data, int channel, long val)
 {
-	mutex_lock(&data->lock);
-
 	if (val >= MAX127_FULL_RANGE)
 		data->ctrl_byte[channel] |= MAX127_CTRL_RNG;
 	else
 		data->ctrl_byte[channel] &= ~MAX127_CTRL_RNG;
-
-	mutex_unlock(&data->lock);
-
 	return 0;
 }
 
@@ -315,7 +299,6 @@ static int max127_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	data->client = client;
-	mutex_init(&data->lock);
 	for (i = 0; i < ARRAY_SIZE(data->ctrl_byte); i++)
 		data->ctrl_byte[i] = (MAX127_CTRL_START |
 				      MAX127_SET_CHANNEL(i));
-- 
2.45.2

