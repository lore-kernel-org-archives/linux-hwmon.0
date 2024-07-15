Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0909F1849D0
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Jul 2024 07:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721028680; cv=none; b=YAGgpI8fqL38Y/Yuog+N/iSHpSbtQlyV2iSYkWZI/3SYi/bPZs4fa2NShXwX7DdkAGJYa746awgrBx3AJFaukxozgAGrQlJ2veCXpFNopCtsp8JCODG8qWstD7ulmofrnpy3iIhkWsnoGNfw1d3a7k/zrEO7TA2Pc01hg1j5NKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721028680; c=relaxed/simple;
	bh=msdvHICFqZBk3Qmz2OXLcwYLDlWXsaOJTSf+xIoW5K8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V59RsNtE594b21Xhbg0NudIO6RXx4kFSKoPTp94BW14GPUK2P68oMnzApjzcwMAcbIqWGodcpspvBvgaHBiFdANBvzVscsOdAIjp58CM3t/yppf25Bvl0e0NF0IaryH6HALvOP6qntk97Rw3FbvoAsicnExRmU+guILpFaXebHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Xz3s8Kf+; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Xz3s8Kf+"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-595856e2332so5015964a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Jul 2024 00:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1721028677; x=1721633477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7H+3a2UnmA5NVXZ9zwW5RQvv7oqwdwKXWiUEHwm4fFk=;
        b=Xz3s8Kf+WTojUkDnICtQoLmdoYQPcZaLg2nE8jhzkxBony45vvT2vWqTqHPHZYOdKB
         66Y7eViW4jKqCXszu3lY9vpzQoZDZcz40gBbjloVSPg38460pYk3v7DghIJVMtIZhaMy
         qiGPMYtbQs93uBQAXj6Q5meeRNyV90YDgVjjO/4HHyMfB3/5Ck8UawaRb0E8XQvyrPFi
         nLQ9SUFOSjnJ2aFb9vtW6FDkIYryhz+6ivqaQ0QORM6hncfJ7D8El/jWCEy6QaXzQuXQ
         nUYtF6uE+8BcQcqs2fz4lh2Zm4L9umVjhmPpCwpwMSNJTi/3N7Jh6M3rVbok6huCe644
         sjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721028677; x=1721633477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7H+3a2UnmA5NVXZ9zwW5RQvv7oqwdwKXWiUEHwm4fFk=;
        b=gesX+oD8MXhU8QkS5Ir51/2zbcxOSYYxhjOrD9rIEDTcOuKrRQQxGFA1X9zHHYNUkl
         WUToosiLtpeI7GDym/+6sJ9R+RQrs3vPjkfJL9jNeLRIVNcM+0UYBPDwhCLmGPjvn+RT
         KohdHSw0gHY6tvkDhR2MSe0wvI76VeobrSvPQ74OoTXypo8KttKSE3fuc/nHnF+KGFCo
         XrVuMLIbisfM6ckHU5ER7X0tqkHtGz0NrrckGK4oeLxLQ2J03Wq5+Virnkr7hECOS46j
         FSuHA0aemK0rtcyHWmzo5iUW6DYIAlJBi2BFiThDhaw2wa2IwrmNS5A6QEEwYPvfujXE
         IU4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHOYNxXzVBvtzECeweE5yC54GVM+exhJL6aEmw+WZhO2AOMf59mJ+qTOmoriNaLVCzvAczPiY7DyLfqQRdFwIY81MgnPU5fnleh3Y=
X-Gm-Message-State: AOJu0YyqgpKgbbBcBeMgGtDyxlQtibk9po7DXudAt8E5e915LSARPL/l
	JTCco2cYhIwtlIFbD5BgIZBhihetTXYPDWzNLBactfhE/nrHUVgdETBy1GFEoxk=
X-Google-Smtp-Source: AGHT+IHnUUX2ROHLKdUMz/8YZsTBxpX8KbBG7oBgLNCvKmKvPz20CS13QNSFgp78xwmOKgcSET5u1g==
X-Received: by 2002:a05:6402:2707:b0:57d:10c:6c40 with SMTP id 4fb4d7f45d1cf-594ba98e3c7mr14379033a12.7.1721028676341;
        Mon, 15 Jul 2024 00:31:16 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-037-049-067-221.um09.pools.vodafone-ip.de. [37.49.67.221])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59cf7763236sm1274023a12.12.2024.07.15.00.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 00:31:16 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 5/5] hwmon: pmbus: pli12096bc: Add write delay
Date: Mon, 15 Jul 2024 09:31:02 +0200
Message-ID: <20240715073105.594221-5-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715073105.594221-1-patrick.rudolph@9elements.com>
References: <20240715073105.594221-1-patrick.rudolph@9elements.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tests on PLI12096bc showed that sometimes a small delay is necessary
after a write operation before a new operation can be processed.
If not respected the device will probably NACK the data phase of
the SMBus transaction. Tests showed that the probability to observe
transaction errors can be raised by either reading sensor data or
toggling the regulator enable.

Further tests showed that 250 microseconds, as used previously for
the CLEAR_FAULTS workaround, is sufficient.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 drivers/hwmon/pmbus/pli1209bc.c | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/hwmon/pmbus/pli1209bc.c b/drivers/hwmon/pmbus/pli1209bc.c
index 2c6c9ec2a652..178e0cdb7887 100644
--- a/drivers/hwmon/pmbus/pli1209bc.c
+++ b/drivers/hwmon/pmbus/pli1209bc.c
@@ -54,30 +54,6 @@ static int pli1209bc_read_word_data(struct i2c_client *client, int page,
 	}
 }
 
-static int pli1209bc_write_byte(struct i2c_client *client, int page, u8 reg)
-{
-	int ret;
-
-	switch (reg) {
-	case PMBUS_CLEAR_FAULTS:
-		ret = pmbus_write_byte(client, page, reg);
-		/*
-		 * PLI1209 takes 230 usec to execute the CLEAR_FAULTS command.
-		 * During that time it's busy and NACKs all requests on the
-		 * SMBUS interface. It also NACKs reads on PMBUS_STATUS_BYTE
-		 * making it impossible to poll the BUSY flag.
-		 *
-		 * Just wait for not BUSY unconditionally.
-		 */
-		usleep_range(250, 300);
-		break;
-	default:
-		ret = -ENODATA;
-		break;
-	}
-	return ret;
-}
-
 #if IS_ENABLED(CONFIG_SENSORS_PLI1209BC_REGULATOR)
 static const struct regulator_desc pli1209bc_reg_desc = {
 	.name = "vout2",
@@ -127,7 +103,7 @@ static struct pmbus_driver_info pli1209bc_info = {
 	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
 	    | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT,
 	.read_word_data = pli1209bc_read_word_data,
-	.write_byte = pli1209bc_write_byte,
+	.write_delay = 250,
 #if IS_ENABLED(CONFIG_SENSORS_PLI1209BC_REGULATOR)
 	.num_regulators = 1,
 	.reg_desc = &pli1209bc_reg_desc,
-- 
2.45.2

