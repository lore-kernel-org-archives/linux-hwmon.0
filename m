Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385731;
	b=LIxrRO3NDoaO/gY5MRZcIzbqEoCa6e2Wx9jj+npTwmzYVQc7oYVIFYSebkvOM+5Tz3nj
	 9yI6IoNEi5cCqfYZBHHFwi2YkNbO851PySQ0Qk2g6OO+hZcbGdfsHrxzVX9+JkLav8+Kf
	 hmOTJPAcudSb5ixKnd+Q+arUjOIT+FXcqCagbBTxX21cj+k1yWo4QGvHPStrqXYhs/MRD
	 Kwy5BlCFNjYKC7prjwGs8mzc491nzIuc6qzWagYMzNmhP4unW0AegHi1Y/6XO8AF+4sbR
	 6eGqdW4DVpIcudGsPVhE3x8qdsn0trxgeZuykcH8SxEo7yo2iWrcLHRPnSg33Mvmhtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=agS3oe8L0hdPjr48miavd+nPT5T0r6hqPyAhGQquZQM=;
	b=cLmqyOU38YSisXPtrilrV5WAwYS+/ODd1ZxvjCCiOdS6S4gx5O9+Woy7jlajGGkcirlb
	 gz1kmLlGnJX4t/ZdWSq6atweQNFVD17MSwED3RzMCMk4RbpPDXqWiIk4GoLY5ov5Sa3cr
	 VSxFFi40lrFTzzs7nBLpQN3F7CH3gtcwoi1btntflg27ZRfcWQBkFlVAfgziXi0U1Oik4
	 I1mPLrA1wWj/Bjlv/IVYnxqpOxc3FJE1h3vylvEIr/b4tZACbTtV6Ord+bR8mo1rD7jys
	 OEBCbXMHT5jVBqLX6fxYGSjneM06c+5Sq5F6Ek8bIkDUU2Uzt0NEKdEOfkg876oDHUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zOqQL73s;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0937E60A2613
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 08:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0937E60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zOqQL73s
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so189374466b.2
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 00:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794385729; x=1794990529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agS3oe8L0hdPjr48miavd+nPT5T0r6hqPyAhGQquZQM=;
        b=zOqQL73shpSJwoZ/CtH2OwVaU2aUb2HCvMM+a/e6wu8s1Qlmi1Er4kcgvMvrrZ1d9u
         eJhrdzdEY2RQYpNztDR0NH1OE51/3oTftK5e7KBAgqulisuvrjMKKBJcxUzOxnYor7C9
         Y67PYyNZ/5PeFAiJXBdcYDuEMAgiiAU+E2DSCY/uMpxp0piIpSoH4xygJ/BjQgYJLDnG
         39p4wMC5VpEqUauyaoPD9gvYLIbOxH07rvIXnm7aRjQryahsay5yymgO+dJQtSP112vF
         bESzBiocfo+Ihj8s6grwL3R+7seqYz2PyumswtaFT3sARFoJ+w/oEE+jPQMgbU2wP8Mo
         DQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794385729; x=1794990529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=agS3oe8L0hdPjr48miavd+nPT5T0r6hqPyAhGQquZQM=;
        b=AmnDp1yj0rNsGHWbs6SWy7lhkGekRAlVn3hJ9ToWRdkXt+IHDdyLdJGcIDw7ztQk3F
         HAQx0btv9eqG2hIEgPYiPz2m2rRR+nm+qW2W9o5wGgKbQv9sDbP5dOIz6Dswg2WCqnZU
         Xtox6eyKXNTQuAfRywwb/7uFCi12KQd/BlYZBrcfEKdHsUWLXAAWObG4XgAu05ESNHEY
         N3j1KFAK9NiJwA8dY9vD/ad7Fk+RCUbHxl3pzbZ1ukVYDB7DYKVXL/emcPmUEHcmZIQf
         4h+FgV+int+eWxeaXsWw8pfBpy8/bW/ukygKc0+YRXu5CqGJmZRJdeZBGGAJAN9Y1QeH
         NWOg==
X-Gm-Message-State: APuU4Z/Da8IJVUACIk/rTYtOpekosSb08cghP/SgyQ7We0o+JurWjaC+
	7kySs9D4vpO3XxR97NFF6xxrMvL3/ZrcjQYsfj0kwOfuSDUu/JDzVnV8
