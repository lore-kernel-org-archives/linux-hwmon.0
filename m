Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897573;
	b=UzphSmJV5Zai1bw2g23mNS3gZWOb26QBV+5fFkIV7XMFrOVRzFPKnY49HbNbWvLy3UU3
	 xu08JYnhh/IGCp9jLZaQwjexadih1Y8RstYNEiAbMJaw/RlciDJs3Z5AjvhAyf/nUtPoS
	 oXimAXEUbzE1bB50FikNJeGyG0nMG0p7liL6a6wA8NhS7wBkncx9zMaK9KJADVS+PQRTD
	 Mt8/tUOFVwnEEUkawCfcVDaLORJmN1TKAvlJwbcjy35If0O/8Y47q2tGqHbtMZKGyp32V
	 DTK/tyJZuRsxIUT+VZ4nOOXHbev2riXG7pXERCiD4B8+piwgcquJ/r47tRvzpnbIxWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=jIsXoLD0V4o6ZxF6ixggOmISmDc85kM+xsblptZ7vmI=;
	b=dN2d9nWmajpfN23FVTeXEpebNfVl2RR/N9sRljjYhsCOoxIddiqUclDje4AE1nhQkcLG
	 jgdHmLllsiGYtedygmqE2kj+SqDLJbi/mAnxfNERopGgF+137bF91L5FIE68SQl+WSiTt
	 YuhAk+RCZcwBITDKNYMRbm9LNZT6BhvfzIRAPAL8X5Kqy+HudRwNbdcVX9j00lajbVLFf
	 R4orClItvd/8Mkn1o4P+Y0inXP/CeE5IfsQFRWXV58JgKwbQP6MHPP9+08Y7q5H08Ijgw
	 jc2lVvoEq8b3neYsVa7/idxPnXG8s7aWGWnxzamjZkdsRrgR4y57XdFKU5YMRojmOkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QOo6BMPa;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F262606A32C
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F262606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QOo6BMPa
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5363510eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897572; x=1793502372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIsXoLD0V4o6ZxF6ixggOmISmDc85kM+xsblptZ7vmI=;
        b=QOo6BMPatC5jr7ThNSI3tBYm8oh+BIlOLpbNGLIQuqlUu/ci7WDqrs6w7WmyOpO6sX
         79kG4YFpk0ELRNWUQ1uJhIa/mxvUw1O80sddaJG66ZKNyb/Z95GuUggbdS68cep5jZag
         x52rUXulleGyUWdc0mGqxQmmXzGdp/v5lF3/bAoUgUa8sShWpSF6vgvNfTQJhZGHGSm6
         hYuP+60G+gw9MvSTbV8cq+KjRSRNtDQazN4iaKYS/wTaMi7UO0tuD+IsmZ9pIZl7KV8D
         gHNHmTBjqfk2TlSwIE8cbIzNED35n005hAOi3ov3V5kz2b+l7xXdHbjDe/eBHrsw1ubm
         jzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897572; x=1793502372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIsXoLD0V4o6ZxF6ixggOmISmDc85kM+xsblptZ7vmI=;
        b=2QrN+8EMIDBanw4aceKRB0O3zNDmXX+8PUewYWlwwyuw0bWJiFpyyWvjUccLeYrUjN
         eEn0feZOY1M+yaINnHXTKS+afAoGXOkL5YW0V8IXgXwkYrx2BviwgcvEOlXeszVdQvGm
         Z9URweO5tq5r18H1q3FNO9V14dePsRSFD1gyGV81cB8/TGpMw5dP/O3rzMd/MfFBFIfi
         /Uo5f3Z6I5YdZ1ZCVFhq7EbH0vF7+FVvr5J2GQmQqO0A1QlQDtlU0pfKQDHEKeWcUcLM
         436Fa6b05QO9n8q7htHSWRtSF8k+vWlW2TM2kYdv02woq9KzjC2Xxdo3CpicXtdEapQF
         VIyw==
