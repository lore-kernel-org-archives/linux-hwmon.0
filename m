Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897574;
	b=nAFkGL37X7tJqlhuQ3jmAO7fszfGlsdMwNw0etcn1HKNLQF0FyVgxUGiIVBdUzeJqaYs
	 PRxJwzV17K29dCtV56Y9bP/9isOG7LIopv6N3/3NsmCM9C+VPC7SaUzCtBDvIPh/AC9aZ
	 1LKHFNcb00tdMeZuxYuRmX4+K3hNK/SgU2xCfsE53lDXOv1SCSsryFhJ/kuh6aJ189xBM
	 U9+/TJlbEA+65ryGyoqqK4Et/cgnkUY89dIiPWW3vtQ4KlDjOBFyZR8IAGA+8FW3zgBV3
	 dYacg9LmqFUcsgVxJLGpVQVxNSL2m3aEph2YlQut277AlaYh+DCiX6hnjNmQOUHVHkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=mwnvOx73d1ku66N7XjhN6sBeA5of7cWYXLsPW/HqYxY=;
	b=umBHZ19k0Cwll8tg2Dcz9WO4uoQZZhwVIvFRCURiIPvOvT38oJo3sFnSOLcpcf+nsuuL
	 kTXGrOdPsDlJsgkamTIxCTIHUgdbIVGVcMrWpiZUh9U/8ZnuDUN4ed6PjpO+ib0f2ycVT
	 svOW/8qDdjeqBH15qu8xFyWZ9Jb6Nec4+kDMd2Qy3OwxjQ7zysMaChNeD2K5z+7BCat8u
	 hPWl/PIsJvM2Kgfb1WeRHcTgPO2jAal/DZMOn1VJC4zlBtZfb++XD5Q/+e6gcPoZcT6pp
	 dtDJO8AYxFVUlFPjlFJr2MI2VfEDV57U4T6hA1sxeqgaVEdS8XTGu0g/Muz0BzVj0rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="f8/jou0+";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E066C606A334
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E066C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f8/jou0+
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3550c917fd3so3031088eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897573; x=1793502373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwnvOx73d1ku66N7XjhN6sBeA5of7cWYXLsPW/HqYxY=;
        b=f8/jou0+9Dl2rlDG3pvpfcXRWFgjLFworrVfNF7G+VT7wEZq9o+5yJR8yidwn9Z/Rw
         WnwUTAibnt3h62mFYjfwDwLW/Y2Hw7PaEXlwRzm9KOTGgAFEijlAkZDGM9DtshCVDH8u
         omtQ+qy1/fpt0eZ2uA0LIC4ZaYf8y29+z/Q1WyXxvKkFgEMm9+dQO10d0DJS6+sipXs6
         Wye8u9hr77QHbp9WqL7yfhTPk1Xbi996hR/d6qW7MwwC461NFp0I5CNJORTboES/0kNw
         0az9GCK3/18KrFDJIr/yK0p8/Elo9nI8sKzZCqhiYpFKGsnieESSnLINl+o6lOFjyext
         j8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897573; x=1793502373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwnvOx73d1ku66N7XjhN6sBeA5of7cWYXLsPW/HqYxY=;
        b=uR/z2y9diSw5dsgwd3tdYjdvXD6B6kCBLdx0JL6nBSPipeT2RGvgkPrkQ1S1W9yjm5
         Pa+gePttZZ+WT02e7MCurHa/ILdGkO19GtohP2yhbU2zORlkc/NLsHdBp7MjQ890FziJ
         B1AAdCIy9X/vcGtmS2zG4iTDxJ7TPClnXVmKY7bN63MyNXceH4grjbdeVUjBLw/w86L3
         MNOSsOKu48ghmdV/JvLowLVx+XeiJGDOWY946bfNB3k1sXlszzRqIdr9Ah2oIqDmQqtm
         wRe47xNPKpkUzSAUWLACt8mvCmLOLb0tNuRyRnAbwT1osySQ26r7QpbERfBPB9pKFmoX
         GRZQ==
