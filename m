Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302466;
	b=2YdcxAlE795791r+WKgb7MGLNR7Av3sXcJb+q3ZN9PPAk8fzgIrveaIKAGuH1YNd5Pyz
	 GpHpWogMtnYhiO2cBM7l7pIPQY3b8cXv+hm7WOZQZ+n/l1Lt78iarl0m1i0ZhT8t55sWO
	 7v7rSW3fgs0fng0GAV4yHJlzCT4+p49fGgelHqQV1UElmCuzn8FzGbcbXu7QClgKuOx/I
	 ovKS01dvODhyvTfv3i3a8EK7h0q/TTl38+zRTShWNSKgAyreb84XsOph+e8CIj02emhI4
	 BOI2RKCHaA6AHHf4134RopDg9bOg4q7D4bLDuD4VzcXfxGbUJ+VZKV4aTW+Rm1/HaVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302466;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=urFVS682ubyxsP7IsuZLT4obni0tx+jX8VfX+5V6oKc=;
	b=R8u3arxq64ZWaKisT9mm56SjsgCMUgGTtw9l4+m8XqPANKGR4BAhIDtIqek1h+ipqWaO
	 7BSZnRYRfTKV3XdZcGqMHFOEHt9eCkeBGn0EhvQHOIfq8K1cTposKaUFcqH6/hoR1DB7e
	 NJZg4iD1veU0qHFQhtxPRaL7WtE0hMytdD//y6O1y2t0vvtxVliZjUmuThdn8Wc7ht5Y8
	 5UU6i4+nnXkKPXcPXJVTaNJ+/dPNb6aXKBTudpTJjXvOiHk/WHT6AkLxwjCAXksdgOqyq
	 mmhxrh7+n5xVIk81qFi0QQB/nXztnr+BN3imkkNFKPP3sbU7qwD8p9aBapQkmdI8G6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ipvych.com;
	spf=pass smtp.mailfrom=ipvych.com;
	dkim=pass header.d=ipvych.com header.i=@ipvych.com header.a=rsa-sha256 header.s=key1 header.b="qEqPvNL/";
	arc=none smtp.remote-ip=95.215.58.145
Received: from mta1.migadu.com (out-145.mta1.migadu.com [95.215.58.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47B4606A6A7
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Nov 2026 23:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B47B4606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ipvych.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ipvych.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ipvych.com header.i=@ipvych.com header.a=rsa-sha256 header.s=key1 header.b=qEqPvNL/
X-Envelope-To: linux-hwmon@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bV2B/6E/lvavoG65aDGkRjTcyyaWW50CdXXXYHwyoPQ=;
 c=simple/simple; d=ipvych.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795302462; v=1; x=1795907262;
 b=qEqPvNL/78FogA6YfBGqF/JXyKv6GnU+AOYYxSewZ2Kc5AQ0KwgA9LLLtfDk3uuyglSrfF91
 blNgcRt3qTJ6Wuc5aDXQ3pUY9dxQYhBQeJvvXpOzAOs3Afh5LbENBRheSLg58jDgPMpF+KoGcIr
 C8EvyqMv4eu/TzlKKcguFjK+npKWkkrxLYzENDSu+3TdCqEpl22eIXquBqFkBW2coPa+EmPTi+s
 EnzIZYUAdB1VBrrWCYHKbhR5HHPkrdrBsiIhziEdl/xax8WmWNWsolGKVbJnC42kcIUkxUOnd3z
 UNLKlRmmh25KQBWbaAnoHRNM8nxPtfGdnmcZRDtWJpkPw==
X-Envelope-To: linux-hwmon@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4ed606daeaa9bb56;
	Sat, 21 Nov 2026 23:07:42 +0000
X-Mizu-Trace-ID: 4ed606daeaa9bb56
X-Migadu-Flow: FLOW_OUT
From: Ivan Popovych <ivan@ipvych.com>
To: linux-kernel@vger.kernel.org
Cc: pali@kernel.org,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	Ivan Popovych <ivan@ipvych.com>
Subject: [PATCH v2] hwmon: (dell-smm) Add Dell XPS 15 9550 to fan control whitelist
Date: Sun, 22 Nov 2026 01:07:38 +0200
Message-ID: <20261121230738.4970-1-ivan@ipvych.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <e4e133c6-db41-4776-a73e-e8e051eadec4@gmx.de>
References: <e4e133c6-db41-4776-a73e-e8e051eadec4@gmx.de>
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

Confirmed on my own Dell XPS 15 9550 running BIOS version 1.14.0
running "echo 1 > pwm1_enable" disables automatic fan control and
"echo 2 > pwm1_enable" enables it back.

Both 30a3/31a3 and 34a3/35a3 commands work on this laptop, using
30a3/31a3 as these are the commands used by the official Dell
software.

Signed-off-by: Ivan Popovych <ivan@ipvych.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 5963f908972f..3645157620fd 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1640,6 +1640,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
 		},
 		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
 	},
+	{
+		.ident = "Dell XPS 15 9550",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 15 9550"),
+		},
+		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
+	},
 	{
 		.ident = "Dell Optiplex 7000",
 		.matches = {
-- 
2.56.1