X-Gm-Message-State: AFq9FYI4CZZUlooHfGZPms50cVu1uplhXBmRFE9XuRSf4Ea8wVZWaKFa
	9hNZwefGwpMDLbWJfcT2S5naqG0HNyXp2TWDxZYB008Yfm+LqhMZsWCJ
X-Gm-Gg: AYBFou2KKFfue84OdW/xjamtl9rYPpqOGOQD0SFkq2xco6CMOqPVOL9w9lkk3gJ0Lq2
	JLqUAAKKLlAhvPtUEhWYDFEySrLzF+hkPyEUrUucKjktsoD2usxtPGknDkDAD5OQAKW08801ouq
	SXqg285BABy3jLtr1w6eBAcjOvmshpjmWrO+n8N/OUyy6cGWMZugR1+bbdX5d8TvqqxOTM9lCYu
	WigopHxWBzqj8ojPKJbc4ZfikWGU5fHmXRnHRlwgh5mOv4daAXi/kiGa7O5Sy74/xLDnZ4zR0rh
	7XGjKsRBEqpswrgod+cOQSRaDm95oSPqvxm3fIrmcL5xYHuy0tCU4TuiGVobh+mSR/6FfqNzii9
	i0PEulm4esrMBkRPEfpPXyk5+rS5zxjRQYO74wuAt2qG/Sy1w9jIjY1Gfz46V3pYj4uqV8xOaCm
	2EMJEitJhw3U1xwp+4GDlM5KxAuxqj4S9/W4zK3VtKa4yYZgc/fD39YEgnpcVWXlcxTAq8I1ywS
	lf+lt9A1+zI7Bfj/O0QdJIMA6tx1DBbUratns51Nvt5forPuM3RQJtbZoVkPeDnqgj82YFGhLBm
	SIYYsAUanBgK4DE8FyxRQNC6QIJ4vFssYDTiu3ieec8=
X-Received: by 2002:a05:7300:2442:b0:358:2e30:8e5 with SMTP id 5a478bee46e88-369e836b382mr6015233eec.1.1792897571529;
        Sat, 24 Oct 2026 20:06:11 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:10 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:05 -0700
Subject: [PATCH 02/31] hwmon: (lm93) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-2-e81941ad0cd3@gmail.com>
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

Pass the expected command length and destination buffer directly to
i2c_smbus_read_block_data() instead of using a static intermediate
buffer and memcpy.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/lm93.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/lm93.c b/drivers/hwmon/lm93.c
index d58a3c2a8593..2cbf0af22f61 100644
--- a/drivers/hwmon/lm93.c
+++ b/drivers/hwmon/lm93.c
@@ -871,8 +871,6 @@ static int lm93_write_word(struct i2c_client *client, u8 reg, u16 value)
 	return result;
 }
 
-static u8 lm93_block_buffer[I2C_SMBUS_BLOCK_MAX];
-
 /*
  * read block data into values, retry if not expected length
  * fbn => index to lm93_block_read_cmds table
@@ -884,7 +882,8 @@ static void lm93_read_block(struct i2c_client *client, u8 fbn, u8 *values)
 
 	for (i = 1; i <= MAX_RETRIES; i++) {
 		result = i2c_smbus_read_block_data(client,
-			lm93_block_read_cmds[fbn].cmd, lm93_block_buffer);
+			lm93_block_read_cmds[fbn].cmd,
+			lm93_block_read_cmds[fbn].len, values);
 
 		if (result == lm93_block_read_cmds[fbn].len) {
 			break;
@@ -895,13 +894,6 @@ static void lm93_read_block(struct i2c_client *client, u8 fbn, u8 *values)
 			mdelay(i + 3);
 		}
 	}
-
-	if (result == lm93_block_read_cmds[fbn].len) {
-		memcpy(values, lm93_block_buffer,
-		       lm93_block_read_cmds[fbn].len);
-	} else {
-		/* <TODO> what to do in case of error? */
-	}
 }
 
 static struct lm93_data *lm93_update_device(struct device *dev)

-- 
2.56.0.257.gf7497c7d27-goog

