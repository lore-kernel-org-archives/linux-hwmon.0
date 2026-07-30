Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF7C439010
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 13:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785418289; cv=none; b=qet0ALkfHyWLoc9pML7KeumsrGWlHkCoPflbZrbYfGO0AtV0zpNnt0uPaNgLx/tGoY8AIZtFxE6begXeTjFPT4mNVe0yLSH2e1H59jtKILeZds8Vhcz7JHCX62wOa8LdmRQsR39rF+RjAE6oCQDP8vbqjMTZob2/NnMsF9sWxYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785418289; c=relaxed/simple;
	bh=UkBJmfqs8l3S14i7K7iFj6KJJ86Oz/FXaGKO5mJrZ+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UrESk2s9hPp7d5ZWdH3Uyw8HdS256MU0ey2Ei56aGXss1h/Co+O/JK1t1P4jSogYa3JbvL6Pfc4F4ybGPeQ8vTAjMYzJbazbdUDOspIS5DTLB5eHD5lDRogaUAQKbE/kwClDPEfqiuEo2GoDNQ8tuDi3e8WWlRcyVDiUAh69fDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CnboAj3N; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnboAj3N"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a07a051a81so1460873a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 06:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785418286; x=1786023086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YqkMyE5v64XraDfbtgWG92rltHOmj6zAfHfG5b14r08=;
        b=CnboAj3NoE2uw4RuDxB58LfTJ6qead0neuPN2YotCVnNE9QOXeAJukZ7UkBhHAkvgx
         ccaCRCaPV5xvkr7miXBbvCqGmTPRG55nXk+LHzz3BogDjorQ1zI5Y3NaPfHRzMGiBr+m
         WsjaRk0cUsZk2ieO3fqDTPLkdymMM1Q7pxDGRxjUwXgDxMLF4Ps0UQtKK3ybbtxmFoqk
         e7zyi/UlzCsDmQvJGKJAuOt/fmgxDVuHJyFfl9fyKCKgz40xHTHei/Y2p52sheyNOc0v
         mls+pE1ifKB7TZC6g0dbXU1sYXI4rOHjeWn3ye7l8ptaAz0JrOscHWy9cMxD2mfMiR5d
         H9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785418286; x=1786023086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YqkMyE5v64XraDfbtgWG92rltHOmj6zAfHfG5b14r08=;
        b=HAh0kSQdGyUCd2yi3r9AwyTezOeQxfNuqGHY9347zHfgc5fc5iRlESdf0ofKbtPMle
         M/bA3ryzYMUffo1JopLhcqItnoa19JWsF+gSyhYtqwV1s1a+hBoq4k8Ek8hImArXlezB
         QL70ov2e5LL0XMGRZM8sFzEBqCRzsflUEabZl4BMUId2KNIK+YaPq0klNOTUIOPAXXqZ
         dD/kOTcbbRyw4qSDm/4YsPXSv75RjhWLV9csrINom9e/FWJuMzDQf4RKjE192RspvdnJ
         onB3vsLBLy8a/1rIjyADZzxzdGGaYrdz3Xen/6ejeMjLOK3tp6AAeaPeaRkhDCuvmqhk
         k+NQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUMZDdU/yo1MW2pkvMLc33/fL4DtxyMx1s+cTza2osKQ+jy1QJG5Br4dNiMaE0cQFo0wU/zbiy+HHmOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeAzFnBW6tZSXZhaCbPu/EzE3C0uZEo82MClldBJRqqP4Gzvjp
	Xyb9Mo1aVNYsgGQJPwj2XNkDy4lj4e6gpT10UBCS9tKjLXRKoQWZqQMc
X-Gm-Gg: AR+sD10sp9Z7Jh5lzWQuYWjSUMN6FIku1tWphZLOErWC2jeNT+k6lDxZNmvCDmm+MMW
	73GYLRAUj1ba/dFO0Ou1cvjY8onZTYphBoTRyeVS6vZNibbS1nGekqWsNaH8hX3e9QZToF9ytuE
	H7uGHket1ng3RFCHxzyf6K/tNy6ZBVwu42lfZYK4hhWJ3RLa0xdKAO7dntsU9fR/GfwM30aRVi3
	Qo2l0q7iyEb5nAXp7WMUPsK6rPzLKafynS4vRI8rj1HMb7DxAXDzvbaVZLY0H973zxOwen9324T
	GscSDEkzx+UayHvCgaMjjjWdH8UECgzJKsqK3YUWTikTTjrqJeqDnLenfFzrnwazcDLFq3+leWw
	QVYW5gxLPcRZASjVmxufqb4WeVj8Q63EGjwWdLTyL32DN5nN0JyL/Xbw6I+k2Iyepw8lAH5PaOe
	fo+Rv5qoebqjXdJmje1JeU+qHrqGpdqZvT2nL1sNuYkih57wXgtabvBqm4j1ECiXb/rlzBAoI3v
	dSY9LPuHKMchjD4GMW39RPYwysHRMIWhYFr/BzTl2Rj2rCNT5QJkPLN