X-Gm-Gg: AYBFou1JO7PJUMCZPNu5SmxtNrhVWwzAUqt87U7fQ+kNFkKMHG4h8K2iaiHF3le8auQ
	hmRSX8PGbi39JMYxFBY7aV8x8bpca4F4+s5e84yo9+1OEkKDZjeV20V4tAgY/4q6p+WtIiD4gFz
	zI63zTmqXW9wawSzhGR4F43/nqRInJ4K2X+cDnAlwsOqxjJO83HvyxrhxWeB4s1JP0vD0rE7c3W
	83nBPGT/chm/3rbwgcXGiwSVKHulxzhIC5IIa/G950Y/V2wh64Wsh5dCPWB/T/KZE15fdnSrSa7
	DuViYLM5bCI4WP/Na4gKisbS444sKjmTneJM/IrVeTDM/sS8sANxcl5RUr/e2MtEhZ0W1glLRnG
	AZBqkZdIrbRvwuUvEA3Dud4Icp5PHtO6ZjIDFzyhynZuK5x1lJeE9x89QeRvf/OPlQjnaE88bhX
	VCubjsiZJqnitiOApbvAmqChxLTcGD0v0ZQ1j7Z7Tch1kKpUdMBbQMHFbFbLat3II2ihk6gfZJB
	Jp7FIMCdLa0j/oRvCAjbbWjxuTm8PCU2TUaQ5FkFJKxg0a7GSN3snJDeu4w+Ndp+5iikvjttGGl
	mOqLStPe71Ro+/WlKRe5fzU0P657EbkwaUtSgzIPv/sRnzr5mR2pjJGNlRip8uVS/bbp6oD4I7y
	yuDMXV6yMnf1Q50rd+4XI1gszZxwW/7+jw8ckTBTxf12AjdldmG94OcMpGLpEy0EvS8hap9Nl1X
	BHliiyDwnTvUsbvIymUBHI6HWRntA+9Qs0pjRQcyFKuoC1ig==
X-Received: by 2002:a17:906:794c:b0:c50:6345:e41b with SMTP id a640c23a62f3a-c5066d3d007mr110823166b.46.1794385729434;
        Wed, 11 Nov 2026 00:28:49 -0800 (PST)
Received: from fractal.tuxedo-gray.ts.net (c-78-82-25-228.bbcust.telenor.se. [78.82.25.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56ffc7sm210135866b.17.2026.11.11.00.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:28:48 -0800 (PST)
From: Johan Dahlin <jdahlin@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>,
	Johan Dahlin <jdahlin@gmail.com>
Subject: [PATCH v2 2/7] hwmon: (nct6683) Restore automatic fan control on driver removal
Date: Wed, 11 Nov 2026 09:28:33 +0100
Message-ID: <20261111082838.1418051-3-jdahlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111082838.1418051-1-jdahlin@gmail.com>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
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

A fan switched to manual mode through pwmN_enable keeps its last duty
cycle after the driver is unloaded, with nothing left to adjust it.

Return the channels the driver switched to manual mode to automatic mode
when the device is removed, using the bitmap kept for resume. Other
channels are not touched.

Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
---
 drivers/hwmon/nct6683.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 0565ca9290eb..d43dcf90048b 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -1584,6 +1584,32 @@ static void nct6683_setup_sensors(struct nct6683_data *data)
 	}
 }
 
+/*
+ * Hand the fans the driver switched to manual mode back to the EC, so that
+ * they do not stay at a fixed duty cycle once nobody is left to adjust it.
+ */
+static void nct6683_restore_fan_control(void *_dev)
+{
+	struct device *dev = _dev;
+	struct nct6683_data *data = dev_get_drvdata(dev);
+	unsigned long manual;
+	int ch, err;
+
+	mutex_lock(&data->update_lock);
+	manual = data->pwm_manual;
+	for_each_set_bit(ch, &manual, NCT6683_NUM_REG_FAN) {
+		err = nct6683_fan_ctrl_update(data, ch, false, -1);
+		if (err) {
+			dev_warn(dev, "Failed to restore automatic mode of pwm%d: %d\n",
+				 ch + 1, err);
+			/* The EC does not respond, skip the remaining channels */
+			if (err == -ETIMEDOUT)
+				break;
+		}
+	}
+	mutex_unlock(&data->update_lock);
+}
+
 static int nct6683_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1593,6 +1619,7 @@ static int nct6683_probe(struct platform_device *pdev)
 	struct device *hwmon_dev;
 	struct resource *res;
 	int groups = 0;
+	int err;
 	char build[16];
 
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
@@ -1710,6 +1737,13 @@ static int nct6683_probe(struct platform_device *pdev)
 		 nct6683_read(data, NCT6683_REG_VERSION_LO),
 		 build);
 
+	if (data->have_fan_ctrl) {
+		err = devm_add_action_or_reset(dev, nct6683_restore_fan_control,
+					       dev);
+		if (err)
+			return err;
+	}
+
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
 			nct6683_device_names[data->kind], data, data->groups);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
-- 
2.53.0

