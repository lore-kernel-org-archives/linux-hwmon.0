Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023866;
	b=3/1nJ5s0UC3JwgTsP9/6tUbuy+XV4XXK8sTwgjH1Tcip9ehlF3f4o4PTP7811Jey59lP
	 IhETil3D4ZV3MoJHfE+lmIc9vdj2LZk+TJ674Hu3DwayaAgjWuRt4cChT9eMDWk+MLWlf
	 KMlie8S7QvRYwLpGzVSnKg7qACk9+8g+nIgpaiiR8TZrjXG2+dOoRMg8ezX/NoVxfzpD8
	 JJoRmu/9s5D2y/5kn3EW7DmqltFvdMbwkA2tsWGBxzwEdl0d5B3OsixM8L1sy8NCChfkg
	 EBKv+0bnfoTmrKrVR1h+UlbVrI5lOI6Fgy/JeT+sdzmQdAcDAs3+Ffi8/XsdNjgbNog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4soOe8J5RcbwJ9ZjXDdzfBU9+cvbWhpoPlwod6HNRmE=;
	b=bjV5Oaae26U1MzbU4bozWtcVpLA7Icq3UxguMh+LWGkVjsVtZxbzPRsAapXcb7vsC0qb
	 rkiDkRsxNXHt0x5Uh+LCZBfjegTyR5CBWLWFMBc29Oz1W7CYNucAxcEzy8eXZOu/HCr/k
	 Mk09/sXXguNfYkzT6RTC/FG74jugvv/cnMX2CEfhalbSKe70xrRtHJE5LyR5bkXGHaxWN
	 +18DBZ6XMoxmx7BUoJN2F1LYIIFfDe5OkqeEzriM8KzyIGmDbXSTFhP14/f1wHzMvL52+
	 sHjz0V0r4SpA/v8aN2gMUMS7sKn56VJTcruToxLKssuXtOzRloXr0UEVX6bBkcBTFhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sQFpT8U3;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8A0606A31C
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 17:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C8A0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sQFpT8U3
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4d28f75d62so216960666b.0
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 09:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795023865; x=1795628665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4soOe8J5RcbwJ9ZjXDdzfBU9+cvbWhpoPlwod6HNRmE=;
        b=sQFpT8U3U9tJRgjpg5itqRYSIhcz1jOA3BfYS3mw5xEQsjb1u9bj7zm1AjegHjvG3y
         vw/W6x6GK+AC8oprqO91tn5Ef3ptmE1o3muJqlUkKXLZMcqjkcHUp1DJlZR8chyx2yil
         UAkTLub3VBgXc6dtgZVA1gpGQQEtu/Z3Z/LT4iZLJd8lID2QsT5lEpuiXW7cZXBdzEkx
         OZNg4thCfF4qisSB1rBFDPyZ4a4Z8CDOIA/m9zyyMz8AlRASw1be3zkr6LPE8gOsytnE
         AKZQG0dknLHc1j3GxEk5ncxdYaD9FwfIZIWvYgDzrBhEqEtjBLkNrs/AL1Cs8X8sacYF
         pQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795023865; x=1795628665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4soOe8J5RcbwJ9ZjXDdzfBU9+cvbWhpoPlwod6HNRmE=;
        b=kOEgHaXWske6ijlOV4J6bPV/t/yoNGcnBQScrvUB6l89cT6MdlM3FL7Sd/cVophvgV
         HBlQUOfQS0Ud3AVmLO4TuHXciDUJXdeW8txOK0lHh3QsVVgq/Tmk3uCXYhBGvaLEUy6h
         bms7Vni8vu7dgQc/J5koNpWMm/E0AfO2P7WJv26KGANPHSEYyYUa/oxLAj9Dx1P3FKgu
         Orc9riMCE4Ph16s4SVU+TG1d9tq6yfugcQGP+fX10TuU89a5IoNjGEoUPcN6c3Bp+vK9
         NC6CzZVJffTloBU2rcAIRuYX0JA/2nrHYWD/vYJaR2anBvgMVr/66XAFC2+tcuOY0FVG
         AVfQ==