X-Received: by 2002:a05:6402:26d6:b0:698:b1bc:ed5f with SMTP id 4fb4d7f45d1cf-6a07b83c3ddmr1200600a12.30.1785418285353;
        Thu, 30 Jul 2026 06:31:25 -0700 (PDT)
Received: from fedora.tux.internal (85.191.71.118.dynamic.dhcp.aura-net.dk. [85.191.71.118])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07d393c48sm565891a12.24.2026.07.30.06.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:31:24 -0700 (PDT)
From: Bruno Thomsen <bruno.thomsen@gmail.com>
To: devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH 2/2] hwmon: (tmp401) add channel label support
Date: Thu, 30 Jul 2026 15:30:58 +0200
Message-ID: <20260730133058.14731-2-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730133058.14731-1-bruno.thomsen@gmail.com>
References: <20260730133058.14731-1-bruno.thomsen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow userspace application to select temperature sensor based on
channel label in device tree, just like it's possible in lm90.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
 drivers/hwmon/tmp401.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
index ca0ff525ea29..13c5da4df447 100644
--- a/drivers/hwmon/tmp401.c
+++ b/drivers/hwmon/tmp401.c
@@ -117,6 +117,7 @@ struct tmp401_data {
 	struct hwmon_channel_info temp_info;
 	const struct hwmon_channel_info *info[3];
 	struct hwmon_chip_info chip;
+	const char *channel_label[4];
 };
 
 /* regmap */
@@ -467,6 +468,16 @@ static int tmp401_read(struct device *dev, enum hwmon_sensor_types type,
 	}
 }
 
+static int tmp401_read_string(struct device *dev, enum hwmon_sensor_types type,
+			     u32 attr, int channel, const char **str)
+{
+	struct tmp401_data *data = dev_get_drvdata(dev);
+
+	*str = data->channel_label[channel];
+
+	return 0;
+}
+
 static int tmp401_write(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long val)
 {
@@ -502,6 +513,7 @@ static umode_t tmp401_is_visible(const void *data, enum hwmon_sensor_types type,
 		case hwmon_temp_fault:
 		case hwmon_temp_lowest:
 		case hwmon_temp_highest:
+		case hwmon_temp_label:
 			return 0444;
 		case hwmon_temp_min:
 		case hwmon_temp_max:
@@ -521,6 +533,7 @@ static umode_t tmp401_is_visible(const void *data, enum hwmon_sensor_types type,
 static const struct hwmon_ops tmp401_ops = {
 	.is_visible = tmp401_is_visible,
 	.read = tmp401_read,
+	.read_string = tmp401_read_string,
 	.write = tmp401_write,
 };
 
@@ -531,6 +544,7 @@ static int tmp401_init_client(struct tmp401_data *data)
 	struct regmap *regmap = data->regmap;
 	u32 config, config_orig;
 	int ret;
+	u32 ch;
 	u32 val = 0;
 	s32 nfactor = 0;
 
@@ -590,6 +604,26 @@ static int tmp401_init_client(struct tmp401_data *data)
 			return ret;
 	}
 
+	for_each_child_of_node_scoped(data->client->dev.of_node, child) {
+		ret = of_property_read_u32(child, "reg", &ch);
+		if (ret) {
+			dev_err(&data->client->dev, "missing reg property of %pOFn\n", child);
+			return ret;
+		}
+		if (ch >= ARRAY_SIZE(data->temp_channel_config) ||
+		    !data->temp_channel_config[ch]) {
+			dev_err(&data->client->dev, "invalid reg %u of %pOFn\n", ch, child);
+			return -EINVAL;
+		}
+		ret = of_property_read_string(child, "label", &data->channel_label[ch]);
+		if (ret == -ENODATA || ret == -EILSEQ) {
+			dev_err(&data->client->dev, "invalid label property in %pOFn\n", child);
+			return ret;
+		}
+		if (data->channel_label[ch])
+			data->temp_channel_config[ch] |= HWMON_T_LABEL;
+	}
+
 	return 0;
 }
 
-- 
2.55.0