X-Gm-Message-State: AFq9FYJ7Za0rnwa2+G6B2PNhoimbqZOSrehQ2/c2VZYXrURlSG39PmSq
	TsQnelx1CQ0fUuFowD1Y4qlU17v2FleUJu4+bI4Mc+qLzi0t7dQonf9C
X-Gm-Gg: AYBFou0IN1gRwDSTu4pIW5uYhYjAgdv09LMdkN6sSVU2Fp9g293iAvxO1YLLBm8+FGt
	sdBxNeK9ILjhbtNGMV7kvqvTQxUAZlkEfiy0eiNZS9Wvqe1PIw+3TFxIcYNKRT5Gbx7e8/htSQt
	siZ4FMAxA0xNcdympY14klUKlxj/38lTt9DMTHXRGMhunJijJe1yJb+3Cc2aLfYWqeA0vq1ssn+
	oUiyl1wbcwDh+crPWqg4+nZImXpvedTTBrYvDkDl6v6L6xoL8Bu8ysJj9PsYezhIlcFeyiiZT77
	mkC17B8e7dgAPmGnoGvito18r7lXt5gRmL1yL0Ba53jd+fc1a3GL8IesztiqNLIeaD8LNohhAjE
	ZlF1yytWEzvvca/Rq3Cq/hMcyjjR69vGUZi1eeEmEypd3AyGDii13wo3AaILzMsAkyqF2D8EjcI
	r8wgdn6d510UlFUmvmPTwFY7jT9TmNJb3jPamqFqq80MRZpPCAJf2w5vSVZDrX31OmYJ2RjGXkg
	tJhWSds1062cF4UxTXSzDKhZBy8FqVFrZSgPlODC80ZvbRw16Jr+/RKwojWMO1XhQQN+5GUVTwZ
	M+p562We0GniJNzsOM+cEwrHD0pyo8yhFyL66yYOddM=
X-Received: by 2002:a05:693c:87d9:20b0:369:987f:d15e with SMTP id 5a478bee46e88-369e8336389mr5141005eec.2.1792897572926;
        Sat, 24 Oct 2026 20:06:12 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:12 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:06 -0700
Subject: [PATCH 03/31] hwmon: (pt5161l) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-3-e81941ad0cd3@gmail.com>
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

Pass the chunk length and destination buffer directly to
i2c_smbus_read_block_data() instead of copying through an intermediate
buffer.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pt5161l.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pt5161l.c b/drivers/hwmon/pt5161l.c
index 1638f54f8eae..b38b1f63627a 100644
--- a/drivers/hwmon/pt5161l.c
+++ b/drivers/hwmon/pt5161l.c
@@ -121,7 +121,7 @@ static int pt5161l_read_block_data(struct pt5161l_data *data, u32 address,
 	int ret, tries;
 	u8 remain_len = len;
 	u8 curr_len;
-	u8 wbuf[16], rbuf[I2C_SMBUS_BLOCK_MAX];
+	u8 wbuf[16];
 	u8 cmd = 0x08; /* [7]:pec_en, [4:2]:func, [1]:start, [0]:end */
 	u8 config = 0x00; /* [6]:cfg_type, [4:1]:burst_len, [0]:address bit16 */
 
@@ -146,14 +146,13 @@ static int pt5161l_read_block_data(struct pt5161l_data *data, u32 address,
 				return ret;
 
 			ret = i2c_smbus_read_block_data(client, (cmd | 0x1),
-							rbuf);
+							curr_len, val);
 			if (ret == curr_len)
 				break;
 		}
 		if (tries >= 3)
 			return ret < 0 ? ret : -EIO;
 
-		memcpy(val, rbuf, curr_len);
 		val += curr_len;
 		address += curr_len;
 	}

-- 
2.56.0.257.gf7497c7d27-goog