X-Gm-Message-State: APuU4Z9ixfBEvQKU6YN/QCQr/GCiYeU/SKXDCE61RPmO5GK0fuw+MXJy
	3QI2KOYfDiSHZAsTRrABfdjoQ9DldqzxVYcBc0Wf3RicI3HjiCNq9FW9CWuGltcs
X-Gm-Gg: AYBFou1xvm0Vs/72DPTpvTr/UyyFdLgLPTaY0un3nya4mFsvG//b24M/MS+eMKE2e9F
	k244XjsG6Ld8Q3HSGRXom9DRfX3W38MisUgS+ZfzNd6YvfCQor8twU3tXgdxVVsw4cri1IqWowY
	s3BKj+7B6KV0rYm0wOfxlprRKWv8i25mOVENSAAqJv2hN3aY8D0dZiww1eE4Fk606hxc/OH7zjI
	6DJDBNOeBpEDJOQ0WHTzHN6Cs/I0YW7VHVayf+suFwglqYaLOcjH/KopqMQvdNDZWgN8JGs4KMU
	m+b98k5x7+5LupohBohBfOMJ/HbWJQXw2SlJpyv77FPGxW6H2MhbJYlZNGNaCF3irZi3kd73Ajk
	V55+3pqKYVluCtgNo4bBbaogIJv2Yk78FjKfhRYusx77BWJzXezTYLeMYnZtqBo5PzHhQKc8Vf4
	wYpZxQ4+Jrr0hBA03BwP4nH5IqhcE3WWm9EX5Dl2eaJfrqj8uqzyhMQ3x+BWbSVaEWusS04P3fj
	Mvf1CPXVIh3pWelOjqkungDzNq5NBu5epKIxcMLtXX+E5s/qgl1bKW+BpDOi1ZnOKqFCDmDoR99
	wFoF98aabEig5J/138yqelFglFFtnnwcsTkv5d00PLJ512c7rciBxc7zJKsrQd9GEHRqZIMDpuQ
	0JiughECdrRzeUwEg153/rBnSrfF460Ro
X-Received: by 2002:a17:907:6d1f:b0:c46:8b87:c1f4 with SMTP id a640c23a62f3a-c510e2d4ee1mr313457266b.20.1795023864719;
        Wed, 18 Nov 2026 09:44:24 -0800 (PST)
Received: from fedora.tux.internal (85.191.71.118.dynamic.dhcp.aura-net.dk. [85.191.71.118])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c3befsm25904066b.26.2026.11.18.09.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:44:24 -0800 (PST)
From: Bruno Thomsen <bruno.thomsen@gmail.com>
To: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH v2 2/2] hwmon: (tmp401) add channel label support
Date: Wed, 18 Nov 2026 18:43:34 +0100
Message-ID: <20261118174334.18759-2-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118174334.18759-1-bruno.thomsen@gmail.com>
References: <20261118174334.18759-1-bruno.thomsen@gmail.com>
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

Read the optional per-channel label from the device tree and expose it
through tempX_label, so user space can select a temperature sensor by
the name the board gives it instead of hardcoding a sysfs index.

The channel index comes from the child node reg property. Reject a reg
value that the detected chip does not implement, since only TMP432 has
a second remote channel; accepting it would add a tempX_label with no
matching tempX_input.

This mirrors what lm90 already does.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
Changes in v2:
- Fix continuation-line alignment in tmp401_read_string() reported by
  checkpatch --strict.
- Expand commit message: the channel index comes from the child node
  reg property, and a reg value the detected chip does not implement is
  rejected so no tempX_label is created without a tempX_input.
- Skip child nodes not named "channel", as lm90 and tmp421 do.
---
 drivers/hwmon/tmp401.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
index 2fceeacdc88c..7b645d982c9a 100644
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
+			      u32 attr, int channel, const char **str)
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
 
@@ -590,6 +604,28 @@ static int tmp401_init_client(struct tmp401_data *data)
 			return ret;
 	}
 
+	for_each_child_of_node_scoped(data->client->dev.of_node, child) {
+		if (!of_node_name_eq(child, "channel"))
+			continue;
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
2.53.0

