Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F95242925
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 22:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883127; cv=none; b=kjETa9+VdjIK0ySU3YXHZ4eqzlWit/ldFtR+zcDl12/S4sbwCwCriftLHOMNdh99EGSEmMn7/UywuXHuelUGjJa+v3Fg0veJruxddUB3z0ZccTtS7Dae91z/Tpz+M6RSruYDnktXsqCEZDerbR7zsPxxrE5nwpDMlaNFn88rcxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883127; c=relaxed/simple;
	bh=YuUrT1BEnFyF/ImxIJNRuH++hsrfZzAUxyPbwt2jgrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AsbjS/KF1DprUDQK+qGF7/X6aqktyv58rGPG2V/afe9+kHnxoqvA/z3szZh1R4ZdyrWlGCB/U/8n55M+nbvEXzp3SJMZfezcJRERW/IHt0g7Inbs7A0tNNOMCEX8Ib/yyIVVBx7WZlBxCt7pQIaF+OiM/SVGz8VHcF0alc60+Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=I5Yrs9tM; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="I5Yrs9tM"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2f68f3b075fso1330317eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 15:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778883125; x=1779487925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lf1AbfbJq6OKtzU38AjcQmkVu/SnjdthMQ1Neq2C96U=;
        b=I5Yrs9tMQxiZpf6fOuxQk97nq51PWESCJmQx8KKmcOaq66BVukO4ecsuYvcm3A0pC2
         6VtXyoVadGJOKTN2dTHcVuqcExtWUZTHbmDXiaN0uqfnnOQSlZ68zRaqNalNBX0YfeOP
         kOaqFdhgCX3k2DxjjDhwDIc/eUiCIIpJW8JHqOZYvnWpaUqgeLTxr6uQoKDjxei+x4AA
         H0JxSK7WJaqLErqXqyIAZgBgTSCuxERmMz5BQkGa1Vp4DnUmU84gXPGcrbebUjOxWQA1
         22Trf/dQiv9SqwpyjTjO55bxi8jmIlgoPS0CbynbjZ411zxNlM1I13zIjzSDzG0zWms5
         rUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778883125; x=1779487925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lf1AbfbJq6OKtzU38AjcQmkVu/SnjdthMQ1Neq2C96U=;
        b=L7r0bkra7IhbKpIlB3y+PsKQZ/vBBNHFZL5lfoutLqMuDRByHsstk3fA/SwoCb4C8r
         Feo4mF9GKzh1sQa8j2xcwIq+5KP5x6+t/v49tKpi7jEMxQ1ZSKHtcPz/KN/o9Fwtz/pD
         SxouUMxru0oTjP9SDJXjHG9n7PHXJg78yERLDCFK78YfLzQ+z8kR/eZFdPEd00s8/Juz
         zOsd5TUxhQJozBvPo/JngY+5mqU6vRf7nP9O/J8A2aGzo3FVb3xRALYmrEgF0DqXaW4s
         V+nJc0xLsf+9JJLnKVAvOcC/uTCN1BYuGfQ8OLkibkkNViSgqo4r+fAfWcsGitSuFPO4
         0Pdg==
X-Forwarded-Encrypted: i=1; AFNElJ811bjOQ2v1Inonig0mNc9Xij0JCZNIzO3JxZGgJhHPhU34X5YqS0kgb1JtHrzU5E2Jbn/V43zHipvW/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyGxNnVvstAt6RL1hChGopHkX+C+f14nm3S0xXKyRqxVG+AoY4
	ZU/P1xCtEl+YAGiQGuB0OYH0yEsq4AGAFeaEgFN9Fyx/JcpWwxLJzRwObw6VA19yLAo=
X-Gm-Gg: Acq92OHyvfldsvm7fdkJdTnu/Z+7TEIam+9pMWcWWHSOkmZ7hsL/NND+8MfruJqVyIJ
	N65JZ5DL60gJsEqO8hJTrrQD7kwMttvDP67pFer518NkD3k4/9tktEr6DifwO0gZSrevNlWpmu5
	dg4dlGmLlf+/Zggh9nXkSRf7Hf+Y6Ud+ec7CQ34riXKj30jRvKOc3/tkCrwKmkHoSmqtv81jqXc
	wqDq+3+MhxFCSVeG5rhBS8JgbJ5D4jOD05J9ZSe8mcSDQCKtm5IXNfHbiBUoPi7LkdbRG/Cwnbh
	IU8oxiTTxNidfAfs3D8fbxpyP37ANqLmeHyNzWZUNRL99L+O0S8RfwlKHZl4WI7DSk8cb3+xQGM
	rKXhXBu57iT15hR7nHS3m82LqCxvbDW3IQos76w0I6irDTHs6orN09jxpIMFfHeERAdJk+PnHi/
	utVr+IenqYju47RRqMXzgUNloTVOqmBbDqhtkZ
X-Received: by 2002:a05:7300:be17:b0:2f2:6dde:df67 with SMTP id 5a478bee46e88-3039862657bmr2942193eec.22.1778883125129;
        Fri, 15 May 2026 15:12:05 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e686sm9626315eec.5.2026.05.15.15.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 15:12:04 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Fri, 15 May 2026 15:11:48 -0700
Subject: [PATCH 2/5] hwmon: (pmbus/adm1266) widen blackbox-info buffer to
 I2C_SMBUS_BLOCK_MAX
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-adm1266-fixes-v1-2-1c1ea1349cfe@nexthop.ai>
References: <20260515-adm1266-fixes-v1-0-1c1ea1349cfe@nexthop.ai>
In-Reply-To: <20260515-adm1266-fixes-v1-0-1c1ea1349cfe@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778883122; l=1590;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=YuUrT1BEnFyF/ImxIJNRuH++hsrfZzAUxyPbwt2jgrY=;
 b=Hkbvw8/WxKlbe9Pm3Qn0o3qVsSb8cvHHc0pzRPts595HAREP6TY9GKq/4yMbs3lGIgbYxXKGf
 e/EcqvM1iy6AHb7WaSHgPvXVXt3bFxRepcYluK3eKQN6k0+sI+vC2XB
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

adm1266_nvmem_read_blackbox() declares a 5-byte stack buffer and
passes it to i2c_smbus_read_block_data() to retrieve the 4-byte
BLACKBOX_INFO response.  i2c_smbus_read_block_data() does not honour
caller buffer sizes -- it memcpy()s data.block[0] bytes from the
SMBus transaction (where data.block[0] is the length byte returned by
the slave device, up to I2C_SMBUS_BLOCK_MAX = 32):

	memcpy(values, &data.block[1], data.block[0]);

If the device returns any block length above 5, the call overflows
the caller's 5-byte stack buffer before the post-call

	if (ret != 4)
		return -EIO;

check has a chance to reject the response.

Widen the local buffer to I2C_SMBUS_BLOCK_MAX so the helper has room
for any well-formed SMBus block response, matching the convention used
by the other i2c_smbus_read_block_data() callers in this driver.

Fixes: 15609d189302 ("hwmon: (pmbus/adm1266) read blackbox")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index a86666c73a5e..94691dec1359 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -349,7 +349,7 @@ static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
 {
 	int record_count;
 	char index;
-	u8 buf[5];
+	u8 buf[I2C_SMBUS_BLOCK_MAX];
 	int ret;
 
 	ret = i2c_smbus_read_block_data(data->client, ADM1266_BLACKBOX_INFO, buf);

-- 
2.53.0

