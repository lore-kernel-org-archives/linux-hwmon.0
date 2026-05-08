Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B124C363C75;
	Fri,  8 May 2026 23:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283205; cv=none; b=EBes9wqu46lRWxC5ap1Y7oFISXYuFXZr8Jq1taohElzklDLDluDm0IuJTULiwMbznZeAHMmrjEF7hCNFCOA3CLCYbQKW17AX/JMC8eALgEbTCkVA+vDRECXc/CQZzpR13uITuZaYwMYSAOLRHhiRRFsF8XmZNnQ2vjvD3ST6TuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283205; c=relaxed/simple;
	bh=M0amAFMEIsEZpyl4hB4XgE7zBr4BM5r9Kw3gxVPXmwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p9eRp0UhFlD7QWO8gJ1ryae7cam0X7g8G4gFfAKlhD7DnPPCV7hJZg01vqKFIe54SMjk24rMlnFrfXyLlv0GiVVKr+jgfPklmS+9W86XU1s9TkdG3U/lQvngPvGb8QbqT8beDz7L+kf4dwlIpfX3qMnkkSHRifp2fPcHkyckyfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJrJilll; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJrJilll"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6ED36C2BCB4;
	Fri,  8 May 2026 23:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778283205;
	bh=M0amAFMEIsEZpyl4hB4XgE7zBr4BM5r9Kw3gxVPXmwI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FJrJilll6HGYWlVePE65YjzVqVNfmn/HgUFrgnBysV68N8UAgjT8arIsTeVp6BZUD
	 5LNTsLzPEvssafKUFYFgrofa8qMbghdxWUaNVYe8CD+aIH6whx6QpOSDl/H9dJH1PH
	 nJw85ZorMqTvUtlvPgnyFt/Ocwk8G8gzXH/Q+3/0un8FcVL6T5CNXWgRdtMrlpSDsE
	 RwS3DEI9SPL+/bKJpN5VHTtAJTm53EHOjq6uLW7AavCPdrvXpU3dntdPF6iTInlX1y
	 yggCSEriI5L2NRPM5Xptcn+Zr0a0dVqT8hONZ7BTmI+hCKo18vSx5S1fUukctyn21j
	 Lsxxuj4RpGkyg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C32CD37AF;
	Fri,  8 May 2026 23:33:25 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Fri, 08 May 2026 16:33:14 -0700
Subject: [PATCH 2/7] hwmon: (pmbus/adm1266) write fractional-seconds field
 of SET_RTC
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-adm1266-v1-2-ec08bf29e0ce@nexthop.ai>
References: <20260508-adm1266-v1-0-ec08bf29e0ce@nexthop.ai>
In-Reply-To: <20260508-adm1266-v1-0-ec08bf29e0ce@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736;
 i=abdurrahman@nexthop.ai; h=from:subject:message-id;
 bh=zgclZid47CWbHlZWQwfDY1h7EjKE5ZC3dtjfgCW8+38=;
 b=owJ4nJvAy8zAJbYltPXv6rsCXxhPqyUxZP4rOtK/4lPRG2eD5cw+Kx7tlT0ZuFNWb5tUrzVDQ
 fz3WSuvPjzWUcrCIMbFICumyDLnkf+bto62iA0xh+xh5rAygQxh4OIUgIlwz2T4X2ywM7jk1v/w
 zb8+VMpcm7v27/IH5Ukfylfkz5+bdD8iKJSR4UaSPeOLa194uf5dDz4qyKVk/3XjwqmNCyauWOQ
 66cqCmbwAw5BUjQ==
X-Developer-Key: i=abdurrahman@nexthop.ai; a=openpgp;
 fpr=9CE24FEC86888658B05CC23FB45585FDABDD10F4
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/default with
 auth_id=756
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Reply-To: abdurrahman@nexthop.ai

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

The SET_RTC register is six bytes wide: bytes [1:0] hold fractional
seconds (LSB = 1/65536 s) and bytes [5:2] hold whole seconds. The
driver was zeroing the fractional bytes, which loses sub-second
resolution when timestamping blackbox records.

Sample wall-clock time as a struct timespec64 and convert tv_nsec to
the device's 16-bit fractional representation. The conversion uses
64-bit arithmetic to avoid overflow on the (nsec << 16) intermediate.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index a86666c73a5e..ba8a02509528 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -428,16 +428,23 @@ static int adm1266_config_nvmem(struct adm1266_data *data)
 
 static int adm1266_set_rtc(struct adm1266_data *data)
 {
-	time64_t kt;
+	struct timespec64 ts;
 	char write_buf[6];
+	u16 frac;
 	int i;
 
-	kt = ktime_get_real_seconds();
-
-	memset(write_buf, 0, sizeof(write_buf));
+	ktime_get_real_ts64(&ts);
 
+	/*
+	 * SET_RTC frame layout (datasheet Rev. D, Table 84):
+	 *   bytes [1:0] = fractional seconds, LSB = 1/65536 s
+	 *   bytes [5:2] = seconds since 1970-01-01 UTC
+	 */
+	frac = (u16)(((u64)ts.tv_nsec << 16) / NSEC_PER_SEC);
+	for (i = 0; i < 2; i++)
+		write_buf[i] = (frac >> (i * 8)) & 0xFF;
 	for (i = 0; i < 4; i++)
-		write_buf[2 + i] = (kt >> (i * 8)) & 0xFF;
+		write_buf[2 + i] = (ts.tv_sec >> (i * 8)) & 0xFF;
 
 	return i2c_smbus_write_block_data(data->client, ADM1266_SET_RTC, sizeof(write_buf),
 					  write_buf);

-- 
2.53.0


