Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424843;
	b=43tpkepJ3Bxb4IJaHS+O/ShUkbiF7R31X1cTG3l/CfMmkzRO0CCoehW/d9hJb4m+3Slo
	 +oYq9ojWI2VBw9cAFpUuAdeh3yNT0SJJBEykjgtrzb07FIJw8SPsxJWVEW46ArulxznPK
	 b4nV6RDw0TfE2O1QCoK5nnc3xm9UhmAX2UwAtBDxHbfgdRqOJjTipTuX4NymtH1vy0RV1
	 fe0UXxpKRkCeeP25RVXUnWJJZ3u83qJcPFS5kF4wABkzUEnYOLKhTVUwpM0Kl0alqlor+
	 ByXYlw42/xpAXa6qXVBuhFsdtDbx6Ch/rPIek/8Pz9qZT5XZPUe0xYJMm6JotYWlscA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+QU3ElGvdYqdRAsqMMP4vBLt2gMtLEB8tbeLeTev/8U=;
	b=JWiO+S0gjulhh0HLphNOpI6CaQyXBVsk9AhjCW9BH7oMTmuZh4ZJK9GHACANyDyzLsX/
	 IOVEXWUTmhBoc/CaQ9pw7+UMuRHjvPMbbuxOn4TvbkbsKo4XMZFPVh+TxHfoXPA1pL+c4
	 dMhCQM4Un1EVqvKKRIyQ1A4p4AILURPPvRnkXaBdFpAch+a6IJY5jzRcwfI2ige4hNTFx
	 Q2MohwE6sqHsRww1GghovW8fxRa9wig8FedLpCQUPQ1xQvC76bZ/0AFEMAJej1dKvQYYE
	 U2MLef9YiAgcq0nu9BP4kH4ATM6+WplCHtaq2o6D+ddA9xTwiSnSTkxz3EezhaRcGtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ltOENgfJ;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E00C606AF83
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 15:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E00C606AF83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ltOENgfJ
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so1256482a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 08:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792424842; x=1793029642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+QU3ElGvdYqdRAsqMMP4vBLt2gMtLEB8tbeLeTev/8U=;
        b=ltOENgfJKo+HBDt5vHk2fu8vtkCvEx0FnXvObxZFRfOQHZANLAmEdvHMCLVYcwi9/m
         vdtB/vBAjL3ZJvdZWyTXtD7e54AY4W8MinF73Kb+NnkEihmK3ES1xlhG1SXsZMN2P6nq
         fd5uvOkUzdcMHTRely91pcdfEZ54LredhMpy/kDlNQtOUqCkTEN81hZBDAI0/xTWwWmF
         t5KztGmZtRr1zXaVvTSRajPxt4BnEOAQYv9Cb8O5yfNIj+spr876VaM/Qw5vQ/CSxPlL
         HAIN5O7ld5Q3dDrxm+UUq50AOUUUuHWvWEVCRpcWCaHTIjDIMxjFk7b3OCqrdL5akQSr
         Ib8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792424842; x=1793029642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+QU3ElGvdYqdRAsqMMP4vBLt2gMtLEB8tbeLeTev/8U=;
        b=CXm+ytVjQavBv+ihOpRi3imOxyBBSyKZb4c7Y/gWFxaAMLMo9fFwsEG2VGYkb07zRI
         33/9JPNNDgslcmU0h51Q1zXhmo1HLH3WDqOkQfgx4e9Ic35If+K3gF2SPo/6m/cQykiR
         FQFCR8UsbT6xWzeFbFEA47bGBFZQLMRoyJTnLupBi4SIL+GIuNtr6OR9RDojBTSVdreo
         GsjYmfKIZGIm5+hUMG8WKreLjiSUUUcImb7GPp+E/OslYA99Xwp9QsFbwEAne0XQZXBB
         wcprsKIVgnH60XRMXncTg5Qi1pO9kKxObcBLZxdn3MLEzCQkvYzPgz0JyjqFWkmPNgN5
         P8gg==
X-Gm-Message-State: AFq9FYLJTY/h6tNOZuEU7tZ7vi0HcXc9xmEnjiL2ZEcOqBUvmkU+DGTq
	4f3kBaxnba5/lW0B6uoJalOMdzM5xYFDC+w/Kp8o4bWBmd5r5U0W/viH
X-Gm-Gg: AYBFou2dVa9yhNtnE0FBSZKRImwu8UCtGoagMzcgV3WZ5M+xqxwDnjEFn8neo/bwddJ
	f0coo1dRhCITDW0wr3Xa7oR+QWlh0RdvBbtbbCTDi5TA1JeLtYUy/Y4z4kNsTjhKaSv4utc3PJi
	7FQOWnTheGQq1XirKQ2cOXEqltjjCbcCRnSOiOCd0puCnsQsaHE7seSx3KmhJgqWzChlrNjOWhU
	R6pGJUzbqpIz0qEbpdnr+nVntLu2isWDHmKAYgObSW8hnfe0zAJ1FVLcSj+jjzgNnldkBtv3agk
	P+tR2xWN/IN90m0k/F6wAuZoeQPyLykYBrM58QqUxa1eHYv3KqYrtne17Em/tmXZszd9koe/DsX
	yg8v3399MDs869Zq6gzRXK9Z+r6GCP+uraiztWIRmQhbE3w+Epsp6VXSJ7uW4zvRISYObbXN4tg
	dQ0h23aVb63s0imlu7io6kgYlPIXzAKMwQYB7FUAvBseAeDvp2IjnpxmdLHR2Z5kMsICBnNaG1a
	YLxAWqQXhP+Pn+IoZljMe8pXw==
X-Received: by 2002:a05:6a20:43ac:b0:3de:7f6c:b871 with SMTP id adf61e73a8af0-3e22607ded2mr5611265637.36.1792424841593;
        Mon, 19 Oct 2026 08:47:21 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f56c8c490sm4213095b3a.10.2026.10.19.08.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:47:20 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (sht3x) Return the consumed count for heater writes
Date: Tue, 20 Oct 2026 00:47:18 +0900
Message-ID: <20261019154718.2328055-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

heater_enable_store() returns the result of i2c_master_send(), which is
the two-byte command length on success rather than the sysfs input
count. This can report more bytes than were supplied, or a partial write
for a fully processed input. For example, writing "on\n" returns two
instead of three, so a caller retrying the remaining newline gets
-EINVAL even though the heater command succeeded. Retrying the remainder
of "off\n" can also send the heater-off command twice.

Return count after a complete command transfer. Preserve negative I2C
errors and return -EIO for nonnegative incomplete transfers, so a
zero-message transfer is not reported as a successful zero-byte write.
Keep the existing boolean parsing, command selection and locking.

Fixes: 50c22cd154e5 ("hwmon: (sht3x) add humidity heater element control")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested under ARM64 QEMU with an emulated I2C adapter through hwmon
sysfs. Successful writes return the input count, and zero-message
transfers return -EIO. Retry behavior and negative I2C errors were also
checked. No physical sensor was tested.

 drivers/hwmon/sht3x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index b46de050e20a..a0f5ba5c888d 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -543,7 +543,10 @@ static ssize_t heater_enable_store(struct device *dev,
 
 	mutex_unlock(&data->i2c_lock);
 
-	return ret;
+	if (ret != SHT3X_CMD_LENGTH)
+		return ret < 0 ? ret : -EIO;
+
+	return count;
 }
 
 static int update_interval_read(struct device *dev)

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.55.0

